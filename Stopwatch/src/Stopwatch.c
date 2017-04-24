#include "bsp.h"
#include "tick.h"
#include "disp.h"
#include "render.h"
#include "voltmeter.h"
#include "joystick.h"
#include "adc.h"
#include "thinfont.h"
#include "InitDevice.h"
#include <SI_EFM8BB3_Register_Enums.h>

#define SYSCLK 3062000 //Configurator set for HFOSC0/8
#define LED_TOGGLE_RATE 800 //timer0 set to approx. 100ms

SI_SBIT(BTN0, SFR_P0, 2);                 // P0.2 BTN0
SI_SBIT(BTN1, SFR_P0, 3);                 // P0.3 BTN1
// Generic line buffer
SI_SEGMENT_VARIABLE(Line[DISP_BUF_SIZE], uint8_t, RENDER_LINE_SEG);
SI_SEGMENT_VARIABLE(String[DISP_BUF_SIZE], uint8_t, RENDER_LINE_SEG);

uint16_t time;
char timeStr[9];
uint16_t Laps[9];
uint8_t lapnum;
uint8_t current;
uint8_t start;

//sets global variables
void initGlobals()
{
	time = 0;
	lapnum = 0;
	current = 0;
	start = 0;
}

//BTN0 interrupt
SI_INTERRUPT (INT0_ISR, INT0_IRQn)
{
	if(BTN0 == 0){
		IE_ET0 = !IE_ET0; //toggle
		start = !start; //if start == 1, startup lights should go on next BTN0 press
	}
	IE_EX0 = 0; //TURN OFF EXTERNAL0 INTERRUPTS (SO THAT MULTIPLE BTN0 PRESSES ARE NOT REGISTERED)
}

//BTN1 interrupt
SI_INTERRUPT (INT1_ISR, INT1_IRQn)
{
	if(BTN1 == 0){
		lapnum++;
	}
	IE_EX1 = 0;
}

//time increases by 1 every time LED_TOGGLE RATE is reached
SI_INTERRUPT (TIMER0_ISR, TIMER0_IRQn)
{
   static uint16_t counter = 0;

   counter++;

   if(counter == LED_TOGGLE_RATE)
   {
	  time++;
	  counter = 0;
   }
}

/*
 * str - pointer to string text (0 - 21 characters) to display
 * rowNum - row number of the screen (0 - 127)
 * fontScale - font scaler (1 - 4)
 */
void drawScreenText(SI_VARIABLE_SEGMENT_POINTER(str, char, RENDER_STR_SEG), uint8_t rowNum, uint8_t fontScale)
{
  uint8_t i,j;
  for (i = 0; i < FONT_HEIGHT; i++)
  {
    RENDER_ClrLine(Line);
    RENDER_Large_StrLine(Line, 4, i, (SI_VARIABLE_SEGMENT_POINTER(, char, RENDER_STR_SEG))str, fontScale);

    for (j = 1; j < fontScale + 1; j++)
    {
      DISP_WriteLine(rowNum + (i * fontScale) + j, Line);
    }
  }
}

//taking miliVolt2str from voltmeter.c to take in time integer counting in tenths of a second and converts to string
void secondsToStr(uint16_t time, char * str)
{
  int8_t position = 6;
  uint8_t count = 0;

  // display backwards from s
  str[position--] = '\0';
  str[position--] = 's';

  for (; position >= 0; position--)
  {
    // count = 1 is the location of the decimal point
    if (count == 1)
    {
      str[position--] = '.';
    }
	// Get the right-most digit from the number
	// and convert to ascii
	str[position] = (time % 10) + '0';

	// Shift number by 1 decimal place to the right
	time /= 10;
	count+=1;
  }
}

//sets up timer0 (off by default)
void initTimer0()
{
	uint8_t TCON_save;
	TCON_save = TCON;
	TCON &= ~TCON_TR0__BMASK & ~TCON_TR1__BMASK;
	TH0 = 0xC0; //(0xC0 << TH0_TH0__SHIFT);
	TCON |= (TCON_save & TCON_TR0__BMASK) | (TCON_save & TCON_TR1__BMASK);

	CKCON0 = CKCON0_SCA__SYSCLK_DIV_48;

	TMOD = TMOD_T0M__MODE2 | TMOD_T1M__MODE0 | TMOD_CT0__TIMER
				| TMOD_GATE0__DISABLED | TMOD_CT1__TIMER | TMOD_GATE1__DISABLED;

	TCON |= TCON_TR0__RUN;

	IE_ET0 = 0;
}

//sets up BTN interrupts (on by default)
void initBTNinterrupts(void)
{
	IT01CF = IT01CF_IN0PL__ACTIVE_LOW | IT01CF_IN0SL__P0_2
				| IT01CF_IN1PL__ACTIVE_LOW | IT01CF_IN1SL__P0_3;
	IE_EX0 = 1;
	IE_EX1 = 1;
}

//draws main time underneath "STOPWATCH" title
void drawTime()
{
	secondsToStr(time, timeStr);
	drawScreenText(timeStr, 20, 1);
}

//draws a new lap if the lapnum (incremented by BTN1 interrupt does not match the current lap)
void drawNewLap()
{
	uint16_t temp_time;
	if(current != lapnum && lapnum<9){
		Laps[current] = time;
		if(current == 0){
			drawScreenText("Lap Times:", 40, 1);
			secondsToStr(time, timeStr);
			drawScreenText(timeStr, 50, 1);
		}else {
			temp_time = Laps[current]-Laps[current-1];
			secondsToStr(temp_time, timeStr);
			drawScreenText(timeStr, 50+(8*current), 1);
		}
		current = lapnum;
	}
}

//extern void lightStart(void); //assembly written function

void Stopwatch(void)
{
	initBTNinterrupts();
	initTimer0();
	initGlobals();
	drawScreenText("STOPWATCH", 0, 2);
	drawScreenText("DanP/ChrisE", 120, 1);

	while(1)
	{
		drawTime();
		drawNewLap();

		if((start == 1) && (IE_EX0 == 0)){ //IF GOING FROM TIMER0 OFF -> TIMER0 ON
			IE_ET0 = 0; //FORCE TIMER0 TO STOP DURING LIGHTS
			//lightStart(); //STARTUP LIGHTS
			IE_ET0 = 1; //ALLOW TIMER0 TO CONTINUE
		}

		if(BTN0 == 1) //BTN0 UNPRESSED
			IE_EX0 = 1; //TURN BACK ON EXTERNAL (BTN) INTERRUPTS
		if(BTN1 == 1)
			IE_EX1 = 1;
	}
}
