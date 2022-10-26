;Program compiled by Great Cow BASIC (1.00.00 Release Candidate 2022-10-19 (Windows 64 bit) : Build 1181) for Microchip PIC-AS
;  See the GCBASIC forums at http://sourceforge.net/projects/gcbasic/forums,
;  Check the documentation and Help at http://gcbasic.sourceforge.net/help/,
;or, email:
;   evanvennn at users dot sourceforge dot net

;********************************************************************************


;Set up the assembler options (Chip type, clock source, other bits and pieces)
;PROCESSOR   16F17126
 PAGEWIDTH   180
 RADIX       DEC
 TITLE       "d:\GreatCowBASICGits\Demonstration_Sources.git\trunk\Vendor_Boards\Great_Cow_Basic_Demo_Board\16F17126_chiprange_demonstrations\100_reversible_leds_with_variable_delay_to_serial_terminal.s"
 SUBTITLE    "10-26-2022"

; Reverse lookup file(s)
; C:\Program Files\Microchip\xc8\v2.40\pic\include\proc\pic16f17126.inc
; C:\Program Files\Microchip\xc8\v2.40\pic\dat\cfgmap\16f17126.cfgmap
; Alternative CONFIG file is to be found at C:\Program Files\Microchip\xc8\vX.YY\pic\dat\cfgdata as per Microchip support ticket #00730936 

;********************************************************************************

;********************************************************************************
;Explicit CONFIG
 CONFIG FCMEN=ON                                 ;C1 Reverselookup FCMEN = ON
 CONFIG CLKOUTEN=OFF                             ;C1 Reverselookup CLKOUTEN = OFF
 CONFIG RSTOSC=HFINTOSC_32MHz                    ;C1 Reverselookup RSTOSC = HFINTOSC_32MHZ
 CONFIG FEXTOSC=OFF                              ;C1 Reverselookup FEXTOSC = OFF
 CONFIG MCLRE=INTMCLR                            ;C1 Reverselookup MCLRE = INTMCLR
 CONFIG WDTE=OFF                                 ;C1 Reverselookup WDTE = OFF
 CONFIG LVP=OFF                                  ;C1 Reverselookup LVP = OFF
 CONFIG WRTSAF=OFF                               ;C1 Reverselookup WRTSAF = OFF
 CONFIG WRTD=OFF                                 ;C1 Reverselookup WRTD = OFF
 CONFIG WRTB=OFF                                 ;C1 Reverselookup WRTB = OFF
 CONFIG CPD=OFF                                  ;C1 Reverselookup CPD = OFF
 CONFIG CP=OFF                                   ;C1 Reverselookup CP = OFF
;Inferred CONFIG


;********************************************************************************
; The XC8 xc.inc include file.  This MUST be placed after the CONFIG statements.

 #include <xc.inc>

;********************************************************************************

;Set aside RAM memory locations for variables. All variables are global.
GLOBAL	ADREADPORT
 ADREADPORT                       EQU 32          ; 0X20
GLOBAL	ANSELB
 ANSELB                           EQU 33          ; 0X21
GLOBAL	CHECK_SWITCH
 CHECK_SWITCH                     EQU 34          ; 0X22
GLOBAL	COMPORT
 COMPORT                          EQU 35          ; 0X23
GLOBAL	DELAYTEMP
 DELAYTEMP                        EQU 112          ; 0X70
GLOBAL	DELAYTEMP2
 DELAYTEMP2                       EQU 113          ; 0X71
GLOBAL	DIRECTION
 DIRECTION                        EQU 36          ; 0X24
GLOBAL	HSERPRINTCRLFCOUNT
 HSERPRINTCRLFCOUNT               EQU 37          ; 0X25
GLOBAL	LEDS
 LEDS                             EQU 38          ; 0X26
GLOBAL	L_CALIBRATE
 L_CALIBRATE                      EQU 39          ; 0X27
GLOBAL	L_CALIBRATE_H
 L_CALIBRATE_H                    EQU 40          ; 0X28
GLOBAL	L_FROMHIGH
 L_FROMHIGH                       EQU 41          ; 0X29
GLOBAL	L_FROMHIGH_H
 L_FROMHIGH_H                     EQU 42          ; 0X2A
GLOBAL	L_FROMLOW
 L_FROMLOW                        EQU 43          ; 0X2B
GLOBAL	L_FROMLOW_H
 L_FROMLOW_H                      EQU 44          ; 0X2C
GLOBAL	L_MAP
 L_MAP                            EQU 45          ; 0X2D
GLOBAL	L_MAP_H
 L_MAP_H                          EQU 46          ; 0X2E
GLOBAL	L_SYSCALC
 L_SYSCALC                        EQU 47          ; 0X2F
GLOBAL	L_SYSCALCF
 L_SYSCALCF                       EQU 49          ; 0X31
GLOBAL	L_SYSCALCF_E
 L_SYSCALCF_E                     EQU 52          ; 0X34
GLOBAL	L_SYSCALCF_H
 L_SYSCALCF_H                     EQU 50          ; 0X32
GLOBAL	L_SYSCALCF_U
 L_SYSCALCF_U                     EQU 51          ; 0X33
GLOBAL	L_SYSCALC_H
 L_SYSCALC_H                      EQU 48          ; 0X30
GLOBAL	L_TOHIGH
 L_TOHIGH                         EQU 53          ; 0X35
GLOBAL	L_TOHIGH_H
 L_TOHIGH_H                       EQU 54          ; 0X36
GLOBAL	L_TOLOW
 L_TOLOW                          EQU 55          ; 0X37
GLOBAL	L_TOLOW_H
 L_TOLOW_H                        EQU 56          ; 0X38
GLOBAL	MYDELAY
 MYDELAY                          EQU 57          ; 0X39
GLOBAL	OUTVALUETEMP
 OUTVALUETEMP                     EQU 58          ; 0X3A
GLOBAL	PRINTLEN
 PRINTLEN                         EQU 59          ; 0X3B
GLOBAL	READAD
 READAD                           EQU 60          ; 0X3C
GLOBAL	SCALE
 SCALE                            EQU 61          ; 0X3D
GLOBAL	SCALE_H
 SCALE_H                          EQU 62          ; 0X3E
GLOBAL	SERDATA
 SERDATA                          EQU 63          ; 0X3F
GLOBAL	SERPRINTVAL
 SERPRINTVAL                      EQU 64          ; 0X40
GLOBAL	STRINGPOINTER
 STRINGPOINTER                    EQU 65          ; 0X41
GLOBAL	SYSBITVAR0
 SYSBITVAR0                       EQU 66          ; 0X42
GLOBAL	SYSBYTETEMPA
 SYSBYTETEMPA                     EQU 117          ; 0X75
GLOBAL	SYSBYTETEMPB
 SYSBYTETEMPB                     EQU 121          ; 0X79
GLOBAL	SYSBYTETEMPX
 SYSBYTETEMPX                     EQU 112          ; 0X70
GLOBAL	SYSCALCTEMPX
 SYSCALCTEMPX                     EQU 112          ; 0X70
GLOBAL	SYSDIVLOOP
 SYSDIVLOOP                       EQU 116          ; 0X74
GLOBAL	SYSLONGDIVMULTA
 SYSLONGDIVMULTA                  EQU 67          ; 0X43
GLOBAL	SYSLONGDIVMULTA_E
 SYSLONGDIVMULTA_E                EQU 70          ; 0X46
GLOBAL	SYSLONGDIVMULTA_H
 SYSLONGDIVMULTA_H                EQU 68          ; 0X44
GLOBAL	SYSLONGDIVMULTA_U
 SYSLONGDIVMULTA_U                EQU 69          ; 0X45
GLOBAL	SYSLONGDIVMULTB
 SYSLONGDIVMULTB                  EQU 71          ; 0X47
GLOBAL	SYSLONGDIVMULTB_E
 SYSLONGDIVMULTB_E                EQU 74          ; 0X4A
GLOBAL	SYSLONGDIVMULTB_H
 SYSLONGDIVMULTB_H                EQU 72          ; 0X48
GLOBAL	SYSLONGDIVMULTB_U
 SYSLONGDIVMULTB_U                EQU 73          ; 0X49
GLOBAL	SYSLONGDIVMULTX
 SYSLONGDIVMULTX                  EQU 75          ; 0X4B
GLOBAL	SYSLONGDIVMULTX_E
 SYSLONGDIVMULTX_E                EQU 78          ; 0X4E
GLOBAL	SYSLONGDIVMULTX_H
 SYSLONGDIVMULTX_H                EQU 76          ; 0X4C
GLOBAL	SYSLONGDIVMULTX_U
 SYSLONGDIVMULTX_U                EQU 77          ; 0X4D
GLOBAL	SYSLONGTEMPA
 SYSLONGTEMPA                     EQU 117          ; 0X75
GLOBAL	SYSLONGTEMPA_E
 SYSLONGTEMPA_E                   EQU 120          ; 0X78
GLOBAL	SYSLONGTEMPA_H
 SYSLONGTEMPA_H                   EQU 118          ; 0X76
GLOBAL	SYSLONGTEMPA_U
 SYSLONGTEMPA_U                   EQU 119          ; 0X77
GLOBAL	SYSLONGTEMPB
 SYSLONGTEMPB                     EQU 121          ; 0X79
GLOBAL	SYSLONGTEMPB_E
 SYSLONGTEMPB_E                   EQU 124          ; 0X7C
GLOBAL	SYSLONGTEMPB_H
 SYSLONGTEMPB_H                   EQU 122          ; 0X7A
GLOBAL	SYSLONGTEMPB_U
 SYSLONGTEMPB_U                   EQU 123          ; 0X7B
GLOBAL	SYSLONGTEMPX
 SYSLONGTEMPX                     EQU 112          ; 0X70
GLOBAL	SYSLONGTEMPX_E
 SYSLONGTEMPX_E                   EQU 115          ; 0X73
GLOBAL	SYSLONGTEMPX_H
 SYSLONGTEMPX_H                   EQU 113          ; 0X71
GLOBAL	SYSLONGTEMPX_U
 SYSLONGTEMPX_U                   EQU 114          ; 0X72
GLOBAL	SYSPRINTDATAHANDLER
 SYSPRINTDATAHANDLER              EQU 79          ; 0X4F
GLOBAL	SYSPRINTDATAHANDLER_H
 SYSPRINTDATAHANDLER_H            EQU 80          ; 0X50
GLOBAL	SYSPRINTTEMP
 SYSPRINTTEMP                     EQU 81          ; 0X51
GLOBAL	SYSREPEATTEMP1
 SYSREPEATTEMP1                   EQU 82          ; 0X52
GLOBAL	SYSSTRINGA
 SYSSTRINGA                       EQU 119          ; 0X77
GLOBAL	SYSSTRINGA_H
 SYSSTRINGA_H                     EQU 120          ; 0X78
GLOBAL	SYSTEMP1
 SYSTEMP1                         EQU 83          ; 0X53
GLOBAL	SYSTEMP1_E
 SYSTEMP1_E                       EQU 86          ; 0X56
GLOBAL	SYSTEMP1_H
 SYSTEMP1_H                       EQU 84          ; 0X54
GLOBAL	SYSTEMP1_U
 SYSTEMP1_U                       EQU 85          ; 0X55
GLOBAL	SYSTEMP2
 SYSTEMP2                         EQU 87          ; 0X57
GLOBAL	SYSTEMP2_H
 SYSTEMP2_H                       EQU 88          ; 0X58
GLOBAL	SYSTEMP3
 SYSTEMP3                         EQU 89          ; 0X59
GLOBAL	SYSWAITTEMP10US
 SYSWAITTEMP10US                  EQU 117          ; 0X75
GLOBAL	SYSWAITTEMPMS
 SYSWAITTEMPMS                    EQU 114          ; 0X72
GLOBAL	SYSWAITTEMPMS_H
 SYSWAITTEMPMS_H                  EQU 115          ; 0X73
GLOBAL	SYSWAITTEMPS
 SYSWAITTEMPS                     EQU 116          ; 0X74

;********************************************************************************

;ALIAS VARIABLES
GLOBAL	AFSR0
 AFSR0                            EQU 4
GLOBAL	AFSR0_H
 AFSR0_H                          EQU 5
GLOBAL	SYSREADADBYTE
 SYSREADADBYTE                    EQU 60
GLOBAL	SYSSCALEWORD
 SYSSCALEWORD                     EQU 61
GLOBAL	SYSSCALEWORD_H
 SYSSCALEWORD_H                   EQU 62

;********************************************************************************

 PSECT   PROGMEM0,delta=2, abs
 RESETVEC:
;VECTORS
	ORG	0
	PAGESEL	BASPROGRAMSTART
	GOTO	BASPROGRAMSTART
	ORG	4
	RETFIE

;********************************************************************************

;START OF PROGRAM MEMORY PAGE 0
	ORG	5
GLOBAL	BASPROGRAMSTART
BASPROGRAMSTART:
;CALL INITIALISATION ROUTINES
	CALL	INITSYS
	CALL	INITPPS
	CALL	INITUSART

;START OF THE MAIN PROGRAM
;''
;''  This demonstration produces a variable speed rotating LED display that is proportional to the ADC value.
;''  The ADC value and LED rotate speed are  proportional to each other.
;''
;''  The demonstration also introduces the PERIPHERAL PIN SELECT (PPS) MODULE.  We have created the Serial PPS settings for you on Port C.4.
;''
;''  Rotate the POT to see the LEDs shift faster, and press the switch to reverse the direction of the LEDs.
;''
;''  The Serial port shows the value of the ADC and the direction!
;''
;''************************************************************************
;''@author  EvanV
;''@licence GPL
;''@version 1.02
;''@date    31.10.2022
;----- Configuration
;Chip Settings.
;This Configuration change is needed to enable programming in Low Voltage Programming Mode
;Template comment at the end of the config file
;' -------------------PORTA----------------
;' Bit#:  -7---6---5---4---3---2---1---0---
;' IO:   ---------------------SW------ADC--
;'-----------------------------------------
;'
;' -------------------PORTB----------------
;' Bit#:  -7---6---5---4---3---2---1---0---
;' IO:    ---------------------------------
;'-----------------------------------------
;'
;' ------------------PORTC-----------------
;' Bit#:  -7---6---5---4---3---2---1---0---
;' IO:    ----TX1--------LED--LED-LED LED--
;'-----------------------------------------
;Define constants to make things easier. We can reuse these at any time.
;Dir     RC0         Out
	BCF	TRISC,0
;Dir     RC1         Out
	BCF	TRISC,1
;Dir     RC2         Out
	BCF	TRISC,2
;Dir     RC3         Out
	BCF	TRISC,3
;Dir     POTENTIOMETER In
	BSF	TRISA,0
;Dir     SWITCHIN      In
	BSF	TRISA,2
;USART settings - setup the serial port - connects to PortC.4 via PPS
;*****************************************************************************************************
;Main program commences here.. everything before this is setup for the board.
;Dim direction As Byte
;Dim mydelay, leds  As Byte
;start from the right to left
;direction = LED_RIGHT
	CLRF	DIRECTION
;Set the initial LED states - change to suit your configuration
;leds = 0b10000
	MOVLW	16
	MOVWF	LEDS
;wait 2 s
	MOVLW	2
	MOVWF	SYSWAITTEMPS
	CALL	DELAY_S
;HSerPrintCRLF
	MOVLW	1
	MOVWF	HSERPRINTCRLFCOUNT
	MOVLW	1
	MOVWF	COMPORT
	CALL	HSERPRINTCRLF
;HSerPrint "Great Cow BASIC 2022 "
	MOVLW	LOW STRINGTABLE1
	MOVWF	SYSPRINTDATAHANDLER
	MOVLW	(HIGH STRINGTABLE1) | 128
	MOVWF	SYSPRINTDATAHANDLER_H
	MOVLW	1
	MOVWF	COMPORT
	CALL	HSERPRINT305
;HSerPrint ChipNameStr
	MOVLW	LOW STRINGTABLE83
	MOVWF	SYSPRINTDATAHANDLER
	MOVLW	(HIGH STRINGTABLE83) | 128
	MOVWF	SYSPRINTDATAHANDLER_H
	MOVLW	1
	MOVWF	COMPORT
	CALL	HSERPRINT305
;HSerPrint " at "
	MOVLW	LOW STRINGTABLE2
	MOVWF	SYSPRINTDATAHANDLER
	MOVLW	(HIGH STRINGTABLE2) | 128
	MOVWF	SYSPRINTDATAHANDLER_H
	MOVLW	1
	MOVWF	COMPORT
	CALL	HSERPRINT305
;HSerPrint ChipMHz
	MOVLW	32
	MOVWF	SERPRINTVAL
	MOVLW	1
	MOVWF	COMPORT
	CALL	HSERPRINT307
;HSerPrint "mHz"
	MOVLW	LOW STRINGTABLE3
	MOVWF	SYSPRINTDATAHANDLER
	MOVLW	(HIGH STRINGTABLE3) | 128
	MOVWF	SYSPRINTDATAHANDLER_H
	MOVLW	1
	MOVWF	COMPORT
	CALL	HSERPRINT305
;HSerPrintCRLF
	MOVLW	1
	MOVWF	HSERPRINTCRLFCOUNT
	MOVLW	1
	MOVWF	COMPORT
	CALL	HSERPRINTCRLF
;wait 4 s
	MOVLW	4
	MOVWF	SYSWAITTEMPS
	CALL	DELAY_S
;Do
GLOBAL	SYSDOLOOP_S1
SYSDOLOOP_S1:
;Get a value for the ADC port
;mydelay = ReadAD( ANA0 )
	CLRF	ADREADPORT
	CALL	FN_READAD6
	MOVF	SYSREADADBYTE,W
	MOVWF	MYDELAY
;mydelay = scale( mydelay, 0, 220, 25, 200 )
	MOVWF	L_MAP
	CLRF	L_MAP_H
	CLRF	L_FROMLOW
	CLRF	L_FROMLOW_H
	MOVLW	220
	MOVWF	L_FROMHIGH
	CLRF	L_FROMHIGH_H
	MOVLW	25
	MOVWF	L_TOLOW
	CLRF	L_TOLOW_H
	MOVLW	200
	MOVWF	L_TOHIGH
	CLRF	L_TOHIGH_H
	CLRF	L_CALIBRATE
	CLRF	L_CALIBRATE_H
	CALL	FN_SCALE74
	MOVF	SYSSCALEWORD,W
	MOVWF	MYDELAY
;Show state
;If direction = LED_RIGHT Then
	MOVF	DIRECTION,F
	BTFSS	STATUS,2
	GOTO	ELSE1_1
;HSerPrint ">R"
	MOVLW	LOW STRINGTABLE4
	MOVWF	SYSPRINTDATAHANDLER
	MOVLW	(HIGH STRINGTABLE4) | 128
	MOVWF	SYSPRINTDATAHANDLER_H
	MOVLW	1
	MOVWF	COMPORT
	CALL	HSERPRINT305
;Else
	GOTO	ENDIF1
GLOBAL	ELSE1_1
ELSE1_1:
;HSerPrint "<L "
	MOVLW	LOW STRINGTABLE5
	MOVWF	SYSPRINTDATAHANDLER
	MOVLW	(HIGH STRINGTABLE5) | 128
	MOVWF	SYSPRINTDATAHANDLER_H
	MOVLW	1
	MOVWF	COMPORT
	CALL	HSERPRINT305
;End If
GLOBAL	ENDIF1
ENDIF1:
;HSerSend 9
	MOVLW	9
	MOVWF	SERDATA
	CALL	HSERSEND294
;HSerPrint mydelay
	MOVF	MYDELAY,W
	MOVWF	SERPRINTVAL
	MOVLW	1
	MOVWF	COMPORT
	CALL	HSERPRINT307
;HSerPrintCRLF
	MOVLW	1
	MOVWF	HSERPRINTCRLFCOUNT
	MOVLW	1
	MOVWF	COMPORT
	CALL	HSERPRINTCRLF
;Set the LEDs
;If  direction = LED_RIGHT  Then
	MOVF	DIRECTION,F
	BTFSS	STATUS,2
	GOTO	ELSE2_1
;ROTATE THE LEDS.  WE ARE ONLY INTERESTED IN THE FOUR LEDS SO WE MASK THE OTHER .
;Set C Off
	BCF	STATUS,0
;and shift the contents of LEDState
;Rotate leds Right
	RRF	LEDS,F
;If the LEDState.0is equal to 1 then the sequence has completed, then set the initial state again, the same operation as the starting LED.
;If C = 1 Then
	BTFSS	STATUS,0
	GOTO	ENDIF4
;leds = 16
	MOVLW	16
	MOVWF	LEDS
;End if
GLOBAL	ENDIF4
ENDIF4:
;LEDPORT = ( LEDPORT and LEDMASK ) or leds
	CLRF	SYSTEMP1
	MOVF	SYSTEMP1,W
	IORWF	LEDS,W
	MOVWF	LATC
;Else
	GOTO	ENDIF2
GLOBAL	ELSE2_1
ELSE2_1:
;ROTATE THE LEDS.  WE ARE ONLY INTERESTED IN THE FOUR LEDS SO WE MASK THE OTHER .
;Set C Off
	BCF	STATUS,0
;and shift the contents of LEDState
;Rotate leds Left
	RLF	LEDS,F
;If the LEDState.0is equal to 1 then the sequence has completed, then set the initial state again, the same operation as the starting LED.
;If leds = 32 Then
	MOVLW	32
	SUBWF	LEDS,W
	BTFSS	STATUS,2
	GOTO	ENDIF5
;Mask off the other bits
;leds = 1
	MOVLW	1
	MOVWF	LEDS
;End If
GLOBAL	ENDIF5
ENDIF5:
;LEDPORT = ( LEDPORT and LEDMASK ) or leds
	CLRF	SYSTEMP1
	MOVF	SYSTEMP1,W
	IORWF	LEDS,W
	MOVWF	LATC
;End If
GLOBAL	ENDIF2
ENDIF2:
;wait, and then check the switch is DOWN
;If mydelay > 0 Then
	MOVF	MYDELAY,W
	SUBLW	0
	BTFSC	STATUS,0
	GOTO	ENDIF3
;Wait mydelay ms
	MOVF	MYDELAY,W
	MOVWF	SYSWAITTEMPMS
	CLRF	SYSWAITTEMPMS_H
	CALL	DELAY_MS
;If check_switch = TRUE Then
	CALL	FN_CHECK_SWITCH
	INCF	CHECK_SWITCH,W
	BTFSC	STATUS,2
;toggle the direction
;direction = !direction
	COMF	DIRECTION,F
;End If
;End If
GLOBAL	ENDIF3
ENDIF3:
;Loop
	GOTO	SYSDOLOOP_S1
GLOBAL	SYSDOLOOP_E1
SYSDOLOOP_E1:
;global variable - if button is held down, we don't want to keep on switching directions
;Dim previous_state As BIT
;previous_state = SWITCH_UP
	BSF	SYSBITVAR0,0
GLOBAL	BASPROGRAMEND
BASPROGRAMEND:
	SLEEP
	GOTO	BASPROGRAMEND

;********************************************************************************

;SOURCE: 100_REVERSIBLE_LEDS_WITH_VARIABLE_DELAY_TO_SERIAL_TERMINAL.GCB (168)
GLOBAL	FN_CHECK_SWITCH
FN_CHECK_SWITCH:
;switch is normally open to 5V ...when pressed, RA3 is connected to GND
;If (SwitchIn = SWITCH_DOWN) Then
	BTFSC	PORTA,2
	GOTO	ELSE7_1
;debounce by delaying and checking if switch is still pressed
;Wait 1 ms
	MOVLW	1
	MOVWF	SYSWAITTEMPMS
	CLRF	SYSWAITTEMPMS_H
	CALL	DELAY_MS
;If ( (previous_state =  SWITCH_DOWN) & (SwitchIn = SWITCH_DOWN) ) Then
	CLRF	SYSBYTETEMPX
	BTFSS	SYSBITVAR0,0
	COMF	SYSBYTETEMPX,F
	MOVF	SYSBYTETEMPX,W
	MOVWF	SYSTEMP1
	CLRF	SYSBYTETEMPX
	BTFSS	PORTA,2
	COMF	SYSBYTETEMPX,F
	MOVF	SYSBYTETEMPX,W
	MOVWF	SYSTEMP2
	MOVF	SYSTEMP1,W
	ANDWF	SYSTEMP2,W
	MOVWF	SYSTEMP3
	BTFSS	SYSTEMP3,0
	GOTO	ELSE8_1
;don't toggle
;check_switch = FALSE
	CLRF	CHECK_SWITCH
;Exit Function
	RETURN
;Else
	GOTO	ENDIF8
GLOBAL	ELSE8_1
ELSE8_1:
;check if still down
;If (SwitchIn = SWITCH_DOWN) Then
	BTFSC	PORTA,2
	GOTO	ELSE9_1
;previous_state = SWITCH_DOWN
	BCF	SYSBITVAR0,0
;reverse the LEDs
;check_switch = TRUE
	MOVLW	255
	MOVWF	CHECK_SWITCH
;Exit Function
	RETURN
;Else
	GOTO	ENDIF9
GLOBAL	ELSE9_1
ELSE9_1:
;switch not properly held down
;previous_state = SWITCH_UP
	BSF	SYSBITVAR0,0
;don't reverse
;check_switch = FALSE
	CLRF	CHECK_SWITCH
;Exit Function
	RETURN
;End If
GLOBAL	ENDIF9
ENDIF9:
;End If
GLOBAL	ENDIF8
ENDIF8:
;Else
	GOTO	ENDIF7
GLOBAL	ELSE7_1
ELSE7_1:
;switch not pressed
;previous_state = SWITCH_UP
	BSF	SYSBITVAR0,0
;don't reverse
;check_switch = FALSE
	CLRF	CHECK_SWITCH
;Exit Function
	RETURN
;End If
GLOBAL	ENDIF7
ENDIF7:
	RETURN

;********************************************************************************

GLOBAL	DELAY_10US
DELAY_10US:
GLOBAL	D10US_START
D10US_START:
	MOVLW	25
	MOVWF	DELAYTEMP
GLOBAL	DELAYUS0
DELAYUS0:
	DECFSZ	DELAYTEMP,F
	GOTO	DELAYUS0
	NOP
	DECFSZ	SYSWAITTEMP10US, F
	GOTO	D10US_START
	RETURN

;********************************************************************************

GLOBAL	DELAY_MS
DELAY_MS:
	INCF	SYSWAITTEMPMS_H, F
GLOBAL	DMS_START
DMS_START:
	MOVLW	14
	MOVWF	DELAYTEMP2
GLOBAL	DMS_OUTER
DMS_OUTER:
	MOVLW	189
	MOVWF	DELAYTEMP
GLOBAL	DMS_INNER
DMS_INNER:
	DECFSZ	DELAYTEMP, F
	GOTO	DMS_INNER
	DECFSZ	DELAYTEMP2, F
	GOTO	DMS_OUTER
	DECFSZ	SYSWAITTEMPMS, F
	GOTO	DMS_START
	DECFSZ	SYSWAITTEMPMS_H, F
	GOTO	DMS_START
	RETURN

;********************************************************************************

GLOBAL	DELAY_S
DELAY_S:
GLOBAL	DS_START
DS_START:
	MOVLW	232
	MOVWF	SYSWAITTEMPMS
	MOVLW	3
	MOVWF	SYSWAITTEMPMS_H
	CALL	DELAY_MS
	DECFSZ	SYSWAITTEMPS, F
	GOTO	DS_START
	RETURN

;********************************************************************************

;OVERLOADED SIGNATURE: STRING:BYTE:, SOURCE: USART.H (2317)
GLOBAL	HSERPRINT305
HSERPRINT305:
;PrintLen = PrintData(0)
	MOVF	SYSPRINTDATAHANDLER,W
	MOVWF	FSR0L
	MOVF	SYSPRINTDATAHANDLER_H,W
	MOVWF	FSR0H
	MOVF	INDF0,W
	MOVWF	PRINTLEN
;If PrintLen <> 0 then
	MOVF	PRINTLEN,F
	BTFSC	STATUS,2
	GOTO	ENDIF15
;Write Data
;for SysPrintTemp = 1 to PrintLen
	MOVLW	1
	MOVWF	SYSPRINTTEMP
GLOBAL	SYSFORLOOP1
SYSFORLOOP1:
;HSerSend(PrintData(SysPrintTemp),comport )
	MOVF	SYSPRINTTEMP,W
	ADDWF	SYSPRINTDATAHANDLER,W
	MOVWF	FSR0L
	MOVLW	0
	ADDWFC	SYSPRINTDATAHANDLER_H,W
	MOVWF	FSR0H
	MOVF	INDF0,W
	MOVWF	SERDATA
	CALL	HSERSEND295
;next
;POSITIVE VALUE STEP HANDLER IN FOR-NEXT STATEMENT :#4P 
	MOVF	SYSPRINTTEMP,W
	SUBWF	PRINTLEN,W
	MOVWF	SYSTEMP3
	MOVWF	SYSBYTETEMPA
	CLRF	SYSBYTETEMPB
	CALL	SYSCOMPEQUAL
	COMF	SYSBYTETEMPX,F
	BTFSS	SYSBYTETEMPX,0
	GOTO	ENDIF16
;SET LOOPVAR TO LOOPVAR + STEPVALUE WHERE STEPVALUE IS A POSITIVE VALUE
	INCF	SYSPRINTTEMP,F
	GOTO	SYSFORLOOP1
;END IF
GLOBAL	ENDIF16
ENDIF16:
GLOBAL	SYSFORLOOPEND1
SYSFORLOOPEND1:
;End If
GLOBAL	ENDIF15
ENDIF15:
;CR
;All Usarts
;--------------------------
;Specific USARTs
;------------------
	RETURN

;********************************************************************************

;OVERLOADED SIGNATURE: BYTE:BYTE:, SOURCE: USART.H (2391)
GLOBAL	HSERPRINT307
HSERPRINT307:
;OutValueTemp = 0
	CLRF	OUTVALUETEMP
;IF SerPrintVal >= 100 Then
	MOVLW	100
	SUBWF	SERPRINTVAL,W
	BTFSS	STATUS,0
	GOTO	ENDIF17
;OutValueTemp = SerPrintVal / 100
	MOVF	SERPRINTVAL,W
	MOVWF	SYSBYTETEMPA
	MOVLW	100
	MOVWF	SYSBYTETEMPB
	CALL	SYSDIVSUB
	MOVF	SYSBYTETEMPA,W
	MOVWF	OUTVALUETEMP
;SerPrintVal = SysCalcTempX
	MOVF	SYSCALCTEMPX,W
	MOVWF	SERPRINTVAL
;HSerSend(OutValueTemp + 48 ,comport )
	MOVLW	48
	ADDWF	OUTVALUETEMP,W
	MOVWF	SERDATA
	CALL	HSERSEND295
;End If
GLOBAL	ENDIF17
ENDIF17:
;If OutValueTemp > 0 Or SerPrintVal >= 10 Then
	MOVF	OUTVALUETEMP,W
	MOVWF	SYSBYTETEMPB
	CLRF	SYSBYTETEMPA
	CALL	SYSCOMPLESSTHAN
	MOVF	SYSBYTETEMPX,W
	MOVWF	SYSTEMP3
	MOVF	SERPRINTVAL,W
	MOVWF	SYSBYTETEMPA
	MOVLW	10
	MOVWF	SYSBYTETEMPB
	CALL	SYSCOMPLESSTHAN
	COMF	SYSBYTETEMPX,F
	MOVF	SYSTEMP3,W
	IORWF	SYSBYTETEMPX,W
	MOVWF	SYSTEMP1
	BTFSS	SYSTEMP1,0
	GOTO	ENDIF18
;OutValueTemp = SerPrintVal / 10
	MOVF	SERPRINTVAL,W
	MOVWF	SYSBYTETEMPA
	MOVLW	10
	MOVWF	SYSBYTETEMPB
	CALL	SYSDIVSUB
	MOVF	SYSBYTETEMPA,W
	MOVWF	OUTVALUETEMP
;SerPrintVal = SysCalcTempX
	MOVF	SYSCALCTEMPX,W
	MOVWF	SERPRINTVAL
;HSerSend(OutValueTemp + 48 ,comport )
	MOVLW	48
	ADDWF	OUTVALUETEMP,W
	MOVWF	SERDATA
	CALL	HSERSEND295
;End If
GLOBAL	ENDIF18
ENDIF18:
;HSerSend(SerPrintVal + 48 ,comport)
	MOVLW	48
	ADDWF	SERPRINTVAL,W
	MOVWF	SERDATA
	GOTO	HSERSEND295
;CR

;********************************************************************************

;SOURCE: USART.H (2525)
GLOBAL	HSERPRINTCRLF
HSERPRINTCRLF:
;repeat HSerPrintCRLFCount
	MOVF	HSERPRINTCRLFCOUNT,W
	MOVWF	SYSREPEATTEMP1
	BTFSC	STATUS,2
	GOTO	SYSREPEATLOOPEND1
GLOBAL	SYSREPEATLOOP1
SYSREPEATLOOP1:
;HSerSend(13,comport)
	MOVLW	13
	MOVWF	SERDATA
	CALL	HSERSEND295
;HSerSend(10,comport)
	MOVLW	10
	MOVWF	SERDATA
	CALL	HSERSEND295
;end Repeat
	DECFSZ	SYSREPEATTEMP1,F
	GOTO	SYSREPEATLOOP1
GLOBAL	SYSREPEATLOOPEND1
SYSREPEATLOOPEND1:
	RETURN

;********************************************************************************

;OVERLOADED SIGNATURE: BYTE:, SOURCE: USART.H (1366)
GLOBAL	HSERSEND294
HSERSEND294:
;USART_TX_BLOCKING
;Wait While TXIF = Off
GLOBAL	SYSWAITLOOP2
SYSWAITLOOP2:
	BANKSEL	PIR4
	BTFSS	PIR4,6
	GOTO	SYSWAITLOOP2
;Wait until TRMT = 1
GLOBAL	SYSWAITLOOP3
SYSWAITLOOP3:
	BANKSEL	TX1STA
	BTFSS	TX1STA,1
	GOTO	SYSWAITLOOP3
;TXREG = SerData
	BANKSEL	SERDATA
	MOVF	SERDATA,W
	BANKSEL	TX1REG
	MOVWF	TX1REG
;Wait USART_DELAY
	MOVLW	1
	MOVWF	SYSWAITTEMPMS
	CLRF	SYSWAITTEMPMS_H
	BANKSEL	STATUS
	GOTO	DELAY_MS

;********************************************************************************

;OVERLOADED SIGNATURE: BYTE:BYTE:, SOURCE: USART.H (1468)
GLOBAL	HSERSEND295
HSERSEND295:
GLOBAL	HSERSENDUSART1HANDLER
HSERSENDUSART1HANDLER:
;USART_TX_BLOCKING
;Wait While TXIF = Off
GLOBAL	SYSWAITLOOP4
SYSWAITLOOP4:
	BANKSEL	PIR4
	BTFSS	PIR4,6
	GOTO	SYSWAITLOOP4
;Wait until TRMT = 1
GLOBAL	SYSWAITLOOP5
SYSWAITLOOP5:
	BANKSEL	TX1STA
	BTFSS	TX1STA,1
	GOTO	SYSWAITLOOP5
;TXREG = SerData
	BANKSEL	SERDATA
	MOVF	SERDATA,W
	BANKSEL	TX1REG
	MOVWF	TX1REG
;Wait USART_DELAY
	MOVLW	1
	MOVWF	SYSWAITTEMPMS
	CLRF	SYSWAITTEMPMS_H
	BANKSEL	STATUS
	GOTO	DELAY_MS

;********************************************************************************

;SOURCE: 100_REVERSIBLE_LEDS_WITH_VARIABLE_DELAY_TO_SERIAL_TERMINAL.GCB (27)
GLOBAL	INITPPS
INITPPS:
;Module: UART pin directions
;Dir PORTC.4 Out    ' Make TX1 pin an output
	BCF	TRISC,4
;Module: UART1
;RC4PPS = 0x13       ' RC4->EUSART1:TX1
	MOVLW	19
	BANKSEL	RC4PPS
	MOVWF	RC4PPS
	BANKSEL	STATUS
	RETURN

;********************************************************************************

;SOURCE: SYSTEM.H (159)
GLOBAL	INITSYS
INITSYS:
;asm showdebug This code block sets the internal oscillator to ChipMHz
;asm showdebug Default settings for microcontrollers with _OSCCON1_
;Default OSCCON1 typically, NOSC HFINTOSC; NDIV 1 - Common as this simply sets the HFINTOSC
;OSCCON1 = 0x60
	MOVLW	96
	BANKSEL	OSCCON1
	MOVWF	OSCCON1
;Default value typically, CSWHOLD may proceed; SOSCPWR Low power
;OSCCON3 = 0x00
	CLRF	OSCCON3
;Default value typically, MFOEN disabled; LFOEN disabled; ADOEN disabled; SOSCEN disabled; EXTOEN disabled; HFOEN disabled
;OSCEN = 0x00
	CLRF	OSCEN
;Default value
;OSCTUNE = 0x00
	CLRF	OSCTUNE
;asm showdebug The MCU is a chip family ChipFamily
;asm showdebug OSCCON type is 102
;Set OSCFRQ values for MCUs with OSCSTAT... the 16F171xx MCU family
;OSCFRQ = 0b00000101
	MOVLW	5
	MOVWF	OSCFRQ
;asm showdebug _Complete_the_chip_setup_of_BSR,ADCs,ANSEL_and_other_key_setup_registers_or_register_bits
;Ensure all ports are set for digital I/O and, turn off A/D
;SET ADFM OFF
	BANKSEL	ADCON0
	BCF	ADCON0,2
;Switch off A/D Var(ADCON0)
;SET ADCON0.ADON OFF
	BCF	ADCON0,7
;ANSELA = 0
	BANKSEL	ANSELA
	CLRF	ANSELA
;ANSELC = 0
	CLRF	ANSELC
;Set comparator register bits for many MCUs with register CM2CON0
;C2EN = 0
	BANKSEL	CM2CON0
	BCF	CM2CON0,7
;C1EN = 0
	BCF	CM1CON0,7
;
;'Turn off all ports
;PORTA = 0
	BANKSEL	PORTA
	CLRF	PORTA
;PORTC = 0
	CLRF	PORTC
	RETURN

;********************************************************************************

;SOURCE: USART.H (945)
GLOBAL	INITUSART
INITUSART:
;Set the default value for USART handler - required when more than one USART
;comport = 1
	MOVLW	1
	MOVWF	COMPORT
;PIC USART 1 Init
;Set baud rate for chips with BRG16 bit
;SPBRGH = SPBRGH_TEMP
	MOVLW	3
	BANKSEL	SP1BRGH
	MOVWF	SP1BRGH
;SPBRGL = SPBRGL_TEMP
	MOVLW	64
	MOVWF	SP1BRGL
;BRG16: 16-bit Baud Rate Generator bit
;1 = bsf - 16-bit Baud Rate Generator is used
;0 = bcf - 8-bit Baud Rate Generator is used
;BRG16 = BRG16_TEMP
	BSF	BAUD1CON,3
;Set High Baud Rate Select bit
;BRGH = BRGH_TEMP
	BSF	TX1STA,2
;Enable async and TX mode
;[canskip]SYNC=0
	BCF	TX1STA,4
;[canskip]TXEN=1
	BSF	TX1STA,5
;SPEN=1
	BSF	RC1STA,7
;CREN=1
	BSF	RC1STA,4
	BANKSEL	STATUS
	RETURN

;********************************************************************************

;OVERLOADED SIGNATURE: BYTE:, SOURCE: A-D.H (2008)
GLOBAL	FN_READAD6
FN_READAD6:
;ADFM should configured to ensure LEFT justified
;SET ADFM OFF
	BANKSEL	ADCON0
	BCF	ADCON0,2
;for 16F1885x and possibly future others
;ADPCH = ADReadPort
	BANKSEL	ADREADPORT
	MOVF	ADREADPORT,W
	BANKSEL	ADPCH
	MOVWF	ADPCH
;SetNegativeChannelSelectbits
;Macro Source: a-d.h (2789)
;ADCON0.ADIC = 0
	BCF	ADCON0,1
;ADNCH = 0x3A
	MOVLW	58
	MOVWF	ADNCH
;***************************************
;Perform conversion
;LLReadAD 1
;Macro Source: a-d.h (565)
;Select Case ADReadPort
;Case 0: Set ANSELA.0 On
GLOBAL	SYSSELECT1CASE1
SYSSELECT1CASE1:
	BANKSEL	ADREADPORT
	MOVF	ADREADPORT,F
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE2
;Case 0: Set ANSELA.0 On
	BANKSEL	ANSELA
	BSF	ANSELA,0
;Case 1: Set ANSELA.1 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE2
SYSSELECT1CASE2:
	DECF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE3
;Case 1: Set ANSELA.1 On
	BANKSEL	ANSELA
	BSF	ANSELA,1
;Case 2: Set ANSELA.2 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE3
SYSSELECT1CASE3:
	MOVLW	2
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE4
;Case 2: Set ANSELA.2 On
	BANKSEL	ANSELA
	BSF	ANSELA,2
;Case 3: Set ANSELA.3 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE4
SYSSELECT1CASE4:
	MOVLW	3
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE5
;Case 3: Set ANSELA.3 On
	BANKSEL	ANSELA
	BSF	ANSELA,3
;Case 4: Set ANSELA.4 ON
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE5
SYSSELECT1CASE5:
	MOVLW	4
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE6
;Case 4: Set ANSELA.4 ON
	BANKSEL	ANSELA
	BSF	ANSELA,4
;Case 5: Set ANSELA.5 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE6
SYSSELECT1CASE6:
	MOVLW	5
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE7
;Case 5: Set ANSELA.5 On
	BANKSEL	ANSELA
	BSF	ANSELA,5
;Case 6: Set ANSELA.6 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE7
SYSSELECT1CASE7:
	MOVLW	6
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE8
;Case 6: Set ANSELA.6 On
	BANKSEL	ANSELA
	BSF	ANSELA,6
;Case 7: Set ANSELA.7 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE8
SYSSELECT1CASE8:
	MOVLW	7
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE9
;Case 7: Set ANSELA.7 On
	BANKSEL	ANSELA
	BSF	ANSELA,7
;Case 8: Set ANSELB.0 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE9
SYSSELECT1CASE9:
	MOVLW	8
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE10
;Case 8: Set ANSELB.0 On
	BSF	ANSELB,0
;Case 9: Set ANSELB.1 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE10
SYSSELECT1CASE10:
	MOVLW	9
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE11
;Case 9: Set ANSELB.1 On
	BSF	ANSELB,1
;Case 10: Set ANSELB.2 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE11
SYSSELECT1CASE11:
	MOVLW	10
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE12
;Case 10: Set ANSELB.2 On
	BSF	ANSELB,2
;Case 11: Set ANSELB.3 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE12
SYSSELECT1CASE12:
	MOVLW	11
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE13
;Case 11: Set ANSELB.3 On
	BSF	ANSELB,3
;Case 12: Set ANSELB.4 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE13
SYSSELECT1CASE13:
	MOVLW	12
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE14
;Case 12: Set ANSELB.4 On
	BSF	ANSELB,4
;Case 13: Set ANSELB.5 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE14
SYSSELECT1CASE14:
	MOVLW	13
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE15
;Case 13: Set ANSELB.5 On
	BSF	ANSELB,5
;Case 14: Set ANSELB.6 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE15
SYSSELECT1CASE15:
	MOVLW	14
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE16
;Case 14: Set ANSELB.6 On
	BSF	ANSELB,6
;Case 15: Set ANSELB.7 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE16
SYSSELECT1CASE16:
	MOVLW	15
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE17
;Case 15: Set ANSELB.7 On
	BSF	ANSELB,7
;Case 16: Set ANSELC.0 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE17
SYSSELECT1CASE17:
	MOVLW	16
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE18
;Case 16: Set ANSELC.0 On
	BANKSEL	ANSELC
	BSF	ANSELC,0
;Case 17: Set ANSELC.1 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE18
SYSSELECT1CASE18:
	MOVLW	17
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE19
;Case 17: Set ANSELC.1 On
	BANKSEL	ANSELC
	BSF	ANSELC,1
;Case 18: Set ANSELC.2 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE19
SYSSELECT1CASE19:
	MOVLW	18
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE20
;Case 18: Set ANSELC.2 On
	BANKSEL	ANSELC
	BSF	ANSELC,2
;Case 19: Set ANSELC.3 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE20
SYSSELECT1CASE20:
	MOVLW	19
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE21
;Case 19: Set ANSELC.3 On
	BANKSEL	ANSELC
	BSF	ANSELC,3
;Case 20: Set ANSELC.4 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE21
SYSSELECT1CASE21:
	MOVLW	20
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE22
;Case 20: Set ANSELC.4 On
	BANKSEL	ANSELC
	BSF	ANSELC,4
;Case 21: Set ANSELC.5 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE22
SYSSELECT1CASE22:
	MOVLW	21
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE23
;Case 21: Set ANSELC.5 On
	BANKSEL	ANSELC
	BSF	ANSELC,5
;Case 22: Set ANSELC.6 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE23
SYSSELECT1CASE23:
	MOVLW	22
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECT1CASE24
;Case 22: Set ANSELC.6 On
	BANKSEL	ANSELC
	BSF	ANSELC,6
;Case 23: Set ANSELC.7 On
	GOTO	SYSSELECTEND1
GLOBAL	SYSSELECT1CASE24
SYSSELECT1CASE24:
	MOVLW	23
	SUBWF	ADREADPORT,W
	BTFSS	STATUS,2
	GOTO	SYSSELECTEND1
;Case 23: Set ANSELC.7 On
	BANKSEL	ANSELC
	BSF	ANSELC,7
;End Select
GLOBAL	SYSSELECTEND1
SYSSELECTEND1:
;Configure AD clock defaults
;Set ADCS off 'Clock source = FOSC/ADCLK
	BANKSEL	ADCON0
	BCF	ADCON0,4
;ADCLK = 1 ' default to FOSC/2
	MOVLW	1
	MOVWF	ADCLK
;Conversion Clock Speed
;SET ADCS OFF  'ADCON0.4
	BCF	ADCON0,4
;ADCLK = 15    'FOSC/16
	MOVLW	15
	MOVWF	ADCLK
;Result formatting
;if ADLeftadjust = 0 then
;Set ADCON.2 off     '8-bit
;Set ADFM OFF
	BCF	ADCON0,2
;Set ADFM0 OFF
	BCF	ADCON0,2
;End if
;Configure AD read Channel
;ADPCH = ADReadPort
	BANKSEL	ADREADPORT
	MOVF	ADREADPORT,W
	BANKSEL	ADPCH
	MOVWF	ADPCH
;Enable AD Operations
;SET ADON ON
	BSF	ADCON0,7
;Acquisition Delay
;Wait AD_Delay
	MOVLW	2
	MOVWF	SYSWAITTEMP10US
	BANKSEL	STATUS
	CALL	DELAY_10US
;Read A/D @1
;SET GO_NOT_DONE ON
	BANKSEL	ADCON0
	BSF	ADCON0,0
;nop
	NOP
;Wait While GO_NOT_DONE ON
GLOBAL	SYSWAITLOOP1
SYSWAITLOOP1:
	BTFSC	ADCON0,0
	GOTO	SYSWAITLOOP1
;Switch off A/D
;SET ADCON0.ADON OFF
	BCF	ADCON0,7
;ANSELA = 0
	BANKSEL	ANSELA
	CLRF	ANSELA
;ANSELC = 0
	CLRF	ANSELC
;ReadAD = ADRESH
	BANKSEL	ADRESH
	MOVF	ADRESH,W
	BANKSEL	READAD
	MOVWF	READAD
;SET ADFM OFF
	BANKSEL	ADCON0
	BCF	ADCON0,2
	BANKSEL	STATUS
	RETURN

;********************************************************************************

;OVERLOADED SIGNATURE: WORD:WORD:WORD:WORD:WORD:INTEGER:, SOURCE: STDBASIC.H (264)
GLOBAL	FN_SCALE74
FN_SCALE74:
;dim l_syscalc as word
;dim l_syscalcF as long
;l_syscalcf =  [long]( l_map - l_fromLow ) * [long](l_toHigh   - l_toLow)
	MOVF	L_FROMLOW,W
	SUBWF	L_MAP,W
	MOVWF	SYSTEMP1
	MOVF	L_FROMLOW_H,W
	SUBWFB	L_MAP_H,W
	MOVWF	SYSTEMP1_H
	MOVF	L_TOLOW,W
	SUBWF	L_TOHIGH,W
	MOVWF	SYSTEMP2
	MOVF	L_TOLOW_H,W
	SUBWFB	L_TOHIGH_H,W
	MOVWF	SYSTEMP2_H
	MOVF	SYSTEMP1,W
	MOVWF	SYSLONGTEMPA
	MOVF	SYSTEMP1_H,W
	MOVWF	SYSLONGTEMPA_H
	CLRF	SYSLONGTEMPA_U
	CLRF	SYSLONGTEMPA_E
	MOVF	SYSTEMP2,W
	MOVWF	SYSLONGTEMPB
	MOVF	SYSTEMP2_H,W
	MOVWF	SYSLONGTEMPB_H
	CLRF	SYSLONGTEMPB_U
	CLRF	SYSLONGTEMPB_E
	CALL	SYSMULTSUB32
	MOVF	SYSLONGTEMPX,W
	MOVWF	L_SYSCALCF
	MOVF	SYSLONGTEMPX_H,W
	MOVWF	L_SYSCALCF_H
	MOVF	SYSLONGTEMPX_U,W
	MOVWF	L_SYSCALCF_U
	MOVF	SYSLONGTEMPX_E,W
	MOVWF	L_SYSCALCF_E
;l_syscalc = (  l_fromHigh - l_fromLow )
	MOVF	L_FROMLOW,W
	SUBWF	L_FROMHIGH,W
	MOVWF	L_SYSCALC
	MOVF	L_FROMLOW_H,W
	SUBWFB	L_FROMHIGH_H,W
	MOVWF	L_SYSCALC_H
;scale = (l_syscalcf / l_syscalc) + l_toLow + l_calibrate
	MOVF	L_SYSCALCF,W
	MOVWF	SYSLONGTEMPA
	MOVF	L_SYSCALCF_H,W
	MOVWF	SYSLONGTEMPA_H
	MOVF	L_SYSCALCF_U,W
	MOVWF	SYSLONGTEMPA_U
	MOVF	L_SYSCALCF_E,W
	MOVWF	SYSLONGTEMPA_E
	MOVF	L_SYSCALC,W
	MOVWF	SYSLONGTEMPB
	MOVF	L_SYSCALC_H,W
	MOVWF	SYSLONGTEMPB_H
	CLRF	SYSLONGTEMPB_U
	CLRF	SYSLONGTEMPB_E
	CALL	SYSDIVSUB32
	MOVF	SYSLONGTEMPA,W
	MOVWF	SYSTEMP1
	MOVF	SYSLONGTEMPA_H,W
	MOVWF	SYSTEMP1_H
	MOVF	SYSLONGTEMPA_U,W
	MOVWF	SYSTEMP1_U
	MOVF	SYSLONGTEMPA_E,W
	MOVWF	SYSTEMP1_E
	MOVF	L_TOLOW,W
	ADDWF	SYSTEMP1,W
	MOVWF	SYSTEMP2
	MOVF	L_TOLOW_H,W
	ADDWFC	SYSTEMP1_H,W
	MOVWF	SYSTEMP2_H
	MOVF	L_CALIBRATE,W
	ADDWF	SYSTEMP2,W
	MOVWF	SCALE
	MOVF	L_CALIBRATE_H,W
	ADDWFC	SYSTEMP2_H,W
	MOVWF	SCALE_H
	RETURN

;********************************************************************************

;SOURCE: SYSTEM.H (3078)
GLOBAL	SYSCOMPEQUAL
SYSCOMPEQUAL:
;Dim SysByteTempA, SysByteTempB, SysByteTempX as byte
;clrf SysByteTempX
	CLRF	SYSBYTETEMPX
;movf SysByteTempA, W
	MOVF	SYSBYTETEMPA, W
;subwf SysByteTempB, W
	SUBWF	SYSBYTETEMPB, W
;btfsc STATUS, Z
	BTFSC	STATUS,2
;comf SysByteTempX,F
	COMF	SYSBYTETEMPX,F
	RETURN

;********************************************************************************

;SOURCE: SYSTEM.H (3158)
GLOBAL	SYSCOMPEQUAL32
SYSCOMPEQUAL32:
;dim SysLongTempA as long
;dim SysLongTempB as long
;dim SysByteTempX as byte
;clrf SysByteTempX
	CLRF	SYSBYTETEMPX
;Test low, exit if false
;movf SysLongTempA, W
	MOVF	SYSLONGTEMPA, W
;subwf SysLongTempB, W
	SUBWF	SYSLONGTEMPB, W
;btfss STATUS, Z
	BTFSS	STATUS,2
;return
	RETURN
;Test high, exit if false
;movf SysLongTempA_H, W
	MOVF	SYSLONGTEMPA_H, W
;subwf SysLongTempB_H, W
	SUBWF	SYSLONGTEMPB_H, W
;btfss STATUS, Z
	BTFSS	STATUS,2
;return
	RETURN
;Test upper, exit if false
;movf SysLongTempA_U, W
	MOVF	SYSLONGTEMPA_U, W
;subwf SysLongTempB_U, W
	SUBWF	SYSLONGTEMPB_U, W
;btfss STATUS, Z
	BTFSS	STATUS,2
;return
	RETURN
;Test exp, exit if false
;movf SysLongTempA_E, W
	MOVF	SYSLONGTEMPA_E, W
;subwf SysLongTempB_E, W
	SUBWF	SYSLONGTEMPB_E, W
;btfss STATUS, Z
	BTFSS	STATUS,2
;return
	RETURN
;comf SysByteTempX,F
	COMF	SYSBYTETEMPX,F
	RETURN

;********************************************************************************

;SOURCE: SYSTEM.H (3383)
GLOBAL	SYSCOMPLESSTHAN
SYSCOMPLESSTHAN:
;Dim SysByteTempA, SysByteTempB, SysByteTempX as byte
;clrf SysByteTempX
	CLRF	SYSBYTETEMPX
;bsf STATUS, C
	BSF	STATUS,0
;movf SysByteTempB, W
	MOVF	SYSBYTETEMPB, W
;subwf SysByteTempA, W
	SUBWF	SYSBYTETEMPA, W
;btfss STATUS, C
	BTFSS	STATUS,0
;comf SysByteTempX,F
	COMF	SYSBYTETEMPX,F
	RETURN

;********************************************************************************

;SOURCE: SYSTEM.H (3471)
GLOBAL	SYSCOMPLESSTHAN32
SYSCOMPLESSTHAN32:
;dim SysLongTempA as long
;dim SysLongTempB as long
;dim SysByteTempX as byte
;clrf SysByteTempX
	CLRF	SYSBYTETEMPX
;Test Exp, exit if more
;movf SysLongTempA_E,W
	MOVF	SYSLONGTEMPA_E,W
;subwf SysLongTempB_E,W
	SUBWF	SYSLONGTEMPB_E,W
;btfss STATUS,C
	BTFSS	STATUS,0
;return
	RETURN
;If not more and not zero, is less
;btfss STATUS,Z
	BTFSS	STATUS,2
;goto SCLT32True
	GOTO	SCLT32TRUE
;Test Upper, exit if more
;movf SysLongTempA_U,W
	MOVF	SYSLONGTEMPA_U,W
;subwf SysLongTempB_U,W
	SUBWF	SYSLONGTEMPB_U,W
;btfss STATUS,C
	BTFSS	STATUS,0
;return
	RETURN
;If not more and not zero, is less
;btfss STATUS,Z
	BTFSS	STATUS,2
;goto SCLT32True
	GOTO	SCLT32TRUE
;Test High, exit if more
;movf SysLongTempA_H,W
	MOVF	SYSLONGTEMPA_H,W
;subwf SysLongTempB_H,W
	SUBWF	SYSLONGTEMPB_H,W
;btfss STATUS,C
	BTFSS	STATUS,0
;return
	RETURN
;If not more and not zero, is less
;btfss STATUS,Z
	BTFSS	STATUS,2
;goto SCLT32True
	GOTO	SCLT32TRUE
;Test Low, exit if more or equal
;movf SysLongTempB,W
	MOVF	SYSLONGTEMPB,W
;subwf SysLongTempA,W
	SUBWF	SYSLONGTEMPA,W
;btfsc STATUS,C
	BTFSC	STATUS,0
;return
	RETURN
GLOBAL	SCLT32TRUE
SCLT32TRUE:
;comf SysByteTempX,F
	COMF	SYSBYTETEMPX,F
	RETURN

;********************************************************************************

;SOURCE: SYSTEM.H (2793)
GLOBAL	SYSDIVSUB
SYSDIVSUB:
;dim SysByteTempA as byte
;dim SysByteTempB as byte
;dim SysByteTempX as byte
;Check for div/0
;movf SysByteTempB, F
	MOVF	SYSBYTETEMPB, F
;btfsc STATUS, Z
	BTFSC	STATUS,2
;return
	RETURN
;Main calc routine
;SysByteTempX = 0
	CLRF	SYSBYTETEMPX
;SysDivLoop = 8
	MOVLW	8
	MOVWF	SYSDIVLOOP
GLOBAL	SYSDIV8START
SYSDIV8START:
;bcf STATUS, C
	BCF	STATUS,0
;rlf SysByteTempA, F
	RLF	SYSBYTETEMPA, F
;rlf SysByteTempX, F
	RLF	SYSBYTETEMPX, F
;movf SysByteTempB, W
	MOVF	SYSBYTETEMPB, W
;subwf SysByteTempX, F
	SUBWF	SYSBYTETEMPX, F
;bsf SysByteTempA, 0
	BSF	SYSBYTETEMPA, 0
;btfsc STATUS, C
	BTFSC	STATUS,0
;goto Div8NotNeg
	GOTO	DIV8NOTNEG
;bcf SysByteTempA, 0
	BCF	SYSBYTETEMPA, 0
;movf SysByteTempB, W
	MOVF	SYSBYTETEMPB, W
;addwf SysByteTempX, F
	ADDWF	SYSBYTETEMPX, F
GLOBAL	DIV8NOTNEG
DIV8NOTNEG:
;decfsz SysDivLoop, F
	DECFSZ	SYSDIVLOOP, F
;goto SysDiv8Start
	GOTO	SYSDIV8START
	RETURN

;********************************************************************************

;SOURCE: SYSTEM.H (2937)
GLOBAL	SYSDIVSUB32
SYSDIVSUB32:
;dim SysLongTempA as long
;dim SysLongTempB as long
;dim SysLongTempX as long
;#ifdef PIC
;dim SysLongDivMultA as long
;dim SysLongDivMultB as long
;dim SysLongDivMultX as long
;#endif
;SysLongDivMultA = SysLongTempA
	MOVF	SYSLONGTEMPA,W
	MOVWF	SYSLONGDIVMULTA
	MOVF	SYSLONGTEMPA_H,W
	MOVWF	SYSLONGDIVMULTA_H
	MOVF	SYSLONGTEMPA_U,W
	MOVWF	SYSLONGDIVMULTA_U
	MOVF	SYSLONGTEMPA_E,W
	MOVWF	SYSLONGDIVMULTA_E
;SysLongDivMultB = SysLongTempB
	MOVF	SYSLONGTEMPB,W
	MOVWF	SYSLONGDIVMULTB
	MOVF	SYSLONGTEMPB_H,W
	MOVWF	SYSLONGDIVMULTB_H
	MOVF	SYSLONGTEMPB_U,W
	MOVWF	SYSLONGDIVMULTB_U
	MOVF	SYSLONGTEMPB_E,W
	MOVWF	SYSLONGDIVMULTB_E
;SysLongDivMultX = 0
	CLRF	SYSLONGDIVMULTX
	CLRF	SYSLONGDIVMULTX_H
	CLRF	SYSLONGDIVMULTX_U
	CLRF	SYSLONGDIVMULTX_E
;Avoid division by zero
;if SysLongDivMultB = 0 then
	MOVF	SYSLONGDIVMULTB,W
	MOVWF	SYSLONGTEMPA
	MOVF	SYSLONGDIVMULTB_H,W
	MOVWF	SYSLONGTEMPA_H
	MOVF	SYSLONGDIVMULTB_U,W
	MOVWF	SYSLONGTEMPA_U
	MOVF	SYSLONGDIVMULTB_E,W
	MOVWF	SYSLONGTEMPA_E
	CLRF	SYSLONGTEMPB
	CLRF	SYSLONGTEMPB_H
	CLRF	SYSLONGTEMPB_U
	CLRF	SYSLONGTEMPB_E
	CALL	SYSCOMPEQUAL32
	BTFSS	SYSBYTETEMPX,0
	GOTO	ENDIF13
;SysLongTempA = 0
	CLRF	SYSLONGTEMPA
	CLRF	SYSLONGTEMPA_H
	CLRF	SYSLONGTEMPA_U
	CLRF	SYSLONGTEMPA_E
;exit sub
	RETURN
;end if
GLOBAL	ENDIF13
ENDIF13:
;Main calc routine
;SysDivLoop = 32
	MOVLW	32
	MOVWF	SYSDIVLOOP
GLOBAL	SYSDIV32START
SYSDIV32START:
;set C off
	BCF	STATUS,0
;Rotate SysLongDivMultA Left
	RLF	SYSLONGDIVMULTA,F
	RLF	SYSLONGDIVMULTA_H,F
	RLF	SYSLONGDIVMULTA_U,F
	RLF	SYSLONGDIVMULTA_E,F
;Rotate SysLongDivMultX Left
	RLF	SYSLONGDIVMULTX,F
	RLF	SYSLONGDIVMULTX_H,F
	RLF	SYSLONGDIVMULTX_U,F
	RLF	SYSLONGDIVMULTX_E,F
;SysLongDivMultX = SysLongDivMultX - SysLongDivMultB
	MOVF	SYSLONGDIVMULTB,W
	SUBWF	SYSLONGDIVMULTX,F
	MOVF	SYSLONGDIVMULTB_H,W
	SUBWFB	SYSLONGDIVMULTX_H,F
	MOVF	SYSLONGDIVMULTB_U,W
	SUBWFB	SYSLONGDIVMULTX_U,F
	MOVF	SYSLONGDIVMULTB_E,W
	SUBWFB	SYSLONGDIVMULTX_E,F
;Set SysLongDivMultA.0 On
	BSF	SYSLONGDIVMULTA,0
;If C Off Then
	BTFSC	STATUS,0
	GOTO	ENDIF14
;Set SysLongDivMultA.0 Off
	BCF	SYSLONGDIVMULTA,0
;SysLongDivMultX = SysLongDivMultX + SysLongDivMultB
	MOVF	SYSLONGDIVMULTB,W
	ADDWF	SYSLONGDIVMULTX,F
	MOVF	SYSLONGDIVMULTB_H,W
	ADDWFC	SYSLONGDIVMULTX_H,F
	MOVF	SYSLONGDIVMULTB_U,W
	ADDWFC	SYSLONGDIVMULTX_U,F
	MOVF	SYSLONGDIVMULTB_E,W
	ADDWFC	SYSLONGDIVMULTX_E,F
;End If
GLOBAL	ENDIF14
ENDIF14:
;decfsz SysDivLoop, F
	DECFSZ	SYSDIVLOOP, F
;goto SysDiv32Start
	GOTO	SYSDIV32START
;SysLongTempA = SysLongDivMultA
	MOVF	SYSLONGDIVMULTA,W
	MOVWF	SYSLONGTEMPA
	MOVF	SYSLONGDIVMULTA_H,W
	MOVWF	SYSLONGTEMPA_H
	MOVF	SYSLONGDIVMULTA_U,W
	MOVWF	SYSLONGTEMPA_U
	MOVF	SYSLONGDIVMULTA_E,W
	MOVWF	SYSLONGTEMPA_E
;SysLongTempX = SysLongDivMultX
	MOVF	SYSLONGDIVMULTX,W
	MOVWF	SYSLONGTEMPX
	MOVF	SYSLONGDIVMULTX_H,W
	MOVWF	SYSLONGTEMPX_H
	MOVF	SYSLONGDIVMULTX_U,W
	MOVWF	SYSLONGTEMPX_U
	MOVF	SYSLONGDIVMULTX_E,W
	MOVWF	SYSLONGTEMPX_E
	RETURN

;********************************************************************************

;SOURCE: SYSTEM.H (2682)
GLOBAL	SYSMULTSUB32
SYSMULTSUB32:
;dim SysLongTempA as long
;dim SysLongTempB as long
;dim SysLongTempX as long
;Can't use normal SysDivMult variables for 32 bit, they overlap with
;SysLongTemp variables
;dim SysLongDivMultA as long
;dim SysLongDivMultB as long
;dim SysLongDivMultX as long
;SysLongDivMultA = SysLongTempA
	MOVF	SYSLONGTEMPA,W
	MOVWF	SYSLONGDIVMULTA
	MOVF	SYSLONGTEMPA_H,W
	MOVWF	SYSLONGDIVMULTA_H
	MOVF	SYSLONGTEMPA_U,W
	MOVWF	SYSLONGDIVMULTA_U
	MOVF	SYSLONGTEMPA_E,W
	MOVWF	SYSLONGDIVMULTA_E
;SysLongDivMultB = SysLongTempB
	MOVF	SYSLONGTEMPB,W
	MOVWF	SYSLONGDIVMULTB
	MOVF	SYSLONGTEMPB_H,W
	MOVWF	SYSLONGDIVMULTB_H
	MOVF	SYSLONGTEMPB_U,W
	MOVWF	SYSLONGDIVMULTB_U
	MOVF	SYSLONGTEMPB_E,W
	MOVWF	SYSLONGDIVMULTB_E
;SysLongDivMultX = 0
	CLRF	SYSLONGDIVMULTX
	CLRF	SYSLONGDIVMULTX_H
	CLRF	SYSLONGDIVMULTX_U
	CLRF	SYSLONGDIVMULTX_E
GLOBAL	MUL32LOOP
MUL32LOOP:
;IF SysLongDivMultB.0 ON then SysLongDivMultX += SysLongDivMultA
	BTFSS	SYSLONGDIVMULTB,0
	GOTO	ENDIF11
;IF SysLongDivMultB.0 ON then SysLongDivMultX += SysLongDivMultA
	MOVF	SYSLONGDIVMULTA,W
	ADDWF	SYSLONGDIVMULTX,F
	MOVF	SYSLONGDIVMULTA_H,W
	ADDWFC	SYSLONGDIVMULTX_H,F
	MOVF	SYSLONGDIVMULTA_U,W
	ADDWFC	SYSLONGDIVMULTX_U,F
	MOVF	SYSLONGDIVMULTA_E,W
	ADDWFC	SYSLONGDIVMULTX_E,F
;IF SysLongDivMultB.0 ON then SysLongDivMultX += SysLongDivMultA
GLOBAL	ENDIF11
ENDIF11:
;set STATUS.C OFF
	BCF	STATUS,0
;rotate SysLongDivMultB right
	RRF	SYSLONGDIVMULTB_E,F
	RRF	SYSLONGDIVMULTB_U,F
	RRF	SYSLONGDIVMULTB_H,F
	RRF	SYSLONGDIVMULTB,F
;set STATUS.C off
	BCF	STATUS,0
;rotate SysLongDivMultA left
	RLF	SYSLONGDIVMULTA,F
	RLF	SYSLONGDIVMULTA_H,F
	RLF	SYSLONGDIVMULTA_U,F
	RLF	SYSLONGDIVMULTA_E,F
;if SysLongDivMultB > 0 then goto MUL32LOOP
	MOVF	SYSLONGDIVMULTB,W
	MOVWF	SYSLONGTEMPB
	MOVF	SYSLONGDIVMULTB_H,W
	MOVWF	SYSLONGTEMPB_H
	MOVF	SYSLONGDIVMULTB_U,W
	MOVWF	SYSLONGTEMPB_U
	MOVF	SYSLONGDIVMULTB_E,W
	MOVWF	SYSLONGTEMPB_E
	CLRF	SYSLONGTEMPA
	CLRF	SYSLONGTEMPA_H
	CLRF	SYSLONGTEMPA_U
	CLRF	SYSLONGTEMPA_E
	CALL	SYSCOMPLESSTHAN32
	BTFSC	SYSBYTETEMPX,0
;if SysLongDivMultB > 0 then goto MUL32LOOP
	GOTO	MUL32LOOP
;if SysLongDivMultB > 0 then goto MUL32LOOP
;SysLongTempX = SysLongDivMultX
	MOVF	SYSLONGDIVMULTX,W
	MOVWF	SYSLONGTEMPX
	MOVF	SYSLONGDIVMULTX_H,W
	MOVWF	SYSLONGTEMPX_H
	MOVF	SYSLONGDIVMULTX_U,W
	MOVWF	SYSLONGTEMPX_U
	MOVF	SYSLONGDIVMULTX_E,W
	MOVWF	SYSLONGTEMPX_E
	RETURN

;********************************************************************************

GLOBAL	SYSSTRINGTABLES
SYSSTRINGTABLES:
	MOVF	SYSSTRINGA_H,W
	MOVWF	PCLATH
	MOVF	SYSSTRINGA,W
	INCF	SYSSTRINGA,F
	BTFSC	STATUS,2
	INCF	SYSSTRINGA_H,F
	MOVWF	PCL

GLOBAL	STRINGTABLE1
STRINGTABLE1:
	RETLW	21
	RETLW	71	;G
	RETLW	114	;R
	RETLW	101	;E
	RETLW	97	;A
	RETLW	116	;T
	RETLW	32	; 
	RETLW	67	;C
	RETLW	111	;O
	RETLW	119	;W
	RETLW	32	; 
	RETLW	66	;B
	RETLW	65	;A
	RETLW	83	;S
	RETLW	73	;I
	RETLW	67	;C
	RETLW	32	; 
	RETLW	50	;2
	RETLW	48	;0
	RETLW	50	;2
	RETLW	50	;2
	RETLW	32	; 


GLOBAL	STRINGTABLE2
STRINGTABLE2:
	RETLW	4
	RETLW	32	; 
	RETLW	97	;A
	RETLW	116	;T
	RETLW	32	; 


GLOBAL	STRINGTABLE3
STRINGTABLE3:
	RETLW	3
	RETLW	109	;M
	RETLW	72	;H
	RETLW	122	;Z


GLOBAL	STRINGTABLE4
STRINGTABLE4:
	RETLW	2
	RETLW	62	;>
	RETLW	82	;R


GLOBAL	STRINGTABLE5
STRINGTABLE5:
	RETLW	3
	RETLW	60	;<
	RETLW	76	;L
	RETLW	32	; 


GLOBAL	STRINGTABLE83
STRINGTABLE83:
	RETLW	8
	RETLW	49	;1
	RETLW	54	;6
	RETLW	70	;F
	RETLW	49	;1
	RETLW	55	;7
	RETLW	49	;1
	RETLW	50	;2
	RETLW	54	;6


;********************************************************************************

;START OF PROGRAM MEMORY PAGE 1
	PSECT	PROGMEM1,CLASS=CODE,SPACE=SPACE_CODE,DELTA=2, ABS, OVRLD 
	ORG	2048
;START OF PROGRAM MEMORY PAGE 2
	PSECT	PROGMEM2,CLASS=CODE,SPACE=SPACE_CODE,DELTA=2, ABS, OVRLD 
	ORG	4096
;START OF PROGRAM MEMORY PAGE 3
	PSECT	PROGMEM3,CLASS=CODE,SPACE=SPACE_CODE,DELTA=2, ABS, OVRLD 
	ORG	6144
;START OF PROGRAM MEMORY PAGE 4
	PSECT	PROGMEM4,CLASS=CODE,SPACE=SPACE_CODE,DELTA=2, ABS, OVRLD 
	ORG	8192
;START OF PROGRAM MEMORY PAGE 5
	PSECT	PROGMEM5,CLASS=CODE,SPACE=SPACE_CODE,DELTA=2, ABS, OVRLD 
	ORG	10240
;START OF PROGRAM MEMORY PAGE 6
	PSECT	PROGMEM6,CLASS=CODE,SPACE=SPACE_CODE,DELTA=2, ABS, OVRLD 
	ORG	12288
;START OF PROGRAM MEMORY PAGE 7
	PSECT	PROGMEM7,CLASS=CODE,SPACE=SPACE_CODE,DELTA=2, ABS, OVRLD 
	ORG	14336
;
; Declare Power-On-Reset entry point
;
 END     RESETVEC
