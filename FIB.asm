data SEGMENT
    n db 10
    fib db 10 dup(0)
    data ends

code SEGMENT
    ASSUME CS:code DS:data
    
    START:
    MOV AX,data
    MOV DS,AX
    LEA SI,fib
    MOV AL,00H
    MOV [SI],AL
    INC AL
    INC SI
    MOV [SI],AL
    MOV CL,n
    MOV CH,00H
    SUB CX,02H
    
    LGC:
    MOV AL,[SI-1]
    ADD AL,[SI]
    DAA
    INC SI
    MOV [SI],AL
    LOOP LGC
    
    MOV AH,4Ch
    INT 21H
    END START
    code ENDS