EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:LED D1
U 1 1 637430F4
P 4350 3800
F 0 "D1" H 4343 4016 50  0000 C CNN
F 1 "LED" H 4343 3925 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 4350 3800 50  0001 C CNN
F 3 "~" H 4350 3800 50  0001 C CNN
	1    4350 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6374356E
P 4050 3800
F 0 "R1" H 4120 3846 50  0000 L CNN
F 1 "R" H 4120 3755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3980 3800 50  0001 C CNN
F 3 "~" H 4050 3800 50  0001 C CNN
	1    4050 3800
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_DPDT_x2 SW1
U 1 1 6374399D
P 4250 3400
F 0 "SW1" H 4250 3685 50  0000 C CNN
F 1 "SW_DPDT_x2" H 4250 3594 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4250 3400 50  0001 C CNN
F 3 "~" H 4250 3400 50  0001 C CNN
	1    4250 3400
	1    0    0    -1  
$EndComp
Text GLabel 4250 2700 2    50   Input ~ 0
5v
Text GLabel 4250 2800 2    50   Input ~ 0
out1
Text GLabel 4450 3300 2    50   Input ~ 0
5v
Text GLabel 4050 3400 0    50   Input ~ 0
out1
Text GLabel 4500 3800 2    50   Input ~ 0
out1
Text GLabel 4250 3000 2    50   Input ~ 0
GND
Text GLabel 4450 3500 2    50   Input ~ 0
GND
Text GLabel 3900 3800 0    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 63748153
P 4050 2800
F 0 "J1" H 4158 3081 50  0000 C CNN
F 1 "Conn_01x04_Male" H 4158 2990 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 4050 2800 50  0001 C CNN
F 3 "~" H 4050 2800 50  0001 C CNN
	1    4050 2800
	1    0    0    -1  
$EndComp
Text GLabel 4250 2900 2    50   Input ~ 0
out2
$Comp
L Device:LED D2
U 1 1 6374A1BF
P 5550 3800
F 0 "D2" H 5543 4016 50  0000 C CNN
F 1 "LED" H 5543 3925 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5550 3800 50  0001 C CNN
F 3 "~" H 5550 3800 50  0001 C CNN
	1    5550 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 6374A1C5
P 5250 3800
F 0 "R2" H 5320 3846 50  0000 L CNN
F 1 "R" H 5320 3755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5180 3800 50  0001 C CNN
F 3 "~" H 5250 3800 50  0001 C CNN
	1    5250 3800
	0    -1   -1   0   
$EndComp
Text GLabel 5650 3300 2    50   Input ~ 0
5v
Text GLabel 5250 3400 0    50   Input ~ 0
out2
Text GLabel 5700 3800 2    50   Input ~ 0
out2
Text GLabel 5650 3500 2    50   Input ~ 0
GND
Text GLabel 5100 3800 0    50   Input ~ 0
GND
$Comp
L Switch:SW_DPDT_x2 SW2
U 1 1 6374C4D6
P 5450 3400
F 0 "SW2" H 5450 3685 50  0000 C CNN
F 1 "SW_DPDT_x2" H 5450 3594 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5450 3400 50  0001 C CNN
F 3 "~" H 5450 3400 50  0001 C CNN
	1    5450 3400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
