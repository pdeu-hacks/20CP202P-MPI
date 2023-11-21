org 100h

start:
    mov cx, 0  ; Counter for consonants
    mov si, offset input_string  ; Pointer to the input string

    next_char:
        lodsb  ; Load the next character into AL
        cmp al, 0  ; Check if it's the null terminator (end of string)
        je end_program

        ; Check if the character is a letter
        cmp al, 'A'
        jl not_letter
        cmp al, 'Z'
        jg not_letter

        ; Convert uppercase letter to lowercase
        add al, 32

        ; Check if the letter is a vowel (aeiou)
        cmp al, 'a'
        je not_consonant
        cmp al, 'e'
        je not_consonant
        cmp al, 'i'
        je not_consonant
        cmp al, 'o'
        je not_consonant
        cmp al, 'u'
        je not_consonant

        ; If it's not a vowel, increment the consonant counter
        inc cx

        not_consonant:

    not_letter:
        jmp next_char

    end_program:
        ; Now CX contains the count of consonants
        ; You can use the value in CX as needed
        ; For example, you can store it in a memory location or display it.

        ; Add your code here for further processing or displaying the result

    ; Define the input string
    input_string db "Hello World! This is an example.", 0

    ; Add any other data or code sections as needed

ret





