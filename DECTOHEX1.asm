data SEGMENT
    num dw 3DDH
    ans db 5 DUP(0)
    data ENDS

code SEGMENT
    ASSUME CS:code,DS:data
    
    START:
    MOV AX,data
    MOV DS,AX
    MOV AX,num
    MOV CX,10H
    LEA SI,ans
    
    LGC:
    MOV DX,00H
    DIV CX
    MOV [SI],DL
    INC SI
    CMP AX,CX
    JAE LGC
    MOV [SI],AL
    MOV AX,4C00H
    INT 21H
    code ENDS
END START