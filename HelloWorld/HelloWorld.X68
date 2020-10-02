*-----------------------------------------------------------------------
* Title      : Hello World Program 
* Written by : Hannah Ashna
* Date       : 3rd April 2020
* Description: A program that carries out the newbie programer exercise
*-----------------------------------------------------------------------
   
START:  ORG    $1000 ; first instruction of program
        
*----------- Code for Output ------------
        LEA     MESSAGE, A1     ; loads MESSAGE into address register A1
        MOVE.B  #14, D0         ; Moves the number 14 into data register D0
        TRAP    #15             ; Displays Message
        
        SIMHALT                 ; halt simulator

CR      EQU     $0D             ; This is the ASCII code for Carriage Return
LF      EQU     $0A             ; This is the ASCII code for Line Feed


MESSAGE DC.B    'Hello World',CR,LF                                             ; Place ASCII string in memory using MESSAGE variable
        DC.B    'Welcome to my little experiment with Easy68K', 0      ; Outputs this string on a new line because of CR and LF
        END     START                                                           ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
