INCLUDE 'emu8086.inc'
ORG 100h

getstring MACRO mem
    local scan, exit
    MOV BX, mem
    
    scan:
        MOV AH, 1
        INT 21h
        CMP AL, 13
        JE exit
        MOV B.[BX], AL
        INC BX
        JMP scan
    
    exit:
    MOV DL, 10
    MOV AH, 2
    INT 21h
    MOV B.[BX], 0
    INC BX
    
ENDM

putstring MACRO mem
    local print, exit
    MOV BX, mem
    
    print:
        CMP B.[BX], 0
        JE exit
        MOV DL, B.[BX]
        MOV AH, 2
        INT 21h
        INC BX
        JMP print
        
    exit:
    INC BX
    
ENDM


MOV SI, 1000h
MOV BX, SI

CALL pthis
DB 'Enter your full name: ', 0
getstring BX

CALL pthis
DB 13, 'Enter your roll number: ', 0
getstring BX

CALL pthis
DB 13, 'Enter course name: ', 0
getstring BX

MOV BX, SI

CALL pthis
DB 13, 10, 10, '-----Student Details-----', 0

CALL pthis
DB 13, 10, 10, 'Name: ', 0
putstring BX

CALL pthis
DB 13, 10, 'Roll number: ', 0
putstring BX

CALL pthis
DB 13, 10, 'Course name: ', 0
putstring BX

RET

define_pthis