/*
   Write message to file "output.txt" using LinuxARM syscalls
*/

.data
   fileName:      .asciz  "output.txt"
   message:       .asciz  "Hello there"
   messageLength: .word   11

.text

.global _start
_start:
   MOV   r7, #5         @r7 gets syscall code; 5 = Open file
   LDR   r0, =fileName  @r0 gets address of file name
   LDR   r1, =01101     @r1 gets mode to open with
                        @     01101 : Octal for write/create/truncate
   LDR   r2, =0644      @r2 gets file permissions
                        @     0644  : read/write self, read others
   SWI 0                @trigger syscall

   MOV   r4, r0         @r4 = returned file handle

   MOV   r7, #4         @r7 gets syscall code; 4 = write file
   MOV   r0, r4         @r0 gets fileHandle to write to
   LDR   r1, =message   @r1 gets address of string to write
   LDR   r3, =messageLength   @get address of string length
   LDR   r2, [r3]       @r2 gets length to write
   SWI 0                @trigger syscall

   MOV   r7, #1         @r7 gets syscall code; 1 = exit
   SWI 0                @trigger syscall
