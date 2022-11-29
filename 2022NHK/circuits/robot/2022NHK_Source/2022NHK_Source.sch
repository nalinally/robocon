EESchema Schematic File Version 4
LIBS:2022NHK_Source-cache
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
L Connector:USB_A J2
U 1 1 63562F3D
P 4950 2150
F 0 "J2" H 5007 2617 50  0000 C CNN
F 1 "USB_A" H 5007 2526 50  0000 C CNN
F 2 "Connector_USB:USB_A_Wuerth_61400826021_Horizontal_Stacked" H 5100 2100 50  0001 C CNN
F 3 " ~" H 5100 2100 50  0001 C CNN
	1    4950 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 6356319D
P 10100 2700
F 0 "J7" H 10208 2881 50  0000 C CNN
F 1 "Conn_01x02_Male" H 10208 2790 50  0000 C CNN
F 2 "Connector_T:Connector_T_Male" H 10100 2700 50  0001 C CNN
F 3 "~" H 10100 2700 50  0001 C CNN
	1    10100 2700
	-1   0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U1
U 1 1 6356408B
P 6750 2050
F 0 "U1" H 6750 2292 50  0000 C CNN
F 1 "L7805" H 6750 2201 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220F-3_Vertical" H 6775 1900 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 6750 2000 50  0001 C CNN
	1    6750 2050
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 63565254
P 6150 2200
F 0 "C1" H 6265 2246 50  0000 L CNN
F 1 "C" H 6265 2155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6188 2050 50  0001 C CNN
F 3 "~" H 6150 2200 50  0001 C CNN
	1    6150 2200
	-1   0    0    -1  
$EndComp
Connection ~ 6750 2350
Wire Wire Line
	6750 2350 6150 2350
Wire Wire Line
	6450 2050 6150 2050
Connection ~ 6150 2050
Wire Wire Line
	5850 2050 6150 2050
Wire Wire Line
	4950 2550 5450 2550
Wire Wire Line
	6750 2550 6750 2350
Wire Wire Line
	7050 2050 7250 2050
Wire Wire Line
	6750 2350 7250 2350
$Comp
L Device:CP C4
U 1 1 6356DFA7
P 7250 2200
F 0 "C4" H 7368 2246 50  0000 L CNN
F 1 "CP" H 7368 2155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7288 2050 50  0001 C CNN
F 3 "~" H 7250 2200 50  0001 C CNN
	1    7250 2200
	1    0    0    -1  
$EndComp
Connection ~ 7250 2050
Wire Wire Line
	7250 2050 7800 2050
Connection ~ 7250 2350
Wire Wire Line
	7250 2350 7800 2350
Text GLabel 6150 2050 1    50   Input ~ 0
5v_1
$Comp
L Device:LED D1
U 1 1 635746B6
P 5450 2100
F 0 "D1" H 5443 2316 50  0000 C CNN
F 1 "LED" H 5443 2225 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5450 2100 50  0001 C CNN
F 3 "~" H 5450 2100 50  0001 C CNN
	1    5450 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 63574A8A
P 5450 2400
F 0 "R1" H 5520 2446 50  0000 L CNN
F 1 "R" H 5520 2355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5380 2400 50  0001 C CNN
F 3 "~" H 5450 2400 50  0001 C CNN
	1    5450 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 1950 5250 1950
Connection ~ 5450 2550
Wire Wire Line
	5450 2550 6750 2550
Text GLabel 9000 3200 0    50   Input ~ 0
GND
Text GLabel 9000 2600 0    50   Input ~ 0
vin
NoConn ~ 9900 2500
$Comp
L Device:R R4
U 1 1 6357D9D0
P 9250 2750
F 0 "R4" H 9320 2796 50  0000 L CNN
F 1 "R" H 9320 2705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9180 2750 50  0001 C CNN
F 3 "~" H 9250 2750 50  0001 C CNN
	1    9250 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 6357DDB2
P 9250 3050
F 0 "D4" H 9243 3266 50  0000 C CNN
F 1 "LED" H 9243 3175 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9250 3050 50  0001 C CNN
F 3 "~" H 9250 3050 50  0001 C CNN
	1    9250 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9250 3200 9900 3200
Wire Wire Line
	9900 3200 9900 2800
Wire Wire Line
	9000 2600 9250 2600
Connection ~ 9250 2600
Wire Wire Line
	9250 2600 9500 2600
Text GLabel 7800 2050 0    50   Input ~ 0
vin
Text GLabel 7800 2350 3    50   Input ~ 0
GND
Wire Wire Line
	9000 3200 9250 3200
Connection ~ 9250 3200
$Comp
L Connector:USB_A J1
U 1 1 6358D70F
P 4950 3350
F 0 "J1" H 5007 3817 50  0000 C CNN
F 1 "USB_A" H 5007 3726 50  0000 C CNN
F 2 "Connector_USB:USB_A_Wuerth_61400826021_Horizontal_Stacked" H 5100 3300 50  0001 C CNN
F 3 " ~" H 5100 3300 50  0001 C CNN
	1    4950 3350
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U2
U 1 1 6358D715
P 6750 3250
F 0 "U2" H 6750 3492 50  0000 C CNN
F 1 "L7805" H 6750 3401 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220F-3_Vertical" H 6775 3100 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 6750 3200 50  0001 C CNN
	1    6750 3250
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 6358D71B
P 6250 3400
F 0 "C2" H 6365 3446 50  0000 L CNN
F 1 "C" H 6365 3355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6288 3250 50  0001 C CNN
F 3 "~" H 6250 3400 50  0001 C CNN
	1    6250 3400
	-1   0    0    -1  
$EndComp
Connection ~ 6750 3550
Wire Wire Line
	6750 3550 6250 3550
Wire Wire Line
	6450 3250 6250 3250
Connection ~ 6250 3250
Wire Wire Line
	5900 3250 6250 3250
Wire Wire Line
	4950 3750 5400 3750
Wire Wire Line
	6750 3750 6750 3550
Wire Wire Line
	7050 3250 7250 3250
Wire Wire Line
	6750 3550 7250 3550
$Comp
L Device:CP C5
U 1 1 6358D72A
P 7250 3400
F 0 "C5" H 7368 3446 50  0000 L CNN
F 1 "CP" H 7368 3355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7288 3250 50  0001 C CNN
F 3 "~" H 7250 3400 50  0001 C CNN
	1    7250 3400
	1    0    0    -1  
$EndComp
Connection ~ 7250 3250
Wire Wire Line
	7250 3250 7800 3250
Connection ~ 7250 3550
Wire Wire Line
	7250 3550 7800 3550
Text GLabel 6250 3250 1    50   Input ~ 0
5v_2
$Comp
L Device:LED D2
U 1 1 6358D73C
P 5400 3300
F 0 "D2" H 5393 3516 50  0000 C CNN
F 1 "LED" H 5393 3425 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5400 3300 50  0001 C CNN
F 3 "~" H 5400 3300 50  0001 C CNN
	1    5400 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 6358D742
P 5400 3600
F 0 "R2" H 5470 3646 50  0000 L CNN
F 1 "R" H 5470 3555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5330 3600 50  0001 C CNN
F 3 "~" H 5400 3600 50  0001 C CNN
	1    5400 3600
	1    0    0    -1  
$EndComp
Connection ~ 5400 3150
Wire Wire Line
	5400 3150 5250 3150
Connection ~ 5400 3750
Wire Wire Line
	5400 3750 6750 3750
Text GLabel 7800 3250 0    50   Input ~ 0
vin
Text GLabel 7800 3550 3    50   Input ~ 0
GND
$Comp
L Connector:USB_A J3
U 1 1 63590145
P 4950 4550
F 0 "J3" H 5007 5017 50  0000 C CNN
F 1 "USB_A" H 5007 4926 50  0000 C CNN
F 2 "Connector_USB:USB_A_Wuerth_61400826021_Horizontal_Stacked" H 5100 4500 50  0001 C CNN
F 3 " ~" H 5100 4500 50  0001 C CNN
	1    4950 4550
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U3
U 1 1 6359014B
P 6750 4450
F 0 "U3" H 6750 4692 50  0000 C CNN
F 1 "L7805" H 6750 4601 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220F-3_Vertical" H 6775 4300 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 6750 4400 50  0001 C CNN
	1    6750 4450
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 63590151
P 6250 4600
F 0 "C3" H 6365 4646 50  0000 L CNN
F 1 "C" H 6365 4555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6288 4450 50  0001 C CNN
F 3 "~" H 6250 4600 50  0001 C CNN
	1    6250 4600
	-1   0    0    -1  
$EndComp
Connection ~ 6750 4750
Wire Wire Line
	6750 4750 6250 4750
Wire Wire Line
	6450 4450 6250 4450
Connection ~ 6250 4450
Wire Wire Line
	5900 4450 6250 4450
Wire Wire Line
	4950 4950 5400 4950
Wire Wire Line
	6750 4950 6750 4750
Wire Wire Line
	7050 4450 7250 4450
Wire Wire Line
	6750 4750 7250 4750
$Comp
L Device:CP C6
U 1 1 63590160
P 7250 4600
F 0 "C6" H 7368 4646 50  0000 L CNN
F 1 "CP" H 7368 4555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7288 4450 50  0001 C CNN
F 3 "~" H 7250 4600 50  0001 C CNN
	1    7250 4600
	1    0    0    -1  
$EndComp
Connection ~ 7250 4450
Wire Wire Line
	7250 4450 7800 4450
Connection ~ 7250 4750
Wire Wire Line
	7250 4750 7800 4750
Text GLabel 6250 4450 1    50   Input ~ 0
5v_3
$Comp
L Device:LED D3
U 1 1 63590172
P 5400 4500
F 0 "D3" H 5393 4716 50  0000 C CNN
F 1 "LED" H 5393 4625 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5400 4500 50  0001 C CNN
F 3 "~" H 5400 4500 50  0001 C CNN
	1    5400 4500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 63590178
P 5400 4800
F 0 "R3" H 5470 4846 50  0000 L CNN
F 1 "R" H 5470 4755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5330 4800 50  0001 C CNN
F 3 "~" H 5400 4800 50  0001 C CNN
	1    5400 4800
	1    0    0    -1  
$EndComp
Connection ~ 5400 4350
Wire Wire Line
	5400 4350 5250 4350
Connection ~ 5400 4950
Wire Wire Line
	5400 4950 6750 4950
Text GLabel 7800 4450 0    50   Input ~ 0
vin
Text GLabel 7800 4750 3    50   Input ~ 0
GND
NoConn ~ 4850 4950
NoConn ~ 5250 4650
NoConn ~ 5250 4550
NoConn ~ 4850 3750
NoConn ~ 5250 3450
NoConn ~ 5250 3350
NoConn ~ 4850 2550
NoConn ~ 5250 2250
NoConn ~ 5250 2150
$Comp
L Switch:SW_DPDT_x2 SW4
U 1 1 635AC113
P 9700 2600
F 0 "SW4" H 9700 2885 50  0000 C CNN
F 1 "SW_DPDT_x2" H 9700 2794 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9700 2600 50  0001 C CNN
F 3 "~" H 9700 2600 50  0001 C CNN
	1    9700 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2050 5850 1950
Wire Wire Line
	5850 1950 5450 1950
Connection ~ 5450 1950
Wire Wire Line
	5900 3250 5900 3150
Wire Wire Line
	5400 3150 5900 3150
Wire Wire Line
	5900 4450 5900 4350
Wire Wire Line
	5400 4350 5900 4350
$EndSCHEMATC
