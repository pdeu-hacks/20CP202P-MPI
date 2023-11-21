org 100h ; The origin point of the program

mov cx, 5 ; Set the loop counter (assuming array size is 5)
mov si, offset array ; Load the address of the array into SI register
mov ax, 0 ; Initialize sum to zero

calculate_sum:
    mov bx, [si] ; Load the current element of the array into BX register
    add ax, bx ; Add the current element to the sum
    add si, 2 ; Move to the next element (assuming each element is 2 bytes, adjust as needed)
    loop calculate_sum ; Repeat the loop until cx becomes zero

; At this point, AX contains the sum of the array elements

int 20h ; Terminate the program

array dw 1, 2, 3, 4, 5 ; Example array (16-bit integers)






