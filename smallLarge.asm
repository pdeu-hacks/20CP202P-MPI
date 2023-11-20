org 100h 

mov ax, 5000H
mov DS, ax
mov bx, 1000H
mov si, bx
mov di, bx  
     
mov b.[bx], 4
add bx, 1
mov b.[bx], 3
inc bx
mov b.[bx], 5
inc bx
mov b.[bx], 1
inc bx
mov b.[bx], 2
inc bx
     
sub bx, si
     
mov al, [si]
inc si 
     
HERE: 
    sub bx, 1
    JZ END 
    
    cmp al, [si]
    JNC NEXT
    mov al, [si]
     
NEXT: 
    inc si
    LOOP HERE
     
END:
    add bx, 5
    mov dl, [DI]
    inc DI 
     
HERE1: 
    sub bx, 1
    jz END1
    cmp dl, [DI]
    JC NEXT1
    mov dl, [DI]
     
NEXT1: 
    inc DI
    LOOP HERE1
     
END1:      
RET