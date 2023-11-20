include emu8086.inc
org 100h
mov dx, offset message1
mov ah,9h
int 21h  

CALL scan_num 
mov AX, CX 
mov di,ax

mov dl, 13d
mov ah, 2h
int 21h 

mov dl, 10d
mov ah, 2h 
int 21h

mov dx, offset message2
mov ah,9h
int 21h
mov bx, offset hex
inc bx 
cmp di,15
jle hexaconv
inc bx 
cmp di,255
jle hexaconv
inc bx    
cmp di,4095
jle hexaconv
inc bx 
cmp di,65534
jle hexaconv
inc bx 


hexaconv: 
mov [bx],'$'
dec bx
mov ax,di 
mov si,0h 
mov dx,0h 
hexaconvstore: 
inc si
mov cx,16
div cx 
add dx,'0'
cmp dx,'9'
jng skip
add dx,7h
skip:
mov [bx],dl
dec bx
mov dx,0h
cmp ax,0h
je hexaprint 
loop hexaconvstore

hexaprint:
mov dx,offset hex
mov ah,9h       
int 21h

end:
mov ax, 4c00h
int 21h   

message1 db 'Input number: ',13,10,'$'
message2 db 'Hexadecimal: ',13,10,'$'
hex db 60 dup(?)

ret
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS