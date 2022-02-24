/*
 * TLC59108: Arduino library to control TI TLC59108/TLC59108F/TLC59208 LED drivers
 * 
 * (C) 2013 Christopher Smith <chrylis@gmail.com>
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef AR1000_H
# define AR1000_H

# include <Arduino.h>
# include "Wire.h"

class AR1000
{
public:
	// default I2C addresses
	struct I2C_ADDR
	{
		static const byte BASE = 0x4D;
	};

	struct COMMAND
	{
    static const byte GET_VERSION = 0x10;
    static const byte ENABLE_TOUCH = 0x12;
    static const byte DISABLE_TOUCH = 0x13;
    static const byte CALIBRATE_MODE = 0x14;
    static const byte REGISTER_READ = 0x20;
    static const byte REGISTER_WRITE = 0x21;
    static const byte REGISTER_START_ADDRESS_REQUEST = 0x22;
    static const byte REGISTERS_WRITE_TO_EEPROM = 0x23;
    static const byte EEPROM_READ = 0x28;
    static const byte EEPROM_WRITE = 0x29;
    static const byte EEPROM_WRITE_TO_REGISTERS = 0x2B;
	};


  struct REGISTEROFFSETS
  {
    static const byte touchThreshold = 0x02;
    static const byte sensitivityFilter = 0x03;
    static const byte samplingFast = 0x04;
    static const byte samplingSlow = 0x05;
    static const byte accuracyFilterFast = 0x06;
    static const byte accuracyFilterSlow = 0x07;
    static const byte speedThreshold = 0x08;
    static const byte sleepDelay = 0x0A;
    static const byte penUpDelay = 0x0B;
    static const byte touchMode = 0x0C;
    static const byte touchOptions = 0x0D;
    static const byte calibrationInset = 0x0E;
    static const byte penStateReportDelay = 0x0F;
    static const byte touchReportDelay = 0x11;
  };
  
	struct EEPROMMAP
	{
    static const byte touchThreshold = 0x03;
    static const byte sensitivityFilter = 0x04;
    static const byte samplingFast = 0x05;
    static const byte samplingSlow = 0x06;
    static const byte accuracyFilterFast = 0x07;
    static const byte accuracyFilterSlow = 0x08;
    static const byte speedThreshold = 0x09;
    static const byte sleepDelay = 0x0B;
    static const byte penUpDelay = 0x0C;
    static const byte touchMode = 0x0D;
    static const byte touchOptions = 0x0E;
    static const byte calibrationInset = 0x0F;
    static const byte penStateReportDelay = 0x10;
    static const byte touchReportDelay = 0x12;
    static const byte dataBlockSeparator = 0x14;
    static const byte calibrationULXlow = 0x15;
    static const byte calibrationULXhigh = 0x16;
    static const byte calibrationULYlow = 0x17;
    static const byte calibrationULYhigh = 0x18;
    static const byte calibrationURXlow = 0x19;
    static const byte calibrationURXhigh = 0x1A;
    static const byte calibrationURYlow = 0x1B;
    static const byte calibrationURYhigh = 0x1C;
    static const byte calibrationLRXlow = 0x1D;
    static const byte calibrationLRXhigh = 0x1E;
    static const byte calibrationLRYlow = 0x1F;
    static const byte calibrationLRYhigh = 0x20;
    static const byte calibrationLLXlow = 0x21;
    static const byte calibrationLLXhigh = 0x22;
    static const byte calibrationLLYlow = 0x23;
    static const byte calibrationLLYhigh = 0x24;
    static const byte calibrationFlipState = 0x25;
	};


public:
	// sets default I2C interface for pre-initialization commands (e.g., subaddress setting)
	static void setDefaultI2C(TwoWire i2c_default);

	// creates an instance managing drivers on the specified interface and address
	AR1000(TwoWire i2c, const byte i2c_address);

	// creates an instance managing drivers on the specified address with the default interface
	AR1000(const byte i2c_address);

	// initializes the driver by performing a hardware reset (if pin is specified) and enabling the oscillator
	void init();
  
  // sets a single register; returns -1 on error
  uint8_t setRegister(const uint8_t reg, const uint8_t value) const;
  
	// reads a single register; returns -1 on error
	uint8_t readRegister(const uint8_t reg) const;

  uint8_t sendCommand(uint8_t *dataReceive, const uint8_t command, const uint8_t dataSize, uint8_t *dataSend) const;

  // return touch location
  uint8_t readTouchReport(uint8_t *dest);


private:
	static TwoWire i2c_default;
	mutable TwoWire i2c;
	int addr;

};

#endif // AR1000_H
