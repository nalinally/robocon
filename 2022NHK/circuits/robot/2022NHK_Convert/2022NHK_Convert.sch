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
L Connector:Conn_01x03_Male J4
U 1 1 6328266A
P 5950 1900
F 0 "J4" H 6058 2181 50  0000 C CNN
F 1 "Conn_01x03_Male" H 6058 2090 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S3B-XH-A_1x03_P2.50mm_Horizontal" H 5950 1900 50  0001 C CNN
F 3 "~" H 5950 1900 50  0001 C CNN
	1    5950 1900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 632864C3
P 4650 1900
F 0 "J1" H 4758 2181 50  0000 C CNN
F 1 "Conn_01x03_Male" H 4758 2090 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 4650 1900 50  0001 C CNN
F 3 "~" H 4650 1900 50  0001 C CNN
	1    4650 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 632865B4
P 5250 1800
F 0 "#PWR01" H 5250 1650 50  0001 C CNN
F 1 "+5V" H 5265 1973 50  0000 C CNN
F 2 "" H 5250 1800 50  0001 C CNN
F 3 "" H 5250 1800 50  0001 C CNN
	1    5250 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1800 4850 1800
$Comp
L power:GND #PWR02
U 1 1 632870A7
P 5250 2000
F 0 "#PWR02" H 5250 1750 50  0001 C CNN
F 1 "GND" H 5255 1827 50  0000 C CNN
F 2 "" H 5250 2000 50  0001 C CNN
F 3 "" H 5250 2000 50  0001 C CNN
	1    5250 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2000 4850 2000
Text GLabel 4850 1900 2    50   Input ~ 0
sig1
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 63288D80
P 4650 2600
F 0 "J2" H 4758 2881 50  0000 C CNN
F 1 "Conn_01x03_Male" H 4758 2790 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 4650 2600 50  0001 C CNN
F 3 "~" H 4650 2600 50  0001 C CNN
	1    4650 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 63288D86
P 5250 2500
F 0 "#PWR03" H 5250 2350 50  0001 C CNN
F 1 "+5V" H 5265 2673 50  0000 C CNN
F 2 "" H 5250 2500 50  0001 C CNN
F 3 "" H 5250 2500 50  0001 C CNN
	1    5250 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2500 4850 2500
$Comp
L power:GND #PWR04
U 1 1 63288D8D
P 5250 2700
F 0 "#PWR04" H 5250 2450 50  0001 C CNN
F 1 "GND" H 5255 2527 50  0000 C CNN
F 2 "" H 5250 2700 50  0001 C CNN
F 3 "" H 5250 2700 50  0001 C CNN
	1    5250 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2700 4850 2700
Text GLabel 4850 2600 2    50   Input ~ 0
sig2
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 63289A32
P 4650 3300
F 0 "J3" H 4758 3581 50  0000 C CNN
F 1 "Conn_01x03_Male" H 4758 3490 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 4650 3300 50  0001 C CNN
F 3 "~" H 4650 3300 50  0001 C CNN
	1    4650 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 63289A38
P 5250 3200
F 0 "#PWR05" H 5250 3050 50  0001 C CNN
F 1 "+5V" H 5265 3373 50  0000 C CNN
F 2 "" H 5250 3200 50  0001 C CNN
F 3 "" H 5250 3200 50  0001 C CNN
	1    5250 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3200 4850 3200
$Comp
L power:GND #PWR06
U 1 1 63289A3F
P 5250 3400
F 0 "#PWR06" H 5250 3150 50  0001 C CNN
F 1 "GND" H 5255 3227 50  0000 C CNN
F 2 "" H 5250 3400 50  0001 C CNN
F 3 "" H 5250 3400 50  0001 C CNN
	1    5250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3400 4850 3400
Text GLabel 4850 3300 2    50   Input ~ 0
sig3
Wire Wire Line
	6450 1800 6150 1800
$Comp
L power:GND #PWR07
U 1 1 6328A1D2
P 6450 3400
F 0 "#PWR07" H 6450 3150 50  0001 C CNN
F 1 "GND" H 6455 3227 50  0000 C CNN
F 2 "" H 6450 3400 50  0001 C CNN
F 3 "" H 6450 3400 50  0001 C CNN
	1    6450 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3400 6150 3400
Text GLabel 6150 1900 2    50   Input ~ 0
sig1
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 6328C180
P 5950 2600
F 0 "J5" H 6058 2881 50  0000 C CNN
F 1 "Conn_01x03_Male" H 6058 2790 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S3B-XH-A_1x03_P2.50mm_Horizontal" H 5950 2600 50  0001 C CNN
F 3 "~" H 5950 2600 50  0001 C CNN
	1    5950 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J6
U 1 1 6328CF9D
P 5950 3300
F 0 "J6" H 6058 3581 50  0000 C CNN
F 1 "Conn_01x03_Male" H 6058 3490 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S3B-XH-A_1x03_P2.50mm_Horizontal" H 5950 3300 50  0001 C CNN
F 3 "~" H 5950 3300 50  0001 C CNN
	1    5950 3300
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U1
U 1 1 6328EAC0
P 7600 1750
F 0 "U1" H 7600 1992 50  0000 C CNN
F 1 "L7805" H 7600 1901 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220F-3_Vertical" H 7625 1600 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 7600 1700 50  0001 C CNN
	1    7600 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 6329019B
P 7600 2050
F 0 "#PWR012" H 7600 1800 50  0001 C CNN
F 1 "GND" H 7605 1877 50  0000 C CNN
F 2 "" H 7600 2050 50  0001 C CNN
F 3 "" H 7600 2050 50  0001 C CNN
	1    7600 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 63291014
P 8050 1750
F 0 "#PWR013" H 8050 1600 50  0001 C CNN
F 1 "+5V" H 8065 1923 50  0000 C CNN
F 2 "" H 8050 1750 50  0001 C CNN
F 3 "" H 8050 1750 50  0001 C CNN
	1    8050 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1
U 1 1 63291E1E
P 7150 1900
F 0 "C1" H 7265 1946 50  0000 L CNN
F 1 "CP1" H 7265 1855 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7150 1900 50  0001 C CNN
F 3 "~" H 7150 1900 50  0001 C CNN
	1    7150 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 6329249B
P 8050 1900
F 0 "C2" H 8165 1946 50  0000 L CNN
F 1 "C" H 8165 1855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 8088 1750 50  0001 C CNN
F 3 "~" H 8050 1900 50  0001 C CNN
	1    8050 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 2050 7600 2050
Connection ~ 7600 2050
Wire Wire Line
	7150 2050 7600 2050
Wire Wire Line
	7150 1750 7300 1750
Wire Wire Line
	7900 1750 8050 1750
Connection ~ 8050 1750
Text GLabel 7150 1750 0    50   Input ~ 0
6v_1
Text GLabel 6450 1800 2    50   Input ~ 0
6v_1
Text GLabel 6150 2600 2    50   Input ~ 0
sig2
Text GLabel 6150 3300 2    50   Input ~ 0
sig3
NoConn ~ 6150 3200
NoConn ~ 6150 2500
$Comp
L power:GND #PWR09
U 1 1 632A1658
P 6450 2700
F 0 "#PWR09" H 6450 2450 50  0001 C CNN
F 1 "GND" H 6455 2527 50  0000 C CNN
F 2 "" H 6450 2700 50  0001 C CNN
F 3 "" H 6450 2700 50  0001 C CNN
	1    6450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2700 6150 2700
$Comp
L power:GND #PWR08
U 1 1 632A1AF3
P 6450 2000
F 0 "#PWR08" H 6450 1750 50  0001 C CNN
F 1 "GND" H 6455 1827 50  0000 C CNN
F 2 "" H 6450 2000 50  0001 C CNN
F 3 "" H 6450 2000 50  0001 C CNN
	1    6450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2000 6150 2000
$Comp
L Mechanical:MountingHole H1
U 1 1 632A7DFB
P 8600 1850
F 0 "H1" H 8700 1896 50  0000 L CNN
F 1 "MountingHole" H 8700 1805 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 8600 1850 50  0001 C CNN
F 3 "~" H 8600 1850 50  0001 C CNN
	1    8600 1850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 632A8326
P 8600 2100
F 0 "H2" H 8700 2146 50  0000 L CNN
F 1 "MountingHole" H 8700 2055 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 8600 2100 50  0001 C CNN
F 3 "~" H 8600 2100 50  0001 C CNN
	1    8600 2100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 632A84B2
P 8600 2450
F 0 "H3" H 8700 2496 50  0000 L CNN
F 1 "MountingHole" H 8700 2405 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 8600 2450 50  0001 C CNN
F 3 "~" H 8600 2450 50  0001 C CNN
	1    8600 2450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 632A869B
P 8600 2650
F 0 "H4" H 8700 2696 50  0000 L CNN
F 1 "MountingHole" H 8700 2605 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 8600 2650 50  0001 C CNN
F 3 "~" H 8600 2650 50  0001 C CNN
	1    8600 2650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
