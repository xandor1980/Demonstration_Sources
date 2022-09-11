;Program compiled by Great Cow BASIC (1.00.00 Release Candidate 2022-09-11 (Windows 64 bit) : Build 1168x) for Microchip PIC-AS
;  See the GCBASIC forums at http://sourceforge.net/projects/gcbasic/forums,
;  Check the documentation and Help at http://gcbasic.sourceforge.net/help/,
;or, email:
;   evanvennn at users dot sourceforge dot net

;********************************************************************************


;Set up the assembler options (Chip type, clock source, other bits and pieces)
;PROCESSOR   16F18075
 PAGEWIDTH   180
 RADIX       DEC
 TITLE       "d:\GreatCowBASICGits\Demonstration_Sources.git\trunk\Vendor_Boards\Great_Cow_Basic_Demo_Board\16f18075_chiprange_demonstrations\050_show_a2d_value_on_leds.s"
 SUBTITLE    "09-11-2022"

; Reverse lookup file(s)
; C:\Program Files\Microchip\xc8\v2.40\pic\include\proc\pic16f18075.inc
; C:\Program Files\Microchip\xc8\v2.40\pic\dat\cfgmap\16f18075.cfgmap
; Alternative CONFIG file is to be found at C:\Program Files\Microchip\xc8\vX.YY\pic\dat\cfgdata as per Microchip support ticket #00730936 

;********************************************************************************

;********************************************************************************
;Explicit CONFIG
 CONFIG CLKOUTEN=OFF                             ;C1 Reverselookup CLKOUTEN = OFF
 CONFIG RSTOSC=HFINTOSC_32MHz                    ;C1 Reverselookup RSTOSC = HFINTOSC_32MHZ
 CONFIG FEXTOSC=OFF                              ;C1 Reverselookup FEXTOSC = OFF
 CONFIG WDTE=OFF                                 ;C1 Reverselookup WDTE = OFF
 CONFIG MCLRE=INTMCLR                            ;C1 Reverselookup MCLRE = INTMCLR
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
 ADCVAL                           EQU 32          ; 0X20
 ADREADPORT                       EQU 33          ; 0X21
 DELAYTEMP                        EQU 112          ; 0X70
 DELAYTEMP2                       EQU 113          ; 0X71
 READAD                           EQU 34          ; 0X22
 SYSWAITTEMP10US                  EQU 117          ; 0X75
 SYSWAITTEMPMS                    EQU 114          ; 0X72
 SYSWAITTEMPMS_H                  EQU 115          ; 0X73

;********************************************************************************

;ALIAS VARIABLES
 SYSREADADBYTE                    EQU 34

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
BASPROGRAMSTART:
;CALL INITIALISATION ROUTINES
	CALL	INITSYS

;START OF THE MAIN PROGRAM
	BCF	TRISB,1
	BCF	TRISB,2
	BCF	TRISB,3
	BCF	TRISB,4
	BSF	TRISA,0
SYSDOLOOP_S1:
	CLRF	ADREADPORT
	CALL	FN_READAD4
	MOVF	SYSREADADBYTE,W
	MOVWF	ADCVAL
SYSSELECT1CASE1:
	MOVLW	0
	SUBWF	ADCVAL,W
	BTFSS	STATUS,0
	GOTO	SYSSELECT1CASE2
	MOVF	ADCVAL,W
	SUBLW	49
	BTFSS	STATUS,0
	GOTO	SYSSELECT1CASE2
	BCF	LATB,1
	BCF	LATB,2
	BCF	LATB,3
	BCF	LATB,4
	GOTO	SYSSELECTEND1
SYSSELECT1CASE2:
	MOVLW	50
	SUBWF	ADCVAL,W
	BTFSS	STATUS,0
	GOTO	SYSSELECT1CASE3
	MOVF	ADCVAL,W
	SUBLW	99
	BTFSS	STATUS,0
	GOTO	SYSSELECT1CASE3
	BSF	LATB,1
	BCF	LATB,2
	BCF	LATB,3
	BCF	LATB,4
	GOTO	SYSSELECTEND1
SYSSELECT1CASE3:
	MOVLW	100
	SUBWF	ADCVAL,W
	BTFSS	STATUS,0
	GOTO	SYSSELECT1CASE4
	MOVF	ADCVAL,W
	SUBLW	149
	BTFSS	STATUS,0
	GOTO	SYSSELECT1CASE4
	BSF	LATB,1
	BSF	LATB,2
	BCF	LATB,3
	BCF	LATB,4
	GOTO	SYSSELECTEND1
SYSSELECT1CASE4:
	MOVLW	150
	SUBWF	ADCVAL,W
	BTFSS	STATUS,0
	GOTO	SYSSELECT1CASE5
	MOVF	ADCVAL,W
	SUBLW	200
	BTFSS	STATUS,0
	GOTO	SYSSELECT1CASE5
	BSF	LATB,1
	BSF	LATB,2
	BSF	LATB,3
	BCF	LATB,4
	GOTO	SYSSELECTEND1
SYSSELECT1CASE5:
	BSF	LATB,1
	BSF	LATB,2
	BSF	LATB,3
	BSF	LATB,4
SYSSELECTEND1:
	MOVLW	100
	MOVWF	SYSWAITTEMPMS
	CLRF	SYSWAITTEMPMS_H
	CALL	DELAY_MS
	GOTO	SYSDOLOOP_S1
SYSDOLOOP_E1:
BASPROGRAMEND:
	SLEEP
	GOTO	BASPROGRAMEND

;********************************************************************************

DELAY_10US:
D10US_START:
	MOVLW	25
	MOVWF	DELAYTEMP
DELAYUS0:
	DECFSZ	DELAYTEMP,F
	GOTO	DELAYUS0
	NOP
	DECFSZ	SYSWAITTEMP10US, F
	GOTO	D10US_START
	RETURN

;********************************************************************************

DELAY_MS:
	INCF	SYSWAITTEMPMS_H, F
DMS_START:
	MOVLW	14
	MOVWF	DELAYTEMP2
DMS_OUTER:
	MOVLW	189
	MOVWF	DELAYTEMP
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

INITSYS:
;asm showdebug This code block sets the internal oscillator to ChipMHz
	BANKSEL	OSCCON2
	CLRF	OSCCON2
	CLRF	OSCCON3
	MOVLW	5
	MOVWF	OSCFRQ
;asm showdebug _Complete_the_chip_setup_of_BSR,ADCs,ANSEL_and_other_key_setup_registers_or_register_bits
	BANKSEL	ADCON0
	BCF	ADCON0,2
	BCF	ADCON0,7
	BANKSEL	ANSELA
	CLRF	ANSELA
	CLRF	ANSELB
	CLRF	ANSELC
	CLRF	ANSELD
	CLRF	ANSELE
	BANKSEL	CM1CON0
	BCF	CM1CON0,7
	BANKSEL	PORTA
	CLRF	PORTA
	CLRF	PORTB
	CLRF	PORTC
	CLRF	PORTD
	CLRF	PORTE
	RETURN

;********************************************************************************

FN_READAD4:
	BANKSEL	ADCON0
	BCF	ADCON0,2
	BANKSEL	ADREADPORT
	MOVF	ADREADPORT,W
	BANKSEL	ADPCH
	MOVWF	ADPCH
SYSSELECT2CASE1:
	BANKSEL	ADREADPORT
	MOVF	ADREADPORT,F
	BTFSS	STATUS,2
	GOTO	SYSSELECTEND2
	BANKSEL	ANSELA
	BSF	ANSELA,0
SYSSELECTEND2:
	BANKSEL	ADCON0
	BCF	ADCON0,4
	MOVLW	1
	MOVWF	ADCLK
	BCF	ADCON0,4
	MOVLW	15
	MOVWF	ADCLK
	BCF	ADCON0,2
	BCF	ADCON0,2
	BANKSEL	ADREADPORT
	MOVF	ADREADPORT,W
	BANKSEL	ADPCH
	MOVWF	ADPCH
	BSF	ADCON0,7
	MOVLW	2
	MOVWF	SYSWAITTEMP10US
	BANKSEL	STATUS
	CALL	DELAY_10US
	BANKSEL	ADCON0
	BSF	ADCON0,0
	NOP
SYSWAITLOOP1:
	BTFSC	ADCON0,0
	GOTO	SYSWAITLOOP1
	BCF	ADCON0,7
	BANKSEL	ANSELA
	CLRF	ANSELA
	CLRF	ANSELB
	CLRF	ANSELC
	CLRF	ANSELD
	CLRF	ANSELE
	BANKSEL	ADRESH
	MOVF	ADRESH,W
	BANKSEL	READAD
	MOVWF	READAD
	BANKSEL	ADCON0
	BCF	ADCON0,2
	BANKSEL	STATUS
	RETURN

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
;
; Declare Power-On-Reset entry point
;
 END     RESETVEC
