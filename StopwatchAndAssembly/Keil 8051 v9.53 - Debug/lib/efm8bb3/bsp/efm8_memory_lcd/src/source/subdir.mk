################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/EFM8BB3/bsp/efm8_memory_lcd/source/spi.c \
C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/EFM8BB3/bsp/efm8_memory_lcd/source/tick.c 

OBJS += \
./lib/efm8bb3/bsp/efm8_memory_lcd/src/source/spi.OBJ \
./lib/efm8bb3/bsp/efm8_memory_lcd/src/source/tick.OBJ 


# Each subdirectory must supply rules for building sources it contributes
lib/efm8bb3/bsp/efm8_memory_lcd/src/source/spi.OBJ: C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/EFM8BB3/bsp/efm8_memory_lcd/source/spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: Keil 8051 Compiler'
	C51 "@$(patsubst %.OBJ,%.__i,$@)" || $(RC)
	@echo 'Finished building: $<'
	@echo ' '

lib/efm8bb3/bsp/efm8_memory_lcd/src/source/spi.OBJ: C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/kits/common/bsp/bsp.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/kits/common/drivers/efm8_memory_lcd/inc/spi.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/EFM8BB3/peripheral_driver/inc/spi_0.h C:/SiliconLabs/SimplicityStudio/v4/developer/toolchains/keil_8051/9.53/INC/STRING.H C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/kits/EFM8BB3_SLSTK2022A/config/bsp_config.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/kits/common/drivers/efm8_memory_lcd/inc/config/spi_config.h C:/Users/Daniel/SimplicityStudio/v4_workspace/StopwatchAndAssembly/inc/config/efm8_config.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/EFM8BB3/inc/SI_EFM8BB3_Register_Enums.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/kits/common/drivers/efm8_memory_lcd/inc/disp.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/EFM8BB3/inc/SI_EFM8BB3_Defs.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/shared/si8051Base/si_toolchain.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/shared/si8051Base/stdint.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/shared/si8051Base/stdbool.h

lib/efm8bb3/bsp/efm8_memory_lcd/src/source/tick.OBJ: C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/EFM8BB3/bsp/efm8_memory_lcd/source/tick.c
	@echo 'Building file: $<'
	@echo 'Invoking: Keil 8051 Compiler'
	C51 "@$(patsubst %.OBJ,%.__i,$@)" || $(RC)
	@echo 'Finished building: $<'
	@echo ' '

lib/efm8bb3/bsp/efm8_memory_lcd/src/source/tick.OBJ: C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/kits/common/bsp/bsp.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/kits/common/drivers/efm8_memory_lcd/inc/tick.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/kits/EFM8BB3_SLSTK2022A/config/bsp_config.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/EFM8BB3/inc/SI_EFM8BB3_Register_Enums.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/EFM8BB3/inc/SI_EFM8BB3_Defs.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/shared/si8051Base/si_toolchain.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/shared/si8051Base/stdint.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.4/Device/shared/si8051Base/stdbool.h


