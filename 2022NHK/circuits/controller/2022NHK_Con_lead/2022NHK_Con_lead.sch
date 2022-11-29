EESchema Schematic File Version 4
LIBS:2022NHK_Con_lead-cache
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
Text GLabel 10300 3050 2    50   Input ~ 0
1a
Text GLabel 7700 4850 2    50   Input ~ 0
8a
Text GLabel 10300 3150 2    50   Input ~ 0
1b
Text GLabel 10300 3250 2    50   Input ~ 0
2a
Text GLabel 10300 3550 2    50   Input ~ 0
2b
Text GLabel 10300 3650 2    50   Input ~ 0
3a
Text GLabel 10300 4050 2    50   Input ~ 0
3b
Text GLabel 10300 4150 2    50   Input ~ 0
4a
Text GLabel 10300 4250 2    50   Input ~ 0
4b
Text GLabel 10300 4350 2    50   Input ~ 0
5a
Text GLabel 10300 4450 2    50   Input ~ 0
5b
Text GLabel 10300 4650 2    50   Input ~ 0
6a
Text GLabel 9300 4650 0    50   Input ~ 0
6b
Text GLabel 9300 4050 0    50   Input ~ 0
7a
Text GLabel 9300 3950 0    50   Input ~ 0
7b
Text GLabel 6700 4850 0    50   Input ~ 0
8b
Text GLabel 5650 4400 0    50   Input ~ 0
serial1_tx
Text GLabel 7700 3050 2    50   Input ~ 0
serial1_rx
Text GLabel 6700 3150 0    50   Input ~ 0
serial2_tx
Text GLabel 7700 3150 2    50   Input ~ 0
serial2_rx
Text GLabel 7700 4350 2    50   Input ~ 0
xbee_tx
Text GLabel 7700 4450 2    50   Input ~ 0
xbee_rx
$Comp
L Connector:Conn_01x05_Male J2
U 1 1 6280C9C5
P 3500 2650
F 0 "J2" H 3608 3031 50  0000 C CNN
F 1 "Conn_01x05_Male" H 3608 2940 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 3500 2650 50  0001 C CNN
F 3 "~" H 3500 2650 50  0001 C CNN
	1    3500 2650
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J13
U 1 1 6280EB6B
P 5850 4500
F 0 "J13" H 5958 4781 50  0000 C CNN
F 1 "Conn_01x03_Male" H 5958 4690 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S3B-XH-A_1x03_P2.50mm_Horizontal" H 5850 4500 50  0001 C CNN
F 3 "~" H 5850 4500 50  0001 C CNN
	1    5850 4500
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6280F371
P 5300 5300
F 0 "R1" H 5370 5346 50  0000 L CNN
F 1 "R" H 5370 5255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5230 5300 50  0001 C CNN
F 3 "~" H 5300 5300 50  0001 C CNN
	1    5300 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 6280F6F2
P 5300 5600
F 0 "D1" H 5293 5816 50  0000 C CNN
F 1 "LED" H 5293 5725 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5300 5600 50  0001 C CNN
F 3 "~" H 5300 5600 50  0001 C CNN
	1    5300 5600
	0    -1   -1   0   
$EndComp
Text GLabel 7700 4650 2    50   Input ~ 0
led1
Text GLabel 7700 4750 2    50   Input ~ 0
led2
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 628131C7
P 3900 1400
F 0 "J4" H 3928 1376 50  0000 L CNN
F 1 "Conn_01x02_Female" H 3928 1285 50  0000 L CNN
F 2 "Connector_T:Connector_T_Female" H 3900 1400 50  0001 C CNN
F 3 "~" H 3900 1400 50  0001 C CNN
	1    3900 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 628139FF
P 3100 1400
F 0 "J1" H 3208 1581 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3208 1490 50  0000 C CNN
F 2 "Connector_T:Connector_T_Male" H 3100 1400 50  0001 C CNN
F 3 "~" H 3100 1400 50  0001 C CNN
	1    3100 1400
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U1
U 1 1 62814058
P 5150 1300
F 0 "U1" H 5150 1542 50  0000 C CNN
F 1 "L7805" H 5150 1451 50  0000 C CNN
F 2 "Regulator:NJM7805FA" H 5175 1150 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 5150 1250 50  0001 C CNN
	1    5150 1300
	1    0    0    -1  
$EndComp
NoConn ~ 9300 4850
NoConn ~ 9300 4750
NoConn ~ 10300 4550
NoConn ~ 6700 3350
NoConn ~ 9300 4550
NoConn ~ 9300 4450
NoConn ~ 9300 4350
NoConn ~ 9300 4250
NoConn ~ 9300 4150
NoConn ~ 7700 3250
NoConn ~ 9300 3850
NoConn ~ 10300 3750
NoConn ~ 9300 3750
NoConn ~ 9300 3650
NoConn ~ 6700 3250
NoConn ~ 10300 3350
NoConn ~ 9300 3350
NoConn ~ 9300 3050
NoConn ~ 6700 4650
NoConn ~ 6700 4550
NoConn ~ 6700 4450
NoConn ~ 6700 4350
NoConn ~ 6700 4250
NoConn ~ 6700 3750
NoConn ~ 7700 3650
NoConn ~ 6700 3650
NoConn ~ 7700 3550
$Comp
L NUCLEO_F446RE:Nucleo-F446RE U2
U 1 1 62808F4C
P 8500 3950
F 0 "U2" H 8500 6968 118 0000 C CNB
F 1 "Nucleo-F446RE" H 8500 6775 118 0000 C CNB
F 2 "NUCLEO-F446RE:MODULE_NUCLEO_F446RE" H 8500 3950 60  0001 C CNN
F 3 "" H 8500 3950 60  0000 C CNN
	1    8500 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR011
U 1 1 6281ED95
P 4450 1300
F 0 "#PWR011" H 4450 1150 50  0001 C CNN
F 1 "+BATT" H 4465 1473 50  0000 C CNN
F 2 "" H 4450 1300 50  0001 C CNN
F 3 "" H 4450 1300 50  0001 C CNN
	1    4450 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 6281F42D
P 4450 1600
F 0 "#PWR012" H 4450 1350 50  0001 C CNN
F 1 "GND" H 4455 1427 50  0000 C CNN
F 2 "" H 4450 1600 50  0001 C CNN
F 3 "" H 4450 1600 50  0001 C CNN
	1    4450 1600
	1    0    0    -1  
$EndComp
Text GLabel 5850 1300 2    50   Input ~ 0
5vin
Text GLabel 3300 2550 0    50   Input ~ 0
5vout
$Comp
L Device:C C2
U 1 1 62820B9A
P 5650 1450
F 0 "C2" H 5765 1496 50  0000 L CNN
F 1 "C" H 5765 1405 50  0000 L CNN
F 2 "Capacitor_THT:C_Axial_L3.8mm_D2.6mm_P7.50mm_Horizontal" H 5688 1300 50  0001 C CNN
F 3 "~" H 5650 1450 50  0001 C CNN
	1    5650 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1
U 1 1 628211AC
P 4650 1450
F 0 "C1" H 4765 1496 50  0000 L CNN
F 1 "CP1" H 4765 1405 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 4650 1450 50  0001 C CNN
F 3 "~" H 4650 1450 50  0001 C CNN
	1    4650 1450
	1    0    0    -1  
$EndComp
Connection ~ 4650 1600
Wire Wire Line
	4650 1600 5150 1600
Connection ~ 5150 1600
Wire Wire Line
	5150 1600 5650 1600
Wire Wire Line
	4450 1300 4650 1300
Connection ~ 4650 1300
Wire Wire Line
	4650 1300 4850 1300
Wire Wire Line
	5450 1300 5650 1300
Connection ~ 5650 1300
Wire Wire Line
	5650 1300 5850 1300
Wire Wire Line
	4450 1600 4650 1600
$Comp
L power:+BATT #PWR06
U 1 1 62823A77
P 3500 1400
F 0 "#PWR06" H 3500 1250 50  0001 C CNN
F 1 "+BATT" H 3515 1573 50  0000 C CNN
F 2 "" H 3500 1400 50  0001 C CNN
F 3 "" H 3500 1400 50  0001 C CNN
	1    3500 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 62824045
P 3500 1500
F 0 "#PWR07" H 3500 1250 50  0001 C CNN
F 1 "GND" H 3505 1327 50  0000 C CNN
F 2 "" H 3500 1500 50  0001 C CNN
F 3 "" H 3500 1500 50  0001 C CNN
	1    3500 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1400 3300 1400
Wire Wire Line
	3500 1500 3300 1500
Wire Wire Line
	3500 1400 3700 1400
Connection ~ 3500 1400
Wire Wire Line
	3700 1500 3500 1500
Connection ~ 3500 1500
Text GLabel 7700 4150 2    50   Input ~ 0
5vin
Text GLabel 7700 3850 2    50   Input ~ 0
5vout
$Comp
L power:GND #PWR01
U 1 1 6282D477
P 3100 2850
F 0 "#PWR01" H 3100 2600 50  0001 C CNN
F 1 "GND" H 3105 2677 50  0000 C CNN
F 2 "" H 3100 2850 50  0001 C CNN
F 3 "" H 3100 2850 50  0001 C CNN
	1    3100 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2850 3300 2850
Text GLabel 3300 2650 0    50   Input ~ 0
1a
Text GLabel 3300 2450 0    50   Input ~ 0
1b
NoConn ~ 3300 2750
$Comp
L Connector:Conn_01x05_Male J6
U 1 1 6283266B
P 4300 2650
F 0 "J6" H 4408 3031 50  0000 C CNN
F 1 "Conn_01x05_Male" H 4408 2940 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 4300 2650 50  0001 C CNN
F 3 "~" H 4300 2650 50  0001 C CNN
	1    4300 2650
	-1   0    0    -1  
$EndComp
Text GLabel 4100 2550 0    50   Input ~ 0
5vout
$Comp
L power:GND #PWR09
U 1 1 62832672
P 3900 2850
F 0 "#PWR09" H 3900 2600 50  0001 C CNN
F 1 "GND" H 3905 2677 50  0000 C CNN
F 2 "" H 3900 2850 50  0001 C CNN
F 3 "" H 3900 2850 50  0001 C CNN
	1    3900 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2850 4100 2850
Text GLabel 4100 2650 0    50   Input ~ 0
2a
Text GLabel 4100 2450 0    50   Input ~ 0
2b
NoConn ~ 4100 2750
$Comp
L Connector:Conn_01x05_Male J9
U 1 1 6283332C
P 5050 2650
F 0 "J9" H 5158 3031 50  0000 C CNN
F 1 "Conn_01x05_Male" H 5158 2940 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 5050 2650 50  0001 C CNN
F 3 "~" H 5050 2650 50  0001 C CNN
	1    5050 2650
	-1   0    0    -1  
$EndComp
Text GLabel 4850 2550 0    50   Input ~ 0
5vout
$Comp
L power:GND #PWR014
U 1 1 62833333
P 4650 2850
F 0 "#PWR014" H 4650 2600 50  0001 C CNN
F 1 "GND" H 4655 2677 50  0000 C CNN
F 2 "" H 4650 2850 50  0001 C CNN
F 3 "" H 4650 2850 50  0001 C CNN
	1    4650 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2850 4850 2850
Text GLabel 4850 2650 0    50   Input ~ 0
3a
Text GLabel 4850 2450 0    50   Input ~ 0
3b
NoConn ~ 4850 2750
$Comp
L Connector:Conn_01x05_Male J11
U 1 1 628347B7
P 5850 2650
F 0 "J11" H 5958 3031 50  0000 C CNN
F 1 "Conn_01x05_Male" H 5958 2940 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 5850 2650 50  0001 C CNN
F 3 "~" H 5850 2650 50  0001 C CNN
	1    5850 2650
	-1   0    0    -1  
$EndComp
Text GLabel 5650 2550 0    50   Input ~ 0
5vout
$Comp
L power:GND #PWR018
U 1 1 628347BE
P 5450 2850
F 0 "#PWR018" H 5450 2600 50  0001 C CNN
F 1 "GND" H 5455 2677 50  0000 C CNN
F 2 "" H 5450 2850 50  0001 C CNN
F 3 "" H 5450 2850 50  0001 C CNN
	1    5450 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2850 5650 2850
Text GLabel 5650 2650 0    50   Input ~ 0
4a
Text GLabel 5650 2450 0    50   Input ~ 0
4b
NoConn ~ 5650 2750
$Comp
L Connector:Conn_01x05_Male J3
U 1 1 62835AEE
P 3500 3650
F 0 "J3" H 3608 4031 50  0000 C CNN
F 1 "Conn_01x05_Male" H 3608 3940 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 3500 3650 50  0001 C CNN
F 3 "~" H 3500 3650 50  0001 C CNN
	1    3500 3650
	-1   0    0    -1  
$EndComp
Text GLabel 3300 3550 0    50   Input ~ 0
5vout
$Comp
L power:GND #PWR02
U 1 1 62835AF5
P 3100 3850
F 0 "#PWR02" H 3100 3600 50  0001 C CNN
F 1 "GND" H 3105 3677 50  0000 C CNN
F 2 "" H 3100 3850 50  0001 C CNN
F 3 "" H 3100 3850 50  0001 C CNN
	1    3100 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3850 3300 3850
Text GLabel 3300 3650 0    50   Input ~ 0
5a
Text GLabel 3300 3450 0    50   Input ~ 0
5b
NoConn ~ 3300 3750
$Comp
L Connector:Conn_01x05_Male J7
U 1 1 62836C1F
P 4300 3650
F 0 "J7" H 4408 4031 50  0000 C CNN
F 1 "Conn_01x05_Male" H 4408 3940 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 4300 3650 50  0001 C CNN
F 3 "~" H 4300 3650 50  0001 C CNN
	1    4300 3650
	-1   0    0    -1  
$EndComp
Text GLabel 4100 3550 0    50   Input ~ 0
5vout
$Comp
L power:GND #PWR010
U 1 1 62836C26
P 3900 3850
F 0 "#PWR010" H 3900 3600 50  0001 C CNN
F 1 "GND" H 3905 3677 50  0000 C CNN
F 2 "" H 3900 3850 50  0001 C CNN
F 3 "" H 3900 3850 50  0001 C CNN
	1    3900 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3850 4100 3850
Text GLabel 4100 3650 0    50   Input ~ 0
6a
Text GLabel 4100 3450 0    50   Input ~ 0
6b
NoConn ~ 4100 3750
$Comp
L Connector:Conn_01x05_Male J10
U 1 1 62837A7B
P 5050 3650
F 0 "J10" H 5158 4031 50  0000 C CNN
F 1 "Conn_01x05_Male" H 5158 3940 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 5050 3650 50  0001 C CNN
F 3 "~" H 5050 3650 50  0001 C CNN
	1    5050 3650
	-1   0    0    -1  
$EndComp
Text GLabel 4850 3550 0    50   Input ~ 0
5vout
$Comp
L power:GND #PWR015
U 1 1 62837A82
P 4650 3850
F 0 "#PWR015" H 4650 3600 50  0001 C CNN
F 1 "GND" H 4655 3677 50  0000 C CNN
F 2 "" H 4650 3850 50  0001 C CNN
F 3 "" H 4650 3850 50  0001 C CNN
	1    4650 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3850 4850 3850
Text GLabel 4850 3650 0    50   Input ~ 0
7a
Text GLabel 4850 3450 0    50   Input ~ 0
7b
NoConn ~ 4850 3750
$Comp
L Connector:Conn_01x05_Male J12
U 1 1 62838354
P 5850 3650
F 0 "J12" H 5958 4031 50  0000 C CNN
F 1 "Conn_01x05_Male" H 5958 3940 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 5850 3650 50  0001 C CNN
F 3 "~" H 5850 3650 50  0001 C CNN
	1    5850 3650
	-1   0    0    -1  
$EndComp
Text GLabel 5650 3550 0    50   Input ~ 0
5vout
$Comp
L power:GND #PWR019
U 1 1 6283835B
P 5450 3850
F 0 "#PWR019" H 5450 3600 50  0001 C CNN
F 1 "GND" H 5455 3677 50  0000 C CNN
F 2 "" H 5450 3850 50  0001 C CNN
F 3 "" H 5450 3850 50  0001 C CNN
	1    5450 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3850 5650 3850
Text GLabel 5650 3650 0    50   Input ~ 0
8a
Text GLabel 5650 3450 0    50   Input ~ 0
8b
NoConn ~ 5650 3750
Text GLabel 5650 4500 0    50   Input ~ 0
serial1_rx
$Comp
L power:GND #PWR020
U 1 1 6283CC0D
P 5650 4600
F 0 "#PWR020" H 5650 4350 50  0001 C CNN
F 1 "GND" H 5655 4427 50  0000 C CNN
F 2 "" H 5650 4600 50  0001 C CNN
F 3 "" H 5650 4600 50  0001 C CNN
	1    5650 4600
	1    0    0    -1  
$EndComp
Text GLabel 4700 4400 0    50   Input ~ 0
serial2_tx
$Comp
L Connector:Conn_01x03_Male J8
U 1 1 6283E292
P 4900 4500
F 0 "J8" H 5008 4781 50  0000 C CNN
F 1 "Conn_01x03_Male" H 5008 4690 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S3B-XH-A_1x03_P2.50mm_Horizontal" H 4900 4500 50  0001 C CNN
F 3 "~" H 4900 4500 50  0001 C CNN
	1    4900 4500
	-1   0    0    -1  
$EndComp
Text GLabel 4700 4500 0    50   Input ~ 0
serial2_rx
$Comp
L power:GND #PWR016
U 1 1 6283E299
P 4700 4600
F 0 "#PWR016" H 4700 4350 50  0001 C CNN
F 1 "GND" H 4705 4427 50  0000 C CNN
F 2 "" H 4700 4600 50  0001 C CNN
F 3 "" H 4700 4600 50  0001 C CNN
	1    4700 4600
	1    0    0    -1  
$EndComp
Text GLabel 6700 3050 0    50   Input ~ 0
serial1_tx
$Comp
L power:GND #PWR026
U 1 1 6281149B
P 8950 3450
F 0 "#PWR026" H 8950 3200 50  0001 C CNN
F 1 "GND" H 8955 3277 50  0000 C CNN
F 2 "" H 8950 3450 50  0001 C CNN
F 3 "" H 8950 3450 50  0001 C CNN
	1    8950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 3450 8950 3450
$Comp
L power:GND #PWR027
U 1 1 62812761
P 10650 3950
F 0 "#PWR027" H 10650 3700 50  0001 C CNN
F 1 "GND" H 10655 3777 50  0000 C CNN
F 2 "" H 10650 3950 50  0001 C CNN
F 3 "" H 10650 3950 50  0001 C CNN
	1    10650 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 3950 10650 3950
$Comp
L power:GND #PWR022
U 1 1 6281418F
P 6200 3950
F 0 "#PWR022" H 6200 3700 50  0001 C CNN
F 1 "GND" H 6205 3777 50  0000 C CNN
F 2 "" H 6200 3950 50  0001 C CNN
F 3 "" H 6200 3950 50  0001 C CNN
	1    6200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3950 6200 3950
$Comp
L power:GND #PWR023
U 1 1 628165AD
P 8100 3350
F 0 "#PWR023" H 8100 3100 50  0001 C CNN
F 1 "GND" H 8105 3177 50  0000 C CNN
F 2 "" H 8100 3350 50  0001 C CNN
F 3 "" H 8100 3350 50  0001 C CNN
	1    8100 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 3350 8100 3350
$Comp
L power:GND #PWR024
U 1 1 628179EA
P 8100 4050
F 0 "#PWR024" H 8100 3800 50  0001 C CNN
F 1 "GND" H 8105 3877 50  0000 C CNN
F 2 "" H 8100 4050 50  0001 C CNN
F 3 "" H 8100 4050 50  0001 C CNN
	1    8100 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4050 7700 3950
Wire Wire Line
	7700 4050 8100 4050
Connection ~ 7700 4050
Text GLabel 5300 5150 0    50   Input ~ 0
led1
Text GLabel 5800 5150 0    50   Input ~ 0
led2
$Comp
L Device:R R2
U 1 1 6281A69B
P 5800 5300
F 0 "R2" H 5870 5346 50  0000 L CNN
F 1 "R" H 5870 5255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5730 5300 50  0001 C CNN
F 3 "~" H 5800 5300 50  0001 C CNN
	1    5800 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 6281A6A1
P 5800 5600
F 0 "D2" H 5793 5816 50  0000 C CNN
F 1 "LED" H 5793 5725 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5800 5600 50  0001 C CNN
F 3 "~" H 5800 5600 50  0001 C CNN
	1    5800 5600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 6281B73D
P 5300 5750
F 0 "#PWR013" H 5300 5500 50  0001 C CNN
F 1 "GND" H 5305 5577 50  0000 C CNN
F 2 "" H 5300 5750 50  0001 C CNN
F 3 "" H 5300 5750 50  0001 C CNN
	1    5300 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 6281BB6F
P 5800 5750
F 0 "#PWR017" H 5800 5500 50  0001 C CNN
F 1 "GND" H 5805 5577 50  0000 C CNN
F 2 "" H 5800 5750 50  0001 C CNN
F 3 "" H 5800 5750 50  0001 C CNN
	1    5800 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR025
U 1 1 62827BE8
P 8250 3750
F 0 "#PWR025" H 8250 3600 50  0001 C CNN
F 1 "+3V3" H 8265 3923 50  0000 C CNN
F 2 "" H 8250 3750 50  0001 C CNN
F 3 "" H 8250 3750 50  0001 C CNN
	1    8250 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3750 7700 3750
$Comp
L Connector:Conn_01x04_Male J5
U 1 1 628B52BC
P 3750 4450
F 0 "J5" H 3858 4731 50  0000 C CNN
F 1 "Conn_01x04_Male" H 3858 4640 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S4B-XH-A_1x04_P2.50mm_Horizontal" H 3750 4450 50  0001 C CNN
F 3 "~" H 3750 4450 50  0001 C CNN
	1    3750 4450
	-1   0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR05
U 1 1 628B734C
P 3250 4350
F 0 "#PWR05" H 3250 4200 50  0001 C CNN
F 1 "+3V3" H 3265 4523 50  0000 C CNN
F 2 "" H 3250 4350 50  0001 C CNN
F 3 "" H 3250 4350 50  0001 C CNN
	1    3250 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 4350 3250 4350
$Comp
L power:GND #PWR08
U 1 1 628B87AC
P 3250 4650
F 0 "#PWR08" H 3250 4400 50  0001 C CNN
F 1 "GND" H 3255 4477 50  0000 C CNN
F 2 "" H 3250 4650 50  0001 C CNN
F 3 "" H 3250 4650 50  0001 C CNN
	1    3250 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4650 3550 4650
Text GLabel 9300 3150 0    50   Input ~ 0
jyro_scl
Text GLabel 9300 3250 0    50   Input ~ 0
jyro_sda
Text GLabel 3550 4550 0    50   Input ~ 0
jyro_scl
Text GLabel 3550 4450 0    50   Input ~ 0
jyro_sda
Text GLabel 7700 4550 2    50   Input ~ 0
sw_usr1
Text GLabel 6700 3850 0    50   Input ~ 0
bt_usr1
Text GLabel 6700 4050 0    50   Input ~ 0
bt_usr2
Text GLabel 6700 4150 0    50   Input ~ 0
bt_usr3
Text GLabel 6700 4750 0    50   Input ~ 0
bt_usr4
$Comp
L power:+3V3 #PWR021
U 1 1 628C6DEE
P 4200 5250
F 0 "#PWR021" H 4200 5100 50  0001 C CNN
F 1 "+3V3" H 4215 5423 50  0000 C CNN
F 2 "" H 4200 5250 50  0001 C CNN
F 3 "" H 4200 5250 50  0001 C CNN
	1    4200 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J14
U 1 1 628C80CC
P 4400 5450
F 0 "J14" H 4372 5424 50  0000 R CNN
F 1 "Conn_01x06_Male" H 4372 5333 50  0000 R CNN
F 2 "Connector_JST:JST_XH_S6B-XH-A_1x06_P2.50mm_Horizontal" H 4400 5450 50  0001 C CNN
F 3 "~" H 4400 5450 50  0001 C CNN
	1    4400 5450
	-1   0    0    -1  
$EndComp
Text GLabel 4200 5350 0    50   Input ~ 0
sw_usr1
Text GLabel 4200 5450 0    50   Input ~ 0
bt_usr1
Text GLabel 4200 5550 0    50   Input ~ 0
bt_usr2
Text GLabel 4200 5650 0    50   Input ~ 0
bt_usr3
Text GLabel 4200 5750 0    50   Input ~ 0
bt_usr4
$Comp
L Xbee:xbeepros1 U3
U 1 1 628B59B1
P 2550 5250
F 0 "U3" H 3000 5465 50  0000 C CNN
F 1 "xbeepros1" H 3000 5374 50  0000 C CNN
F 2 "xbee:xbee_pro_s1" H 2550 5250 50  0001 C CNN
F 3 "" H 2550 5250 50  0001 C CNN
	1    2550 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 628BEE81
P 2050 5300
F 0 "#PWR03" H 2050 5050 50  0001 C CNN
F 1 "GND" H 2055 5127 50  0000 C CNN
F 2 "" H 2050 5300 50  0001 C CNN
F 3 "" H 2050 5300 50  0001 C CNN
	1    2050 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5300 2550 5300
$Comp
L power:+3V3 #PWR04
U 1 1 628BFF97
P 2250 5200
F 0 "#PWR04" H 2250 5050 50  0001 C CNN
F 1 "+3V3" H 2265 5373 50  0000 C CNN
F 2 "" H 2250 5200 50  0001 C CNN
F 3 "" H 2250 5200 50  0001 C CNN
	1    2250 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 5200 2250 5400
Wire Wire Line
	2250 5400 2550 5400
Text GLabel 2550 5600 0    50   Input ~ 0
xbee_tx
Text GLabel 2550 5500 0    50   Input ~ 0
xbee_rx
NoConn ~ 3450 5300
NoConn ~ 3450 5400
NoConn ~ 3450 5500
NoConn ~ 3450 5600
NoConn ~ 3450 5700
NoConn ~ 3450 5800
NoConn ~ 3450 5900
NoConn ~ 3450 6000
NoConn ~ 3450 6100
NoConn ~ 3450 6200
NoConn ~ 3450 6300
NoConn ~ 2550 6300
NoConn ~ 2550 6200
NoConn ~ 2550 6100
NoConn ~ 2550 6000
NoConn ~ 2550 5900
NoConn ~ 2550 5800
NoConn ~ 2550 5700
$Comp
L Connector:Conn_01x04_Male J15
U 1 1 628DBA49
P 2650 4400
F 0 "J15" H 2758 4681 50  0000 C CNN
F 1 "Conn_01x04_Male" H 2758 4590 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S4B-XH-A_1x04_P2.50mm_Horizontal" H 2650 4400 50  0001 C CNN
F 3 "~" H 2650 4400 50  0001 C CNN
	1    2650 4400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 628DC705
P 2450 4600
F 0 "#PWR028" H 2450 4350 50  0001 C CNN
F 1 "GND" H 2455 4427 50  0000 C CNN
F 2 "" H 2450 4600 50  0001 C CNN
F 3 "" H 2450 4600 50  0001 C CNN
	1    2450 4600
	1    0    0    -1  
$EndComp
Text GLabel 9300 3550 0    50   Input ~ 0
led3
Text GLabel 2450 4500 0    50   Input ~ 0
led3
Text GLabel 2450 4300 0    50   Input ~ 0
led1
Text GLabel 2450 4400 0    50   Input ~ 0
led2
$EndSCHEMATC
