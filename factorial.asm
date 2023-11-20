INCLUDE 'emu8086.inc'
ORG 100h

LEA SI, msg1
CALL print_string     ;printing msg1

CALL scan_num         ;scan a number
MOV BX, CX

MOV AX, 1   ;resilt will be stored in ax

factorial:
           MUL CX
           LOOP factorial


CALL pthis
DB 13, 10, "Factorial of ", 0
XCHG AX, BX
CALL print_num
CALL pthis
DB " is: ", 0
XCHG AX, BX
CALL print_num

RET

msg1 DB "Enter a number: ", 0
define_print_string
define_scan_num
define_pthis
define_print_num
define_print_num_uns