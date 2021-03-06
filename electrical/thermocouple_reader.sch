EESchema Schematic File Version 2  date 8/28/2013 1:08:23 PM
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:zatetic
LIBS:thermocouple_reader-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "28 aug 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L AD849X U1
U 1 1 521CB4F9
P 8750 2200
F 0 "U1" H 8600 2450 60  0000 C CNN
F 1 "AD849X" H 8750 1950 60  0000 C CNN
F 2 "" H 8750 2200 60  0000 C CNN
F 3 "" H 8750 2200 60  0000 C CNN
	1    8750 2200
	1    0    0    -1  
$EndComp
$Comp
L ADG707 U2
U 1 1 521CD413
P 9100 5300
F 0 "U2" H 8600 5950 60  0000 C CNN
F 1 "ADG707" H 8700 6050 60  0000 C CNN
F 2 "" H 10100 4600 60  0000 C CNN
F 3 "" H 10100 4600 60  0000 C CNN
	1    9100 5300
	1    0    0    -1  
$EndComp
$Comp
L OP777 U3
U 1 1 521CD422
P 5400 4050
F 0 "U3" H 5500 4300 60  0000 C CNN
F 1 "OP777" H 5600 3800 60  0000 C CNN
F 2 "" H 5400 4050 60  0000 C CNN
F 3 "" H 5400 4050 60  0000 C CNN
	1    5400 4050
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P1
U 1 1 521CD431
P 1000 950
F 0 "P1" V 950 950 40  0000 C CNN
F 1 "TC_0" V 1050 950 40  0000 C CNN
F 2 "" H 1000 950 60  0000 C CNN
F 3 "" H 1000 950 60  0000 C CNN
	1    1000 950 
	-1   0    0    1   
$EndComp
$Comp
L ZENER_SOT23 D1
U 1 1 521CD4F0
P 9400 2350
F 0 "D1" H 9400 2450 40  0000 C CNN
F 1 "2.4V" H 9400 2250 30  0000 C CNN
F 2 "~" H 9400 2350 60  0000 C CNN
F 3 "~" H 9400 2350 60  0000 C CNN
F 4 "MMBZ5221B-7-F" H 9400 2350 60  0001 C CNN "Part Number"
	1    9400 2350
	0    -1   -1   0   
$EndComp
Text Notes 8400 2850 0    60   ~ 0
TC_OUT shunted to (0.95*Varef) so \nuC ADC inputs are not over loaded
$Comp
L R R28
U 1 1 521CD534
P 4850 3900
F 0 "R28" V 4930 3900 40  0000 C CNN
F 1 "10K" V 4857 3901 40  0000 C CNN
F 2 "~" V 4780 3900 30  0000 C CNN
F 3 "~" H 4850 3900 30  0000 C CNN
	1    4850 3900
	1    0    0    -1  
$EndComp
$Comp
L R R29
U 1 1 521CD544
P 4850 4600
F 0 "R29" V 4930 4600 40  0000 C CNN
F 1 "2.49K" V 4857 4601 40  0000 C CNN
F 2 "~" V 4780 4600 30  0000 C CNN
F 3 "~" H 4850 4600 30  0000 C CNN
	1    4850 4600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 521CD554
P 5400 3600
F 0 "#PWR01" H 5400 3560 30  0001 C CNN
F 1 "+3.3V" H 5500 3650 30  0000 C CNN
F 2 "" H 5400 3600 60  0000 C CNN
F 3 "" H 5400 3600 60  0000 C CNN
	1    5400 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 521CD55A
P 5400 5000
F 0 "#PWR02" H 5400 5000 30  0001 C CNN
F 1 "GND" H 5400 4930 30  0001 C CNN
F 2 "" H 5400 5000 60  0000 C CNN
F 3 "" H 5400 5000 60  0000 C CNN
	1    5400 5000
	1    0    0    -1  
$EndComp
NoConn ~ 5050 3950
NoConn ~ 5050 4050
NoConn ~ 5050 4150
Text Label 6200 4050 0    60   ~ 0
V_TC_offset
Text Notes 4000 5050 0    60   ~ 0
V_TC_offset = V_AREF * (R_GND / (R_GND+R_VSS))\n(-0.5V_TC_offset allows for measurement down to -100C)\n\nR_GND = (V_TC_offset/V_AREF)*R_VSS / [1-(V_TC_offset/V_AREF)]\n\nV_TC_offset = 2.5*(2490 / (2490+10000) = 0.4984V
$Comp
L R R2
U 1 1 521CD85D
P 1600 1100
F 0 "R2" V 1680 1100 40  0000 C CNN
F 1 "1M" V 1607 1101 40  0000 C CNN
F 2 "~" V 1530 1100 30  0000 C CNN
F 3 "~" H 1600 1100 30  0000 C CNN
	1    1600 1100
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 521CD863
P 1600 650
F 0 "R1" V 1700 650 40  0000 C CNN
F 1 "10K" V 1607 651 40  0000 C CNN
F 2 "~" V 1530 650 30  0000 C CNN
F 3 "~" H 1600 650 30  0000 C CNN
	1    1600 650 
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 521CD869
P 1600 1250
F 0 "R3" V 1680 1250 40  0000 C CNN
F 1 "10K" V 1607 1251 40  0000 C CNN
F 2 "~" V 1530 1250 30  0000 C CNN
F 3 "~" H 1600 1250 30  0000 C CNN
	1    1600 1250
	0    -1   -1   0   
$EndComp
$Comp
L C C10
U 1 1 521CD871
P 2500 1100
F 0 "C10" H 2500 1200 40  0000 L CNN
F 1 "1nF" H 2506 1015 40  0000 L CNN
F 2 "~" H 2538 950 30  0000 C CNN
F 3 "~" H 2500 1100 60  0000 C CNN
	1    2500 1100
	0    -1   -1   0   
$EndComp
$Comp
L C C1
U 1 1 521CD87E
P 2150 950
F 0 "C1" V 2200 1050 40  0000 L CNN
F 1 "10nF" V 2200 750 40  0000 L CNN
F 2 "~" H 2188 800 30  0000 C CNN
F 3 "~" H 2150 950 60  0000 C CNN
	1    2150 950 
	-1   0    0    1   
$EndComp
$Comp
L C C9
U 1 1 521CD884
P 2500 800
F 0 "C9" H 2500 900 40  0000 L CNN
F 1 "1nF" H 2506 715 40  0000 L CNN
F 2 "~" H 2538 650 30  0000 C CNN
F 3 "~" H 2500 800 60  0000 C CNN
	1    2500 800 
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR03
U 1 1 521CDCD2
P 1950 1100
F 0 "#PWR03" H 1950 1100 30  0001 C CNN
F 1 "GND" H 1950 1030 30  0001 C CNN
F 2 "" H 1950 1100 60  0000 C CNN
F 3 "" H 1950 1100 60  0000 C CNN
	1    1950 1100
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR04
U 1 1 521CDD31
P 2800 950
F 0 "#PWR04" H 2800 950 30  0001 C CNN
F 1 "GND" H 2800 880 30  0001 C CNN
F 2 "" H 2800 950 60  0000 C CNN
F 3 "" H 2800 950 60  0000 C CNN
	1    2800 950 
	0    -1   -1   0   
$EndComp
Text Label 2800 650  0    60   ~ 0
TC_NiCr_Pos_0
Text Label 2800 1250 0    60   ~ 0
TC_NiAl_Neg_0
$Comp
L CONN_2 P2
U 1 1 521CDE1D
P 1000 1850
F 0 "P2" V 950 1850 40  0000 C CNN
F 1 "TC_1" V 1050 1850 40  0000 C CNN
F 2 "" H 1000 1850 60  0000 C CNN
F 3 "" H 1000 1850 60  0000 C CNN
	1    1000 1850
	-1   0    0    1   
$EndComp
$Comp
L R R5
U 1 1 521CDE23
P 1600 2000
F 0 "R5" V 1680 2000 40  0000 C CNN
F 1 "1M" V 1607 2001 40  0000 C CNN
F 2 "~" V 1530 2000 30  0000 C CNN
F 3 "~" H 1600 2000 30  0000 C CNN
	1    1600 2000
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 521CDE29
P 1600 1550
F 0 "R4" V 1700 1550 40  0000 C CNN
F 1 "10K" V 1607 1551 40  0000 C CNN
F 2 "~" V 1530 1550 30  0000 C CNN
F 3 "~" H 1600 1550 30  0000 C CNN
	1    1600 1550
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 521CDE2F
P 1600 2150
F 0 "R6" V 1680 2150 40  0000 C CNN
F 1 "10K" V 1607 2151 40  0000 C CNN
F 2 "~" V 1530 2150 30  0000 C CNN
F 3 "~" H 1600 2150 30  0000 C CNN
	1    1600 2150
	0    -1   -1   0   
$EndComp
$Comp
L C C12
U 1 1 521CDE35
P 2500 2000
F 0 "C12" H 2500 2100 40  0000 L CNN
F 1 "1nF" H 2506 1915 40  0000 L CNN
F 2 "~" H 2538 1850 30  0000 C CNN
F 3 "~" H 2500 2000 60  0000 C CNN
	1    2500 2000
	0    -1   -1   0   
$EndComp
$Comp
L C C2
U 1 1 521CDE3B
P 2150 1850
F 0 "C2" V 2200 1950 40  0000 L CNN
F 1 "10nF" V 2200 1650 40  0000 L CNN
F 2 "~" H 2188 1700 30  0000 C CNN
F 3 "~" H 2150 1850 60  0000 C CNN
	1    2150 1850
	-1   0    0    1   
$EndComp
$Comp
L C C11
U 1 1 521CDE41
P 2500 1700
F 0 "C11" H 2500 1800 40  0000 L CNN
F 1 "1nF" H 2506 1615 40  0000 L CNN
F 2 "~" H 2538 1550 30  0000 C CNN
F 3 "~" H 2500 1700 60  0000 C CNN
	1    2500 1700
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR05
U 1 1 521CDE4B
P 1950 2000
F 0 "#PWR05" H 1950 2000 30  0001 C CNN
F 1 "GND" H 1950 1930 30  0001 C CNN
F 2 "" H 1950 2000 60  0000 C CNN
F 3 "" H 1950 2000 60  0000 C CNN
	1    1950 2000
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR06
U 1 1 521CDE52
P 2800 1850
F 0 "#PWR06" H 2800 1850 30  0001 C CNN
F 1 "GND" H 2800 1780 30  0001 C CNN
F 2 "" H 2800 1850 60  0000 C CNN
F 3 "" H 2800 1850 60  0000 C CNN
	1    2800 1850
	0    -1   -1   0   
$EndComp
Text Label 2800 1550 0    60   ~ 0
TC_NiCr_Pos_1
Text Label 2800 2150 0    60   ~ 0
TC_NiAl_Neg_1
$Comp
L CONN_2 P3
U 1 1 521CDEA4
P 1000 2750
F 0 "P3" V 950 2750 40  0000 C CNN
F 1 "TC_2" V 1050 2750 40  0000 C CNN
F 2 "" H 1000 2750 60  0000 C CNN
F 3 "" H 1000 2750 60  0000 C CNN
	1    1000 2750
	-1   0    0    1   
$EndComp
$Comp
L R R8
U 1 1 521CDEAA
P 1600 2900
F 0 "R8" V 1680 2900 40  0000 C CNN
F 1 "1M" V 1607 2901 40  0000 C CNN
F 2 "~" V 1530 2900 30  0000 C CNN
F 3 "~" H 1600 2900 30  0000 C CNN
	1    1600 2900
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 521CDEB0
P 1600 2450
F 0 "R7" V 1700 2450 40  0000 C CNN
F 1 "10K" V 1607 2451 40  0000 C CNN
F 2 "~" V 1530 2450 30  0000 C CNN
F 3 "~" H 1600 2450 30  0000 C CNN
	1    1600 2450
	0    -1   -1   0   
$EndComp
$Comp
L R R9
U 1 1 521CDEB6
P 1600 3050
F 0 "R9" V 1680 3050 40  0000 C CNN
F 1 "10K" V 1607 3051 40  0000 C CNN
F 2 "~" V 1530 3050 30  0000 C CNN
F 3 "~" H 1600 3050 30  0000 C CNN
	1    1600 3050
	0    -1   -1   0   
$EndComp
$Comp
L C C14
U 1 1 521CDEBC
P 2500 2900
F 0 "C14" H 2500 3000 40  0000 L CNN
F 1 "1nF" H 2506 2815 40  0000 L CNN
F 2 "~" H 2538 2750 30  0000 C CNN
F 3 "~" H 2500 2900 60  0000 C CNN
	1    2500 2900
	0    -1   -1   0   
$EndComp
$Comp
L C C3
U 1 1 521CDEC2
P 2150 2750
F 0 "C3" V 2200 2850 40  0000 L CNN
F 1 "10nF" V 2200 2550 40  0000 L CNN
F 2 "~" H 2188 2600 30  0000 C CNN
F 3 "~" H 2150 2750 60  0000 C CNN
	1    2150 2750
	-1   0    0    1   
$EndComp
$Comp
L C C13
U 1 1 521CDEC8
P 2500 2600
F 0 "C13" H 2500 2700 40  0000 L CNN
F 1 "1nF" H 2506 2515 40  0000 L CNN
F 2 "~" H 2538 2450 30  0000 C CNN
F 3 "~" H 2500 2600 60  0000 C CNN
	1    2500 2600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR07
U 1 1 521CDED2
P 1950 2900
F 0 "#PWR07" H 1950 2900 30  0001 C CNN
F 1 "GND" H 1950 2830 30  0001 C CNN
F 2 "" H 1950 2900 60  0000 C CNN
F 3 "" H 1950 2900 60  0000 C CNN
	1    1950 2900
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR08
U 1 1 521CDED9
P 2800 2750
F 0 "#PWR08" H 2800 2750 30  0001 C CNN
F 1 "GND" H 2800 2680 30  0001 C CNN
F 2 "" H 2800 2750 60  0000 C CNN
F 3 "" H 2800 2750 60  0000 C CNN
	1    2800 2750
	0    -1   -1   0   
$EndComp
Text Label 2800 2450 0    60   ~ 0
TC_NiCr_Pos_2
Text Label 2800 3050 0    60   ~ 0
TC_NiAl_Neg_2
$Comp
L CONN_2 P4
U 1 1 521CDEEC
P 1000 3650
F 0 "P4" V 950 3650 40  0000 C CNN
F 1 "TC_3" V 1050 3650 40  0000 C CNN
F 2 "" H 1000 3650 60  0000 C CNN
F 3 "" H 1000 3650 60  0000 C CNN
	1    1000 3650
	-1   0    0    1   
$EndComp
$Comp
L R R11
U 1 1 521CDEF2
P 1600 3800
F 0 "R11" V 1680 3800 40  0000 C CNN
F 1 "1M" V 1607 3801 40  0000 C CNN
F 2 "~" V 1530 3800 30  0000 C CNN
F 3 "~" H 1600 3800 30  0000 C CNN
	1    1600 3800
	0    -1   -1   0   
$EndComp
$Comp
L R R10
U 1 1 521CDEF8
P 1600 3350
F 0 "R10" V 1700 3350 40  0000 C CNN
F 1 "10K" V 1607 3351 40  0000 C CNN
F 2 "~" V 1530 3350 30  0000 C CNN
F 3 "~" H 1600 3350 30  0000 C CNN
	1    1600 3350
	0    -1   -1   0   
$EndComp
$Comp
L R R12
U 1 1 521CDEFE
P 1600 3950
F 0 "R12" V 1680 3950 40  0000 C CNN
F 1 "10K" V 1607 3951 40  0000 C CNN
F 2 "~" V 1530 3950 30  0000 C CNN
F 3 "~" H 1600 3950 30  0000 C CNN
	1    1600 3950
	0    -1   -1   0   
$EndComp
$Comp
L C C16
U 1 1 521CDF04
P 2500 3800
F 0 "C16" H 2500 3900 40  0000 L CNN
F 1 "1nF" H 2506 3715 40  0000 L CNN
F 2 "~" H 2538 3650 30  0000 C CNN
F 3 "~" H 2500 3800 60  0000 C CNN
	1    2500 3800
	0    -1   -1   0   
$EndComp
$Comp
L C C4
U 1 1 521CDF0A
P 2150 3650
F 0 "C4" V 2200 3750 40  0000 L CNN
F 1 "10nF" V 2200 3450 40  0000 L CNN
F 2 "~" H 2188 3500 30  0000 C CNN
F 3 "~" H 2150 3650 60  0000 C CNN
	1    2150 3650
	-1   0    0    1   
$EndComp
$Comp
L C C15
U 1 1 521CDF10
P 2500 3500
F 0 "C15" H 2500 3600 40  0000 L CNN
F 1 "1nF" H 2506 3415 40  0000 L CNN
F 2 "~" H 2538 3350 30  0000 C CNN
F 3 "~" H 2500 3500 60  0000 C CNN
	1    2500 3500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR09
U 1 1 521CDF1A
P 1950 3800
F 0 "#PWR09" H 1950 3800 30  0001 C CNN
F 1 "GND" H 1950 3730 30  0001 C CNN
F 2 "" H 1950 3800 60  0000 C CNN
F 3 "" H 1950 3800 60  0000 C CNN
	1    1950 3800
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR010
U 1 1 521CDF21
P 2800 3650
F 0 "#PWR010" H 2800 3650 30  0001 C CNN
F 1 "GND" H 2800 3580 30  0001 C CNN
F 2 "" H 2800 3650 60  0000 C CNN
F 3 "" H 2800 3650 60  0000 C CNN
	1    2800 3650
	0    -1   -1   0   
$EndComp
Text Label 2800 3350 0    60   ~ 0
TC_NiCr_Pos_3
Text Label 2800 3950 0    60   ~ 0
TC_NiAl_Neg_3
$Comp
L CONN_2 P5
U 1 1 521CDF34
P 1000 4550
F 0 "P5" V 950 4550 40  0000 C CNN
F 1 "TC_4" V 1050 4550 40  0000 C CNN
F 2 "" H 1000 4550 60  0000 C CNN
F 3 "" H 1000 4550 60  0000 C CNN
	1    1000 4550
	-1   0    0    1   
$EndComp
$Comp
L R R14
U 1 1 521CDF3A
P 1600 4700
F 0 "R14" V 1680 4700 40  0000 C CNN
F 1 "1M" V 1607 4701 40  0000 C CNN
F 2 "~" V 1530 4700 30  0000 C CNN
F 3 "~" H 1600 4700 30  0000 C CNN
	1    1600 4700
	0    -1   -1   0   
$EndComp
$Comp
L R R13
U 1 1 521CDF40
P 1600 4250
F 0 "R13" V 1700 4250 40  0000 C CNN
F 1 "10K" V 1607 4251 40  0000 C CNN
F 2 "~" V 1530 4250 30  0000 C CNN
F 3 "~" H 1600 4250 30  0000 C CNN
	1    1600 4250
	0    -1   -1   0   
$EndComp
$Comp
L R R15
U 1 1 521CDF46
P 1600 4850
F 0 "R15" V 1680 4850 40  0000 C CNN
F 1 "10K" V 1607 4851 40  0000 C CNN
F 2 "~" V 1530 4850 30  0000 C CNN
F 3 "~" H 1600 4850 30  0000 C CNN
	1    1600 4850
	0    -1   -1   0   
$EndComp
$Comp
L C C18
U 1 1 521CDF4C
P 2500 4700
F 0 "C18" H 2500 4800 40  0000 L CNN
F 1 "1nF" H 2506 4615 40  0000 L CNN
F 2 "~" H 2538 4550 30  0000 C CNN
F 3 "~" H 2500 4700 60  0000 C CNN
	1    2500 4700
	0    -1   -1   0   
$EndComp
$Comp
L C C5
U 1 1 521CDF52
P 2150 4550
F 0 "C5" V 2200 4650 40  0000 L CNN
F 1 "10nF" V 2200 4350 40  0000 L CNN
F 2 "~" H 2188 4400 30  0000 C CNN
F 3 "~" H 2150 4550 60  0000 C CNN
	1    2150 4550
	-1   0    0    1   
$EndComp
$Comp
L C C17
U 1 1 521CDF58
P 2500 4400
F 0 "C17" H 2500 4500 40  0000 L CNN
F 1 "1nF" H 2506 4315 40  0000 L CNN
F 2 "~" H 2538 4250 30  0000 C CNN
F 3 "~" H 2500 4400 60  0000 C CNN
	1    2500 4400
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR011
U 1 1 521CDF62
P 1950 4700
F 0 "#PWR011" H 1950 4700 30  0001 C CNN
F 1 "GND" H 1950 4630 30  0001 C CNN
F 2 "" H 1950 4700 60  0000 C CNN
F 3 "" H 1950 4700 60  0000 C CNN
	1    1950 4700
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR012
U 1 1 521CDF69
P 2800 4550
F 0 "#PWR012" H 2800 4550 30  0001 C CNN
F 1 "GND" H 2800 4480 30  0001 C CNN
F 2 "" H 2800 4550 60  0000 C CNN
F 3 "" H 2800 4550 60  0000 C CNN
	1    2800 4550
	0    -1   -1   0   
$EndComp
Text Label 2800 4250 0    60   ~ 0
TC_NiCr_Pos_4
Text Label 2800 4850 0    60   ~ 0
TC_NiAl_Neg_4
$Comp
L CONN_2 P6
U 1 1 521CDF7C
P 1000 5450
F 0 "P6" V 950 5450 40  0000 C CNN
F 1 "TC_5" V 1050 5450 40  0000 C CNN
F 2 "" H 1000 5450 60  0000 C CNN
F 3 "" H 1000 5450 60  0000 C CNN
	1    1000 5450
	-1   0    0    1   
$EndComp
$Comp
L R R17
U 1 1 521CDF82
P 1600 5600
F 0 "R17" V 1680 5600 40  0000 C CNN
F 1 "1M" V 1607 5601 40  0000 C CNN
F 2 "~" V 1530 5600 30  0000 C CNN
F 3 "~" H 1600 5600 30  0000 C CNN
	1    1600 5600
	0    -1   -1   0   
$EndComp
$Comp
L R R16
U 1 1 521CDF88
P 1600 5150
F 0 "R16" V 1700 5150 40  0000 C CNN
F 1 "10K" V 1607 5151 40  0000 C CNN
F 2 "~" V 1530 5150 30  0000 C CNN
F 3 "~" H 1600 5150 30  0000 C CNN
	1    1600 5150
	0    -1   -1   0   
$EndComp
$Comp
L R R18
U 1 1 521CDF8E
P 1600 5750
F 0 "R18" V 1680 5750 40  0000 C CNN
F 1 "10K" V 1607 5751 40  0000 C CNN
F 2 "~" V 1530 5750 30  0000 C CNN
F 3 "~" H 1600 5750 30  0000 C CNN
	1    1600 5750
	0    -1   -1   0   
$EndComp
$Comp
L C C20
U 1 1 521CDF94
P 2500 5600
F 0 "C20" H 2500 5700 40  0000 L CNN
F 1 "1nF" H 2506 5515 40  0000 L CNN
F 2 "~" H 2538 5450 30  0000 C CNN
F 3 "~" H 2500 5600 60  0000 C CNN
	1    2500 5600
	0    -1   -1   0   
$EndComp
$Comp
L C C6
U 1 1 521CDF9A
P 2150 5450
F 0 "C6" V 2200 5550 40  0000 L CNN
F 1 "10nF" V 2200 5250 40  0000 L CNN
F 2 "~" H 2188 5300 30  0000 C CNN
F 3 "~" H 2150 5450 60  0000 C CNN
	1    2150 5450
	-1   0    0    1   
$EndComp
$Comp
L C C19
U 1 1 521CDFA0
P 2500 5300
F 0 "C19" H 2500 5400 40  0000 L CNN
F 1 "1nF" H 2506 5215 40  0000 L CNN
F 2 "~" H 2538 5150 30  0000 C CNN
F 3 "~" H 2500 5300 60  0000 C CNN
	1    2500 5300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR013
U 1 1 521CDFAA
P 1950 5600
F 0 "#PWR013" H 1950 5600 30  0001 C CNN
F 1 "GND" H 1950 5530 30  0001 C CNN
F 2 "" H 1950 5600 60  0000 C CNN
F 3 "" H 1950 5600 60  0000 C CNN
	1    1950 5600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR014
U 1 1 521CDFB1
P 2800 5450
F 0 "#PWR014" H 2800 5450 30  0001 C CNN
F 1 "GND" H 2800 5380 30  0001 C CNN
F 2 "" H 2800 5450 60  0000 C CNN
F 3 "" H 2800 5450 60  0000 C CNN
	1    2800 5450
	0    -1   -1   0   
$EndComp
Text Label 2800 5150 0    60   ~ 0
TC_NiCr_Pos_5
Text Label 2800 5750 0    60   ~ 0
TC_NiAl_Neg_5
$Comp
L CONN_2 P7
U 1 1 521CDFC4
P 1000 6350
F 0 "P7" V 950 6350 40  0000 C CNN
F 1 "TC_6" V 1050 6350 40  0000 C CNN
F 2 "" H 1000 6350 60  0000 C CNN
F 3 "" H 1000 6350 60  0000 C CNN
	1    1000 6350
	-1   0    0    1   
$EndComp
$Comp
L R R20
U 1 1 521CDFCA
P 1600 6500
F 0 "R20" V 1680 6500 40  0000 C CNN
F 1 "1M" V 1607 6501 40  0000 C CNN
F 2 "~" V 1530 6500 30  0000 C CNN
F 3 "~" H 1600 6500 30  0000 C CNN
	1    1600 6500
	0    -1   -1   0   
$EndComp
$Comp
L R R19
U 1 1 521CDFD0
P 1600 6050
F 0 "R19" V 1700 6050 40  0000 C CNN
F 1 "10K" V 1607 6051 40  0000 C CNN
F 2 "~" V 1530 6050 30  0000 C CNN
F 3 "~" H 1600 6050 30  0000 C CNN
	1    1600 6050
	0    -1   -1   0   
$EndComp
$Comp
L R R21
U 1 1 521CDFD6
P 1600 6650
F 0 "R21" V 1680 6650 40  0000 C CNN
F 1 "10K" V 1607 6651 40  0000 C CNN
F 2 "~" V 1530 6650 30  0000 C CNN
F 3 "~" H 1600 6650 30  0000 C CNN
	1    1600 6650
	0    -1   -1   0   
$EndComp
$Comp
L C C22
U 1 1 521CDFDC
P 2500 6500
F 0 "C22" H 2500 6600 40  0000 L CNN
F 1 "1nF" H 2506 6415 40  0000 L CNN
F 2 "~" H 2538 6350 30  0000 C CNN
F 3 "~" H 2500 6500 60  0000 C CNN
	1    2500 6500
	0    -1   -1   0   
$EndComp
$Comp
L C C7
U 1 1 521CDFE2
P 2150 6350
F 0 "C7" V 2200 6450 40  0000 L CNN
F 1 "10nF" V 2200 6150 40  0000 L CNN
F 2 "~" H 2188 6200 30  0000 C CNN
F 3 "~" H 2150 6350 60  0000 C CNN
	1    2150 6350
	-1   0    0    1   
$EndComp
$Comp
L C C21
U 1 1 521CDFE8
P 2500 6200
F 0 "C21" H 2500 6300 40  0000 L CNN
F 1 "1nF" H 2506 6115 40  0000 L CNN
F 2 "~" H 2538 6050 30  0000 C CNN
F 3 "~" H 2500 6200 60  0000 C CNN
	1    2500 6200
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR015
U 1 1 521CDFF2
P 1950 6500
F 0 "#PWR015" H 1950 6500 30  0001 C CNN
F 1 "GND" H 1950 6430 30  0001 C CNN
F 2 "" H 1950 6500 60  0000 C CNN
F 3 "" H 1950 6500 60  0000 C CNN
	1    1950 6500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR016
U 1 1 521CDFF9
P 2800 6350
F 0 "#PWR016" H 2800 6350 30  0001 C CNN
F 1 "GND" H 2800 6280 30  0001 C CNN
F 2 "" H 2800 6350 60  0000 C CNN
F 3 "" H 2800 6350 60  0000 C CNN
	1    2800 6350
	0    -1   -1   0   
$EndComp
Text Label 2800 6050 0    60   ~ 0
TC_NiCr_Pos_6
Text Label 2800 6650 0    60   ~ 0
TC_NiAl_Neg_6
$Comp
L CONN_2 P8
U 1 1 521CE00C
P 1000 7250
F 0 "P8" V 950 7250 40  0000 C CNN
F 1 "TC_7" V 1050 7250 40  0000 C CNN
F 2 "" H 1000 7250 60  0000 C CNN
F 3 "" H 1000 7250 60  0000 C CNN
	1    1000 7250
	-1   0    0    1   
$EndComp
$Comp
L R R23
U 1 1 521CE012
P 1600 7400
F 0 "R23" V 1680 7400 40  0000 C CNN
F 1 "1M" V 1607 7401 40  0000 C CNN
F 2 "~" V 1530 7400 30  0000 C CNN
F 3 "~" H 1600 7400 30  0000 C CNN
	1    1600 7400
	0    -1   -1   0   
$EndComp
$Comp
L R R22
U 1 1 521CE018
P 1600 6950
F 0 "R22" V 1700 6950 40  0000 C CNN
F 1 "10K" V 1607 6951 40  0000 C CNN
F 2 "~" V 1530 6950 30  0000 C CNN
F 3 "~" H 1600 6950 30  0000 C CNN
	1    1600 6950
	0    -1   -1   0   
$EndComp
$Comp
L R R24
U 1 1 521CE01E
P 1600 7550
F 0 "R24" V 1680 7550 40  0000 C CNN
F 1 "10K" V 1607 7551 40  0000 C CNN
F 2 "~" V 1530 7550 30  0000 C CNN
F 3 "~" H 1600 7550 30  0000 C CNN
	1    1600 7550
	0    -1   -1   0   
$EndComp
$Comp
L C C24
U 1 1 521CE024
P 2500 7400
F 0 "C24" H 2500 7500 40  0000 L CNN
F 1 "1nF" H 2506 7315 40  0000 L CNN
F 2 "~" H 2538 7250 30  0000 C CNN
F 3 "~" H 2500 7400 60  0000 C CNN
	1    2500 7400
	0    -1   -1   0   
$EndComp
$Comp
L C C8
U 1 1 521CE02A
P 2150 7250
F 0 "C8" V 2200 7350 40  0000 L CNN
F 1 "10nF" V 2200 7050 40  0000 L CNN
F 2 "~" H 2188 7100 30  0000 C CNN
F 3 "~" H 2150 7250 60  0000 C CNN
	1    2150 7250
	-1   0    0    1   
$EndComp
$Comp
L C C23
U 1 1 521CE030
P 2500 7100
F 0 "C23" H 2500 7200 40  0000 L CNN
F 1 "1nF" H 2506 7015 40  0000 L CNN
F 2 "~" H 2538 6950 30  0000 C CNN
F 3 "~" H 2500 7100 60  0000 C CNN
	1    2500 7100
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR017
U 1 1 521CE03A
P 1950 7400
F 0 "#PWR017" H 1950 7400 30  0001 C CNN
F 1 "GND" H 1950 7330 30  0001 C CNN
F 2 "" H 1950 7400 60  0000 C CNN
F 3 "" H 1950 7400 60  0000 C CNN
	1    1950 7400
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR018
U 1 1 521CE041
P 2800 7250
F 0 "#PWR018" H 2800 7250 30  0001 C CNN
F 1 "GND" H 2800 7180 30  0001 C CNN
F 2 "" H 2800 7250 60  0000 C CNN
F 3 "" H 2800 7250 60  0000 C CNN
	1    2800 7250
	0    -1   -1   0   
$EndComp
Text Label 2800 6950 0    60   ~ 0
TC_NiCr_Pos_7
Text Label 2800 7550 0    60   ~ 0
TC_NiAl_Neg_7
Text Label 9300 2050 0    60   ~ 0
MUXOUT_NiCr_Pos
Text Label 8200 2050 2    60   ~ 0
MUXOUT_NiAl_Neg
NoConn ~ 8400 2350
$Comp
L +3.3V #PWR019
U 1 1 521CE4E3
P 10250 1900
F 0 "#PWR019" H 10250 1860 30  0001 C CNN
F 1 "+3.3V" H 10250 2010 30  0000 C CNN
F 2 "" H 10250 1900 60  0000 C CNN
F 3 "" H 10250 1900 60  0000 C CNN
	1    10250 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 521CE4F2
P 8800 2650
F 0 "#PWR020" H 8800 2650 30  0001 C CNN
F 1 "GND" H 8800 2580 30  0001 C CNN
F 2 "" H 8800 2650 60  0000 C CNN
F 3 "" H 8800 2650 60  0000 C CNN
	1    8800 2650
	1    0    0    -1  
$EndComp
$Comp
L C C27
U 1 1 521CE4FF
P 9900 2350
F 0 "C27" H 9800 2450 40  0000 L CNN
F 1 "0.1uF" H 9700 2250 40  0000 L CNN
F 2 "~" H 9938 2200 30  0000 C CNN
F 3 "~" H 9900 2350 60  0000 C CNN
	1    9900 2350
	-1   0    0    1   
$EndComp
Text Label 8200 2150 2    60   ~ 0
V_TC_offset
Text Label 9500 2250 0    60   ~ 0
TC_OUT
NoConn ~ 8750 5900
NoConn ~ 8750 5800
NoConn ~ 9450 4800
$Comp
L GND #PWR021
U 1 1 521CEF66
P 9600 6300
F 0 "#PWR021" H 9600 6300 30  0001 C CNN
F 1 "GND" H 9600 6230 30  0001 C CNN
F 2 "" H 9600 6300 60  0000 C CNN
F 3 "" H 9600 6300 60  0000 C CNN
	1    9600 6300
	1    0    0    -1  
$EndComp
Text Label 8150 6450 2    60   ~ 0
ENABLE
Text Label 9050 6300 3    60   ~ 0
SELECT_0
Text Label 9150 6300 3    60   ~ 0
SELECT_1
Text Label 9250 6300 3    60   ~ 0
SELECT_2
Text Label 9550 4950 0    60   ~ 0
TC_NiAl_Neg_0
Text Label 9550 5050 0    60   ~ 0
TC_NiAl_Neg_1
Text Label 9550 5150 0    60   ~ 0
TC_NiAl_Neg_2
Text Label 9550 5250 0    60   ~ 0
TC_NiAl_Neg_3
Text Label 9550 5350 0    60   ~ 0
TC_NiAl_Neg_4
Text Label 9550 5450 0    60   ~ 0
TC_NiAl_Neg_5
Text Label 9550 5550 0    60   ~ 0
TC_NiAl_Neg_6
Text Label 9550 5650 0    60   ~ 0
TC_NiAl_Neg_7
Text Label 8650 4950 2    60   ~ 0
TC_NiCr_Pos_0
Text Label 8650 5050 2    60   ~ 0
TC_NiCr_Pos_1
Text Label 8650 5150 2    60   ~ 0
TC_NiCr_Pos_2
Text Label 8650 5250 2    60   ~ 0
TC_NiCr_Pos_3
Text Label 8650 5350 2    60   ~ 0
TC_NiCr_Pos_4
Text Label 8650 5450 2    60   ~ 0
TC_NiCr_Pos_5
Text Label 8650 5550 2    60   ~ 0
TC_NiCr_Pos_6
Text Label 8650 5650 2    60   ~ 0
TC_NiCr_Pos_7
Text Label 9200 4400 1    60   ~ 0
MUXOUT_NiAl_Neg
Text Label 9000 4400 1    60   ~ 0
MUXOUT_NiCr_Pos
$Comp
L +3.3V #PWR022
U 1 1 521CFE3B
P 7550 4600
F 0 "#PWR022" H 7550 4560 30  0001 C CNN
F 1 "+3.3V" H 7650 4650 30  0000 C CNN
F 2 "" H 7550 4600 60  0000 C CNN
F 3 "" H 7550 4600 60  0000 C CNN
	1    7550 4600
	1    0    0    -1  
$EndComp
$Comp
L C C26
U 1 1 521CFE41
P 7900 5000
F 0 "C26" H 7800 5100 40  0000 L CNN
F 1 "0.1uF" H 7700 4900 40  0000 L CNN
F 2 "~" H 7938 4850 30  0000 C CNN
F 3 "~" H 7900 5000 60  0000 C CNN
	1    7900 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 521D04C5
P 7550 5300
F 0 "#PWR023" H 7550 5300 30  0001 C CNN
F 1 "GND" H 7550 5230 30  0001 C CNN
F 2 "" H 7550 5300 60  0000 C CNN
F 3 "" H 7550 5300 60  0000 C CNN
	1    7550 5300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 521D0ECD
P 5150 1750
F 0 "#PWR024" H 5150 1750 30  0001 C CNN
F 1 "GND" H 5150 1680 30  0001 C CNN
F 2 "" H 5150 1750 60  0000 C CNN
F 3 "" H 5150 1750 60  0000 C CNN
	1    5150 1750
	1    0    0    -1  
$EndComp
$Comp
L C C29
U 1 1 521D0FA4
P 4650 1450
F 0 "C29" H 4550 1550 40  0000 L CNN
F 1 "10uF" H 4450 1350 40  0000 L CNN
F 2 "~" H 4688 1300 30  0000 C CNN
F 3 "~" H 4650 1450 60  0000 C CNN
	1    4650 1450
	-1   0    0    1   
$EndComp
$Comp
L C C28
U 1 1 521D0FC1
P 10250 2350
F 0 "C28" H 10150 2450 40  0000 L CNN
F 1 "10uF" H 10050 2250 40  0000 L CNN
F 2 "~" H 10288 2200 30  0000 C CNN
F 3 "~" H 10250 2350 60  0000 C CNN
	1    10250 2350
	-1   0    0    1   
$EndComp
$Comp
L C C25
U 1 1 521D0FC7
P 7550 5000
F 0 "C25" H 7450 5100 40  0000 L CNN
F 1 "10uF" H 7350 4900 40  0000 L CNN
F 2 "~" H 7588 4850 30  0000 C CNN
F 3 "~" H 7550 5000 60  0000 C CNN
	1    7550 5000
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR025
U 1 1 521D0FCD
P 4650 1050
F 0 "#PWR025" H 4650 1010 30  0001 C CNN
F 1 "+3.3V" H 4750 1100 30  0000 C CNN
F 2 "" H 4650 1050 60  0000 C CNN
F 3 "" H 4650 1050 60  0000 C CNN
	1    4650 1050
	1    0    0    -1  
$EndComp
$Comp
L C C30
U 1 1 521D0FAA
P 5650 1450
F 0 "C30" H 5550 1550 40  0000 L CNN
F 1 "1uF" H 5450 1350 40  0000 L CNN
F 2 "~" H 5688 1300 30  0000 C CNN
F 3 "~" H 5650 1450 60  0000 C CNN
	1    5650 1450
	-1   0    0    1   
$EndComp
Text Label 5750 1250 0    60   ~ 0
V_AREF
$Comp
L R_DNP R30
U 1 1 521D1842
P 5100 3050
F 0 "R30" V 5180 3050 40  0000 C CNN
F 1 "R_DNP" V 5100 2905 40  0000 L CNN
F 2 "~" V 5030 3050 30  0000 C CNN
F 3 "~" H 5100 3050 30  0000 C CNN
F 4 "DNP" V 5280 3150 60  0001 C CNN "Notes"
	1    5100 3050
	1    0    0    -1  
$EndComp
$Comp
L R R27
U 1 1 521D1868
P 4850 3050
F 0 "R27" V 4930 3050 40  0000 C CNN
F 1 "ZERO" V 4857 3051 40  0000 C CNN
F 2 "~" V 4780 3050 30  0000 C CNN
F 3 "~" H 4850 3050 30  0000 C CNN
	1    4850 3050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR026
U 1 1 521D1BD1
P 5100 2700
F 0 "#PWR026" H 5100 2660 30  0001 C CNN
F 1 "+3.3V" H 5200 2750 30  0000 C CNN
F 2 "" H 5100 2700 60  0000 C CNN
F 3 "" H 5100 2700 60  0000 C CNN
	1    5100 2700
	1    0    0    -1  
$EndComp
Text Label 4850 2700 1    60   ~ 0
V_AREF
$Comp
L CONN_10 P9
U 1 1 521D1BD9
P 6250 6950
F 0 "P9" V 6200 6950 60  0000 C CNN
F 1 "CONN_10" V 6300 6950 60  0000 C CNN
F 2 "" H 6250 6950 60  0000 C CNN
F 3 "" H 6250 6950 60  0000 C CNN
	1    6250 6950
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR027
U 1 1 521D2436
P 5800 6500
F 0 "#PWR027" H 5800 6460 30  0001 C CNN
F 1 "+3.3V" H 5800 6610 30  0000 C CNN
F 2 "" H 5800 6500 60  0000 C CNN
F 3 "" H 5800 6500 60  0000 C CNN
	1    5800 6500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR028
U 1 1 521D2445
P 5800 7500
F 0 "#PWR028" H 5800 7500 30  0001 C CNN
F 1 "GND" H 5800 7430 30  0001 C CNN
F 2 "" H 5800 7500 60  0000 C CNN
F 3 "" H 5800 7500 60  0000 C CNN
	1    5800 7500
	1    0    0    -1  
$EndComp
Text Label 5800 7200 2    60   ~ 0
V_AREF
Text Label 5800 7100 2    60   ~ 0
V_TC_offset
Text Label 5800 6600 2    60   ~ 0
TC_OUT
Text Label 5800 6700 2    60   ~ 0
ENABLE
Text Label 5800 6800 2    60   ~ 0
SELECT_0
Text Label 5800 6900 2    60   ~ 0
SELECT_1
Text Label 5800 7000 2    60   ~ 0
SELECT_2
$Comp
L R R25
U 1 1 521D252E
P 8500 6250
F 0 "R25" V 8580 6250 40  0000 C CNN
F 1 "ZERO" V 8507 6251 40  0000 C CNN
F 2 "~" V 8430 6250 30  0000 C CNN
F 3 "~" H 8500 6250 30  0000 C CNN
	1    8500 6250
	0    -1   -1   0   
$EndComp
$Comp
L R_DNP R26
U 1 1 521D2535
P 8500 6450
F 0 "R26" V 8580 6450 40  0000 C CNN
F 1 "R_DNP" V 8500 6305 40  0000 L CNN
F 2 "~" V 8430 6450 30  0000 C CNN
F 3 "~" H 8500 6450 30  0000 C CNN
F 4 "DNP" V 8680 6550 60  0001 C CNN "Notes"
	1    8500 6450
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V #PWR029
U 1 1 521D2C4E
P 8150 6150
F 0 "#PWR029" H 8150 6110 30  0001 C CNN
F 1 "+3.3V" H 8250 6200 30  0000 C CNN
F 2 "" H 8150 6150 60  0000 C CNN
F 3 "" H 8150 6150 60  0000 C CNN
	1    8150 6150
	1    0    0    -1  
$EndComp
Text Notes 11000 7420 2    90   ~ 0
8 Channel Type K Thermocouple Amplifier
Text Notes 1050 750  0    60   ~ 0
yellow
Text Notes 1050 1200 0    60   ~ 0
red
$Comp
L REF33XX U4
U 1 1 521D3520
P 5150 1350
F 0 "U4" H 5050 1100 60  0000 C CNN
F 1 "REF3325" H 5150 1600 60  0000 C CNN
F 2 "" H 5150 1350 60  0000 C CNN
F 3 "" H 5150 1350 60  0000 C CNN
	1    5150 1350
	1    0    0    -1  
$EndComp
$Comp
L LOGO Z1
U 1 1 521D22B4
P 10700 6550
F 0 "Z1" H 10750 6350 60  0000 C CNN
F 1 "LOGO" H 10550 6700 60  0000 C CNN
F 2 "~" H 10700 6550 60  0000 C CNN
F 3 "~" H 10700 6550 60  0000 C CNN
	1    10700 6550
	1    0    0    -1  
$EndComp
$Comp
L 4_40_HOLE MNT1
U 1 1 521D22C3
P 4350 6500
F 0 "MNT1" H 4350 6350 60  0000 C CNN
F 1 "4_40_HOLE" H 4350 6650 60  0001 C CNN
F 2 "~" H 4350 6500 60  0000 C CNN
F 3 "~" H 4350 6500 60  0000 C CNN
	1    4350 6500
	1    0    0    -1  
$EndComp
$Comp
L 4_40_HOLE MNT2
U 1 1 521D22D0
P 4350 6800
F 0 "MNT2" H 4350 6650 60  0000 C CNN
F 1 "4_40_HOLE" H 4350 6950 60  0001 C CNN
F 2 "~" H 4350 6800 60  0000 C CNN
F 3 "~" H 4350 6800 60  0000 C CNN
	1    4350 6800
	1    0    0    -1  
$EndComp
$Comp
L 4_40_HOLE MNT3
U 1 1 521D22D6
P 4350 7100
F 0 "MNT3" H 4350 6950 60  0000 C CNN
F 1 "4_40_HOLE" H 4350 7250 60  0001 C CNN
F 2 "~" H 4350 7100 60  0000 C CNN
F 3 "~" H 4350 7100 60  0000 C CNN
	1    4350 7100
	1    0    0    -1  
$EndComp
$Comp
L 4_40_HOLE MNT4
U 1 1 521D22DC
P 4350 7400
F 0 "MNT4" H 4350 7250 60  0000 C CNN
F 1 "4_40_HOLE" H 4350 7550 60  0001 C CNN
F 2 "~" H 4350 7400 60  0000 C CNN
F 3 "~" H 4350 7400 60  0000 C CNN
	1    4350 7400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 521D22EC
P 4700 7600
F 0 "#PWR030" H 4700 7600 30  0001 C CNN
F 1 "GND" H 4700 7530 30  0001 C CNN
F 2 "" H 4700 7600 60  0000 C CNN
F 3 "" H 4700 7600 60  0000 C CNN
	1    4700 7600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR031
U 1 1 521D28AA
P 5800 7300
F 0 "#PWR031" H 5800 7260 30  0001 C CNN
F 1 "+3.3V" H 5800 7410 30  0000 C CNN
F 2 "" H 5800 7300 60  0000 C CNN
F 3 "" H 5800 7300 60  0000 C CNN
	1    5800 7300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5050 3850 5000 3850
Wire Wire Line
	5000 3850 5000 3450
Wire Wire Line
	5000 3450 6000 3450
Wire Wire Line
	6000 3450 6000 4050
Wire Wire Line
	5850 4050 6200 4050
Connection ~ 6000 4050
Wire Wire Line
	4850 4150 4850 4350
Wire Wire Line
	4850 4250 5050 4250
Connection ~ 4850 4250
Wire Wire Line
	4850 4850 4850 4900
Wire Wire Line
	4850 4900 5400 4900
Wire Wire Line
	5400 4350 5400 5000
Connection ~ 5400 4900
Wire Wire Line
	5400 3750 5400 3600
Wire Wire Line
	1350 650  1350 850 
Wire Wire Line
	1350 1050 1350 1250
Wire Wire Line
	1850 1250 2800 1250
Wire Wire Line
	1850 650  2800 650 
Wire Wire Line
	1950 1100 1850 1100
Wire Wire Line
	2150 750  2150 650 
Connection ~ 2150 650 
Wire Wire Line
	2150 1150 2150 1250
Connection ~ 2150 1250
Wire Wire Line
	2300 1100 2300 1250
Connection ~ 2300 1250
Wire Wire Line
	2300 800  2300 650 
Connection ~ 2300 650 
Wire Wire Line
	2700 800  2700 1100
Wire Wire Line
	2700 950  2800 950 
Connection ~ 2700 950 
Wire Wire Line
	1350 1550 1350 1750
Wire Wire Line
	1350 1950 1350 2150
Wire Wire Line
	1850 2150 2800 2150
Wire Wire Line
	1850 1550 2800 1550
Wire Wire Line
	1950 2000 1850 2000
Wire Wire Line
	2150 1650 2150 1550
Connection ~ 2150 1550
Wire Wire Line
	2150 2050 2150 2150
Connection ~ 2150 2150
Wire Wire Line
	2300 2000 2300 2150
Connection ~ 2300 2150
Wire Wire Line
	2300 1700 2300 1550
Connection ~ 2300 1550
Wire Wire Line
	2700 1700 2700 2000
Wire Wire Line
	2700 1850 2800 1850
Connection ~ 2700 1850
Wire Wire Line
	1350 2450 1350 2650
Wire Wire Line
	1350 2850 1350 3050
Wire Wire Line
	1850 3050 2800 3050
Wire Wire Line
	1850 2450 2800 2450
Wire Wire Line
	1950 2900 1850 2900
Wire Wire Line
	2150 2550 2150 2450
Connection ~ 2150 2450
Wire Wire Line
	2150 2950 2150 3050
Connection ~ 2150 3050
Wire Wire Line
	2300 2900 2300 3050
Connection ~ 2300 3050
Wire Wire Line
	2300 2600 2300 2450
Connection ~ 2300 2450
Wire Wire Line
	2700 2600 2700 2900
Wire Wire Line
	2700 2750 2800 2750
Connection ~ 2700 2750
Wire Wire Line
	1350 3350 1350 3550
Wire Wire Line
	1350 3750 1350 3950
Wire Wire Line
	1850 3950 2800 3950
Wire Wire Line
	1850 3350 2800 3350
Wire Wire Line
	1950 3800 1850 3800
Wire Wire Line
	2150 3450 2150 3350
Connection ~ 2150 3350
Wire Wire Line
	2150 3850 2150 3950
Connection ~ 2150 3950
Wire Wire Line
	2300 3800 2300 3950
Connection ~ 2300 3950
Wire Wire Line
	2300 3500 2300 3350
Connection ~ 2300 3350
Wire Wire Line
	2700 3500 2700 3800
Wire Wire Line
	2700 3650 2800 3650
Connection ~ 2700 3650
Wire Wire Line
	1350 4250 1350 4450
Wire Wire Line
	1350 4650 1350 4850
Wire Wire Line
	1850 4850 2800 4850
Wire Wire Line
	1850 4250 2800 4250
Wire Wire Line
	1950 4700 1850 4700
Wire Wire Line
	2150 4350 2150 4250
Connection ~ 2150 4250
Wire Wire Line
	2150 4750 2150 4850
Connection ~ 2150 4850
Wire Wire Line
	2300 4700 2300 4850
Connection ~ 2300 4850
Wire Wire Line
	2300 4400 2300 4250
Connection ~ 2300 4250
Wire Wire Line
	2700 4400 2700 4700
Wire Wire Line
	2700 4550 2800 4550
Connection ~ 2700 4550
Wire Wire Line
	1350 5150 1350 5350
Wire Wire Line
	1350 5550 1350 5750
Wire Wire Line
	1850 5750 2800 5750
Wire Wire Line
	1850 5150 2800 5150
Wire Wire Line
	1950 5600 1850 5600
Wire Wire Line
	2150 5250 2150 5150
Connection ~ 2150 5150
Wire Wire Line
	2150 5650 2150 5750
Connection ~ 2150 5750
Wire Wire Line
	2300 5600 2300 5750
Connection ~ 2300 5750
Wire Wire Line
	2300 5300 2300 5150
Connection ~ 2300 5150
Wire Wire Line
	2700 5300 2700 5600
Wire Wire Line
	2700 5450 2800 5450
Connection ~ 2700 5450
Wire Wire Line
	1350 6050 1350 6250
Wire Wire Line
	1350 6450 1350 6650
Wire Wire Line
	1850 6650 2800 6650
Wire Wire Line
	1850 6050 2800 6050
Wire Wire Line
	1950 6500 1850 6500
Wire Wire Line
	2150 6150 2150 6050
Connection ~ 2150 6050
Wire Wire Line
	2150 6550 2150 6650
Connection ~ 2150 6650
Wire Wire Line
	2300 6500 2300 6650
Connection ~ 2300 6650
Wire Wire Line
	2300 6200 2300 6050
Connection ~ 2300 6050
Wire Wire Line
	2700 6200 2700 6500
Wire Wire Line
	2700 6350 2800 6350
Connection ~ 2700 6350
Wire Wire Line
	1350 6950 1350 7150
Wire Wire Line
	1350 7350 1350 7550
Wire Wire Line
	1850 7550 2800 7550
Wire Wire Line
	1850 6950 2800 6950
Wire Wire Line
	1950 7400 1850 7400
Wire Wire Line
	2150 7050 2150 6950
Connection ~ 2150 6950
Wire Wire Line
	2150 7450 2150 7550
Connection ~ 2150 7550
Wire Wire Line
	2300 7400 2300 7550
Connection ~ 2300 7550
Wire Wire Line
	2300 7100 2300 6950
Connection ~ 2300 6950
Wire Wire Line
	2700 7100 2700 7400
Wire Wire Line
	2700 7250 2800 7250
Connection ~ 2700 7250
Wire Wire Line
	8400 2050 8200 2050
Wire Wire Line
	9100 2050 9300 2050
Wire Wire Line
	9100 2350 9200 2350
Wire Wire Line
	9200 2350 9200 2250
Connection ~ 9200 2250
Wire Wire Line
	8400 2250 8200 2250
Wire Wire Line
	9100 2250 9500 2250
Wire Wire Line
	9400 2550 9400 2450
Wire Wire Line
	8200 2550 10250 2550
Connection ~ 9400 2550
Wire Wire Line
	8200 2250 8200 2550
Wire Wire Line
	8800 2650 8800 2550
Connection ~ 8800 2550
Wire Wire Line
	9050 6200 9050 6300
Wire Wire Line
	9150 6300 9150 6200
Wire Wire Line
	9250 6300 9250 6200
Wire Wire Line
	9450 5800 9600 5800
Wire Wire Line
	9600 5800 9600 6300
Wire Wire Line
	9450 5900 9600 5900
Connection ~ 9600 5900
Wire Wire Line
	8750 5650 8650 5650
Wire Wire Line
	8650 5550 8750 5550
Wire Wire Line
	8650 5450 8750 5450
Wire Wire Line
	8650 5350 8750 5350
Wire Wire Line
	8650 5250 8750 5250
Wire Wire Line
	8650 5150 8750 5150
Wire Wire Line
	8650 5050 8750 5050
Wire Wire Line
	8650 4950 8750 4950
Wire Wire Line
	9550 4950 9450 4950
Wire Wire Line
	9550 5050 9450 5050
Wire Wire Line
	9550 5150 9450 5150
Wire Wire Line
	9550 5250 9450 5250
Wire Wire Line
	9550 5350 9450 5350
Wire Wire Line
	9550 5450 9450 5450
Wire Wire Line
	9550 5550 9450 5550
Wire Wire Line
	9550 5650 9450 5650
Wire Wire Line
	9000 4400 9000 4500
Wire Wire Line
	9200 4400 9200 4500
Connection ~ 9900 2550
Wire Wire Line
	7900 5200 7550 5200
Wire Wire Line
	7550 5200 7550 5300
Wire Wire Line
	7550 4800 8750 4800
Connection ~ 7900 4800
Wire Wire Line
	7550 4600 7550 4800
Wire Wire Line
	4850 1250 4650 1250
Wire Wire Line
	4650 1250 4650 1050
Wire Wire Line
	4650 1650 4650 1700
Wire Wire Line
	4650 1700 5650 1700
Wire Wire Line
	5150 1700 5150 1750
Wire Wire Line
	5650 1700 5650 1650
Connection ~ 5150 1700
Wire Wire Line
	5450 1450 5450 1700
Connection ~ 5450 1700
Connection ~ 5650 1250
Wire Wire Line
	4850 3650 4850 3300
Wire Wire Line
	4850 3300 5100 3300
Wire Wire Line
	5100 2800 5100 2700
Wire Wire Line
	5900 6500 5800 6500
Wire Wire Line
	5800 6600 5900 6600
Wire Wire Line
	5800 6700 5900 6700
Wire Wire Line
	5800 6800 5900 6800
Wire Wire Line
	5800 7000 5900 7000
Wire Wire Line
	5800 7100 5900 7100
Wire Wire Line
	5800 7200 5900 7200
Wire Wire Line
	5800 7300 5900 7300
Wire Wire Line
	5800 7400 5900 7400
Wire Wire Line
	5800 7500 5800 7400
Wire Wire Line
	8950 6200 8950 6450
Wire Wire Line
	8950 6450 8750 6450
Wire Wire Line
	8750 6250 8950 6250
Connection ~ 8950 6250
Wire Wire Line
	8250 6450 8150 6450
Wire Wire Line
	8250 6250 8150 6250
Wire Wire Line
	8150 6250 8150 6150
Wire Wire Line
	9100 2150 10250 2150
Connection ~ 9900 2150
Wire Wire Line
	10250 2150 10250 1900
Connection ~ 1350 7400
Connection ~ 1350 6500
Connection ~ 1350 5600
Connection ~ 1350 4700
Connection ~ 1350 3800
Connection ~ 1350 2900
Connection ~ 1350 2000
Connection ~ 1350 1100
Connection ~ 9400 2250
Wire Wire Line
	4700 7400 4650 7400
Wire Wire Line
	4700 6500 4700 7600
Wire Wire Line
	4700 7100 4650 7100
Connection ~ 4700 7400
Wire Wire Line
	4700 6800 4650 6800
Connection ~ 4700 7100
Wire Wire Line
	4700 6500 4650 6500
Connection ~ 4700 6800
Wire Wire Line
	5800 6900 5900 6900
Wire Notes Line
	3350 550  3850 550 
Wire Notes Line
	3850 5800 7100 5800
Wire Notes Line
	7100 4800 7400 4800
Wire Notes Line
	3500 7550 3850 7550
Wire Notes Line
	3850 6000 7100 6000
Wire Notes Line
	7100 6550 7400 6550
Wire Wire Line
	8400 2150 8200 2150
Wire Wire Line
	4850 2700 4850 2800
Wire Wire Line
	5450 1250 5750 1250
Wire Notes Line
	4850 2650 4850 2250
Wire Notes Line
	4850 2250 6000 2250
Wire Notes Line
	6000 2250 6000 1250
Wire Notes Line
	6000 1250 5800 1250
Wire Notes Line
	8150 2150 6800 2150
Wire Notes Line
	6800 2150 6800 4050
Wire Notes Line
	6800 4050 6250 4050
Wire Notes Line
	8200 2000 8200 1300
Wire Notes Line
	8200 1300 10750 1300
Wire Notes Line
	10750 1300 10750 4350
Wire Notes Line
	10750 4350 9200 4350
Wire Notes Line
	9000 4350 9000 4250
Wire Notes Line
	9000 4250 10650 4250
Wire Notes Line
	10650 4250 10650 1400
Wire Notes Line
	10650 1400 9300 1400
Wire Notes Line
	9300 1400 9300 2000
Wire Notes Line
	5500 2200 5500 2300
Wire Notes Line
	5500 2300 5350 2250
Wire Notes Line
	5350 2250 5500 2200
Wire Notes Line
	6800 3000 6750 3150
Wire Notes Line
	6750 3150 6850 3150
Wire Notes Line
	6850 3150 6800 3000
Wire Notes Line
	10200 4250 10050 4200
Wire Notes Line
	10050 4200 10050 4400
Wire Notes Line
	10050 4300 10200 4250
Wire Notes Line
	10050 4300 10200 4350
Wire Notes Line
	10200 4350 10050 4400
Wire Notes Line
	5650 6000 5500 5950
Wire Notes Line
	5500 5950 5500 6050
Wire Notes Line
	5500 6050 5650 6000
Wire Notes Line
	5650 5800 5500 5750
Wire Notes Line
	5500 5750 5500 5850
Wire Notes Line
	5500 5850 5650 5800
Wire Bus Line
	7100 6000 7100 6550
Wire Bus Line
	7100 5800 7100 4800
Wire Bus Line
	3850 5800 3850 550 
Wire Bus Line
	3850 6000 3850 7550
$EndSCHEMATC
