/*
Demonstrates interleaved sections

All .text will be at start of memory
All .data will appear after end of text section
*/

.data   @or .section .data
.word   0xFFFFFFFF


.text   @or .section .text
MOV   r0, r0      @Do nothing
MOV   r1, r1      @Do nothing

.data   @More data
.word   0xDDDDDDDD

.text   @more code
MOV   r2, r2      @Do nothing
MOV   r3, r3      @Do nothing

SWI   0x11        @halt
