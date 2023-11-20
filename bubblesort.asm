org 100h

.data
array db 5,4,6,3,2

.code
mov cx, 5 ; Number of elements in the array
dec cx

scan:
mov bx, cx
mov si, 0

comp:
mov al, [array + si]
mov dl, [array + si + 1]
cmp dl, al
jnc noswap

mov [array + si], dl
mov [array + si + 1], al

noswap:
inc si
dec bx
jnz comp
loop scan

mov cx, 5
mov bx, offset array

print:
mov al, [bx]
add al, '0' 
mov ah, 2
mov dl, al
int 21h
inc bx
loop print

ret