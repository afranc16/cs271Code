/*
   Write a string to stdout using LinuxARM syscalls
*/

.data
   message:   .asciz "Hello World\n"
.align

.text

.global _start

_start:
   MOV   r7, #4         @r7 gets syscall code; 4 = write string
   MOV   r0, #1         @r0 gets fileHandle to write to; 1 = stdout
   LDR   r1, =message   @r1 gets address of string to write
   MOV   r2, #12        @r2 gets length of string
   SWI 0                @trigger syscall

   MOV   r7, #1         @r7 gets syscall code; 1 = exit
   SWI 0                @trigger syscall
