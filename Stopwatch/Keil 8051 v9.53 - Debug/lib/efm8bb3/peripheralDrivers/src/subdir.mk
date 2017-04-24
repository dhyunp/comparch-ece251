################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/EFM8BB3/peripheral_driver/src/spi_0.c 

OBJS += \
./lib/efm8bb3/peripheralDrivers/src/spi_0.OBJ 


# Each subdirectory must supply rules for building sources it contributes
lib/efm8bb3/peripheralDrivers/src/spi_0.OBJ: C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/EFM8BB3/peripheral_driver/src/spi_0.c
	@echo 'Building file: $<'
	@echo 'Invoking: Keil 8051 Compiler'
	C51 "@$(patsubst %.OBJ,%.__i,$@)" || $(RC)
	@echo 'Finished building: $<'
	@echo ' '

lib/efm8bb3/peripheralDrivers/src/spi_0.OBJ: C:/Users/student/SimplicityStudio/v4_workspace/Stopwatch/inc/config/efm8_config.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/EFM8BB3/inc/SI_EFM8BB3_Register_Enums.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/EFM8BB3/peripheral_driver/inc/spi_0.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/EFM8BB3/inc/SI_EFM8BB3_Defs.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/shared/si8051Base/si_toolchain.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/shared/si8051Base/stdint.h C:/SiliconLabs/SimplicityStudio/v4/developer/sdks/8051/v4.0.3/Device/shared/si8051Base/stdbool.h


