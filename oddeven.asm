org 100h

MOV CX, 10
MOV SI, 0

MOV DL, 0
MOV DH, 0

ARRAY DB 5, 7, 6, 9, 12, 5, 8, 11, 4, 3

CountLoop:
    MOV BL, [ARRAY + SI]
    TEST BL, 1
    JNZ OddNumber

EvenNumber:
    INC DL
    JMP NextElement

OddNumber:
    INC DH

NextElement:
    INC SI
    DEC CX
    sub cx, 0
    JZ EndProgram ; Terminate the program when SI is equal to 10
    JMP CountLoop

EndProgram:
    mov AH,76
    int 21h
    ret