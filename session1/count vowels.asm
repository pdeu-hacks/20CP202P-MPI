ORG 100h ; Origin, standard for .COM files

MOV SI, 0 ; Source index for the string
MOV CX, 0 ; Counter for vowels

; Start of loop
COUNT_VOWELS:
    MOV AL, [SI] ; Load the current character into AL
    CMP AL, 0 ; Check if it is the null terminator
    JE  END_PROGRAM ; If yes, jump to the end

    ; Check if the current character is a vowel (case-insensitive)
    CMP AL, 'a'
    JE  IS_VOWEL
    CMP AL, 'e'
    JE  IS_VOWEL
    CMP AL, 'i'
    JE  IS_VOWEL
    CMP AL, 'o'
    JE  IS_VOWEL
    CMP AL, 'u'
    JE  IS_VOWEL
    CMP AL, 'A'
    JE  IS_VOWEL
    CMP AL, 'E'
    JE  IS_VOWEL
    CMP AL, 'I'
    JE  IS_VOWEL
    CMP AL, 'O'
    JE  IS_VOWEL
    CMP AL, 'U'
    JE  IS_VOWEL
    JMP NOT_VOWEL

IS_VOWEL:
    INC CX ; Increment the vowel counter
    JMP CONTINUE

NOT_VOWEL:
CONTINUE:
    INC SI ; Move to the next character in the string
    JMP COUNT_VOWELS ; Repeat the loop

; End of program
END_PROGRAM:
    ; At this point, CX contains the count of vowels
    ; You can use CX for further processing or display

INT 20h ; Terminate the program

TIMES 510-($-$$) DB 0 ; Pad the rest of the 512 bytes with zeros
DW 0xAA55 ; Add the boot signature at the end




