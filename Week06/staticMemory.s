
.data
prompt:  .asciz   "Enter a number (0-255): "
answer:  .asciz   "00"

.text
_start:
   @Print prompt
   MOV   r0, #0         @0 : stdout (standard output stream)
   LDR   r1, =prompt
   SWI   0x69           @0x69 : write string to "file handle"

   @Read Integer expects file handle in r0, places result in r0
   MOV   r0, #1         @1 is the "file handle" for stdin (console input)
   SWI   0x6c           @0x6C = read integer

   MOV   r4, r0         @copy input value to r4
   AND   r5, r4, #0xF   @Get just last 4 bits (nibble) to r5
   AND   r6, r4, #0xF0  @Get next to last nibble to r6
   LSR   r6, r6, #4     @Shift r6 bits to end of word

   MOV   r0, r6         @copy next to last nibble bits to r0
   BL    getHexChar     @call getHexChar
   LDR   r1, =answer
   STRB  r0, [r1]       @put returned char at start of answer string

   MOV   r0, r5         @copy last nibble bits to r0
   BL    getHexChar     @call getHexChar
   LDR   r1, =answer  
   STRB  r0, [r1, #1]   @put returned char at second char of string

   MOV   r0, #0         @ 0 = stdout
   LDR   r1, =answer    @ 
   SWI   0x69           @0x69 : write string to stdout

   SWI   0x11           @Exit

/*
getHexChar
Gets hex char for a value in range 0-15

Params:
 r0 = number (expected to be 0-15)
Return:
 r0 = ascii value of corresponding hex digit
*/
getHexChar:
   @ONLY use registers r0-r3 to do my work, nothing to store
   LDR   r1, =hexCharLookup
   ADD   r1, r0      @add 0-15 bytes to r1
   LDRB  r0, [r1]    @get char stored at address [hexCharLookup + r0]

   @r0 has return value
   MOV   PC, LR      @return

@static storage allocated at start of program used by getHexChar:
.data
hexCharLookup:   .ascii   "0123456789ABCDEF"
