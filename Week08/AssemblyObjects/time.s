/*
Demonstrates assembly level implementation of objects and member functions

This roughly models the Time class from ..\Time\main.cpp

Time class structure:
   12 bytes total space
      address - 8 : hour
      address - 4 : minute
      address - 0 : second

Stack in main:
-------------------------------
FramePointer
Relative
Address           Contents
-------------------------------
 -20              time2.hour
 -16              time2.minute
 -12              time2.second
 -8               time1.hour
 -4               time1.minute
 0                time1.second
*/

.text
_start:
   @allocate space on the stack for two Time objects
   SUB   fp, sp, #4        @fp will point to block of memory where two Times are
   SUB   sp, sp, #24       @allocate stack space for two Times
   @time1 will be at fp, time2 will be at fp+12

   @construct Time time1
   MOV   r0, fp            @load time1's address into r0
   BL    Time_Time

   @time1.setMinute(5)
   MOV   r0, fp            @load time1's address into r0
   MOV   r1, #5            @load 1st parameter into r1
   BL    Time_setMinute

   @r4 = time1.getMinute()
   MOV   r0, fp            @load time1's address into r0
   BL    Time_getMinute
   MOV   r4, r0

   @construct Time time2(22, 45, 10)
   SUB   r0, fp, #12       @load time2's address into r0
   MOV   r1, #22           @load 1st parameter into r1
   MOV   r2, #45           @load 2nd parameter into r2
   MOV   r3, #10           @load 3rd parameter into r3
   BL    Time_Time_int_int_int

   @time2.incrHour() x3
   SUB   r0, fp, #12       @load time2's address into r0
   BL    Time_incrHour     @22->23
   BL    Time_incrHour     @23->00
   BL    Time_incrHour     @00->1

   @r5 = time2.getHour()
   SUB   r0, fp, #12       @load time2's address into r0
   BL    Time_getHour
   MOV   r5, r0

   @deallocate stack space
   ADD   sp, sp, #24

   @exit
   SWI   0x11





/*
Time()
Condensed version... does not worry about building stack frame
Params:
   r0 = address of this
*/
Time_Time:
   @store any appropriate registers

   @r0 has address of this object
   MOV   r1, #0
   STR   r1, [r0, #0]   @this->second = 0
   STR   r1, [r0, #-4]  @this->minute = 0
   STR   r1, [r0, #-8]  @this->hour   = 0

   @restore stack/registers and return
   MOV   pc, lr



/*
Condensed version... does not worry about building stack frame
Time::Time(int h, int m, int s)
Params:
   r0 = address of this
   r1 = h
   r2 = m
   r3 = s
*/
Time_Time_int_int_int:
   @store any appropriate registers

   @r0 has address of this object
   STR   r3, [r0, #0]   @this->second = s
   STR   r2, [r0, #-4]  @this->minute = m
   STR   r1, [r0, #-8]  @this->hour   = h

   @restore stack/registers and return
   MOV   pc, lr


/*
Condensed version... does not worry about building stack frame
int Time::getMinute()
Params:
   r0 = address of this
*/
Time_getMinute:
   @store any appropriate registers

   @r0 has address of this object
   LDR   r1, [r0, #-4]  @r1 = this->minute

   @place return value in r0
   MOV   r0, r1

   @restore stack/registers and return
   MOV   pc, lr



/*
Full version including stack frame
void Time::setMinute(int m)
Params:
   r0 = address of this
   r1 = m

-------------------------------
FramePointer
Relative
Address           Contents
-------------------------------
 -12              m
 -8               this
 -4               old fp
 0                my lr
*/
/*
Time_setMinute:
   @@@ Prologue --------------------------------------------
   PUSH  {fp, lr}       @push necessary registers to stack
                        @if we were using r4+ would need to push those too
                        @sp ends up 4 bytes into stack frame

   ADD   fp, sp, #4     @set frame pointer to top of frame

   SUB   sp, sp, #8     @move stack pointer down 8 bytes
                        @allocates space for this and m

   STR   r0, [fp, #-8]  @store r0 to location reserved for this
   STR   r1, [fp, #-12] @store r1 to location reserved for m

   @@@ Body --------------------------------------------

   LDR   r0, [fp, #-8]  @load address of this to r0
   LDR   r1, [fp, #-12] @load m to r1
   @r0 has &this, min is 4 bytes in from that address
   STR   r1, [r0, #-4]  @this->minute = r1

   @@@ Epilog --------------------------------------------
   ADD   sp, sp, #8     @move stack pointer up to remove 8 bytes and
                        @releases space for this and m
   POP   {fp, lr}       @restore all registers
                        @if we were using r4+ would need to pop those too
   MOV   PC, LR
*/

/*
Condensed version... does not worry about building stack frame
void Time::setMinute(int m)
Params:
   r0 = address of this
   r1 = m
*/
Time_setMinute:
   @store any appropriate registers

   @r0 has address of this object, minute is 4 bytes into this
   STR   r1, [r0, #-4]  @this->minute = r1

   @restore stack/registers and return
   MOV   pc, lr


/*
Condensed version... does not worry about building stack frame
void Time::incrHour()
Params:
   r0 = address of this
*/
Time_incrHour:
   @store any appropriate registers

   @r0 has address of this object
   LDR   r1, [r0, #-8]  @r1 = this->hour

   @update hour
   ADD   r1, r1, #1
   CMP   r1, #24        @check if == 24
   MOVEQ r1, #0         @if so, roll over to 0

   @store back to memory
   STR   r1, [r0, #-8]  @this->hour = r1

   @restore stack/registers and return
   MOV   pc, lr


/*
Condensed version... does not worry about building stack frame
int Time::getHour()
Params:
   r0 = address of this
*/
Time_getHour:
   @store any appropriate registers

   @r0 has address of this object
   LDR   r1, [r0, #-8]  @r1 = this->hour

   @place return value in r0
   MOV   r0, r1

   @restore stack/registers and return
   MOV   pc, lr
