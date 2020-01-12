/*
   Demonstrates using floating point hardware to
   calculate area of circle with given radius - floor to next lowest int
*/

.data
PI:            .double    3.1415928
radius:        .word    5

.text
_start:
   LDR            r1, =radius    @load &radius
   LDR            r1, [r1]       @load value as int
   MUL            r2, r1, r1     @r2 = r^2 as int

   VMOV           s1, r2         @floating point register s1 gets bits from r2
   VCVT.f64.s32   d0, s1         @convert Signed 32bit int value in s1
                                 @     to Floating pt 64bit value in double register d0

   LDR            r3, =PI        @load &PI
   VLDR.f64       d1, [r3]       @load PI as 64bit float into double register d1

   VMUL.f64       d2, d0, d1     @d2 = r^2 * PI in 64bit float math

   VCVT.s32.f64   s6, d2         @convert 64bit float value in d0
                                 @     to signed int 32 bit value in s6

   VMOV           r8, s6         @copy bits from s6 to normal r8 register

end:
   B              end