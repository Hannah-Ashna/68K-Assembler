*-----------------------------------------------------------------------
* Title      : Character Replace
* Written by : Hannah Ashna Jacob (N0865554)
* Date       : 4th April 2020
* Description: Replaces all the blank spaces ' ' with an underscore '_'
*-----------------------------------------------------------------------
    ORG    $1000
    
START:  
        LEA     TestData,A0     ; Loads data from the variable into A0
        
Loop:   TST.B   (A0)            ; TestData[i] = 0;
        BEQ     Finish          ; If true jump to Finish and end the while loop --> while(testdata[i] != 0)
        MOVE.B  (A0),D0         ; Move the contents of A0 to D0
        CMP.B   #$20,D0         ; Compares the value in D0 to ' ' --> if (testdata[i]==' ')
        BNE     Update          ; Branch to Update if not equal
        
        ADD.B   #$3F,D0         ; Replace the blank space with an underscore '_' --> testdata[i]= '_'
        
Update: MOVE.B  D0,(A0)+        ; Move on to the nex character in the string --> Increment the counter by 1 i++
        BRA     Loop            ; Branch back to the while loop
        
Finish: TRAP    #15             ; Halt Simulator

TestData:   DC.B    ' This is a test string',0   ; Declaration of the variable that stores the string --> char testdata[100] = "this is a test string"
     
         END    START           ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
