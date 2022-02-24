#include <Wire.h>

#include "AR1000.h"
#include "TLC59108.h"
#include "SPI.h"
#include "Adafruit_GFX.h"
#include "Adafruit_ILI9341.h"

/* Display backlight */
#define HW_RESET_PIN 9 // not connected
#define i2cAddrBacklight TLC59108::I2C_ADDR::BASE
TLC59108 leds(i2cAddrBacklight);

/* Display tft */
#define TFT_DC 0
#define TFT_CS 17
#define TFT_MOSI 16
#define TFT_CLK 15
#define TFT_RST -5
#define TFT_MISO 14

// Use hardware SPI and the above for CS/DC
Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC);

/* Display touchscreen */
// touch panel configured to send pen down on touch and continuously while being touched
const byte TOUCH_IRQ_PIN = 7;
#define i2cAddrTouchController AR1000::I2C_ADDR::BASE
AR1000 touchController(i2cAddrTouchController);
volatile byte touchReportReady = LOW;

void touchEvent() {
  touchReportReady = HIGH;
}

/* TC Reader */

#define TC_ENABLE 21 // A3
#define TC_SEL0 20 // A2
#define TC_SEL1 19 // A1
#define TC_SEL2 18 // A0
int TC_OUTPUT = A4;
int TC_OFFSET = A5;

int tcMatrix[8][3] = {
  {0,0,0},
  {1,0,0},
  {0,1,0},
  {1,1,0},
  {1,1,1},
  {0,1,1},
  {1,0,1},
  {0,0,1},
};

const int numReadings = 200;

float tcReading[8];                  // the running total
float offsetReading[8];                // the average
float tcAvg[8];
float offsetAvg[8];
float temperature[8];
uint8_t units = 0; // 0=C, 1=F0

#define TEMP_MAX 350

/* Display tft */
/* Initialize buttons for use on display */
// create 2 buttons
char buttonlabels[2][6] = {"C", "F"};
uint16_t buttoncolors[2] = {ILI9341_DARKGREEN, ILI9341_RED};
Adafruit_GFX_Button buttons[2];

void setup() {
  Serial.begin(115200);
//  while (!Serial) {
    //; // wait for serial port to connect. Needed for native USB
//  }
  
  pinMode(TC_ENABLE, OUTPUT);
  pinMode(TC_SEL0, OUTPUT);
  pinMode(TC_SEL1, OUTPUT);
  pinMode(TC_SEL2, OUTPUT);

  digitalWrite(TC_ENABLE, HIGH);
  digitalWrite(TC_SEL0, HIGH);
  digitalWrite(TC_SEL1, LOW);
  digitalWrite(TC_SEL2, LOW);
  
  pinMode(TOUCH_IRQ_PIN, INPUT);
  attachInterrupt(digitalPinToInterrupt(TOUCH_IRQ_PIN), touchEvent, RISING);

  Wire.begin();
  
  touchController.init();
  
  leds.init(HW_RESET_PIN);
  leds.setLedOutputMode(TLC59108::LED_MODE::PWM_IND);
  leds.setBrightness(0, 0x00);
  delay(200);
  leds.setBrightness(0, 0xff);

  tft.begin();

  // Initialize content to display on screen
  tft.fillScreen(ILI9341_BLACK);

  uint8_t buttonTextScale = 2;
  buttons[0].initButton(&tft, 20+45, 320-60+20, 90, 40, ILI9341_PURPLE, ILI9341_BLUE, ILI9341_WHITE, buttonlabels[0], buttonTextScale);
  buttons[0].drawButton();
  buttons[1].initButton(&tft, 130+45, 320-60+20, 90, 40, ILI9341_PURPLE, ILI9341_BLUE, ILI9341_WHITE, buttonlabels[1], buttonTextScale);
  buttons[1].drawButton();

  uint16_t textBaseY = 20;
  uint16_t textLineSpacing = 30;
  tft.setTextColor(ILI9341_WHITE);
  tft.setTextSize(2);
  for (uint8_t i=0; i<8; i++) {
    tft.setCursor(40, textBaseY+textLineSpacing*i);
    tft.print(i);
    tft.print(" : 000.00");
    delay(5);
  }
    
  Serial.println("Setup Complete");
}

void loop(){
  uint8_t touchLocation[2];
  uint16_t pressX;
  uint16_t pressY;
  
  uint16_t textBaseY = 20;
  uint16_t textLineSpacing = 30;
  
  if (touchReportReady) {
    uint8_t pen = touchController.readTouchReport(touchLocation);
    touchReportReady = LOW;
    // Convert touch panel coordinates (1 to 30 on each axis) into display coordinates (320x240)
    pressX = touchLocation[1]*(240/30);
    pressY = 320 - touchLocation[2]*(320/30);
  } else {
    pressX = -1;
    pressY = -1;
  }

  // go thru all the buttons, checking if they were pressed
  for (uint8_t b=0; b<2; b++) {
    if (buttons[b].contains(pressX, pressY)) {
      //Serial.print("Pressing: "); Serial.println(b);
      buttons[b].press(true);  // tell the button it is pressed
      units = b;
    } else {
      buttons[b].press(false);  // tell the button it is NOT pressed
    }
  }

  // now we can ask the buttons if their state has changed
  for (uint8_t b=0; b<2; b++) {
    if (buttons[b].justReleased()) {
      // Serial.print("Released: "); Serial.println(b);
      buttons[b].drawButton();  // draw normal
    }
    if (buttons[b].justPressed()) {
      buttons[b].drawButton(true);  // draw invert!
    }
  }
    
  tft.setTextColor(ILI9341_WHITE, ILI9341_BLACK);
  tft.setTextSize(2);

  for (uint8_t j=0; j<8; j++) {
    digitalWrite(TC_ENABLE, LOW);
    digitalWrite(TC_SEL0, tcMatrix[j][0]);
    digitalWrite(TC_SEL1, tcMatrix[j][1]);
    digitalWrite(TC_SEL2, tcMatrix[j][2]);
    digitalWrite(TC_ENABLE, HIGH);
    
    delay(1);

    tcReading[j] = 0;
    for (int readIndex=0; readIndex<numReadings; readIndex++) {
      // add the reading to the total:
      tcReading[j] = tcReading[j] + analogRead(TC_OUTPUT);
    }
    tcAvg[j] = tcReading[j] / numReadings;

    offsetReading[j] = 0;
    for (int readIndex=0; readIndex<numReadings; readIndex++) {
      // add the reading to the total:
      offsetReading[j] = offsetReading[j] + analogRead(TC_OFFSET);
    }
    offsetAvg[j] = offsetReading[j] / numReadings;

    // AD8497 TC amplifier outputs at 5mV / C
    // ADC on Arduinos is 10bit => max reading of 1023
    // ADC is referenced to 3.3V
    // Temperature = ADCreading / 1023 * 3.3[V] * 1000[mV/V] / 5[mV/C]
    // Temperature = ADCreading * 0.64516129
    temperature[j] = (float (tcAvg[j]-offsetAvg[j]))*0.64516129;
    
    if (temperature[j] > TEMP_MAX) {
      temperature[j] = 999;
    }
  }

  

  for (uint8_t i=0; i<8; i++) {
    tft.setCursor(40, textBaseY+textLineSpacing*i);
    tft.print(i);
    tft.print(" : ");
    
    if (temperature[i]==999) {
       tft.print("         ");
    } else {
      if (temperature[i]>=100) {
        tft.print(" ");
      } else if (temperature[i] > 0) {
        tft.print("  ");
      } else if (temperature[i] < 0 & temperature[i] > -100) {
        tft.print(" ");
      } else if (temperature[i] == 0) {
        tft.print("   ");
      }
      
      if (units == 1) {
        //temperature[j] = temperature[j]*9/5 + 32;
        Serial.print(temperature[i]*9/5 + 32,2);
        Serial.print("°");
        Serial.print("F ");
        
        tft.print(temperature[i]*9/5 + 32,2);
        tft.print((char)247);
        tft.print("F");
      } else {
        Serial.print(temperature[i],2);
        Serial.print("°");
        Serial.print("C ");
        
        tft.print(temperature[i],2);
        tft.print((char)247);
        tft.print("C");
      }
    }
  }
  Serial.println("");
  
}

