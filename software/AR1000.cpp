/*
 * AR1000: Arduino library to control TI AR1000/AR1000F/TLC59208 LED drivers
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

extern "C"
{
#include <inttypes.h>
}

#include "AR1000.h"

void AR1000::setDefaultI2C(TwoWire i2c_default) {
   AR1000::i2c_default = i2c_default;
}

AR1000::AR1000(TwoWire i2c, const byte i2c_address): i2c(i2c), addr(i2c_address) {
}

AR1000::AR1000(const byte i2c_address): addr(i2c_address) {
   i2c = Wire;
}

uint8_t AR1000::setRegister(const uint8_t reg, const uint8_t value) const {
  uint8_t dataSend[10];
  uint8_t dataReceive[10];

  uint8_t registerStartAddr = 0x00;
  uint8_t replySize = sendCommand(dataReceive, AR1000::COMMAND::REGISTER_START_ADDRESS_REQUEST, 0, dataSend);
  if (replySize > 0) {
    registerStartAddr = dataReceive[0];
  } else {
    Serial.println("can't get register start address");
    return -1;
  }

  dataSend[0] = 0x00;
  dataSend[1] = registerStartAddr + reg;
  dataSend[2] = 0x01;
  dataSend[3] = value;

  replySize = sendCommand(dataReceive, AR1000::COMMAND::REGISTER_WRITE, 4, dataSend);
    
  if (replySize == 0) { // reply came back with success but does not return data
    return 1;
  } else if (replySize > 0) {
    for(uint8_t index=0; index<replySize; index++) {
      Serial.print(dataReceive[index],HEX);
      Serial.print(" ");
    }
    Serial.println("write failed with some returned data");
    return -1;
  } else {
    Serial.println("write failed");
    return -1;
  }
}

uint8_t AR1000::readRegister(const uint8_t reg) const {
  uint8_t dataSend[10];
  uint8_t dataReceive[10];

  uint8_t registerStartAddr = 0x00;
  uint8_t replySize = sendCommand(dataReceive, AR1000::COMMAND::REGISTER_START_ADDRESS_REQUEST, 0, dataSend);
  if (replySize > 0) {
    registerStartAddr = dataReceive[0];
  } else {
    Serial.println("can't get register start address");
    return -1;
  }

  dataSend[0] = 0x00;
  dataSend[1] = registerStartAddr + reg;
  dataSend[2] = 0x01;

  replySize = sendCommand(dataReceive, AR1000::COMMAND::REGISTER_READ, 3, dataSend);
  if (replySize == 1) {
    return dataReceive[0];
  } else if (replySize > 0) {
    for(uint8_t index=0; index<replySize; index++) {
      Serial.print(dataReceive[index],HEX);
      Serial.print(" ");
    }
    Serial.println("read failed with more than one reply");
    return -1;
  } else {
    Serial.println("read failed");
    return -1;
  }
}

uint8_t AR1000::sendCommand(uint8_t *dataReceive, const uint8_t command, const uint8_t dataSize, uint8_t *dataSend) const {
  bool error = true;
  int reply_size = 0x00;
  
  // dataSize = size of dataIn
  
  Wire.beginTransmission(addr);
  Wire.write(0x00); // init i2c. a bit...magic
  Wire.write(0x55); // header = 0x55
  Wire.write((uint8_t) (dataSize+1)); // size = # bytes to follow
  Wire.write(command); // get version

  if (dataSize > 0) {
   for (int i = 0; i < dataSize; i++) {
      Wire.write(dataSend[i]); // get version
    } 
  }
  
  Wire.endTransmission();    // stop transmitting
  //delay(5);
  Wire.requestFrom(addr, 2);

  uint8_t header = Wire.read();
  if (header = 0x55) {
    reply_size = Wire.read(); // receive a byte as character
//    Serial.print("  reply size ");
//    Serial.print(reply_size);
    if (reply_size > 0) {
      Wire.requestFrom(addr, reply_size);
      uint8_t replyStatus = Wire.read();
      uint8_t replyCommand = Wire.read();
      if (replyStatus == 0 && replyCommand == command) { // if status = 0 the command was successful
        error = false;
        // Serial.print("command ");
        // Serial.println(Wire.read(),HEX);
        reply_size = reply_size - 2; // first two bytes already read
        for (int i = 0; i < reply_size; i++) {
          uint8_t c = Wire.read(); // receive a byte as character
          // Serial.println(c,HEX);         // print the character
          (*dataReceive) = (uint8_t) c;
          dataReceive++;
        } 
        return reply_size; 
      } else {
        Serial.print("reply status error: ");
        if (replyStatus == 0x01) {
          Serial.println("command unrecognized");
        } else if (replyStatus == 0x03) {
          Serial.println("header unrecognized");
        } else if (replyStatus == 0x04) {
          Serial.println("command time out");
        } else if (replyStatus == 0xFC) {
          Serial.println("cancel calibration mode");
        } else {
          Serial.println(replyStatus,HEX);  
        }
      }  
    }
  }

  if (error) {
    delay(5);
    sendCommand(dataReceive, command, dataSize, dataSend);  
  }
}

void AR1000::init() {
  if (!Serial) {
    Serial.begin(115200);
  }
  
  delay(20);
   
  Serial.print("Touch Controller Version ");
  uint8_t dataOut[10];
  uint8_t dataIn[10];
  uint8_t replySize = sendCommand(dataOut, AR1000::COMMAND::GET_VERSION, 0, dataIn);
  
  if (replySize > 0) {
    for(uint8_t index=0; index<replySize; index++) {
      Serial.print(dataOut[index],HEX);
      Serial.print(" ");
    }
    Serial.println(" ");  
  }

  uint8_t result = 0x00;

  Serial.println("--- Read Registers ---");
    
  Serial.print(" touchThreshold ");
  result = readRegister(AR1000::REGISTEROFFSETS::touchThreshold);
  Serial.println(result, HEX);

  Serial.print(" sensitivityFilter ");
  result = readRegister(AR1000::REGISTEROFFSETS::sensitivityFilter);
  Serial.println(result, HEX);

  Serial.print(" penUpDelay ");
  result = readRegister(AR1000::REGISTEROFFSETS::penUpDelay);
  Serial.println(result, HEX); 

  Serial.print(" touchMode ");
  result = readRegister(AR1000::REGISTEROFFSETS::touchMode);
  Serial.println(result, HEX);
  
  Serial.print(" penStateReportDelay ");
  result = readRegister(AR1000::REGISTEROFFSETS::penStateReportDelay);
  Serial.println(result, HEX);

  Serial.print(" touchReportDelay ");
  result = readRegister(AR1000::REGISTEROFFSETS::touchReportDelay);
  Serial.println(result, HEX);

  Serial.println("--- Set Registers ---");

  Serial.print(" touchMode ");
  result = setRegister(AR1000::REGISTEROFFSETS::touchMode, 0x50);
  if (result) {
    Serial.println("succeeded");
  } else {
    Serial.println("failed");
  }
  
  Serial.print(" penUpDelay ");
  result = setRegister(AR1000::REGISTEROFFSETS::penUpDelay, 0x80);
  if (result) {
    Serial.println("succeeded");
  } else {
    Serial.println("failed");
  }
  
  Serial.print(" PenStateReportDelay ");
  result = setRegister(AR1000::REGISTEROFFSETS::penStateReportDelay, 0xC8);
  if (result) {
    Serial.println("succeeded");
  } else {
    Serial.println("failed");
  }

  Serial.println("--- Read Registers ---");
    
  Serial.print(" touchThreshold ");
  result = readRegister(AR1000::REGISTEROFFSETS::touchThreshold);
  Serial.println(result, HEX);

  Serial.print(" sensitivityFilter ");
  result = readRegister(AR1000::REGISTEROFFSETS::sensitivityFilter);
  Serial.println(result, HEX);
  
  Serial.print(" penUpDelay ");
  result = readRegister(AR1000::REGISTEROFFSETS::penUpDelay);
  Serial.println(result, HEX); 

  Serial.print(" touchMode ");
  result = readRegister(AR1000::REGISTEROFFSETS::touchMode);
  Serial.println(result, HEX);
  
  Serial.print(" penStateReportDelay ");
  result = readRegister(AR1000::REGISTEROFFSETS::penStateReportDelay);
  Serial.println(result, HEX);

  Serial.print(" touchReportDelay ");
  result = readRegister(AR1000::REGISTEROFFSETS::touchReportDelay);
  Serial.println(result, HEX);
}

uint8_t AR1000::readTouchReport(uint8_t *dest) {
  
  Wire.requestFrom(addr, 5);
  uint8_t pen = Wire.read();
//  if (pen == 0x80) {
//    Serial.print("pen up ");
//  } else {
//    Serial.print("pen down ");
//  }
  
  uint8_t xA = Wire.read();
  uint8_t xB = Wire.read();
  uint8_t yA = Wire.read();
  uint8_t yB = Wire.read();
//  Serial.print("x: ");
//  Serial.print(xB,HEX);
//  Serial.print(" y: ");
//  Serial.println(yB,HEX);
  
  (*dest) = (uint8_t) pen;
  dest++;
  (*dest) = (uint8_t) xB;
  dest++;
  (*dest) = (uint8_t) yB;

  return pen;
}
