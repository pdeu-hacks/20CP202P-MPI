data SEGMENT
    STRING DB 'HELLO'
    LEN EQU $-STRING
    REVSTRING DB 20 DUP(0)
    data ends

code SEGMENT
    ASSUME CS:code DS:data
    
    START:
    MOV AX,data
    MOV DS,AX
    MOV ES,AX
    MOV CX,LEN
    MOV SI,OFFSET STRING
    MOV DI, OFFSET REVSTRING+(LEN-1)
    
    LGC:
    CLD
    LODSB
    STD
    STOSB
    LOOP LGC
    
    MOV AH,4CH
    INT 21H
    
    END START
    code ENDS