/*
Demonstrates different ways of allocating strings in ARM
Standard:
.asciz : null (Zero) terminated string literal
Other ways:
.byte  : list of char literals
.ascii : string literal
*/

@"string" as list of bytes in string literal with automatic null terminator
myString:	.asciz  "Apple"

.byte 0xFF	@put pattern ff to show end of string
.align		@force word alignment before next


@"string" as list of bytes in string literal without a null terminator
myString2:	.ascii  "Apple"

.byte 0xFF	@put pattern ff to show end of string
.align		@force word alignment before next

.data
@"string" allocated as individual bytes 
myString3:	.byte   'A', 'p', 'p', 'l', 'e'

.byte 0xFF	@put pattern ff to show end of string
.align		@force word alignment before next
