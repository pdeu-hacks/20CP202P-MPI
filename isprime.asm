INCLUDE 'emu8086.inc'

ORG 100h

LEA SI, msg1
CALL print_string
CALL scan_num      ;scan a number
MOV AX, CX

CMP CX, 0
JE notprime
CMP CX, 1
JE isprime

MOV BX, 1

checkprime:
    MOV AX, CX
    INC BX
    CMP BX, AX
    JE isprime
    DIV BX
    CMP DX, 0
    JZ notprime
    MOV DX, 0
    JMP checkprime
    
    
notprime:
    MOV AX, CX
    CALL pthis
    DB 13, 10, 0
    CALL print_num
    CALL pthis
    DB ' is not a prime', 0
    JMP exit    


isprime:
    MOV AX, CX
    CALL pthis
    DB 13, 10, 0
    CALL print_num
    CALL pthis
    DB ' is a prime number', 0
    
        
exit:    
RET


msg1 DB 'Enter the number: ', 0

define_scan_num
define_print_string
define_print_num
define_print_num_uns
define_pthis                

END