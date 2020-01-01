/*
   Set r0 to hold 42 and exit
*/

.text

@we must declare _start as a global symbol available from outside this file
.global _start
_start:
   MOV   r0, #42    @exit code for program goes in r7	
					@  can be seen in linux once program exits by typing "echo $?"

   MOV   r7, #1     @r7 gets syscall code; 1 = exit on ARMLinux
   SWI 0            @trigger syscall
