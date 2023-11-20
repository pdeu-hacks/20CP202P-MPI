ORG 100h

getstring MACRO mem
    MOV BX, mem
    
    scan:
        MOV AH, 1
        INT 21h
        CMP AL, 13
        JE exit1
        MOV B.[BX], AL
        INC BX
        JMP scan
    
    exit1:
    MOV DL, 10
    MOV AH, 2
    INT 21h
    MOV B.[BX], 0
ENDM

putstring MACRO mem
    MOV BX, mem
    
    print:
        CMP B.[BX], 0
        JE exit2
        MOV DL, B.[BX]
        MOV AH, 2
        INT 21h
        INC BX
        JMP print
        
    exit2:
ENDM


MOV AX, 5000h
MOV DS, AX
MOV SI, 0h

getstring SI
putstring SI

RET