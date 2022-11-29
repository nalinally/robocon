EESchema Schematic File Version 4
LIBS:2022NHK_XBee_ver2-cache
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
L nucleo_3:NUCLEO-F303K8 IC1
U 1 1 631C1679
P 5950 2800
F 0 "IC1" H 5950 3665 50  0000 C CNN
F 1 "NUCLEO-F303K8" H 5950 3574 50  0000 C CNN
F 2 "NUCLEO3:NUCLEO-F303K8" H 7250 3650 50  0001 C CNN
F 3 "" H 7250 3650 50  0001 C CNN
	1    5950 2800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 631C2250
P 5000 1350
F 0 "H1" H 5100 1396 50  0000 L CNN
F 1 "MountingHole" H 5100 1305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 5000 1350 50  0001 C CNN
F 3 "~" H 5000 1350 50  0001 C CNN
	1    5000 1350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 631C2733
P 5250 1350
F 0 "H2" H 5350 1396 50  0000 L CNN
F 1 "MountingHole" H 5350 1305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 5250 1350 50  0001 C CNN
F 3 "~" H 5250 1350 50  0001 C CNN
	1    5250 1350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 631C27DF
P 5500 1350
F 0 "H3" H 5600 1396 50  0000 L CNN
F 1 "MountingHole" H 5600 1305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 5500 1350 50  0001 C CNN
F 3 "~" H 5500 1350 50  0001 C CNN
	1    5500 1350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 631C2A15
P 5750 1350
F 0 "H4" H 5850 1396 50  0000 L CNN
F 1 "MountingHole" H 5850 1305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 5750 1350 50  0001 C CNN
F 3 "~" H 5750 1350 50  0001 C CNN
	1    5750 1350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Heatsink HS1
U 1 1 631C436C
P 8400 2250
F 0 "HS1" H 8542 2371 50  0000 L CNN
F 1 "Heatsink" H 8542 2280 50  0000 L CNN
F 2 "Heatsink_alpha:Heatsink1" H 8412 2250 50  0001 C CNN
F 3 "~" H 8412 2250 50  0001 C CNN
	1    8400 2250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 631C4803
P 7300 1450
F 0 "J6" H 7408 1631 50  0000 C CNN
F 1 "Conn_01x02_Male" H 7408 1540 50  0000 C CNN
F 2 "Connector_T:Connector_T_Male" H 7300 1450 50  0001 C CNN
F 3 "~" H 7300 1450 50  0001 C CNN
	1    7300 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J7
U 1 1 631C4CFA
P 8900 1100
F 0 "J7" H 8928 1076 50  0000 L CNN
F 1 "Conn_01x02_Female" H 8928 985 50  0000 L CNN
F 2 "Connector_T:Connector_T_Female" H 8900 1100 50  0001 C CNN
F 3 "~" H 8900 1100 50  0001 C CNN
	1    8900 1100
	-1   0    0    -1  
$EndComp
$Comp
L Xbee:xbeepros1 U5
U 1 1 631C3EC9
P 8250 4350
F 0 "U5" H 8700 4565 50  0000 C CNN
F 1 "xbeepros1" H 8700 4474 50  0000 C CNN
F 2 "xbee:xbee_pro_s1" H 8250 4350 50  0001 C CNN
F 3 "" H 8250 4350 50  0001 C CNN
	1    8250 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 631C4770
P 7800 2650
F 0 "#PWR017" H 7800 2400 50  0001 C CNN
F 1 "GND" H 7805 2477 50  0000 C CNN
F 2 "" H 7800 2650 50  0001 C CNN
F 3 "" H 7800 2650 50  0001 C CNN
	1    7800 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 631C4F41
P 9100 2350
F 0 "#PWR018" H 9100 2200 50  0001 C CNN
F 1 "+5V" H 9115 2523 50  0000 C CNN
F 2 "" H 9100 2350 50  0001 C CNN
F 3 "" H 9100 2350 50  0001 C CNN
	1    9100 2350
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U6
U 1 1 631C56A1
P 8450 2350
F 0 "U6" H 8450 2592 50  0000 C CNN
F 1 "L7805" H 8450 2501 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220F-3_Vertical" H 8475 2200 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 8450 2300 50  0001 C CNN
	1    8450 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 2650 8000 2650
Wire Wire Line
	7800 2350 8000 2350
Wire Wire Line
	8750 2350 8900 2350
$Comp
L Device:C C2
U 1 1 631CA19F
P 8900 2500
F 0 "C2" H 9015 2546 50  0000 L CNN
F 1 "C" H 9015 2455 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 8938 2350 50  0001 C CNN
F 3 "~" H 8900 2500 50  0001 C CNN
	1    8900 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1
U 1 1 631CA6AA
P 8000 2500
F 0 "C1" H 8115 2546 50  0000 L CNN
F 1 "CP1" H 8115 2455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8000 2500 50  0001 C CNN
F 3 "~" H 8000 2500 50  0001 C CNN
	1    8000 2500
	1    0    0    -1  
$EndComp
Connection ~ 8000 2350
Wire Wire Line
	8000 2350 8150 2350
Connection ~ 8000 2650
Wire Wire Line
	8000 2650 8450 2650
Connection ~ 8900 2350
Wire Wire Line
	8900 2350 9100 2350
Wire Wire Line
	8900 2650 8450 2650
Connection ~ 8450 2650
$Comp
L power:+5V #PWR010
U 1 1 631CC1FA
P 7200 2300
F 0 "#PWR010" H 7200 2150 50  0001 C CNN
F 1 "+5V" H 7215 2473 50  0000 C CNN
F 2 "" H 7200 2300 50  0001 C CNN
F 3 "" H 7200 2300 50  0001 C CNN
	1    7200 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 631CC959
P 7200 2400
F 0 "#PWR011" H 7200 2150 50  0001 C CNN
F 1 "GND" H 7205 2227 50  0000 C CNN
F 2 "" H 7200 2400 50  0001 C CNN
F 3 "" H 7200 2400 50  0001 C CNN
	1    7200 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 2400 6550 2400
Wire Wire Line
	7200 2300 6550 2300
$Comp
L power:+3V3 #PWR012
U 1 1 631CEA50
P 7200 3600
F 0 "#PWR012" H 7200 3450 50  0001 C CNN
F 1 "+3V3" H 7215 3773 50  0000 C CNN
F 2 "" H 7200 3600 50  0001 C CNN
F 3 "" H 7200 3600 50  0001 C CNN
	1    7200 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3600 6550 3600
$Comp
L power:+3V3 #PWR013
U 1 1 631CFCD7
P 7600 4500
F 0 "#PWR013" H 7600 4350 50  0001 C CNN
F 1 "+3V3" H 7615 4673 50  0000 C CNN
F 2 "" H 7600 4500 50  0001 C CNN
F 3 "" H 7600 4500 50  0001 C CNN
	1    7600 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 4500 8250 4500
$Comp
L power:GND #PWR016
U 1 1 631D0DE5
P 7750 4650
F 0 "#PWR016" H 7750 4400 50  0001 C CNN
F 1 "GND" H 7755 4477 50  0000 C CNN
F 2 "" H 7750 4650 50  0001 C CNN
F 3 "" H 7750 4650 50  0001 C CNN
	1    7750 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 4650 7750 4400
Wire Wire Line
	7750 4400 8250 4400
Text GLabel 5350 2300 0    50   Input ~ 0
serial_tx
Text GLabel 5350 2400 0    50   Input ~ 0
serial_rx
Text GLabel 8250 4700 0    50   Input ~ 0
serial_tx
Text GLabel 8250 4600 0    50   Input ~ 0
serial_rx
Text GLabel 5350 3100 0    50   Input ~ 0
signal1
Text GLabel 7800 2350 0    50   Input ~ 0
2cell
Text GLabel 5350 3200 0    50   Input ~ 0
signal2
Text GLabel 5350 3300 0    50   Input ~ 0
signal3
Text GLabel 5350 3400 0    50   Input ~ 0
signal4
$Comp
L Device:R R4
U 1 1 6320DCA9
P 2800 3950
F 0 "R4" V 2593 3950 50  0000 C CNN
F 1 "R" V 2684 3950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 2730 3950 50  0001 C CNN
F 3 "~" H 2800 3950 50  0001 C CNN
	1    2800 3950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 6320DCAF
P 2500 3950
F 0 "#PWR04" H 2500 3700 50  0001 C CNN
F 1 "GND" H 2505 3777 50  0000 C CNN
F 2 "" H 2500 3950 50  0001 C CNN
F 3 "" H 2500 3950 50  0001 C CNN
	1    2500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3950 2650 3950
Wire Wire Line
	3750 3950 3900 3950
$Comp
L power:GNDPWR #PWR08
U 1 1 6321EEE6
P 3900 3950
F 0 "#PWR08" H 3900 3750 50  0001 C CNN
F 1 "GNDPWR" H 3904 3796 50  0000 C CNN
F 2 "" H 3900 3900 50  0001 C CNN
F 3 "" H 3900 3900 50  0001 C CNN
	1    3900 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 6321F87F
P 7300 1100
F 0 "J5" H 7408 1281 50  0000 C CNN
F 1 "Conn_01x02_Male" H 7408 1190 50  0000 C CNN
F 2 "Connector_T:Connector_T_Male" H 7300 1100 50  0001 C CNN
F 3 "~" H 7300 1100 50  0001 C CNN
	1    7300 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J8
U 1 1 6321FA4A
P 8900 1450
F 0 "J8" H 8928 1426 50  0000 L CNN
F 1 "Conn_01x02_Female" H 8928 1335 50  0000 L CNN
F 2 "Connector_T:Connector_T_Female" H 8900 1450 50  0001 C CNN
F 3 "~" H 8900 1450 50  0001 C CNN
	1    8900 1450
	-1   0    0    -1  
$EndComp
Text GLabel 7500 1100 2    50   Input ~ 0
2cell
$Comp
L power:GND #PWR014
U 1 1 6322E4D1
P 7700 1200
F 0 "#PWR014" H 7700 950 50  0001 C CNN
F 1 "GND" H 7705 1027 50  0000 C CNN
F 2 "" H 7700 1200 50  0001 C CNN
F 3 "" H 7700 1200 50  0001 C CNN
	1    7700 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 1200 7500 1200
Text GLabel 7500 1450 2    50   Input ~ 0
3cell
$Comp
L power:GNDPWR #PWR015
U 1 1 6323179A
P 7700 1550
F 0 "#PWR015" H 7700 1350 50  0001 C CNN
F 1 "GNDPWR" H 7704 1396 50  0000 C CNN
F 2 "" H 7700 1500 50  0001 C CNN
F 3 "" H 7700 1500 50  0001 C CNN
	1    7700 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 1550 7500 1550
$Comp
L power:GNDPWR #PWR020
U 1 1 632336AD
P 9400 1550
F 0 "#PWR020" H 9400 1350 50  0001 C CNN
F 1 "GNDPWR" H 9404 1396 50  0000 C CNN
F 2 "" H 9400 1500 50  0001 C CNN
F 3 "" H 9400 1500 50  0001 C CNN
	1    9400 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 1550 9100 1550
Text GLabel 9100 1450 2    50   Input ~ 0
3cell_out
Text GLabel 9100 1100 2    50   Input ~ 0
2cell_out
$Comp
L power:GND #PWR019
U 1 1 63237F18
P 9400 1200
F 0 "#PWR019" H 9400 950 50  0001 C CNN
F 1 "GND" H 9405 1027 50  0000 C CNN
F 2 "" H 9400 1200 50  0001 C CNN
F 3 "" H 9400 1200 50  0001 C CNN
	1    9400 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 1200 9100 1200
Text GLabel 2950 3750 0    50   Input ~ 0
signal4
Wire Wire Line
	3750 5600 4250 5600
Wire Wire Line
	4250 5200 3750 5200
Wire Wire Line
	3750 4700 4250 4700
Wire Wire Line
	4250 4700 4250 4650
Wire Wire Line
	3750 4750 3750 4800
Wire Wire Line
	3750 4800 4250 4800
Wire Wire Line
	4250 4800 4250 4750
Text GLabel 3750 4650 0    50   Input ~ 0
coil1a
Text GLabel 3750 4750 0    50   Input ~ 0
coil1b
Wire Wire Line
	4850 5600 5350 5600
Wire Wire Line
	5350 5200 4850 5200
Wire Wire Line
	4850 4700 5350 4700
Wire Wire Line
	5350 4700 5350 4650
Wire Wire Line
	4850 4750 4850 4800
Wire Wire Line
	4850 4800 5350 4800
Wire Wire Line
	5350 4800 5350 4750
Text GLabel 4850 4650 0    50   Input ~ 0
coil2a
Text GLabel 4850 4750 0    50   Input ~ 0
coil2b
Wire Wire Line
	3750 7050 4250 7050
Wire Wire Line
	4250 6650 3750 6650
Wire Wire Line
	3750 6150 4250 6150
Wire Wire Line
	4250 6150 4250 6100
Wire Wire Line
	3750 6200 3750 6250
Wire Wire Line
	3750 6250 4250 6250
Wire Wire Line
	4250 6250 4250 6200
Text GLabel 3750 6100 0    50   Input ~ 0
coil3a
Text GLabel 3750 6200 0    50   Input ~ 0
coil3b
Wire Wire Line
	4850 7050 5350 7050
Wire Wire Line
	5350 6650 4850 6650
Wire Wire Line
	4850 6150 5350 6150
Wire Wire Line
	5350 6150 5350 6100
Wire Wire Line
	4850 6200 4850 6250
Wire Wire Line
	4850 6250 5350 6250
Wire Wire Line
	5350 6250 5350 6200
Text GLabel 4850 6100 0    50   Input ~ 0
coil4a
Text GLabel 4850 6200 0    50   Input ~ 0
coil4b
Text GLabel 3750 3750 2    50   Input ~ 0
coil4b
Text GLabel 4850 5900 0    50   Input ~ 0
3cell
$Comp
L Device:R R3
U 1 1 63302973
P 2800 3300
F 0 "R3" V 2593 3300 50  0000 C CNN
F 1 "R" V 2684 3300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 2730 3300 50  0001 C CNN
F 3 "~" H 2800 3300 50  0001 C CNN
	1    2800 3300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 63302979
P 2500 3300
F 0 "#PWR03" H 2500 3050 50  0001 C CNN
F 1 "GND" H 2505 3127 50  0000 C CNN
F 2 "" H 2500 3300 50  0001 C CNN
F 3 "" H 2500 3300 50  0001 C CNN
	1    2500 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3300 2650 3300
Wire Wire Line
	3750 3300 3900 3300
$Comp
L power:GNDPWR #PWR07
U 1 1 63302981
P 3900 3300
F 0 "#PWR07" H 3900 3100 50  0001 C CNN
F 1 "GNDPWR" H 3904 3146 50  0000 C CNN
F 2 "" H 3900 3250 50  0001 C CNN
F 3 "" H 3900 3250 50  0001 C CNN
	1    3900 3300
	1    0    0    -1  
$EndComp
Text GLabel 2950 3100 0    50   Input ~ 0
signal3
Text GLabel 3750 3100 2    50   Input ~ 0
coil3b
$Comp
L Device:R R2
U 1 1 63309684
P 2800 2550
F 0 "R2" V 2593 2550 50  0000 C CNN
F 1 "R" V 2684 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 2730 2550 50  0001 C CNN
F 3 "~" H 2800 2550 50  0001 C CNN
	1    2800 2550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 6330968A
P 2500 2550
F 0 "#PWR02" H 2500 2300 50  0001 C CNN
F 1 "GND" H 2505 2377 50  0000 C CNN
F 2 "" H 2500 2550 50  0001 C CNN
F 3 "" H 2500 2550 50  0001 C CNN
	1    2500 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2550 2650 2550
Wire Wire Line
	3750 2550 3900 2550
$Comp
L power:GNDPWR #PWR06
U 1 1 63309692
P 3900 2550
F 0 "#PWR06" H 3900 2350 50  0001 C CNN
F 1 "GNDPWR" H 3904 2396 50  0000 C CNN
F 2 "" H 3900 2500 50  0001 C CNN
F 3 "" H 3900 2500 50  0001 C CNN
	1    3900 2550
	1    0    0    -1  
$EndComp
Text GLabel 2950 2350 0    50   Input ~ 0
signal2
Text GLabel 3750 2350 2    50   Input ~ 0
coil2b
$Comp
L Device:R R1
U 1 1 633101E2
P 2800 1850
F 0 "R1" V 2593 1850 50  0000 C CNN
F 1 "R" V 2684 1850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 2730 1850 50  0001 C CNN
F 3 "~" H 2800 1850 50  0001 C CNN
	1    2800 1850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 633101E8
P 2500 1850
F 0 "#PWR01" H 2500 1600 50  0001 C CNN
F 1 "GND" H 2505 1677 50  0000 C CNN
F 2 "" H 2500 1850 50  0001 C CNN
F 3 "" H 2500 1850 50  0001 C CNN
	1    2500 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1850 2650 1850
Wire Wire Line
	3750 1850 3900 1850
$Comp
L power:GNDPWR #PWR05
U 1 1 633101F0
P 3900 1850
F 0 "#PWR05" H 3900 1650 50  0001 C CNN
F 1 "GNDPWR" H 3904 1696 50  0000 C CNN
F 2 "" H 3900 1800 50  0001 C CNN
F 3 "" H 3900 1800 50  0001 C CNN
	1    3900 1850
	1    0    0    -1  
$EndComp
Text GLabel 2950 1650 0    50   Input ~ 0
signal1
Text GLabel 3750 1650 2    50   Input ~ 0
coil1b
$Comp
L power:GND #PWR09
U 1 1 633298F0
P 4950 2600
F 0 "#PWR09" H 4950 2350 50  0001 C CNN
F 1 "GND" H 4955 2427 50  0000 C CNN
F 2 "" H 4950 2600 50  0001 C CNN
F 3 "" H 4950 2600 50  0001 C CNN
	1    4950 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2600 4950 2600
Text GLabel 3750 5900 0    50   Input ~ 0
3cell
Text GLabel 4850 4450 0    50   Input ~ 0
3cell
Text GLabel 3750 4450 0    50   Input ~ 0
3cell
NoConn ~ 5350 2500
NoConn ~ 5350 2700
NoConn ~ 5350 2800
NoConn ~ 5350 2900
NoConn ~ 5350 3000
NoConn ~ 5350 3500
NoConn ~ 5350 3600
NoConn ~ 5350 3700
NoConn ~ 6550 2500
NoConn ~ 6550 2600
NoConn ~ 6550 2700
NoConn ~ 6550 2800
NoConn ~ 6550 2900
NoConn ~ 6550 3000
NoConn ~ 6550 3100
NoConn ~ 6550 3200
NoConn ~ 6550 3300
NoConn ~ 6550 3400
NoConn ~ 6550 3500
NoConn ~ 6550 3700
NoConn ~ 8250 4800
NoConn ~ 8250 4900
NoConn ~ 8250 5000
NoConn ~ 8250 5100
NoConn ~ 8250 5200
NoConn ~ 8250 5300
NoConn ~ 8250 5400
NoConn ~ 9150 4400
NoConn ~ 9150 4500
NoConn ~ 9150 4600
NoConn ~ 9150 4700
NoConn ~ 9150 4800
NoConn ~ 9150 4900
NoConn ~ 9150 5000
NoConn ~ 9150 5100
NoConn ~ 9150 5200
NoConn ~ 9150 5300
NoConn ~ 9150 5400
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J2
U 1 1 6344E39B
P 3950 6500
F 0 "J2" H 4000 7117 50  0000 C CNN
F 1 "Conn_02x10_Odd_Even" H 4000 7026 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x10_P2.54mm_Vertical" H 3950 6500 50  0001 C CNN
F 3 "~" H 3950 6500 50  0001 C CNN
	1    3950 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 5900 3750 6100
Wire Wire Line
	4250 6300 4250 6400
Wire Wire Line
	3750 6300 3750 6400
Wire Wire Line
	4850 5900 4850 6100
Wire Wire Line
	3750 4450 3750 4650
Wire Wire Line
	4250 4850 4250 4950
Wire Wire Line
	4250 5250 4250 5350
Wire Wire Line
	3750 4850 3750 4950
Wire Wire Line
	3750 5250 3750 5350
Wire Wire Line
	4850 4450 4850 4650
Wire Wire Line
	5350 4850 5350 4950
Wire Wire Line
	5350 5250 5350 5350
Wire Wire Line
	4850 4850 4850 4950
Wire Wire Line
	4850 5250 4850 5350
Wire Wire Line
	4250 6600 4250 6650
Wire Wire Line
	3750 7000 3750 7050
Wire Wire Line
	4250 7000 4250 7050
Connection ~ 3750 6100
Wire Wire Line
	3750 6100 3750 6150
Wire Wire Line
	3750 6700 3750 6800
Connection ~ 3750 7000
Connection ~ 3750 6800
Wire Wire Line
	3750 6800 3750 6900
Connection ~ 3750 6900
Wire Wire Line
	3750 6900 3750 7000
Wire Wire Line
	4250 7000 4250 6900
Connection ~ 4250 7000
Connection ~ 4250 6800
Wire Wire Line
	4250 6800 4250 6700
Connection ~ 4250 6900
Wire Wire Line
	4250 6900 4250 6800
Wire Wire Line
	3750 6650 3750 6600
Connection ~ 3750 6400
Connection ~ 3750 6500
Wire Wire Line
	3750 6500 3750 6400
Connection ~ 3750 6600
Wire Wire Line
	3750 6600 3750 6500
Wire Wire Line
	4250 6600 4250 6500
Connection ~ 4250 6600
Connection ~ 4250 6400
Connection ~ 4250 6500
Wire Wire Line
	4250 6500 4250 6400
Connection ~ 5350 6400
Connection ~ 5350 6500
Wire Wire Line
	5350 6500 5350 6600
Wire Wire Line
	5350 6600 5350 6650
Connection ~ 5350 6600
Connection ~ 5350 6800
Connection ~ 5350 6900
Wire Wire Line
	5350 6900 5350 7000
Wire Wire Line
	5350 7000 5350 7050
Connection ~ 5350 7000
Connection ~ 4850 7000
Wire Wire Line
	4850 7000 4850 7050
Wire Wire Line
	4850 6900 4850 7000
Connection ~ 4850 6900
Connection ~ 4850 6800
Connection ~ 4850 6600
Wire Wire Line
	4850 6600 4850 6650
Wire Wire Line
	4850 6500 4850 6600
Connection ~ 4850 6500
Connection ~ 4850 6400
Wire Wire Line
	4850 6800 4850 6900
Wire Wire Line
	4850 6700 4850 6800
Wire Wire Line
	4850 6400 4850 6500
Wire Wire Line
	4850 6300 4850 6400
Wire Wire Line
	5350 6800 5350 6900
Wire Wire Line
	5350 6700 5350 6800
Wire Wire Line
	5350 6400 5350 6500
Wire Wire Line
	5350 6300 5350 6400
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J4
U 1 1 6345F944
P 5050 6500
F 0 "J4" H 5100 7117 50  0000 C CNN
F 1 "Conn_02x10_Odd_Even" H 5100 7026 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x10_P2.54mm_Vertical" H 5050 6500 50  0001 C CNN
F 3 "~" H 5050 6500 50  0001 C CNN
	1    5050 6500
	1    0    0    -1  
$EndComp
Connection ~ 4850 6100
Wire Wire Line
	4850 6100 4850 6150
Connection ~ 3750 4950
Wire Wire Line
	3750 4950 3750 5050
Connection ~ 3750 5050
Wire Wire Line
	3750 5050 3750 5150
Connection ~ 3750 5150
Wire Wire Line
	3750 5150 3750 5200
Connection ~ 3750 5350
Wire Wire Line
	3750 5350 3750 5450
Connection ~ 3750 5450
Wire Wire Line
	3750 5450 3750 5550
Connection ~ 3750 5550
Wire Wire Line
	3750 5550 3750 5600
Connection ~ 4250 5550
Wire Wire Line
	4250 5550 4250 5600
Connection ~ 4250 5450
Wire Wire Line
	4250 5450 4250 5550
Connection ~ 4250 5350
Wire Wire Line
	4250 5350 4250 5450
Connection ~ 4250 5150
Wire Wire Line
	4250 5150 4250 5200
Connection ~ 4250 5050
Wire Wire Line
	4250 5050 4250 5150
Connection ~ 4250 4950
Wire Wire Line
	4250 4950 4250 5050
Connection ~ 4850 4950
Wire Wire Line
	4850 4950 4850 5050
Connection ~ 4850 5050
Wire Wire Line
	4850 5050 4850 5150
Connection ~ 4850 5150
Wire Wire Line
	4850 5150 4850 5200
Connection ~ 4850 5350
Wire Wire Line
	4850 5350 4850 5450
Connection ~ 4850 5450
Wire Wire Line
	4850 5450 4850 5550
Connection ~ 4850 5550
Wire Wire Line
	4850 5550 4850 5600
Connection ~ 5350 5550
Wire Wire Line
	5350 5550 5350 5600
Connection ~ 5350 5450
Wire Wire Line
	5350 5450 5350 5550
Connection ~ 5350 5350
Wire Wire Line
	5350 5350 5350 5450
Connection ~ 5350 5150
Wire Wire Line
	5350 5150 5350 5200
Connection ~ 5350 5050
Wire Wire Line
	5350 5050 5350 5150
Connection ~ 5350 4950
Wire Wire Line
	5350 4950 5350 5050
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J1
U 1 1 63461840
P 3950 5050
F 0 "J1" H 4000 5667 50  0000 C CNN
F 1 "Conn_02x10_Odd_Even" H 4000 5576 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x10_P2.54mm_Vertical" H 3950 5050 50  0001 C CNN
F 3 "~" H 3950 5050 50  0001 C CNN
	1    3950 5050
	1    0    0    -1  
$EndComp
Connection ~ 3750 4650
Wire Wire Line
	3750 4650 3750 4700
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J3
U 1 1 63462E1F
P 5050 5050
F 0 "J3" H 5100 5667 50  0000 C CNN
F 1 "Conn_02x10_Odd_Even" H 5100 5576 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x10_P2.54mm_Vertical" H 5050 5050 50  0001 C CNN
F 3 "~" H 5050 5050 50  0001 C CNN
	1    5050 5050
	1    0    0    -1  
$EndComp
Connection ~ 4850 4650
Wire Wire Line
	4850 4650 4850 4700
$Comp
L Isolator:TLP627-2 U1
U 1 1 63471F43
P 3350 1750
F 0 "U1" H 3350 2075 50  0000 C CNN
F 1 "TLP627-2" H 3350 1984 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 3050 1550 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=16914&prodName=TLP627" H 3350 1750 50  0001 L CNN
	1    3350 1750
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP627-2 U1
U 2 1 634BBDA8
P 3350 2450
F 0 "U1" H 3350 2775 50  0000 C CNN
F 1 "TLP627-2" H 3350 2684 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 3050 2250 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=16914&prodName=TLP627" H 3350 2450 50  0001 L CNN
	2    3350 2450
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP627-2 U2
U 1 1 634BCF9B
P 3350 3200
F 0 "U2" H 3350 3525 50  0000 C CNN
F 1 "TLP627-2" H 3350 3434 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 3050 3000 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=16914&prodName=TLP627" H 3350 3200 50  0001 L CNN
	1    3350 3200
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP627-2 U2
U 2 1 634BD801
P 3350 3850
F 0 "U2" H 3350 4175 50  0000 C CNN
F 1 "TLP627-2" H 3350 4084 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 3050 3650 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=16914&prodName=TLP627" H 3350 3850 50  0001 L CNN
	2    3350 3850
	1    0    0    -1  
$EndComp
NoConn ~ 9100 1100
NoConn ~ 9100 1450
Text GLabel 3750 5250 0    50   Input ~ 0
contact1b
Text GLabel 3750 6700 0    50   Input ~ 0
contact2b
Text GLabel 4850 6300 0    50   Input ~ 0
contact4a
Text GLabel 3750 4850 0    50   Input ~ 0
contact1a
Text GLabel 4850 5250 0    50   Input ~ 0
contact3b
Text GLabel 4850 4850 0    50   Input ~ 0
contact3a
Text GLabel 3750 6300 0    50   Input ~ 0
contact2a
Text GLabel 4850 6700 0    50   Input ~ 0
contact4b
$EndSCHEMATC
