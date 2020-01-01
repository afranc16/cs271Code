/*
   Read a line of input and repeat it using LinuxARM syscalls
*/

.data
buffer:  .space 20   @space for 20 bytes of input - will be 0 initialized
.align

.text

.global _start
_start:
   @read in a line of input from console
   MOV   r7, #3      @r7 gets syscall code; 3 = read file
   MOV   r0, #0      @r0 gets fileHandle to read from; 0 = stdin
   LDR   r1, =buffer @r1 gets address to read data into
   MOV   r2, #20     @r2 gets max length to read
   SWI 0             @trigger syscall

   MOV   r4, r0      @copy number of bytes read into r4

writeOut:
   @write it out
   MOV   r7, #4      @r7 gets syscall code; 4 = write file
   MOV   r0, #1      @r0 gets fileHandle to write to
   LDR   r1, =buffer @r1 gets address of string to write
   MOV   r2, r4      @r2 gets length to write
   SWI 0             @trigger syscall


   MOV   r7, #1      @r7 gets syscall code; 1 = exit
   SWI 0             @trigger syscall
