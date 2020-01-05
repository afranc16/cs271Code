/*
Demonstrates using the stack to store register values
*/
.text 
.global _start
_start:
@Some initial values
MOV   r1, #0xAA
MOV   r2, #0xBB
MOV   r3, #0xCC

@Store to stack using PUSH
PUSH  {r1, r2, r3}

@Wipe out registers
MOV   r1, #0x0
MOV   r2, #0x0
MOV   r3, #0x0

@POP Removes from stack in back to front order. Sample below
@     removes top of stack into r3, next word into r2, next word into r1
POP   {r1, r2, r3}

end:  B     end