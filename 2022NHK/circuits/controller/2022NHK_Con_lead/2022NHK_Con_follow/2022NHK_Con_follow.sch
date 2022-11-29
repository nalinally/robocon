EESchema Schematic File Version 4
LIBS:2022NHK_Con_follow-cache
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
U 1 1 6286293D
P 7850 2050
F 0 "IC1" H 7850 2915 50  0000 C CNN
F 1 "NUCLEO-F303K8" H 7850 2824 50  0000 C CNN
F 2 "NUCLEO3:NUCLEO-F303K8" H 9150 2900 50  0001 C CNN
F 3 "" H 9150 2900 50  0001 C CNN
	1    7850 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J7
U 1 1 62863794
P 5450 1750
F 0 "J7" H 5558 2031 50  0000 C CNN
F 1 "Conn_01x03_Male" H 5558 1940 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S3B-XH-A_1x03_P2.50mm_Horizontal" H 5450 1750 50  0001 C CNN
F 3 "~" H 5450 1750 50  0001 C CNN
	1    5450 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 62863B8C
P 4300 1650
F 0 "J3" H 4408 1831 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4408 1740 50  0000 C CNN
F 2 "Connector_T:Connector_T_Male" H 4300 1650 50  0001 C CNN
F 3 "~" H 4300 1650 50  0001 C CNN
	1    4300 1650
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U1
U 1 1 6286488D
P 4800 2350
F 0 "U1" H 4800 2592 50  0000 C CNN
F 1 "L7805" H 4800 2501 50  0000 C CNN
F 2 "Regulator:NJM7805FA" H 4825 2200 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 4800 2300 50  0001 C CNN
	1    4800 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1
U 1 1 62865134
P 4400 2500
F 0 "C1" H 4515 2546 50  0000 L CNN
F 1 "CP1" H 4515 2455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 4400 2500 50  0001 C CNN
F 3 "~" H 4400 2500 50  0001 C CNN
	1    4400 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 6286580C
P 5200 2500
F 0 "C2" H 5315 2546 50  0000 L CNN
F 1 "C" H 5315 2455 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 5238 2350 50  0001 C CNN
F 3 "~" H 5200 2500 50  0001 C CNN
	1    5200 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 62865C8E
P 4800 2650
F 0 "#PWR06" H 4800 2400 50  0001 C CNN
F 1 "GND" H 4805 2477 50  0000 C CNN
F 2 "" H 4800 2650 50  0001 C CNN
F 3 "" H 4800 2650 50  0001 C CNN
	1    4800 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR01
U 1 1 62865EB6
P 4300 2350
F 0 "#PWR01" H 4300 2200 50  0001 C CNN
F 1 "+BATT" V 4315 2477 50  0000 L CNN
F 2 "" H 4300 2350 50  0001 C CNN
F 3 "" H 4300 2350 50  0001 C CNN
	1    4300 2350
	0    -1   -1   0   
$EndComp
Text GLabel 8450 1850 2    50   Input ~ 0
5v_out
Text GLabel 5350 2350 2    50   Input ~ 0
5v_in
Wire Wire Line
	4400 2650 4800 2650
Connection ~ 4800 2650
Wire Wire Line
	5200 2650 4800 2650
Wire Wire Line
	4300 2350 4400 2350
Connection ~ 4400 2350
Wire Wire Line
	4400 2350 4500 2350
Wire Wire Line
	5100 2350 5200 2350
Connection ~ 5200 2350
Wire Wire Line
	5200 2350 5350 2350
$Comp
L power:+BATT #PWR04
U 1 1 62868D2A
P 4650 1650
F 0 "#PWR04" H 4650 1500 50  0001 C CNN
F 1 "+BATT" H 4665 1823 50  0000 C CNN
F 2 "" H 4650 1650 50  0001 C CNN
F 3 "" H 4650 1650 50  0001 C CNN
	1    4650 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 62869283
P 4650 1750
F 0 "#PWR05" H 4650 1500 50  0001 C CNN
F 1 "GND" H 4655 1577 50  0000 C CNN
F 2 "" H 4650 1750 50  0001 C CNN
F 3 "" H 4650 1750 50  0001 C CNN
	1    4650 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 1750 4500 1750
Wire Wire Line
	4650 1650 4500 1650
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 62869A74
P 5000 1650
F 0 "J4" H 5028 1626 50  0000 L CNN
F 1 "Conn_01x02_Female" H 5028 1535 50  0000 L CNN
F 2 "Connector_T:Connector_T_Female" H 5000 1650 50  0001 C CNN
F 3 "~" H 5000 1650 50  0001 C CNN
	1    5000 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 1650 4800 1650
Connection ~ 4650 1650
Wire Wire Line
	4800 1750 4650 1750
Connection ~ 4650 1750
Text GLabel 8450 1550 2    50   Input ~ 0
5v_in
$Comp
L power:GND #PWR012
U 1 1 6286D349
P 6900 1850
F 0 "#PWR012" H 6900 1600 50  0001 C CNN
F 1 "GND" H 6905 1677 50  0000 C CNN
F 2 "" H 6900 1850 50  0001 C CNN
F 3 "" H 6900 1850 50  0001 C CNN
	1    6900 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 1850 7250 1850
$Comp
L power:GND #PWR017
U 1 1 6286D9D6
P 8850 1650
F 0 "#PWR017" H 8850 1400 50  0001 C CNN
F 1 "GND" H 8855 1477 50  0000 C CNN
F 2 "" H 8850 1650 50  0001 C CNN
F 3 "" H 8850 1650 50  0001 C CNN
	1    8850 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 1650 8450 1650
NoConn ~ 8450 1750
NoConn ~ 8450 2750
Text GLabel 7250 1950 0    50   Input ~ 0
2a
Text GLabel 7250 2750 0    50   Input ~ 0
3a
Text GLabel 8450 2050 2    50   Input ~ 0
4a
Text GLabel 8450 2250 2    50   Input ~ 0
5a
Text GLabel 8450 2450 2    50   Input ~ 0
6a
Text GLabel 7250 2650 0    50   Input ~ 0
2b
Text GLabel 8450 2650 2    50   Input ~ 0
3b
Text GLabel 8450 2150 2    50   Input ~ 0
4b
Text GLabel 8450 2350 2    50   Input ~ 0
5b
Text GLabel 8450 2550 2    50   Input ~ 0
6b
Text GLabel 7250 2250 0    50   Input ~ 0
uart_tx
Text GLabel 7250 2150 0    50   Input ~ 0
uart_rx
Text GLabel 7250 2350 0    50   Input ~ 0
led1
Text GLabel 7250 2850 0    50   Input ~ 0
bt1
Text GLabel 7250 2950 0    50   Input ~ 0
bt2
NoConn ~ 7250 1750
NoConn ~ 7250 2050
NoConn ~ 7250 2450
NoConn ~ 7250 2550
NoConn ~ 8450 1950
Text GLabel 5650 1650 2    50   Input ~ 0
uart_tx
Text GLabel 5650 1750 2    50   Input ~ 0
uart_rx
$Comp
L power:GND #PWR09
U 1 1 62876ECE
P 5750 1850
F 0 "#PWR09" H 5750 1600 50  0001 C CNN
F 1 "GND" H 5755 1677 50  0000 C CNN
F 2 "" H 5750 1850 50  0001 C CNN
F 3 "" H 5750 1850 50  0001 C CNN
	1    5750 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1850 5650 1850
$Comp
L Connector:Conn_01x05_Male J5
U 1 1 6287CBD5
P 5100 3400
F 0 "J5" H 5208 3781 50  0000 C CNN
F 1 "Conn_01x05_Male" H 5208 3690 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 5100 3400 50  0001 C CNN
F 3 "~" H 5100 3400 50  0001 C CNN
	1    5100 3400
	1    0    0    -1  
$EndComp
Text GLabel 5300 3300 2    50   Input ~ 0
5v_out
Text GLabel 5300 3400 2    50   Input ~ 0
2a
Text GLabel 5300 3200 2    50   Input ~ 0
2b
$Comp
L power:GND #PWR07
U 1 1 6287CBDE
P 5400 3600
F 0 "#PWR07" H 5400 3350 50  0001 C CNN
F 1 "GND" H 5405 3427 50  0000 C CNN
F 2 "" H 5400 3600 50  0001 C CNN
F 3 "" H 5400 3600 50  0001 C CNN
	1    5400 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3600 5300 3600
NoConn ~ 5300 3500
$Comp
L Connector:Conn_01x05_Male J2
U 1 1 6287D0DD
P 4250 4350
F 0 "J2" H 4358 4731 50  0000 C CNN
F 1 "Conn_01x05_Male" H 4358 4640 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 4250 4350 50  0001 C CNN
F 3 "~" H 4250 4350 50  0001 C CNN
	1    4250 4350
	1    0    0    -1  
$EndComp
Text GLabel 4450 4250 2    50   Input ~ 0
5v_out
Text GLabel 4450 4350 2    50   Input ~ 0
4a
Text GLabel 4450 4150 2    50   Input ~ 0
4b
$Comp
L power:GND #PWR03
U 1 1 6287D0E6
P 4550 4550
F 0 "#PWR03" H 4550 4300 50  0001 C CNN
F 1 "GND" H 4555 4377 50  0000 C CNN
F 2 "" H 4550 4550 50  0001 C CNN
F 3 "" H 4550 4550 50  0001 C CNN
	1    4550 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 4550 4450 4550
NoConn ~ 4450 4450
$Comp
L Connector:Conn_01x05_Male J6
U 1 1 6287D7CA
P 5100 4350
F 0 "J6" H 5208 4731 50  0000 C CNN
F 1 "Conn_01x05_Male" H 5208 4640 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 5100 4350 50  0001 C CNN
F 3 "~" H 5100 4350 50  0001 C CNN
	1    5100 4350
	1    0    0    -1  
$EndComp
Text GLabel 5300 4250 2    50   Input ~ 0
5v_out
Text GLabel 5300 4350 2    50   Input ~ 0
5a
Text GLabel 5300 4150 2    50   Input ~ 0
5b
$Comp
L power:GND #PWR08
U 1 1 6287D7D3
P 5400 4550
F 0 "#PWR08" H 5400 4300 50  0001 C CNN
F 1 "GND" H 5405 4377 50  0000 C CNN
F 2 "" H 5400 4550 50  0001 C CNN
F 3 "" H 5400 4550 50  0001 C CNN
	1    5400 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4550 5300 4550
NoConn ~ 5300 4450
$Comp
L Connector:Conn_01x05_Male J8
U 1 1 6287E1CA
P 5950 3400
F 0 "J8" H 6058 3781 50  0000 C CNN
F 1 "Conn_01x05_Male" H 6058 3690 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 5950 3400 50  0001 C CNN
F 3 "~" H 5950 3400 50  0001 C CNN
	1    5950 3400
	1    0    0    -1  
$EndComp
Text GLabel 6150 3300 2    50   Input ~ 0
5v_out
Text GLabel 6150 3400 2    50   Input ~ 0
3a
Text GLabel 6150 3200 2    50   Input ~ 0
3b
$Comp
L power:GND #PWR010
U 1 1 6287E1D3
P 6250 3600
F 0 "#PWR010" H 6250 3350 50  0001 C CNN
F 1 "GND" H 6255 3427 50  0000 C CNN
F 2 "" H 6250 3600 50  0001 C CNN
F 3 "" H 6250 3600 50  0001 C CNN
	1    6250 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3600 6150 3600
NoConn ~ 6150 3500
$Comp
L Connector:Conn_01x05_Male J9
U 1 1 6287F06D
P 5950 4350
F 0 "J9" H 6058 4731 50  0000 C CNN
F 1 "Conn_01x05_Male" H 6058 4640 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 5950 4350 50  0001 C CNN
F 3 "~" H 5950 4350 50  0001 C CNN
	1    5950 4350
	1    0    0    -1  
$EndComp
Text GLabel 6150 4250 2    50   Input ~ 0
5v_out
Text GLabel 6150 4350 2    50   Input ~ 0
6a
Text GLabel 6150 4150 2    50   Input ~ 0
6b
$Comp
L power:GND #PWR011
U 1 1 6287F076
P 6250 4550
F 0 "#PWR011" H 6250 4300 50  0001 C CNN
F 1 "GND" H 6255 4377 50  0000 C CNN
F 2 "" H 6250 4550 50  0001 C CNN
F 3 "" H 6250 4550 50  0001 C CNN
	1    6250 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4550 6150 4550
NoConn ~ 6150 4450
Text GLabel 7200 3450 0    50   Input ~ 0
led1
$Comp
L Device:R R1
U 1 1 62883888
P 7200 3900
F 0 "R1" H 7270 3946 50  0000 L CNN
F 1 "R" H 7270 3855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7130 3900 50  0001 C CNN
F 3 "~" H 7200 3900 50  0001 C CNN
	1    7200 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 62884010
P 7200 3600
F 0 "D1" V 7239 3483 50  0000 R CNN
F 1 "LED" V 7148 3483 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 7200 3600 50  0001 C CNN
F 3 "~" H 7200 3600 50  0001 C CNN
	1    7200 3600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 62884872
P 7200 4050
F 0 "#PWR013" H 7200 3800 50  0001 C CNN
F 1 "GND" H 7205 3877 50  0000 C CNN
F 2 "" H 7200 4050 50  0001 C CNN
F 3 "" H 7200 4050 50  0001 C CNN
	1    7200 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR016
U 1 1 628882A3
P 8800 2850
F 0 "#PWR016" H 8800 2700 50  0001 C CNN
F 1 "+3V3" H 8815 3023 50  0000 C CNN
F 2 "" H 8800 2850 50  0001 C CNN
F 3 "" H 8800 2850 50  0001 C CNN
	1    8800 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 2850 8450 2850
Text GLabel 8450 2950 2    50   Input ~ 0
bt3
$Comp
L Connector:Conn_01x05_Male J10
U 1 1 6290820D
P 7800 3700
F 0 "J10" H 7908 4081 50  0000 C CNN
F 1 "Conn_01x05_Male" H 7908 3990 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 7800 3700 50  0001 C CNN
F 3 "~" H 7800 3700 50  0001 C CNN
	1    7800 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR014
U 1 1 62909182
P 8300 3500
F 0 "#PWR014" H 8300 3350 50  0001 C CNN
F 1 "+3V3" H 8315 3673 50  0000 C CNN
F 2 "" H 8300 3500 50  0001 C CNN
F 3 "" H 8300 3500 50  0001 C CNN
	1    8300 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 629095E4
P 8300 3600
F 0 "#PWR015" H 8300 3350 50  0001 C CNN
F 1 "GND" H 8305 3427 50  0000 C CNN
F 2 "" H 8300 3600 50  0001 C CNN
F 3 "" H 8300 3600 50  0001 C CNN
	1    8300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3500 8300 3500
Wire Wire Line
	8000 3600 8300 3600
Text GLabel 8000 3700 2    50   Input ~ 0
bt1
Text GLabel 8000 3800 2    50   Input ~ 0
bt2
Text GLabel 8000 3900 2    50   Input ~ 0
bt3
$Comp
L Connector:Conn_01x02_Male J11
U 1 1 6290FB1C
P 7800 4400
F 0 "J11" H 7908 4581 50  0000 C CNN
F 1 "Conn_01x02_Male" H 7908 4490 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S2B-XH-A_1x02_P2.50mm_Horizontal" H 7800 4400 50  0001 C CNN
F 3 "~" H 7800 4400 50  0001 C CNN
	1    7800 4400
	1    0    0    -1  
$EndComp
Text GLabel 8000 4400 2    50   Input ~ 0
led1
$Comp
L power:GND #PWR018
U 1 1 629108DE
P 8000 4500
F 0 "#PWR018" H 8000 4250 50  0001 C CNN
F 1 "GND" H 8005 4327 50  0000 C CNN
F 2 "" H 8000 4500 50  0001 C CNN
F 3 "" H 8000 4500 50  0001 C CNN
	1    8000 4500
	1    0    0    -1  
$EndComp
Text GLabel 7250 1550 0    50   Input ~ 0
uart_tx
Text GLabel 7250 1650 0    50   Input ~ 0
uart_rx
$EndSCHEMATC
