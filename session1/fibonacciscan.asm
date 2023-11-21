include emu8086.inc
                   


LEA SI,msg
CALL print_string
CALL scan_num

MOV AX,CX

MOV AX, 0
MOV BX, 1

CALL pthis
DB 10,1,"fibonacci :",0

fib:

CMP CX,0
JE END
MOV DX, BX
ADD BX, AX  
CALL print_num  
CALL pthis
DB " ",0
MOV AX, DX  

LOOP fib

END:
RET

msg DB "Enter the number: ",0

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS

END