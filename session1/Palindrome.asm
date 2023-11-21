INCLUDE 'emu8086.inc'

ORG 100h

MOV AX, 5000h
MOV DS, AX

MOV DX, 20
MOV DI, 1000h
CALL get_string

MOV BX, DI
MOV SI, DI

here:
    CMP B.[SI], 0
    JE exit
    INC SI
    INC BX
    JMP here
exit:
SUB BX, DI
MOV CX, BX
DEC SI

pal:
    MOV AL, B.[SI]
    CMP AL, B.[DI]
    JNE notpal
    DEC SI
    INC DI
    LOOP pal

CALL pthis
DB 13, 10, 'String is Palindrome', 0
JMP return


notpal:
CALL pthis
DB 13, 10, 'String is not a Palindrome', 0    


return:
RET

define_print_string
define_get_string
define_pthis