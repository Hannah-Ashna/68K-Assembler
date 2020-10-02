*-----------------------------------------------------------
* Title      :  Word Count Program
* Written by :  Hannah Ashna Jacob
* Date       :  6th April 2020
* Description:  Counts the words in the test string
*-----------------------------------------------------------
        ORG    $1000
START:                              ; first instruction of program
        LEA     TestString,A0       ; Load Effective Address -> TestString in A0
        LEA     Words,A1            ; Load Effective Address -> Words in A1
        LEA     LastSpace,A2        ; Load Effective Address -> LastSpace in A2

Loop:   
        TST.B   (A0)                ; Creates the while loop --> while(test_string[i] != 0)
        BEQ     Finish              ; If equal to zero jump to Finish and end the while loop
        MOVE.B  (A0),D0             ; Moves contents stored at the address in A0 into D0
        MOVE.B  (A1),D1             ; Moves contents stored at the address in A1 into D1
        MOVE.B  (A2),D2             ; Moves contents stored at the address in A2 into D2

        ; if(!last_space && test_string[i]==' ')
        TST.B   D2                  ; Checks if value stored in D2 is equal to 0 --> last_space = false
        BNE     CheckSpace          ; Branch to CheckSpace when Not Equal to 0 --> if last_space = true --> This is to ensure that the program can handle multispaces
   
        CMP.B   #$20,D0             ; If last_space = false check whether this char is a space 
        BNE     CheckSpace          ; Branch to CheckSpace when Not Equal --> If char is not a space
        ADD.B   #$01,D1             ; Hence, if LastSpace is false and the char is a space, increment the word counter --> words = words + 1
        
        
CheckSpace:
        CMP.B   #$20,D0             ; Check whether the char is a space -->  if (test_string[i] == ' ')
        BNE     LastSpaceFalse      ; Branch to LastSpaceFalse if char is not a space
        MOVE.B  #$01,D2             ; Otherwise if char is a space, Set LastSpace bool to true --> last_space = true
        BRA     UpdateLoop          ; Branch to UpdateLoop to move onto the next char in the TestString
        
LastSpaceFalse:
        MOVE.B  #$00,D2             ; Set LastSpace bool to false --> last_space = false
        
UpdateLoop:
        MOVE.B  D0,(A0)+            ; Increment by 1 so that it moves onto the next char of the string
        MOVE.B  D1,(A1)             ; Updates Word count
        MOVE.B  D2,(A2)             ; Updates LastSpace bool
        BRA     Loop                ; Branch back to the loop
        
Finish:  
        SIMHALT                     ; halt simulator


TestString:     DC.L    'This is a  test  string longer now ',0     ; The test data --> char *test_string="This is a  test  string longer now "
Words:          DC.B    0                                           ; Variable --> int words = 0
LastSpace:      DC.B    0                                           ; Boolean --> bool last_space = true

        END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
