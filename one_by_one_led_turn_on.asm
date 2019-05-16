LIST P=18f8722    ; List directive to define processor
#INCLUDE <p18f8722.inc> ; Processor specific variable definitions

CONFIG OSC = HSPLL, FCMEN = OFF, IESO = OFF, PWRT = OFF, BOREN = OFF, WDT = OFF, MCLRE = ON, LPT1OSC = OFF, LVP = OFF, XINST = OFF, DEBUG = OFF
; Variable and constant definitions
ORG  0x0000 ; Processor reset vector
goto  init    ; Go to beginning of initialization

ORG  0x0008 ; Interrupt Vector
goto  $

init    
CLRF  PORTA
MOVLW 0xFF
MOVWF ADCON1  
MOVLW 0b11110000
    
MOVWF TRISA
CLRF PORTB; Initialization code
CLRF PORTA
CLRF PORTC
CLRF PORTD
CLRF PORTE

L1 EQU 0X80
L2 EQU 0X81
L3 EQU 0X82
L4 EQU 0X83
L5 EQU 0X84
L6 EQU 0X85
M1 EQU 0x86
MOVLW B'11110000'
MOVWF TRISA
MOVWF TRISB
MOVWF TRISC
MOVWF TRISD
bsf TRISA,4
bsf TRISE,3
bsf TRISE,4
clrf LATA
clrf LATB
clrf LATC
clrf LATD
MOVLW B'00000000'
MOVWF L1
MOVWF L2
MOVWF L3
MOVWF L4
MOVWF L5
MOVWF L6

;INITIALIZATION MUST BE DONE
mainline
MOVLW B'00001111'
MOVWF PORTA
MOVWF PORTB
MOVWF PORTC
MOVWF PORTD
;delaying
 MOVLW 0x02
 MOVWF M1
LOOPLAST
 MOVLW 0xFB                 ; 1 cycle
 MOVWF L3                   ; 1 cycle
LOOP3
 MOVLW 0x6F                  ; 1 cycle     Copy 50 to W
 MOVWF L2                    ; 1 cycle       Copy W into L2
 LOOP2
  MOVLW 0x76                 ;1 cycle       Copy 255 into W
  MOVWF L1                    ;1 cycle Copy W into L1
  LOOP1
   decfsz L1,F                    ; 1 cycle but when if works 2 cycles Decrement L1. If 0 Skip next instruction
    GOTO LOOP1                ; 2 cycle          ELSE Keep counting down
   decfsz L2,F                    ; 1 cycle but when if works 2 cycles Decrement L2. If 0 Skip next instruction
    GOTO LOOP2                ; 2 cycles                         ELSE Keep counting down
   decfsz L3,F                ; 1 cycle but when if works 2 cycles
    GOTO LOOP3                ; 2 cycles  
   decfsz M1,F
    GOTO LOOPLAST

   
MOVLW B'00000000'
MOVWF PORTA
MOVWF PORTB
MOVWF PORTC
MOVWF PORTD

;delaying
 MOVLW 0xFB
 MOVWF L6
LOOP6
 MOVLW 0x6F                       ; Copy 50 to W
 MOVWF L5                    ; Copy W into L2
 LOOP5
  MOVLW 0x76                 ; Copy 255 into W
  MOVWF L4                    ; Copy W into L1
  LOOP4
   decfsz L4,F                    ; Decrement L1. If 0 Skip next instruction
    GOTO LOOP4                ; ELSE Keep counting down
   decfsz L5,F                    ; Decrement L2. If 0 Skip next instruction
    GOTO LOOP5                ; ELSE Keep counting down
   decfsz L6,F
    GOTO LOOP6
 
;STATE 0 IS DONE

; ispressed 
    
    
    
    
    
    
    
    
    
    
    
    
    
STATE1
    PORTA0DEVAM
    bsf PORTA,0 ;ILK ISIGI YAK
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTA1DEVAM
    bsf PORTA,1
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTA2DEVAM
    bsf PORTA,2
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTA3DEVAM
    bsf PORTA,3
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTB0DEVAM
    bsf PORTB,0
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTB1DEVAM
    bsf PORTB,1
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTB2DEVAM
    bsf PORTB,2
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTB3DEVAM
    bsf PORTB,3
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTC0DEVAM
    bsf PORTC,0
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTC1DEVAM
    bsf PORTC,1
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTC2DEVAM
    bsf PORTC,2
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTC3DEVAM
    bsf PORTC,3
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTD0DEVAM
    bsf PORTD,0
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTD1DEVAM
    bsf PORTD,1
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTD2DEVAM
    bsf PORTD,2
    CALL IFR4ISPANDR
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    PORTD3DEVAM
    bsf PORTD,3
    INFINITELOOP
    CALL IFR4ISPANDR
    GOTO INFINITELOOP
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    ;IDK WHAT TO DO
    ;             /*TODO*/
    
    IFR4ISPANDR
 MOVLW 0x23
 MOVWF L6
 LOOPA03
  MOVLW 0x6F                        ; Copy 50 to W
  MOVWF L5                          ; Copy W into L2
   LOOPA02
    MOVLW 0x74                      ; Copy 255 into W
    MOVWF L4                        ; Copy W into L1
     LOOPA01
     btfsc PORTA,4
      GOTO PRESSED
      GOTO RELEASED
      PRESSED                       ;PRESSED
  MOVLW 0X01
        MOVLW   0x01
        MOVWF   L1      
        GOTO CONTNE
      RELEASED                      ;RELEASED
        btfsc   L1,0
        GOTO STATE2                 ; AN HASHTAG NEEDED TO GO TO THE RIGHT DIRECTION
  CONTNE                            ;:::::::::::::::::
   decfsz L4,F                      ; Decrement L1. If 0 Skip next instruction
    GOTO LOOPA01                    ; ELSE Keep counting down
   decfsz L5,F                      ; Decrement L2. If 0 Skip next instruction
    GOTO LOOPA02                    ; ELSE Keep counting down
   decfsz L6,F
    GOTO LOOPA03
    return
    GOTO IFR4ISPANDR
    
    STATE2
    pop
    MOVLW 0X00
    MOVWF L1
    MOVWF L3
    MOVWF L4
    STATE2DEVAM
btfsc PORTE,3
 GOTO MAKEL3EQUALTOONE ;RE3 1 ise buraya girer ve oraya 1 geldigini kaydeder-164
 btfsc L3,0
  GOTO state1Continue    ;RE3 0sa ve daha once 1 ise buraya girer-174
  CONTFROML3
  btfsc PORTE,4
   GOTO MAKEL4EQUALTOONE ;RE4 1 ise buraya girer ve L4u 1 yapar-168
   btfsc L4,0
    GOTO State3TurnOffLights ;RE4 0sa ama daha once 1 ise buraya girer
    CONTFROML4
    GOTO STATE2DEVAM

MAKEL3EQUALTOONE
    MOVLW 0x01
    MOVWF L3
    GOTO CONTFROML3
    return
MAKEL4EQUALTOONE
    MOVLW 0x01
    MOVWF L4
    GOTO CONTFROML4
    return
    
    
state1Continue
    MOVLW 0X00
    MOVWF L3
    MOVLW 0X00
    MOVWF L4
    btfss PORTA,0
    GOTO PORTA0DEVAM      ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTA,1
    GOTO PORTA1DEVAM      ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTA,2
    GOTO PORTA2DEVAM      ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTA,3
    GOTO PORTA3DEVAM      ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTB,0
    GOTO PORTB0DEVAM    ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTB,1
    GOTO PORTB1DEVAM      ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTB,2
    GOTO PORTB2DEVAM    ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTB,3
    GOTO PORTB3DEVAM    ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTC,0
    GOTO PORTC0DEVAM    ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTC,1
    GOTO PORTC1DEVAM    ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTC,2
    GOTO PORTC2DEVAM    ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTC,3
    GOTO PORTC3DEVAM    ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTD,0
    GOTO PORTD0DEVAM    ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTD,1
    GOTO PORTD1DEVAM    ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    btfss PORTD,2
    GOTO PORTD2DEVAM     ;urayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
			;portdNIN 3UNCUSU DE YANIYOSA YANI HEPSI YANIYOSA HER TURLU PORTD3 DEVAMA GITMELI
    GOTO PORTD3DEVAM      ;1se burayi atlar ve devam eder, 0sa buraya girip ilk statee gider.
    
    
    
    State3TurnOffLights
    BTFSC PORTD,3
    GOTO SONDURMEYEDEVAMPORTD3 ; 0SA BURAYI ATLAR
    BTFSC PORTD,2
    GOTO SONDURMEYEDEVAMPORTD2
    BTFSC PORTD,1
    GOTO SONDURMEYEDEVAMPORTD1
    BTFSC PORTD,0
    GOTO SONDURMEYEDEVAMPORTD0
    BTFSC PORTC,3
    GOTO SONDURMEYEDEVAMPORTC3
    BTFSC PORTC,2
    GOTO SONDURMEYEDEVAMPORTC2
    BTFSC PORTC,1
    GOTO SONDURMEYEDEVAMPORTC1
    BTFSC PORTC,0
    GOTO SONDURMEYEDEVAMPORTC0
    BTFSC PORTB,3
    GOTO SONDURMEYEDEVAMPORTB3
    BTFSC PORTB,2
    GOTO SONDURMEYEDEVAMPORTB2
    BTFSC PORTB,1
    GOTO SONDURMEYEDEVAMPORTB1
    BTFSC PORTB,0
    GOTO SONDURMEYEDEVAMPORTB0
    BTFSC PORTA,3
    GOTO SONDURMEYEDEVAMPORTA3
    BTFSC PORTA,2
    GOTO SONDURMEYEDEVAMPORTA2
    BTFSC PORTA,1
    GOTO SONDURMEYEDEVAMPORTA1 
			;HEPSI SONUKSE DEVAM ETSIN
    GOTO SONDURMEYEDEVAMPORTA0
    
    
    
        SONDURMEYEDEVAMPORTD3
    bcf PORTD,3 ;ILK ISIGI YAK
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTD2
    bcf PORTD,2
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTD1
    bcf PORTD,1
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTD0
    bcf PORTD,0
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTC3
    bcf PORTC,3
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTC2
    bcf PORTC,2
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTC1
    bcf PORTC,1
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTC0
    bcf PORTC,0
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTB3
    bcf PORTB,3
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTB2
    bcf PORTB,2
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTB1
    bcf PORTB,1
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTB0
    bcf PORTB,0
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTA3
    bcf PORTA,3
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTA2
    bcf PORTA,2
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTA1
    bcf PORTA,1
    CALL IFR4ISPANDRB
    ;wait for 500 ms and look for ra4 is pressed and released, if pressed stop and wait for re3 and re4
    SONDURMEYEDEVAMPORTA0
    bcf PORTA,0
    INFINITELOOPB
    CALL IFR4ISPANDRB
    GOTO INFINITELOOPB
    
    
IFR4ISPANDRB ;CHECK IF R4 IS PRESSED AND RELEASED FOR BACKWARDS
 MOVLW 0x23
 MOVWF L6
 LOOPA03B
  MOVLW 0x6F                        ; Copy 50 to W
  MOVWF L5                          ; Copy W into L2
   LOOPA02B
    MOVLW 0x74                      ; Copy 255 into W
    MOVWF L4                        ; Copy W into L1
     LOOPA01B
     btfsc PORTA,4                  ;a4 0sa atla
      GOTO PRESSEDB
      GOTO RELEASEDB
      PRESSEDB                       ;PRESSED
        MOVLW   0X01
        MOVLW   0x01
        MOVWF   L1      
        GOTO CONTNEB
      RELEASEDB                      ;RELEASED
        btfsc   L1,0                 ;L1 0sa atla
        GOTO STATE2                 ; AN HASHTAG NEEDED TO GO TO THE RIGHT DIRECTION
  CONTNEB                            ;:::::::::::::::::
   decfsz L4,F                      ; Decrement L1. If 0 Skip next instruction
    GOTO LOOPA01B                    ; ELSE Keep counting down
   decfsz L5,F                      ; Decrement L2. If 0 Skip next instruction
    GOTO LOOPA02B                    ; ELSE Keep counting down
   decfsz L6,F
    GOTO LOOPA03B
    return
    GOTO IFR4ISPANDRB
    
    
    
    
    
GOTO mainline
  end






