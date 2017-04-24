################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/kits/common/drivers/efm8_joystick/joystick.c 

OBJS += \
./lib/bsp/efm8_joystick/joystick.OBJ 


# Each subdirectory must supply rules for building sources it contributes
lib/bsp/efm8_joystick/joystick.OBJ: C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/kits/common/drivers/efm8_joystick/joystick.c
	@echo 'Building file: $<'
	@echo 'Invoking: Keil 8051 Compiler'
	C51 "@$(patsubst %.OBJ,%.__i,$@)" || $(RC)
	@echo 'Finished building: $<'
	@echo ' '

lib/bsp/efm8_joystick/joystick.OBJ: C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/kits/common/bsp/bsp.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/kits/common/drivers/efm8_joystick/joystick.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/kits/EFM8BB3_SLSTK2022A/config/bsp_config.h C:/Users/student/SimplicityStudio/v4_workspace/Stopwatch/inc/config/joystick_config.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/EFM8BB3/inc/SI_EFM8BB3_Register_Enums.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/EFM8BB3/inc/SI_EFM8BB3_Defs.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/shared/si8051Base/si_toolchain.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/shared/si8051Base/stdint.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/shared/si8051Base/stdbool.h


