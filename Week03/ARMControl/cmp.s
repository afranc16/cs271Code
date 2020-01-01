
_start:
   MOV     r1, #10         @load x's address

   CMP     r1, #20         @do r1 - 20, set result bits
   @result bits are now 0x8 or 0b1000 : only Negative is set

   CMP     r1, #2          @do r1 - 2, set result bits
   @result bits are now 0x2 or 0b0010 : only carry bit was set
   
   CMP     r1, #10         @do r1 - 10, set result bits
   @result bits are now 0x6 or 0b0110 : carry and zero bits are set