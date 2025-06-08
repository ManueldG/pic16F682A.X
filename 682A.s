PROCESSOR  16F628A
#include <xc.inc>
    
; CONFIG
  CONFIG  FOSC = INTOSCIO       ; Oscillator Selection bits (INTOSC oscillator: CLKOUT function on RA6/OSC2/CLKOUT pin, I/O function on RA7/OSC1/CLKIN)
  CONFIG  WDTE = OFF            ; Watchdog Timer Enable bit (WDT disabled)
  CONFIG  PWRTE = OFF           ; Power-up Timer Enable bit (PWRT disabled)
  CONFIG  MCLRE = OFF           ; RA5/MCLR/VPP Pin Function Select bit (RA5/MCLR/VPP pin function is MCLR)
  CONFIG  BOREN = OFF           ; Brown-out Detect Enable bit (BOD enabled)
  CONFIG  LVP  = OFF            ; Low-Voltage Programming Enable bit (RB4/PGM pin has PGM function, low-voltage programming enabled)
  CONFIG  CPD = OFF             ; Data EE Memory Code Protection bit (Data memory code protection off)
  CONFIG  CP = OFF              ; Flash Program Memory Code Protection bit (Code protection off)
   
PSECT CODE,DELTA=2  
 
delay1 equ 0x24
delay2 equ 0x25 
 
START:

CLRF PORTA ;Initialize PORTA by 
MOVLW 0x07 ;Turn comparators off and
MOVWF CMCON 

BCF STATUS,5
CLRF PORTA
BSF STATUS,5
CLRF TRISA
BCF STATUS,5
    
BSF PORTA,0
BSF PORTA,1
 
LABEL:
    
BSF PORTA,0
BCF PORTA,1   
    
CALL DELAY
CALL DELAY
CALL DELAY    

BCF PORTA,0
BSF PORTA,1 
    
CALL DELAY
CALL DELAY
CALL DELAY
    
GOTO LABEL    
    
DELAY:
MOVLW 0XFF	   
MOVWF delay1    
MOVWF delay2  
LOOP:
DECFSZ delay1, 1
GOTO LOOP
MOVWF delay1  
DECFSZ delay2, 1
GOTO LOOP
NOP
NOP
MOVLW 0XFF	   
MOVWF delay1    
MOVWF delay2  
LOOP2:
DECFSZ delay1, 1
GOTO LOOP2
MOVWF delay1  
DECFSZ delay2, 1
GOTO LOOP2
NOP
NOP
RETURN

END START


