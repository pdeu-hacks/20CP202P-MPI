ORG 100h ; ORG statement to set the origin address of the program

MOV SI, 5 ; Set the array size
MOV CX, SI ; Counter for outer loop

MOV DI, 0 ; Index for comparing elements in inner loop

; Define an array
MOV BX, 0 ; Array base address
MOV AX, [BX] ; Load the first element into AX

OuterLoop:
    DEC CX ; Decrement outer loop counter

    MOV DI, CX ; Set inner loop index to outer loop counter

InnerLoop:
    CMP DI, SI ; Compare inner loop index with array size
    JGE NextOuter ; If inner loop index >= array size, go to next iteration of outer loop

    MOV BX, DI ; Set index for accessing array element to inner loop index
    ADD BX, BX ; Multiply by 2 since each element is 2 bytes
    ADD BX, BX ; (BX = DI * 4)

    MOV DX, [BX] ; Load the current element into DX
    CMP AX, DX ; Compare AX with the current element

    JBE NoSwap ; If AX <= current element, no need to swap

    ; Swap elements
    MOV [BX], AX ; Store AX in the current element's position
    SUB BX, 2 ; Move to the previous element's position
    MOV [BX], DX ; Store the current element in the previous element's position

NoSwap:
    DEC DI ; Decrement inner loop index
    JMP InnerLoop ; Jump to the next iteration of the inner loop

NextOuter:
    MOV AX, [CX * 2] ; Load the next element into AX
    JMP OuterLoop ; Jump to the next iteration of the outer loop

INT 20h ; Terminate program







