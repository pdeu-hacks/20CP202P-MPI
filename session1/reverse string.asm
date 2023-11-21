org 100h

start:
    mov si, 0      ; source index
    mov di, 0      ; destination index

    ; Find the end of the string
find_end:
    mov al, [si]
    cmp al, 0
    je  reverse_string

    inc si
    jmp find_end

reverse_string:
    dec si           ; point to the last character (null terminator)
    cmp si, di
    jl  end_reverse

reverse_loop:
    mov al, [si]    ; load the character from the end
    mov ah, [di]    ; load the character from the beginning
    mov [si], ah    ; swap characters
    mov [di], al

    inc di          ; move towards the center
    dec si

    cmp si, di
    jl  end_reverse ; check if we have reached the middle of the string
    jmp reverse_loop

end_reverse:
    ; Your reversed string is now in the same memory location where the original string was stored

    ; Add any additional code here if needed

    int 20h         ; terminate program





