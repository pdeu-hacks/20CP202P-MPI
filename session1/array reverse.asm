org 100h

jmp start ; Jump to the start of the program

array_size equ 5 ; Define the size of the array

array db 1, 2, 3, 4, 5 ; The array to be reversed

start:
    mov cx, array_size ; Initialize loop counter with array size
    dec cx ; Decrement to account for 0-based indexing

    mov si, 0 ; Source index (start of array)
    mov di, cx ; Destination index (end of array)

reverse_loop:
    cmp si, di ; Compare source and destination indices
    jae done ; Jump to done if they have crossed

    ; Swap elements at si and di
    mov al, [array + si]
    mov bl, [array + di]
    mov [array + si], bl
    mov [array + di], al

    ; Move indices
    inc si
    dec di

    jmp reverse_loop ; Jump back to the beginning of the loop

done:
    ; Your code after reversing the array

    ; Halt the program
    mov ah, 4Ch
    int 21h





