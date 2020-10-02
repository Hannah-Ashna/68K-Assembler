*-------------------------------------------------------------------------------------------------------
* Title      : Basic Calculator Program 
* Written by : Hannah Ashna Jacob - N0865554
* Date       : 21st April 2020
* Description: A program that can carry out addition, subtraction, multiplication and division functions.
*--------------------------------------------------------------------------------------------------------
        ORG    $1000
        
* Main Program        
START:                   
        BRA     Loop     
    
* Loop -- Cycle through the program until the user wants it to end
Loop:
        JSR     GetChar
        BRA     CheckChoice
    
* Function -- Get the user's arithmetic function choice
GetChar:

        * Prompt the user for their choice
        LEA     ChooseFunction,A1
        MOVE.B  #14,D0
        TRAP    #15
        
        * Trap 5 Task - Read the char input from keyboard into D1.B
        MOVE.B  #5,D0
        TRAP    #15
        
        * Move the value from D1 to D4
        MOVE.B  D1,D4
        RTS
        
        
* Function -- Get the two numbers from the user
GetNumbers:
        
        * Prompt the user for their first number
        LEA     NumberPrompt1,A1
        MOVE.B  #14,D0
        TRAP    #15
        
        * Trap 4 Task - Read the first number from keyboard into D1.L
        MOVE.B  #4,D0      
        TRAP    #15
        
        * Move the value from D1 to D2
        MOVE.B  D1,D2      
        
        * Prompt the user for their second number
        LEA     NumberPrompt2,A1
        MOVE.B  #14,D0
        TRAP    #15
        
        * Trap 4 Task - Read the first number from keyboard into D1.L
        MOVE.B  #4,D0      
        TRAP    #15
        
        * Move the value from D1 to D3
        MOVE.B  D1,D3
        RTS    
        
* Function -- Check what arithmetic function the user has chosen and branch to it
CheckChoice:

        * Check if the Char == 'A' for addition
        CMP.B   #$41,D4
        BEQ     AddFunction
        
        * Check if the Char == 'S' for subtraction
        CMP.B   #$53,D4
        BEQ     SubFunction

        * Check if the Char == 'M' for multiplication
        CMP.B   #$4D,D4
        BEQ     MultFunction
        
        * Check if the Char == 'D' for division
        CMP.B   #$44,D4
        BEQ     DivFunction
        
        * If not equal ask user to try to input a value again
        ;LEA     InvalidInput,A1
        ;MOVE.B  #14,D0
        ;TRAP    #15
        ;JSR     GetChar
        
        * Stop the Program
        CMP.B   #$30,D4
        BNE     Loop
        BEQ     FINISH
        
* Function -- Addition of the two numbers
AddFunction:
        
        * Get Values
        JSR     GetNumbers
        
        * D2 = D2 + D3 - Wherein the result is returned to register D2
        ADD.B   D3,D2 

        * Display result in console
        LEA     Result,A1
        MOVE.B  #14,D0
        TRAP    #15  
        MOVEQ   #3,D0
        MOVE.B  D2,D1
        TRAP    #15

        * Branch Back to Loop
        BRA     Loop

        
* Function -- Subtraction of the two numbers
SubFunction:
        
        * Get Values
        JSR     GetNumbers
        
        * D2 = D2 - D3 - Wherein the result is returned to register D2
        SUB.B   D3,D2

        * Display result in console
        LEA     Result,A1
        MOVE.B  #14,D0
        TRAP    #15  
        MOVEQ   #3,D0
        MOVE.B  D2,D1
        TRAP    #15

        * Branch Back to Loop
        BRA     Loop
        
* Function -- Multiplication of the two numbers
MultFunction:
        
        * Get Values
        JSR     GetNumbers
        
        * D2 = D2 * D3 - Wherein the result is returned to register D2
        MULU.W  D3,D2

        * Display result in console
        LEA     Result,A1
        MOVE.B  #14,D0
        TRAP    #15  
        MOVEQ   #3,D0
        MOVE.B  D2,D1
        TRAP    #15

        * Branch Back to Loop
        BRA     Loop
        
* Function -- Division of the two numbers
DivFunction:
        
        * Get Values
        JSR     GetNumbers
        
        * D2 = D2 / D3 - Wherein the result is returned to register D2
        DIVU.W  D3,D2

        * Display result in console
        LEA     Result,A1
        MOVE.B  #14,D0
        TRAP    #15  
        MOVEQ   #3,D0
        MOVE.B  D2,D1
        TRAP    #15

        * Branch Back to Loop
        BRA     Loop
        
        
* Halt Simulator
FINISH:

        * Display a message before halting
        LEA     EndProgram,A1
        MOVE.B  #14,D0
        TRAP    #15 
        SIMHALT             

* ASCII Code for Carriage Return (CR) and Line Feed (LF)
CR      EQU     $0D
LF      EQU     $0A

* Declare the text-prompt variables 
NumberPrompt1:      DC.B    CR,LF,'Enter the first number: ',0
NumberPrompt2:      DC.B    CR,LF,'Enter the second number: ',0
ChooseFunction:     DC.B    CR,LF,'What would you like to do? (A)dd, (S)ubtract, (M)ultiply or (D)ivide? ',0
InvalidInput:       DC.B    CR,LF,'Invalid Choice. Try again ...',0
Result:             DC.B    CR,LF,'Your result: ',0
EndProgram:         DC.B    CR,LF,'Program - Over',0

        END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
