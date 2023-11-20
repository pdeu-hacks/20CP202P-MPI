org 100h
mov dx,offset message1
mov ah,9h
int 21h
mov ax,0h
mov dx,0h 
mov bl,16
mov di,0h 
mov si,0h

numberinput:
mov ax,di
mul bl
mov di,ax
mov ah,1h
int 21h 
cmp al,13
je divideprecaution
sub al,'0'
cmp al,9h
jng skip
sub al,7h
skip:
mov ah,0h
add di,ax
loop numberinput   

divideprecaution:
mov ax,di
div bl
mov ah,0h
mov di,ax

mov dl, 13d
mov ah, 2h
int 21h 

mov dl, 10d 
mov ah, 2h 
int 21h 

mov dx,offset message2
mov ah,9h
int 21h

decconv:
mov ax,di 
mov si,0h 
mov dx,0h
decconvstore: 
inc si
mov bx,10
div bx 
mov bx,dx
push bx
mov dx,0h
cmp ax,0h
je decprint 
loop decconvstore

decprint:
pop dx
add dx,'0'
mov ah,2h
int 21h  
dec si
jz end 
loop decprint


end:
mov ax, 4c00h
int 21h   

message1 db 'Input HEXADECIMAL number: ',13,10,'$'
message2 db 'decimal: ',13,10,'$'
ret