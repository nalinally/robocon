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
L Connector_Generic:Conn_02x10_Odd_Even J1
U 1 1 631E8444
P 5850 3450
F 0 "J1" H 5900 4067 50  0000 C CNN
F 1 "Conn_02x10_Odd_Even" H 5900 3976 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x10_P2.54mm_Horizontal" H 5850 3450 50  0001 C CNN
F 3 "~" H 5850 3450 50  0001 C CNN
	1    5850 3450
	1    0    0    -1  
$EndComp
$Comp
L relay_tb1:tb1-160 U1
U 1 1 631E94CE
P 6950 3200
F 0 "U1" H 6950 3525 50  0000 C CNN
F 1 "tb1-160" H 6950 3434 50  0000 C CNN
F 2 "relay_tb1:tb1_160" H 6950 3400 50  0001 C CNN
F 3 "" H 6950 3400 50  0001 C CNN
	1    6950 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 631EA07C
P 6950 3800
F 0 "D1" H 6950 4016 50  0000 C CNN
F 1 "D" H 6950 3925 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P10.16mm_Horizontal" H 6950 3800 50  0001 C CNN
F 3 "~" H 6950 3800 50  0001 C CNN
	1    6950 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3650 5650 3750
Connection ~ 5650 3750
Wire Wire Line
	5650 3750 5650 3850
Connection ~ 5650 3850
Wire Wire Line
	5650 3850 5650 3950
Wire Wire Line
	5650 3950 5650 4000
Wire Wire Line
	5650 4000 6150 4000
Wire Wire Line
	6150 4000 6150 3950
Connection ~ 5650 3950
Wire Wire Line
	6150 3950 6150 3850
Connection ~ 6150 3950
Connection ~ 6150 3750
Wire Wire Line
	6150 3750 6150 3650
Connection ~ 6150 3850
Wire Wire Line
	6150 3850 6150 3750
Wire Wire Line
	5650 3550 5650 3600
Wire Wire Line
	5650 3600 6150 3600
Wire Wire Line
	6150 3600 6150 3550
Wire Wire Line
	6150 3550 6150 3450
Connection ~ 6150 3550
Connection ~ 6150 3350
Wire Wire Line
	6150 3350 6150 3250
Connection ~ 6150 3450
Wire Wire Line
	6150 3450 6150 3350
Wire Wire Line
	5650 3250 5650 3350
Connection ~ 5650 3550
Connection ~ 5650 3350
Wire Wire Line
	5650 3350 5650 3450
Connection ~ 5650 3450
Wire Wire Line
	5650 3450 5650 3550
Wire Wire Line
	5650 3150 5650 3200
Wire Wire Line
	5650 3200 6150 3200
Wire Wire Line
	6150 3200 6150 3150
Wire Wire Line
	5650 3050 5650 3100
Wire Wire Line
	5650 3100 6150 3100
Wire Wire Line
	6150 3100 6150 3050
Text GLabel 5650 3050 0    50   Input ~ 0
coila
Text GLabel 5650 3150 0    50   Input ~ 0
coilb
Text GLabel 6700 3200 0    50   Input ~ 0
coila
Text GLabel 7200 3200 2    50   Input ~ 0
coilb
NoConn ~ 6700 3100
Wire Wire Line
	6700 3800 6800 3800
Wire Wire Line
	7100 3800 7200 3800
NoConn ~ 7200 3100
Wire Wire Line
	7200 3200 7200 3800
Wire Wire Line
	6700 3800 6700 3200
Text GLabel 6950 3450 0    50   Input ~ 0
contacta
Text GLabel 5650 3250 0    50   Input ~ 0
contacta
$EndSCHEMATC
