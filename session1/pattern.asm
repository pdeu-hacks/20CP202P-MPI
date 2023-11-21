INCLUDE 'emu8086.inc'

ORG 100h

CALL pthis
db 'Enter length: ', 0

CALL scan_num
MOV BX, CX

CALL pthis
DB 13, 10, 0

MOV DX, 1

loop1:
    PUSH CX
    MOV CX, DX
    PUSH DX
    here1:
        MOV AH, 2
        MOV DL, ch1
        INT 21h
        LOOP here1
    
    CALL pthis
    DB 13, 10, 0
    
    POP DX
    INC DX
    POP CX
    LOOP loop1

MOV CX, BX

loop2:
    PUSH CX
    here2:
        MOV AH, 2
        MOV DL, ch2
        INT 21h
        LOOP here2
    
    CALL pthis
    DB 13, 10, 0
    
    POP CX
    LOOP loop2

RET                  

ch1 DB '*'
ch2 DB '$'

define_scan_num
define_pthis