/////////////////////////////////////////////////////////////////////////////
// Includes
/////////////////////////////////////////////////////////////////////////////

#include "bsp.h"
#include "InitDevice.h"
#include "disp.h"

//---------------------------------------------------------------------------
// main() Routine
// --------------------------------------------------------------------------
int main(void)
{
  // Enter default mode
  enter_DefaultMode_from_RESET();

  // Enable all interrupts
  IE_EA = 1;

  DISP_Init();
  Stopwatch_main();

  while (1);
}
