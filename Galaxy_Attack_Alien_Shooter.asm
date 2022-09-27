
.MODEL SMALL
.STACK 100H
.DATA   

    INPUT_NAME_MESSAGE db "Your Name: ", "$"
    INPUT_LEVEL_MESSAGE db "Level Number: ", "$"
    NAME_OF_PLAYER db 50 DUP(?)

    DRAW_STRING_ROW db ?
    DRAW_STRING_COLUMN db ?
    DRAW_STRING_COLOR db ?

    PRINT_YOUR_NAME db "Name:", "$"                                ;;Enter name Message
    PRINT_YOUR_LIFE db "Life:", "$"                              ;; Number of moves left
    PRINT_YOUR_SCORE db "Score:", "$"                              ;; Score Message

   

;variables for funstion calls

LEVEL_NUMBER db ?
    X       dW      ?
    N2      dW      ? 
    Y       dW      ?
    N4      dW      ?    
    N5      dW      ?   
    N6      dW      ?       
    N7      dW      ? 
    N8      dW      ?
    N9      dW      ? 
    N10     dW      ? 
    N11     dW      ? 
    N12     dW      ?
    N13     dW      ? 
    N14     dW      ? 
    N15     DW      ? 
    N16     DW      ? 
    N17     DW      ? 
    N18     DW      ? 
    N22     DW      ? 
    MOVE_SHIP dw     ? 
    COUNT   dw      ?
    COUNT2  dw      ?
    SCORE   dW      ?
    
    
    
   
    MESSAGE_OF_GAME_OVER    dB      "GAME OVER!$"
   
    FINAL_SCORE   DB      "FINAL SCORE:     pts$"

    Lifes db 3
    PATTERN         DB  1,1,1,1,1,1,1,1,1,1,1 
                    DB  1,1,1,1,1,1,1,1,1,1,1 
                    DB  1,1,1,1,1,1,1,1,1,1,1 
                    DB  1,1,1,1,1,1,1,1,1,1,1 
                    DB  1,1,1,1,1,1,1,1,1,1,1

    PATTERN2        DB  0,0,0,0,1,1,1,0,0,0,0 
                    DB  0,0,1,1,1,1,1,1,1,0,0
                    DB  1,1,1,1,1,1,1,1,1,1,1 
                    DB  0,0,1,1,1,1,1,1,1,0,0
                    DB  0,0,0,0,1,1,1,0,0,0,0 

    PATTERN3                DB  1,1,1,1,1,1,1,1,1,1,1  ;11 X 5
                    DB  1,0,0,0,0,1,0,0,0,0,1
                    DB  1,0,0,0,0,1,0,0,0,0,1
                    DB  1,0,0,0,0,1,0,0,0,0,1
                    DB  1,1,1,1,1,1,1,1,1,1,1

    PATTERN4               DB  1,0,0,0,0,1,0,0,0,0,1  ;11 X 5
                    DB  0,1,0,0,0,1,0,0,0,1,0
                    DB  0,0,1,0,0,1,0,0,1,0,0
                    DB  0,0,0,1,0,1,0,1,0,0,0
                    DB  0,0,0,0,1,1,1,0,0,0,0


    PATTERN5                DB  1,0,0,0,0,1,0,0,0,0,1  ;11 X 5
                    DB  0,1,0,0,0,1,0,0,0,1,0
                    DB  0,0,1,0,0,1,0,0,1,0,0
                    DB  0,0,0,1,0,1,0,1,0,0,0
                    DB  0,0,0,0,1,1,1,0,0,0,0

    PATTERN6        DB  1,0,0,0,0,0,0,0,0,0,0  ;11 X 5
                    DB  0,0,0,0,0,0,0,0,0,0,0
                    DB  0,0,0,0,0,0,0,0,0,0,0
                    DB  0,0,0,0,0,0,0,0,0,0,0
                    DB  0,0,0,0,0,0,0,0,0,0,0
                    
    
        

    ; X x Y
    PRINTSHOT       DB  0,0,0,0,0,1,0,0,0,0,0  ;11 X 5
                    DB  0,0,0,0,0,1,0,0,0,0,0
                    DB  0,0,0,0,0,1,0,0,0,0,0
                    DB  0,0,0,0,0,1,0,0,0,0,0
                    DB  0,0,0,0,0,1,0,0,0,0,0
            
    PRINTSPACESHIP      DB  0,0,0,0,0,1,0,0,0,0,0  ; 11 x 15
                    DB  0,0,0,0,0,1,0,0,0,0,0
                    DB  0,0,0,0,1,1,1,0,0,0,0
                    DB  0,0,0,0,1,2,1,0,0,0,0
                    DB  0,0,0,0,1,2,1,0,0,0,0
                    DB  0,1,0,0,1,2,1,0,0,1,0
                    DB  0,1,0,0,1,2,1,0,0,1,0
                    DB  0,1,0,0,1,1,1,0,0,1,0
                    DB  1,1,1,1,1,1,1,1,1,1,1
                    DB  1,1,1,1,1,1,1,1,1,1,1
                    DB  1,1,1,1,1,1,1,1,1,1,1
                    DB  1,1,1,1,1,1,1,1,1,1,1
                    DB  1,1,0,0,1,1,1,0,0,1,1
                    DB  1,1,0,0,1,1,1,0,0,1,1
                    DB  0,0,0,0,0,1,0,0,0,0,0
                    
    
                    
                    
    PRINTALIEN  DB  0,0,0,1,1,0,0,0,0,0,1,0,0,0   ;14 X 11
                    DB  0,0,0,0,1,1,0,0,0,1,0,0,0,0
                    DB  0,0,0,1,1,1,1,1,1,1,1,0,0,0
                    DB  0,1,1,1,0,0,1,1,0,0,1,1,1,0
                    DB  1,1,1,1,1,1,1,1,1,1,1,1,1,1
                    DB  1,1,0,1,1,1,1,1,1,1,1,0,1,1
                    DB  1,1,0,1,1,1,1,1,1,1,1,0,1,1
                    DB  1,1,0,1,1,0,0,0,0,1,1,0,1,1
                    DB  1,1,0,1,1,0,0,0,0,1,1,0,1,1
                    DB  0,0,0,0,1,1,0,0,1,1,0,0,0,0
                    DB  0,0,0,0,1,1,0,0,1,1,0,0,0,0

    PRINTALIEN1	    DB	0,0,0,1,1,0,0,0,1,1,0,0,0	;13 X 09
					DB	0,1,1,1,1,1,0,1,1,1,1,1,0
					DB	0,1,1,0,0,1,1,1,0,0,1,1,0
					DB	0,1,1,1,1,1,1,1,1,1,1,1,0
					DB	0,1,1,1,1,1,1,1,1,1,1,1,0
					DB	0,1,1,0,1,0,0,0,1,0,1,1,0
					DB	0,1,1,0,0,1,0,1,0,0,1,1,0
					DB	0,1,1,0,0,0,0,0,0,0,1,1,0
					DB	0,1,1,1,1,0,0,0,1,1,1,1,0
    
    PRINTALIEN2	    DB	0,0,0,0,0,1,1,1,0,0,0,0	;12 X 08
					DB	0,0,0,1,1,1,1,1,1,1,0,0
					DB	0,0,1,1,1,1,1,1,1,1,1,0
					DB	0,1,1,0,1,1,1,1,1,0,1,1
					DB	0,1,1,1,1,1,1,1,1,1,1,1
					DB	0,0,1,1,0,0,1,0,0,1,1,0
					DB	0,1,1,0,0,0,0,0,0,0,1,1
					DB	0,0,1,1,0,0,0,0,0,1,1,0

        

    MONSTER   DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  0
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,00h,00h,00h,00h,00h,08h,08h,00h,00h,00h,00h,00h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  1
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,08h,00h,00h,00h,00h,08h,08h,00h,00h,00h,00h,08h,06h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  2
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,08h,08h,00h,00h,00h,03h,08h,08h,03h,00h,00h,00h,08h,08h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  3
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,04h,00h,00h,00h,03h,08h,03h,03h,00h,00h,00h,00h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  4
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,00h,00h,00h,03h,03h,03h,03h,03h,03h,00h,00h,00h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  5
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,00h,00h,00h,03h,03h,03h,03h,03h,03h,00h,00h,00h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  6
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,00h,00h,06h,03h,03h,03h,03h,03h,03h,06h,00h,00h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  7
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,08h,08h,08h,06h,04h,08h,03h,0Bh,03h,03h,03h,02h,06h,08h,08h,08h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  8
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,08h,08h,08h,08h,08h,08h,06h,08h,08h,03h,03h,03h,03h,06h,08h,08h,08h,08h,08h,08h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  9
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,08h,08h,07h,07h,08h,08h,06h,08h,03h,08h,03h,03h,08h,06h,08h,08h,08h,07h,07h,08h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 10
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,07h,07h,07h,07h,07h,06h,06h,08h,03h,08h,08h,03h,08h,06h,06h,07h,07h,07h,07h,07h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 11
        DB 00h,00h,00h,00h,00h,00h,00h,00h,04h,06h,06h,06h,06h,06h,06h,06h,06h,08h,08h,08h,08h,08h,08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h     ; 12
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,07h,08h,06h,06h,06h,06h,08h,06h,06h,08h,08h,06h,06h,06h,08h,08h,08h,06h,06h,04h,00h,00h,00h,00h,00h,00h,00h,00h     ; 13
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,08h,07h,06h,00h,06h,00h,04h,06h,06h,06h,06h,04h,00h,06h,00h,04h,07h,07h,06h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 14
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,08h,07h,06h,00h,00h,06h,07h,07h,07h,07h,07h,07h,06h,04h,00h,00h,08h,07h,06h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 15
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,08h,07h,07h,06h,04h,08h,07h,07h,07h,08h,08h,07h,07h,07h,08h,06h,04h,08h,07h,07h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 16
        DB 00h,00h,08h,00h,00h,00h,00h,00h,00h,04h,08h,08h,07h,06h,06h,07h,07h,08h,04h,00h,00h,04h,08h,07h,07h,06h,04h,08h,07h,08h,06h,00h,00h,00h,00h,00h,00h,08h,00h,00h     ; 17
        DB 00h,00h,07h,00h,00h,00h,00h,00h,00h,00h,06h,08h,07h,06h,06h,07h,08h,04h,04h,08h,08h,00h,00h,08h,07h,06h,06h,07h,07h,06h,04h,00h,00h,00h,00h,00h,00h,07h,00h,00h     ; 18
        DB 00h,08h,07h,06h,00h,00h,00h,00h,00h,00h,06h,06h,08h,08h,06h,08h,06h,00h,04h,08h,08h,00h,00h,06h,08h,06h,08h,08h,08h,06h,00h,00h,00h,00h,00h,00h,06h,07h,08h,00h     ; 19
        DB 00h,08h,07h,08h,00h,00h,00h,00h,00h,06h,08h,08h,08h,08h,08h,06h,00h,05h,08h,08h,08h,08h,06h,00h,06h,08h,08h,08h,08h,07h,08h,00h,00h,00h,00h,00h,08h,07h,08h,00h     ; 20
        DB 00h,07h,07h,07h,06h,00h,00h,00h,00h,06h,08h,07h,07h,07h,08h,08h,00h,04h,08h,08h,08h,08h,06h,00h,08h,08h,07h,07h,08h,08h,08h,06h,00h,00h,00h,06h,07h,07h,07h,00h     ; 21
        DB 00h,07h,07h,08h,08h,03h,00h,00h,00h,06h,07h,07h,07h,07h,08h,08h,06h,00h,04h,08h,08h,00h,00h,06h,08h,08h,07h,07h,07h,08h,08h,00h,00h,00h,03h,08h,08h,07h,07h,00h     ; 22
        DB 06h,07h,07h,08h,07h,07h,08h,03h,02h,06h,04h,04h,02h,06h,06h,07h,08h,00h,04h,08h,08h,04h,00h,08h,08h,06h,06h,02h,00h,06h,06h,06h,03h,08h,07h,07h,08h,07h,07h,04h     ; 23
        DB 06h,07h,07h,08h,07h,0Bh,07h,07h,08h,06h,06h,06h,06h,08h,08h,08h,07h,08h,06h,04h,04h,06h,08h,07h,08h,06h,08h,06h,06h,06h,06h,07h,07h,07h,07h,07h,08h,07h,07h,06h     ; 24
        DB 08h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,08h,07h,07h,08h,07h,07h,08h,08h,08h,08h,07h,07h,08h,08h,08h,08h,07h,07h,07h,08h,07h,07h,07h,07h,07h,07h,07h,08h     ; 25
        DB 04h,07h,07h,07h,08h,07h,07h,08h,08h,07h,08h,08h,06h,06h,07h,06h,08h,07h,07h,08h,08h,07h,07h,08h,06h,07h,06h,08h,08h,08h,07h,08h,08h,07h,07h,08h,07h,07h,07h,00h     ; 26
        DB 00h,06h,07h,07h,07h,07h,08h,07h,07h,07h,06h,06h,08h,07h,07h,08h,06h,08h,07h,07h,07h,07h,08h,06h,08h,08h,07h,08h,04h,06h,07h,07h,08h,07h,07h,07h,07h,07h,06h,00h     ; 27
        DB 00h,00h,08h,07h,07h,07h,07h,07h,07h,08h,06h,04h,08h,08h,08h,08h,06h,06h,08h,07h,07h,08h,06h,06h,08h,08h,08h,08h,04h,06h,08h,07h,07h,07h,07h,07h,07h,08h,00h,00h     ; 28
        DB 00h,00h,00h,07h,07h,07h,07h,07h,07h,07h,06h,08h,08h,08h,08h,08h,06h,06h,08h,08h,08h,08h,06h,06h,08h,08h,08h,07h,08h,08h,07h,07h,07h,07h,07h,07h,07h,00h,00h,00h     ; 29
        DB 00h,00h,00h,04h,07h,07h,07h,07h,07h,07h,08h,06h,08h,08h,06h,08h,04h,06h,08h,07h,07h,07h,06h,04h,08h,06h,08h,08h,06h,06h,07h,07h,07h,07h,07h,07h,04h,00h,00h,00h     ; 30
        DB 00h,00h,00h,00h,06h,07h,07h,07h,07h,07h,04h,04h,08h,08h,08h,08h,06h,06h,08h,07h,07h,08h,06h,06h,08h,08h,08h,08h,00h,06h,07h,07h,07h,07h,07h,06h,00h,00h,00h,00h     ; 31
        DB 00h,00h,00h,00h,00h,08h,07h,07h,07h,07h,06h,06h,07h,07h,08h,07h,06h,06h,08h,08h,08h,08h,06h,06h,07h,07h,07h,08h,06h,06h,07h,07h,07h,07h,08h,00h,00h,00h,00h,00h     ; 32
        DB 00h,00h,00h,00h,00h,00h,08h,07h,07h,07h,07h,08h,08h,06h,07h,07h,08h,06h,08h,07h,07h,07h,06h,08h,07h,08h,06h,08h,08h,07h,07h,07h,07h,08h,00h,00h,00h,00h,00h,00h     ; 33
        DB 00h,00h,00h,00h,00h,00h,00h,06h,08h,07h,07h,07h,08h,08h,07h,08h,08h,06h,08h,07h,07h,07h,06h,08h,08h,07h,08h,08h,07h,07h,08h,08h,06h,00h,00h,00h,00h,00h,00h,00h     ; 34
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,06h,08h,07h,07h,07h,07h,00h,08h,07h,07h,08h,04h,07h,07h,07h,07h,06h,06h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 35
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,08h,00h,06h,07h,07h,06h,00h,08h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 36
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 37
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 38
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 39
    
    
.CODE
MAIN    PROC
MAIN1:  
    MOV     AX,@DATA        ;
    MOV     DS,AX          
    XOR     CX,CX
    MOV     CX,55
    XOR     SI,SI
    LEA     SI,PATTERN
    RESET:              
    MOV     AL,1
    MOV     [SI],AL
    INC     SI
    LOOP    RESET
    
                    
    MOV     SCORE,0
    MOV     N12,0
    MOV     N14, 1
    
    MOV     AH,0H           ;Mode video 13H 320 x 200
    MOV     AL,13H
    INT     10H

    MOV     AH,0FH
    INT     10H
    
    CALL MENU

    
    
CONTVI: ; resets the game to the pre-death state
    MOV     N7,150
    MOV     N8,160
    MOV     N9,0
    MOV     N10,50
    MOV     N11,20
    MOV     N15,0
    MOV     N16,0
    MOV     N17,0
    MOV     N18,0
    MOV     N22,2
    MOV     MOVE_SHIP,150
    XOR     AX,AX

LOP:
    MOV     AX,N11
    ADD     AX,72      
    CMP     AX,155            
    JL      CONTG
    JMP     GAME_OVER

CONTG:
    MOV     AX,N12
    CMP     AX,55   
    JL      GER
    JMP     VITORIA
GER:
    CMP LEVEL_NUMBER, 1              ;; checks if LEVEL_NUMBER is 1
    JE BEGIN_LEVEL_1              ;; if level number 1 then jump to level number one drawing

    cmp LEVEL_NUMBER, 2              ;; checks if LEVEL_NUMBER is 2
    je BEGIN_LEVEL_2             ;; jump to level number two drawing

    cmp LEVEL_NUMBER, 3              ;; if level number 3 then jump to its working
    je BEGIN_LEVEL_3             ;; jump to level number three drawing

    BEGIN_LEVEL_1:    
        CALL LEVEL_1              ;; initilaize level one is called for drawing its components
        LOOP  BEGIN_LEVEL_1
    

    BEGIN_LEVEL_2:
        CALL Level_2            ;; initilaize level one is called for drawing its components
    LOOP  BEGIN_LEVEL_2

    BEGIN_LEVEL_3:
        CALL Level_3
    LOOP  BEGIN_LEVEL_3

    ret
    JMP     LOP     
    
GAME_OVER:  
    
    CMP     N14,1      
    JE      MORREU     
        

    

MORREU: 
    CALL   CLEAR
    MOV     AH,2H              
    MOV     DH,10
    MOV     DL,14
    INT     10H

    MOV     AH,9H   
    LEA     DX, MESSAGE_OF_GAME_OVER 
    INT     21H
    
    MOV     AH,2H              
    MOV     DH,12
    MOV     DL,10
    INT     10H
    
    
    MOV     AH,2H               
    MOV     DH,12
    MOV     DL,19
    INT     10H
    
    MOV     BX,SCORE
    CALL    SCORES
    
    MOV     AH,2H               
    MOV     DH,14
    MOV     DL,10
    INT     10H
    
   
    
HH: 
    MOV     AH,1H
    INT     21H 
    
    CMP     AL,65
    JE      P_MAIN

    CMP     AL,97
    JE      P_MAIN
    
    CMP     AL,66
    JE      FIMMAIN

    CMP     AL,98
    JE      FIMMAIN
    
    JMP     HH

VITORIA:
    CALL   CLEAR

    MOV     AH,2H              
    MOV     DH,10
    MOV     DL,14
    INT     10H

    MOV     AH,9H   
    LEA     DX, MESSAGE_OF_GAME_OVER 
    INT     21H
   
    
    MOV     AH,2H               
    MOV     DH,12
    MOV     DL,10
    INT     10H
    
    MOV     AH,9H   
    LEA     DX, FINAL_SCORE
    INT     21H
    
    MOV     AH,2H               
    MOV     DH,12
    MOV     DL,25
    INT     10H
    
    MOV     BX,SCORE
    CALL    SCORES
   
    
H1: MOV     AH,1H
    INT     21H 
    
    CMP     AL,65
    JE      P_MAIN

    CMP     AL,97
    JE      P_MAIN
    
    CMP     AL,66
    JE      FIMMAIN

    CMP     AL,98
    JE      FIMMAIN
    
    JMP     H1
FIMMAIN:    
    MOV     AH,4CH
    INT     21H
P_MAIN:JMP MAIN1
MAIN    ENDP

MENU PROC

    PUSH AX
   
                         
   
    CALL BORDER
    CALL DISPLAY_INPUT_ENTER_NAME
    CALL INPUT_NAME_PLAYER
    CALL DISPLAY_INPUT_ENTER_LEVEL
    CALL INPUT_NAME_LEVEL
   
    POP AX
    RET

MENU ENDP

BORDER PROC

    PUSH BX
    PUSH DX
    PUSH CX
   
    MOV BX, 0
    MOV CX, 50
    MOV DX, 60

   
   
TOP_LINE:

    MOV AH, 0Ch              
    MOV AL, 0BH

    PUSH BX
    MOV BH, 0
    INT 10H

    POP BX
       
    INC CX
    INC BX
    CMP BX, 250

    JB TOP_LINE

    MOV BX, 0
    MOV CX, 50
    MOV DX, 170

BOTTOM__LINE:
   
    MOV AH, 0Ch              
    MOV AL, 0BH

    PUSH BX
    MOV BH, 0
    INT 10H

    POP BX
       
    INC CX
    INC BX
    CMP BX, 250

    JB BOTTOM__LINE

    MOV BX, 0
    MOV CX, 300
    MOV DX, 60
   
RIGHT_LINE:
   
    MOV AH, 0Ch              
    MOV AL, 0BH

    PUSH BX
    MOV BH, 0
    INT 10H

    POP BX

    INC DX
    INC BX
    CMP BX, 110

    JB RIGHT_LINE
           
    MOV BX, 0
    MOV CX, 50
    MOV DX, 60
   
LEFT_LINE:

    MOV AH, 0Ch              
    MOV AL, 0BH

    PUSH BX
    MOV BH, 0
    INT 10H

    POP BX

    INC DX
    INC BX
    CMP BX, 110

    JB LEFT_LINE    
       
    POP CX
    POP DX
    POP BX

    RET

BORDER endp

DISPLAY_INPUT_ENTER_NAME PROC

    PUSH DX
    PUSH AX
    PUSH SI
    PUSH CX
    PUSH BX
   
    MOV DH, 10
    MOV DL, 10
    MOV SI, 0
   
PRINTING_INPUT_ENTER_NAME:

    MOV AH, 02H
    INT 10H

    MOV AH, 09H
    MOV AL, INPUT_NAME_MESSAGE[SI]
    MOV BL, 0AH
    MOV CX, 1
    MOV BH, 0
    INT 10H
       
    ADD DL, 1
    ADD SI, 1

    CMP INPUT_NAME_MESSAGE[si], "$"
    JNE PRINTING_INPUT_ENTER_NAME  
   
    POP BX
    POP CX
    POP SI
    POP AX
    POP DX
   
    RET

DISPLAY_INPUT_ENTER_NAME ENDP

INPUT_NAME_PLAYER PROC

    PUSH AX
    PUSH DX
   
    MOV DL, 25
    MOV DH, 10
   
    MOV AH, 02H
    INT 10H
       
    LEA SI, NAME_OF_PLAYER
    MOV AH, 01H

    INPUT:

        INT 21H
        MOV [SI], AL

        INC SI

        CMP AL, 13
        JNE  INPUT
           
    POP DX
    POP AX

    RET

INPUT_NAME_PLAYER ENDP

DISPLAY_INPUT_ENTER_LEVEL PROC
   
    PUSH DX
    PUSH AX
    PUSH SI
    PUSH CX
    PUSH BX
   
    MOV DH, 16
    MOV DL, 10
    MOV SI, 0

   

    PRINTING_INPUT_ENTER_LEVEL:

        MOV AH, 02H
        INT 10H

        MOV AH, 09H
        MOV AL, INPUT_LEVEL_MESSAGE[SI]
        MOV BL, 0AH
        MOV CX, 1
        MOV BH, 0
        INT 10H
           
        ADD DL, 1
        ADD SI, 1

        CMP INPUT_LEVEL_MESSAGE[si], "$"
        JNE PRINTING_INPUT_ENTER_LEVEL  
   
    POP BX
    POP CX
    POP SI
    POP AX
    POP DX

    RET

DISPLAY_INPUT_ENTER_LEVEL ENDP

INPUT_NAME_LEVEL PROC

    PUSH AX
    PUSH DX
   
    MOV DL, 33
    MOV DH, 14
   
    MOV AH, 02H
    INT 10H

    MOV AH, 01H
    INT 21H
    SUB AL, 48

    MOV LEVEL_NUMBER, AL
   
    POP DX
    POP AX

    RET

INPUT_NAME_LEVEL ENDP



CLEAR   PROC    
    MOV     AX,0A000H 
    MOV     ES, AX;     
    XOR     AX, AX     
    XOR     DI, DI      
    MOV     CX, 32000   ;initialize cx with 32000 corresponding to the number of times it will repeat the process 
    cld                 ; clears the directional flag, increasing the pointer   
    rep stosw           ; repeat the process of clear flag until cx be zero. Cx and treated as word logo and diminished 2 dele achieves repeat it; stosw allocates the value of cx to ax; repeat last operation in case cld (clear flag)
    XOR CX,CX
    RET
CLEAR   ENDP

WAITT   PROC   

    MOV     CX,0
    MOV     DX,256
    MOV     AH,86H
    INT     15H    ;; it works 15h together with 86h makes the program delay (the time is delayed and indicated by cx and dx)
    RET
WAITT   ENDP

;------------------------------------------------ Level 1 ----------------------------------------------------


LEVEL_1 PROC

    PUSH    DI
    CALL    CLEAR           
    POP     DI
    PUSH    X
    PUSH    Y
    CALL    DISPLAY_INFORMATION_1         
    
    POP     X
    POP     Y
    
    XOR     SI,SI
    LEA     SI,PATTERN
    
    MOV     AX,N10          
    MOV     X,AX        
    MOV     AX,N11
    MOV     Y,AX       
    MOV     N5,0
    MOV     N6,0
    MOV     COUNT2,0 
    
    INICIOGPN:
                                                                            
    
    MOV     N15, 1         
    CALL    KILL_ALIEN      
    MOV     Bl,[SI]
    CMP     BL,0            
    JE      CONTI
    
    PUSH    SI
    CALL    PRINT_ALIEN
    POP     SI
    JMP     CONTI
    

CONTI:
    INC     SI              
    ADD     X,20            
    INC     N5              
    INC     COUNT2          
    CMP     N5,11           
    JL      OGPN
    
    MOV     N5,0            
    MOV     AX,N10
    MOV     X,AX            
    ADD     Y,15            
    INC     N6              

OGPN:
    CMP    COUNT2,55       
    JL      P_INICIOGPN     
    JMP     CCC
P_INICIOGPN: 
    JMP INICIOGPN

CCC:
    PUSH    SI
    CALL    SPACESHIP_1   
    POP     SI
    MOV     AX,N9           ; compare n9 (indicates whether the shot is moving or not)
    CMP     AX,0
    JE      FIMGER   ; in which case he continues the movement of the aliens
    
    SUB     N8,10           
    MOV     AX,N8           
    CMP     AX,0            ; compare whether the shot reached the limit of the canvas
    JE      RESTIRO         ; if he has, he will be subtracted
    JMP     FIMGER    ;case do not jump to continue the program
    
RESTIRO:
    MOV N8,160          
    MOV     N9,0
    


FIMGER:;CALL WAITT
    MOV     COUNT,0
    PUSH    SI
wat:
    inc COUNT
    CALL    WAITT   
    CMP     COUNT,90    
    JL      wat
    POP     SI
    
    RET

LEVEL_1 ENDP

;------------------------------------------------ Level 2 ----------------------------------------------------


LEVEL_2 PROC

    PUSH    DI
    CALL    CLEAR           
    POP     DI
    PUSH    X
    PUSH    Y

    CALL    DISPLAY_INFORMATION_2         
    
    POP     X
    POP     Y

    mov  ax, dx
     xor  dx, dx
    mov  cx, 5    
    div  cx       ; here dx contains the remainder of the division - from 0 to 5

    .IF dx == 1
        XOR     SI,SI
        LEA SI, PATTERN
    .ENDIF

    .IF dx == 2
        XOR     SI,SI
        LEA SI, PATTERN2
    .ENDIF

    .IF dx == 3
        XOR     SI,SI
        LEA SI, PATTERN3
    .ENDIF

    .IF dx == 4
        XOR     SI,SI
        LEA SI, PATTERN4
    .ENDIF

    .IF dx == 5
        XOR     SI,SI
        LEA SI, PATTERN5
    .ENDIF 

   

    
    MOV     AX,N10          
    MOV     X,AX      
    MOV     AX,N11
    MOV     Y,AX        
    MOV     N5,0
    MOV     N6,0
    MOV     COUNT2,0 
    
                                                                            
    
    INICIOGPN:

	MOV     N15, 2          
    CALL    KILL_ALIEN      
    MOV     Bl,[SI]
    CMP     BL,0           
    JE      CONTI
    
    PUSH    SI
    CALL    PRINT_ALIEN_1
    POP     SI
    JMP     CONTI
    

CONTI:
    INC     SI              
    ADD     X,20           
    INC     N5              
    INC     COUNT2          
    CMP     N5,11          
    JL      OGPN
    
    MOV     N5,0            
    MOV     AX,N10
    MOV     X,AX           
    ADD     Y,15            
    INC     N6              

OGPN:
    CMP    COUNT2,55       
    JL      P_INICIOGPN     ;
    JMP     CCC
P_INICIOGPN: 
    JMP INICIOGPN

CCC:
    PUSH    SI
    CALL    SPACESHIP_2   
    POP     SI
    MOV     AX,N9           ; compare n9 (indicates whether the shot is moving or not)
    CMP     AX,0
    JE      DDU   ; in which case he continues the movement of the aliens
    
    SUB     N8,10           
    MOV     AX,N8           
    CMP     AX,0            ; compare whether the shot reached the limit of the canvas
    JE      RESTIRO         ; if he has, he will be subtracted
    JMP     DDU   ; case do not jump to continue the program
    
RESTIRO:
    MOV N8,160          ;Reset to initial shooting position
    MOV     N9,0


    MOV		N22,7

DDU:

	MOV		AX,N11		;moves the value containing in n11 that corresponds to the current line of the 320 x 200 matrix
	AND		AX,1		;test if the value in ax and even, if it is even the flag will return 1 (last logical operation with result equal to zero), if it is odd the flag returns 0 (last logical operation with result other than zero)
	JZ		ANDADIR		;case the flag is 1, or is even, it jumps
	
	MOV		AX,N10		
	CMP		AX,10			; compare whether the current position of the alien set is greater than 10
	JG		ANDACMP2		; case n10 is greater than 10 jumps
	
	ADD		N11,3			
	JMP		ANDACMP1
	
ANDACMP2:

	MOV		AX,N22
	SUB 	N10,AX		; as n10 and greater than 10 subtract 2 from it (change the initial position of the alien matrix)
	JMP		FIMGER			
	
ANDADIR:

    MOV	AX,N10		
	ADD 	AX,225			;Adds the total size of the alien block to the starting position
	CMP		AX,315			; compare if the position of the alien block is less than 315 if it is jumped 
	JL		ANDACMP1		
	ADD		N11,3			; if it is not smaller jump 3 lines
	JMP		ANDACMP2		
	
ANDACMP1:
	MOV		AX,N22
	ADD		N10,AX	; case n10 is less than 315 add 2 positions on the x-axis of the alien block
   
    

FIMGER:;CALL WAITT
    MOV     COUNT,0
    PUSH    SI
wat:
    INC COUNT
    CALL    WAITT   
    CMP     COUNT,90    
    JL      wat
    POP     SI
    
    RET

LEVEL_2 ENDP 

;------------------------------------------------ Level 3 ----------------------------------------------------

LEVEL_3 PROC

    PUSH    DI
    CALL    CLEAR           
    POP     DI
    PUSH    X
    PUSH    Y

    CALL    DISPLAY_INFORMATION_2         
    
    POP     X
    POP     Y

    mov  ax, dx
     xor  dx, dx
    mov  cx, 5    
    div  cx       ; here dx contains the remainder of the division - from 0 to 5

    .IF dx == 1
        XOR     SI,SI
        LEA SI, PATTERN
    .ENDIF

    .IF dx == 2
        XOR     SI,SI
        LEA SI, PATTERN2
    .ENDIF

    .IF dx == 3
        XOR     SI,SI
        LEA SI, PATTERN3
    .ENDIF

    .IF dx == 4
        XOR     SI,SI
        LEA SI, PATTERN4
    .ENDIF

    .IF dx == 5
        XOR     SI,SI
        LEA SI, PATTERN5
    .ENDIF 

    CALL MONSTER_ADDITION

   

    
    MOV     AX,N10          
    MOV     X,AX      
    MOV     AX,N11
    MOV     Y,AX        
    MOV     N5,0
    MOV     N6,0
    MOV     COUNT2,0 
    
                                                                            
    
    INICIOGPN:

	MOV     N15, 2          
    CALL    KILL_ALIEN      
    MOV     Bl,[SI]
    CMP     BL,0           
    JE      CONTI
    
    PUSH    SI
    CALL    PRINT_ALIEN_2
    POP     SI
    JMP     CONTI
    

CONTI:
    INC     SI              
    ADD     X,20           
    INC     N5              
    INC     COUNT2          
    CMP     N5,11          
    JL      OGPN
    
    MOV     N5,0            
    MOV     AX,N10
    MOV     X,AX           
    ADD     Y,15            
    INC     N6              

OGPN:
    CMP    COUNT2,55       
    JL      P_INICIOGPN     ;
    JMP     CCC
P_INICIOGPN: 
    JMP INICIOGPN

CCC:
    PUSH    SI
    CALL    SPACESHIP_3  
    POP     SI
    MOV     AX,N9           ; compare n9 (indicates whether the shot is moving or not)
    CMP     AX,0
    JE      DDU   ; in which case he continues the movement of the aliens
    
    SUB     N8,10           
    MOV     AX,N8           
    CMP     AX,0            ; compare whether the shot reached the limit of the canvas
    JE      RESTIRO         ; if he has, he will be subtracted
    JMP     DDU   ; case do not jump to continue the program
    
RESTIRO:
    MOV N8,160          ;Reset to initial shooting position
    MOV     N9,0


    MOV		N22,7

DDU:

	MOV		AX,N11		;moves the value containing in n11 that corresponds to the current line of the 320 x 200 matrix
	AND		AX,1		;test if the value in ax and even, if it is even the flag will return 1 (last logical operation with result equal to zero), if it is odd the flag returns 0 (last logical operation with result other than zero)
	JZ		ANDADIR		;case the flag is 1, or is even, it jumps
	
	MOV		AX,N10		
	CMP		AX,10			; compare whether the current position of the alien set is greater than 10
	JG		ANDACMP2		; case n10 is greater than 10 jumps
	
	ADD		N11,3			
	JMP		ANDACMP1
	
ANDACMP2:

	MOV		AX,N22
	SUB 	N10,AX		; as n10 and greater than 10 subtract 2 from it (change the initial position of the alien matrix)
	JMP		FIMGER			
	
ANDADIR:

    MOV	AX,N10		
	ADD 	AX,225			;Adds the total size of the alien block to the starting position
	CMP		AX,315			; compare if the position of the alien block is less than 315 if it is jumped 
	JL		ANDACMP1		
	ADD		N11,3			; if it is not smaller jump 3 lines
	JMP		ANDACMP2		
	
ANDACMP1:
	MOV		AX,N22
	ADD		N10,AX	; case n10 is less than 315 add 2 positions on the x-axis of the alien block
   
    

FIMGER:;CALL WAITT
    MOV     COUNT,0
    PUSH    SI
wat:
    INC COUNT
    CALL    WAITT   
    CMP     COUNT,90    
    JL      wat
    POP     SI
    
    RET

LEVEL_3 ENDP

;------------------------------------------------ Monster Addition ----------------------------------------------------

MONSTER_ADDITION PROC

    XOR     SI,SI
    LEA SI, PATTERN6

    
    MOV     AX,N10          
    MOV     X,AX      
    MOV     AX,N11
    MOV     Y,AX        
    MOV     N5,0
    MOV     N6,0
    MOV     COUNT2,0 
    
                                                                            
    
    INICIOGPN:

	MOV     N15, 2          
    CALL    KILL_ALIEN      
    MOV     Bl,[SI]
    CMP     BL,0           
    JE      CONTI
    
    PUSH    SI
    CALL    PRINT_MONSTER
    CALL    PRINT_SHOT
    POP     SI
    JMP     CONTI
    

CONTI:
    INC     SI              
    ADD     X,20           
    INC     N5              
    INC     COUNT2          
    CMP     N5,11          
    JL      OGPN
    
    MOV     N5,0            
    MOV     AX,N10
    MOV     X,AX           
    ADD     Y,15            
    INC     N6              

OGPN:
    CMP    COUNT2,55       
    JL      P_INICIOGPN     ;
    JMP     CCC
P_INICIOGPN: 
    JMP INICIOGPN

CCC:
    PUSH    SI
    CALL    SPACESHIP_3  
    POP     SI
    MOV     AX,N9           ; compare n9 (indicates whether the shot is moving or not)
    CMP     AX,0
    JE      DDU   ; in which case he continues the movement of the aliens
    
    SUB     N8,10           
    MOV     AX,N8           
    CMP     AX,0            ; compare whether the shot reached the limit of the canvas
    JE      RESTIRO         ; if he has, he will be subtracted
    JMP     DDU   ; case do not jump to continue the program
    
RESTIRO:
    MOV N8,160          ;Reset to initial shooting position
    MOV     N9,0


    MOV		N22,7

DDU:

	MOV		AX,N11		;moves the value containing in n11 that corresponds to the current line of the 320 x 200 matrix
	AND		AX,1		;test if the value in ax and even, if it is even the flag will return 1 (last logical operation with result equal to zero), if it is odd the flag returns 0 (last logical operation with result other than zero)
	JZ		ANDADIR		;case the flag is 1, or is even, it jumps
	
	MOV		AX,N10		
	CMP		AX,10			; compare whether the current position of the alien set is greater than 10
	JG		ANDACMP2		; case n10 is greater than 10 jumps
	
	ADD		N11,3			
	JMP		ANDACMP1
	
ANDACMP2:

	MOV		AX,N22
	SUB 	N10,AX		; as n10 and greater than 10 subtract 2 from it (change the initial position of the alien matrix)
	JMP		FIMGER			
	
ANDADIR:

    MOV	AX,N10		
	ADD 	AX,225			;Adds the total size of the alien block to the starting position
	CMP		AX,315			; compare if the position of the alien block is less than 315 if it is jumped 
	JL		ANDACMP1		
	ADD		N11,3			; if it is not smaller jump 3 lines
	JMP		ANDACMP2		
	
ANDACMP1:
	MOV		AX,N22
	ADD		N10,AX	; case n10 is less than 315 add 2 positions on the x-axis of the alien block
   
    

FIMGER:;CALL WAITT
    MOV     COUNT,0
    PUSH    SI
wat:
    INC COUNT
    CALL    WAITT   
    CMP     COUNT,90    
    JL      wat
    POP     SI
    
    RET

MONSTER_ADDITION ENDP

;------------------------------------------------ Spaceship For Level 1----------------------------------------------------
SPACESHIP_1   PROC
    PUSH    X
    PUSH    Y
    MOV     AX,MOVE_SHIP     
    MOV     X,AX            
    MOV     Y,170           
    CALL    PRINT_SHIP      
    POP     X
    POP     Y
    
    MOV   AH,01H   
    INT   16H
    JNZ   TECLOU  
    JMP     CONTMOV

    TECLOU:
    MOV   AH,00H   
    INT   16H
    
    ; MOV       AH,1H
    ; INT       21H
CONTMOV:
    CMP     AL,32           ;SPACEBAR
    JE  SPACEBAR
    
    CMP     AL,65           ;compare to see if the A key has been pressed, in case the ship goes to the left
    JE      LEFT_KEY

    CMP     AL,97           ;compare to see if the A key has been pressed, in case the ship goes to the left
    JE      LEFT_KEY
    
    CMP     AL,68           ;compare to see if the D key has been pressed, in case the ship goes to the right
    JE      RIGHT_KEY

    CMP     AL,100          ;compare to see if the D key has been pressed, in case the ship goes to the right
    JE      RIGHT_KEY
    
    MOV     AX,N9           
    CMP     AX,1
    JE      SPACEBAR            
    
    JMP     NO_KEY      ; in case no key has been pressed and there is no moving shot it jumps to end

LEFT_KEY:   
    JMP SPACESHIP_LEFT
RIGHT_KEY:  
    JMP SPACESHIP_RIGHT
SPACEBAR:
    MOV N9,1            
    MOV AX,N8               
    CMP     AX,160          
    JE      NOVOTIRO
    PUSH    X
    PUSH    Y
    MOV     AX,N7          
    MOV     X,AX            
    MOV     AX,N8           
    MOV     Y,AX            
    CALL    PRINT_SHOT     
    POP     X               
    POP     Y
    JMP     NO_KEY        
    
NOVOTIRO:
    PUSH    X           
    PUSH    Y
    MOV     AX,MOVE_SHIP
    MOV     N7,AX       
    MOV     X,AX        
    MOV     AX,N8       
    MOV     Y,AX        
    CALL    PRINT_SHOT  
    POP     X
    POP     Y

    CMP     SCORE,0
    JE      FDJMP
    
    
FDJMP:
    JMP   NO_KEY  ; pula para o fim
SPACESHIP_RIGHT:
    MOV     AX,N9       
    CMP     AX,1
    JE      SPACEBAR2
    
    MOV AX, MOVE_SHIP   
    CMP     AX,305
    JL  ADDMN           
    JMP     NO_KEY      
SPACEBAR2:
    MOV N9,1    
    PUSH    X
    PUSH    Y
    MOV     AX,N7       
    MOV     X,AX    
    MOV     AX,N8   
    MOV     Y,AX   
    CALL    PRINT_SHOT
    POP     X
    POP     Y
    
    MOV AX, MOVE_SHIP 
    CMP     AX,305
    JL  ADDMN      
    JMP     NO_KEY

ADDMN:ADD   MOVE_SHIP,5  
    JMP     NO_KEY      

SPACESHIP_LEFT:
    MOV     AX,N9  
    CMP     AX,1
    JE      SPACEBAR3
    
    MOV AX, MOVE_SHIP 
    CMP     AX,5   
    JG  SUBMN
    JMP     NO_KEY
SPACEBAR3:
    MOV N9,1
    PUSH    X
    PUSH    Y
    MOV     AX,N7   
    MOV     X,AX    
    MOV     AX,N8
    MOV     Y,AX    
    CALL    PRINT_SHOT
    POP     X
    POP     Y
    
    MOV AX, MOVE_SHIP
    CMP    AX,5    
    JG  SUBMN
    JMP     NO_KEY

SUBMN:  
    SUB MOVE_SHIP,5

NO_KEY: 
    RET 

SPACESHIP_1    ENDP

;------------------------------------------------ Spaceship For Level 2-----------------------------------------------

SPACESHIP_2   PROC
   PUSH    X
    PUSH    Y
    MOV     AX,MOVE_SHIP     
    MOV     X,AX            
    MOV     Y,170           
    CALL    PRINT_SHIP      
    POP     X
    POP     Y
    
    MOV   AH,01H   
    INT   16H
    JNZ   TECLOU  
    JMP     CONTMOV

    TECLOU:
    MOV   AH,00H   
    INT   16H
    
    ; MOV       AH,1H
    ; INT       21H
CONTMOV:
    CMP     AL,32           ;SPACEBAR
    JE  SPACEBAR
    
    CMP     AL,65           ;compare to see if the A key has been pressed, in case the ship goes to the left
    JE      LEFT_KEY

    CMP     AL,97           ;compare to see if the A key has been pressed, in case the ship goes to the left
    JE      LEFT_KEY
    
    CMP     AL,68           ;compare to see if the D key has been pressed, in case the ship goes to the right
    JE      RIGHT_KEY

    CMP     AL,100          ;compare to see if the D key has been pressed, in case the ship goes to the right
    JE      RIGHT_KEY
    
    MOV     AX,N9           
    CMP     AX,1
    JE      SPACEBAR            
    
    JMP     NO_KEY      ; in case no key has been pressed and there is no moving shot it jumps to end

LEFT_KEY:   
    JMP SPACESHIP_LEFT
RIGHT_KEY:  
    JMP SPACESHIP_RIGHT
SPACEBAR:
    MOV N9,1            
    MOV AX,N8               
    CMP     AX,160          
    JE      NOVOTIRO
    PUSH    X
    PUSH    Y
    MOV     AX,N7          
    MOV     X,AX            
    MOV     AX,N8           
    MOV     Y,AX            
    CALL    PRINT_SHOT     
    POP     X               
    POP     Y
    JMP     NO_KEY        
    
NOVOTIRO:
    PUSH    X           
    PUSH    Y
    MOV     AX,MOVE_SHIP
    MOV     N7,AX       
    MOV     X,AX        
    MOV     AX,N8       
    MOV     Y,AX        
    CALL    PRINT_SHOT  
    POP     X
    POP     Y

    CMP     SCORE,0
    JE      FDJMP
    SUB SCORE, 1
    
    
FDJMP:
    JMP   NO_KEY  
SPACESHIP_RIGHT:
    MOV     AX,N9       
    CMP     AX,1
    JE      SPACEBAR2
    
    MOV AX, MOVE_SHIP   
    CMP     AX,305
    JL  ADDMN           
    JMP     NO_KEY      
SPACEBAR2:
    MOV N9,1    
    PUSH    X
    PUSH    Y
    MOV     AX,N7       
    MOV     X,AX    
    MOV     AX,N8   
    MOV     Y,AX   
    CALL    PRINT_SHOT
    POP     X
    POP     Y
    
    MOV AX, MOVE_SHIP 
    CMP     AX,305
    JL  ADDMN      
    JMP     NO_KEY

ADDMN:
    ADD   MOVE_SHIP,5  
    JMP     NO_KEY      

SPACESHIP_LEFT:
    MOV     AX,N9  
    CMP     AX,1
    JE      SPACEBAR3
    
    MOV AX, MOVE_SHIP 
    CMP     AX,5   
    JG  SUBMN
    JMP     NO_KEY
SPACEBAR3:
    MOV N9,1
    PUSH    X
    PUSH    Y
    MOV     AX,N7   
    MOV     X,AX    
    MOV     AX,N8
    MOV     Y,AX    
    CALL    PRINT_SHOT
    POP     X
    POP     Y
    
    MOV AX, MOVE_SHIP
    CMP    AX,5    
    JG  SUBMN
    JMP     NO_KEY

SUBMN:  
    SUB MOVE_SHIP,5

NO_KEY: 
    RET 

SPACESHIP_2    ENDP

;------------------------------------------------ Spaceship For Level 3-----------------------------------------------

SPACESHIP_3   PROC
   PUSH    X
    PUSH    Y
    MOV     AX,MOVE_SHIP     
    MOV     X,AX            
    MOV     Y,170           
    CALL    PRINT_SHIP      
    POP     X
    POP     Y
    
    MOV   AH,01H   
    INT   16H
    JNZ   TECLOU  
    JMP     CONTMOV

    TECLOU:
    MOV   AH,00H   
    INT   16H
    
    ; MOV       AH,1H
    ; INT       21H
CONTMOV:
    CMP     AL,32           ;SPACEBAR
    JE  SPACEBAR
    
    CMP     AL,65           ;compare to see if the A key has been pressed, in case the ship goes to the left
    JE      LEFT_KEY

    CMP     AL,97           ;compare to see if the A key has been pressed, in case the ship goes to the left
    JE      LEFT_KEY
    
    CMP     AL,68           ;compare to see if the D key has been pressed, in case the ship goes to the right
    JE      RIGHT_KEY

    CMP     AL,100          ;compare to see if the D key has been pressed, in case the ship goes to the right
    JE      RIGHT_KEY
    
    MOV     AX,N9           
    CMP     AX,1
    JE      SPACEBAR            
    
    JMP     NO_KEY      ; in case no key has been pressed and there is no moving shot it jumps to end

LEFT_KEY:   
    JMP SPACESHIP_LEFT
RIGHT_KEY:  
    JMP SPACESHIP_RIGHT
SPACEBAR:
    MOV N9,1            
    MOV AX,N8               
    CMP     AX,160          
    JE      NOVOTIRO
    PUSH    X
    PUSH    Y
    MOV     AX,N7          
    MOV     X,AX            
    MOV     AX,N8           
    MOV     Y,AX            
    CALL    PRINT_SHOT     
    POP     X               
    POP     Y
    JMP     NO_KEY        
    
NOVOTIRO:
    PUSH    X           
    PUSH    Y
    MOV     AX,MOVE_SHIP
    MOV     N7,AX       
    MOV     X,AX        
    MOV     AX,N8       
    MOV     Y,AX        
    CALL    PRINT_SHOT  
    POP     X
    POP     Y

    CMP     SCORE,0
    JE      FDJMP
    SUB SCORE, 1
    
    
FDJMP:
    JMP   NO_KEY  
SPACESHIP_RIGHT:
    MOV     AX,N9       
    CMP     AX,1
    JE      SPACEBAR2
    
    MOV AX, MOVE_SHIP   
    CMP     AX,305
    JL  ADDMN           
    JMP     NO_KEY      
SPACEBAR2:
    MOV N9,1    
    PUSH    X
    PUSH    Y
    MOV     AX,N7       
    MOV     X,AX    
    MOV     AX,N8   
    MOV     Y,AX   
    CALL    PRINT_SHOT
    POP     X
    POP     Y
    
    MOV AX, MOVE_SHIP 
    CMP     AX,305
    JL  ADDMN      
    JMP     NO_KEY

ADDMN:ADD   MOVE_SHIP,5  
    JMP     NO_KEY      

SPACESHIP_LEFT:
    MOV     AX,N9  
    CMP     AX,1
    JE      SPACEBAR3
    
    MOV AX, MOVE_SHIP 
    CMP     AX,5   
    JG  SUBMN
    JMP     NO_KEY
SPACEBAR3:
    MOV N9,1
    PUSH    X
    PUSH    Y
    MOV     AX,N7   
    MOV     X,AX    
    MOV     AX,N8
    MOV     Y,AX    
    CALL    PRINT_SHOT
    POP     X
    POP     Y
    
    MOV AX, MOVE_SHIP
    CMP    AX,5    
    JG  SUBMN
    JMP     NO_KEY

SUBMN:  
    SUB MOVE_SHIP,5

NO_KEY: 
    RET 

SPACESHIP_3    ENDP

;------------------------------------------------ Kill Alien -----------------------------------------------

KILL_ALIEN PROC
    MOV     Bl,[SI]        
    CMP     BL,0            
    JE      PEDMA          
    
    CMP     N9,0            
    JE      PEDMA
    
    MOV     AX,N8          
    CMP     AX,Y            
    JG      CMPEY2          
    JMP     PEDMA

PEDMA:

    JMP EDMA

CMPEY2:
    MOV      AX,N8           
    PUSH    AX              
    MOV     AX,Y                
    ADD     AX,11               
    MOV     N13,AX      
    POP     AX
    CMP     AX,N13              
    JL      CMPEX1              
    JMP     EDMA
    
CMPEX1:
    MOV  AX,N7           
    PUSH    AX              
    MOV     AX,X            
    MOV     N13,AX
    POP     AX
    SUB     N13,3           
    CMP     AX,N13          
    JG      CMPEX2           
    JMP     EDMA
    
CMPEX2:
    MOV  AX,N7
    PUSH    AX
    MOV     AX,X
    MOV     N13,AX
    POP     AX
    ADD     N13,15      
    CMP     AX,N13      
    JL      MTA1       
    JMP     EDMA
MTA1:
    MOV     N8,160          
    MOV     N9,0            
    INC     N12
    MOV     AL,0            
    MOV     [SI],AL         
    MOV     AX,N15
    ADD     SCORE,AX
    JMP     EDMA
EDMA:
    RET
KILL_ALIEN ENDP

SCORES  PROC
    XOR     AX,AX
    MOV     AX,BX                  
    XOR     CX,CX                     
    MOV     BX,10                     

@REPEAT:                      
    XOR     DX,DX                  
    DIV     BX                      
    PUSH    DX                     
    INC     CX                       
    OR      AX,AX                    
    JNE     @REPEAT                    

    MOV     AH, 2                      

@DISPLAY:                     
    POP     DX                       
    OR      DL, 30H                   
    INT     21H                      
    LOOP @DISPLAY                  

   RET                            
SCORES  endp

DISPLAY_INFORMATION_1 PROC
    MOV     AH, 02H         
    MOV     DH, 0
    MOV     DL, 0 
    INT     10H

    MOV     AH, 9H          
    LEA     DX,  PRINT_YOUR_NAME
    INT     21H 

    CALL PRINT_PLAYER_NAME

    MOV     AH, 02H         
    MOV     DH, 0
    MOV     DL, 28
    INT     10H
    
    MOV     AH, 9H          
    LEA     DX, PRINT_YOUR_SCORE
    INT     21H 

    MOV     BX,SCORE    
    CALL    SCORES

   

    
    
    
FIMVIDA:
    RET
DISPLAY_INFORMATION_1 ENDP

DISPLAY_INFORMATION_2 PROC
    MOV     AH, 02H        
    MOV     DH, 0
    MOV     DL, 0 
    INT     10H

    MOV     AH, 9H          
    LEA     DX,  PRINT_YOUR_NAME
    INT     21H 

    CALL PRINT_PLAYER_NAME

    MOV     AH, 02H         
    MOV     DH, 0
    MOV     DL, 28
    INT     10H
    
    MOV     AH, 9H          
    LEA     DX, PRINT_YOUR_SCORE
    INT     21H 

    MOV     BX,SCORE    
    CALL    SCORES
    
    
    
FIMVIDA:RET
DISPLAY_INFORMATION_2 ENDP

DISPLAY_INFORMATION_3 PROC
    MOV     AH, 02H        
    MOV     DH, 0
    MOV     DL, 0 
    INT     10H

    MOV     AH, 9H          
    LEA     DX,  PRINT_YOUR_NAME
    INT     21H 

    CALL PRINT_PLAYER_NAME

    MOV     AH, 02H         
    MOV     DH, 0
    MOV     DL, 28
    INT     10H
    
    MOV     AH, 9H          
    LEA     DX, PRINT_YOUR_SCORE
    INT     21H 

    MOV     BX,SCORE    
    CALL    SCORES
    
    
    
FIMVIDA:RET
DISPLAY_INFORMATION_3 ENDP



PRINT_PLAYER_NAME PROC

    PUSH DX
    PUSH AX
    PUSH SI
    PUSH CX
    PUSH BX
   
    MOV DH, 0

    MOV DL, 6
    MOV SI, 0
   
PRINT_THE_NAME:

    MOV AH, 02
    INT 10H

    MOV AH, 09
    MOV AL, NAME_OF_PLAYER[SI]
    MOV BL, 0Ch
    MOV CX, 1
    MOV BH, 0
    INT 10H
       
    INC DL
    INC SI
    CMP NAME_OF_PLAYER[SI], 13
    JNE PRINT_THE_NAME  
   
    POP BX
    POP CX
    POP SI
    POP AX
    POP DX
   
    RET
   
PRINT_PLAYER_NAME ENDP

;------------------------------------------------ Print Alien -----------------------------------------------

PRINT_ALIEN PROC 
    XOR     SI,SI   
    LEA     SI,PRINTALIEN   
    MOV     N2,0
    MOV     N4,0
    MOV     COUNT,0
INICIOAL1:MOV   CX,X
    ADD     CX,N2
    INC     N2
    MOV     DX,Y
    ADD     DX,N4
    
    MOV     BL,[SI] ; 
    CMP     BL,0
    JE      AAL1
    
    MOV     AH,0CH
    MOV     AL,1111B    
    INT     10H
    
AAL1:   INC     SI
    INC     COUNT
    CMP     N2,14
    JL      OAL1
    
    MOV     N2,0
    INC     N4

OAL1:   CMP     COUNT,154   
    JL      INICIOAL1   
    RET
PRINT_ALIEN ENDP

;------------------------------------------------ Print Alien 1 -----------------------------------------------

PRINT_ALIEN_1	PROC 
	XOR		SI,SI	
	LEA		SI,PRINTALIEN1	
	MOV		N2,0
	MOV		N4,0
	MOV		COUNT,0
INICIOAL2:
MOV	CX,X
	ADD		CX,N2
	INC		N2
	MOV		DX,Y
	ADD		DX,N4
	
	MOV		BL,[SI]
	CMP		BL,0
	JE		AAL2
	
	MOV		AH,0CH
	MOV		AL,1111B	
	INT		10H
	
AAL2:	INC		SI		
	INC		COUNT
	CMP		N2,13
	JL		OAL2
	
	MOV		N2,0
	INC		N4

OAL2:	
    CMP		COUNT,117	;
	JL		INICIOAL2
	RET
PRINT_ALIEN_1	ENDP

;------------------------------------------------ Print Alien 2-----------------------------------------------

PRINT_ALIEN_2	PROC 
	XOR		SI,SI	
	LEA		SI,PRINTALIEN2	
	MOV		N2,0
	MOV		N4,0
	MOV		COUNT,0
INICIOAL3:
    MOV	CX,X
	ADD		CX,N2
	INC		N2
	MOV		DX,Y
	ADD		DX,N4
	
	MOV		BL,[SI]		
	CMP		BL,0
	JE		AAL3
	
	MOV		AH,0CH
	MOV		AL,1111B	;
	INT		10H
	
AAL3:	
    INC		SI
	INC		COUNT
	CMP		N2,12
	JL		OAL3
	
	MOV		N2,00
	INC		N4

OAL3:	
    CMP		COUNT,96	
	JL		INICIOAL3
	RET
PRINT_ALIEN_2	ENDP

;------------------------------------------------ Print Monster -----------------------------------------------

PRINT_MONSTER PROC

    XOR		SI,SI	
	LEA		SI,MONSTER	
	MOV		N2,0
	MOV		N4,0
	MOV		COUNT,0
INICIOAL3:
    MOV	CX,X
	ADD		CX,N2
	INC		N2
	MOV		DX,Y
	ADD		DX,N4
	
	MOV		BL,[SI]		
	CMP		BL,0
	JE		AAL3
	
	MOV		AH,0CH
	MOV		AL,1111B	;
	INT		10H
	
AAL3:	
    INC		SI
	INC		COUNT
	CMP		N2,50
	JL		OAL3
	
	MOV		N2,00
	INC		N4

OAL3:	
    CMP		COUNT,456	
	JL		INICIOAL3
	RET  

PRINT_MONSTER ENDP

;------------------------------------------------ Print Shot -----------------------------------------------

PRINT_SHOT  PROC 
    XOR     SI,SI   
    LEA     SI,PRINTSHOT    
    MOV     N2,0
    MOV     N4,0

    MOV     COUNT,0

INICIOPT1:
    MOV   CX,X
    ADD     CX,N2
    INC     N2
    MOV     DX,Y
    ADD     DX,N4
    
    MOV     BL,[SI] 
    CMP     BL,0
    JE      APT1    
    
    MOV     AH,0CH
    MOV     AL,1110B   
    INT     10H
    
APT1:
    INC    SI
    INC     COUNT
    CMP     N2,11
    JL      OPT1
    
    MOV     N2,0
    INC     N4

OPT1:   
    CMP     COUNT,55    
    JL      INICIOPT1
    RET
PRINT_SHOT ENDP

;------------------------------------------------ Print Spaceship -----------------------------------------------

PRINT_SHIP  PROC 
    XOR     SI,SI  
    LEA     SI,PRINTSPACESHIP   
    MOV     N2,0
    MOV     N4,0
    MOV     COUNT,0
INICIO:
    MOV  CX,X
    ADD     CX,N2
    INC     N2
    MOV     DX,Y
    ADD     DX,N4
    
    MOV     BL,[SI] 
    CMP     BL,0
    JE      A
    
    CMP     BL,2    
    JE      V
    
    MOV     AH,0CH
    MOV     AL,100B     
    INT     10H
    JMP     A
    
V:  MOV     AH,0CH
    MOV     AL,1110B    
    INT     10H
    
A:  INC     SI
    INC     COUNT
    CMP     N2,11
    JL      O
    
    MOV     N2,0
    INC     N4

O:  
    CMP     COUNT,165   
    JL      INICIO
    RET
PRINT_SHIP  ENDP


END     MAIN


