/*
Demonstrates storing/loading register data to the stack manually
using the stack pointer and STR/LDR
*/
.text 
.global _start
_start:
@Some initial values
MOV   r1, #0xAA
MOV   r2, #0xBB
MOV   r3, #0xCC

@Store r1 to the stack
SUB   sp, sp, #4     @Move stack pointer down 4 bytes
STR   r1, [sp]       @Copy r1 to that address

@Store r2 to the stack
SUB   sp, sp, #4     @Move stack pointer down 4 bytes
STR   r2, [sp]       @Copy r2 to that address

@Wipe out registers
MOV   r1, #0x0
MOV   r2, #0x0

@r2 is at the top of the stack, it must be removed before r1
LDR   r2, [sp]       @Restore r2 from stack
ADD   sp, sp, #4     @Move stack pointer up 4 bytes

@restore r1 from stack and remove it
LDR   r1, [sp]       @Restore r1 from stack
ADD   sp, sp, #4     @Move stack pointer up 4 bytes

@Store r3 to the stack
SUB   sp, sp, #4     @Move stack pointer down 4 bytes
STR   r3, [sp]       @Copy r2 to that address

end:
B     end