
/******************************************************************************
* file: Min_Max.s
* author: G S Nitesh Narayana
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  This is the starter code for assignment 2
  */

  @ BSS section
      .bss

  @ DATA SECTION
      .data
data_items: .word 10, 4, 28, 100, 8, 0 ;@0 is used to terminate the data

  @ TEXT section
      .text

.globl _main


_main:
	LDR r1, =data_items; @store address of data_items in r1
	MOV r5, #0;          @ initializing r5 to 0 for counter
	LDR r3, [r1];		 @r3 carries min value, initializing it with 1st element
	LDR r4, [r1];		 @r4 carries max value, initializing it with 1st element
Loop:LDR r6, [r1];		 @Starting a loop, using r6 as temp variable that carries the values from array, load the value present in r1 location
	 CMP r6, #0;		 @compare the data with 0
	 BEQ END;			 @if 0, go to END and terminate the Loop
	 cmp r6, r3;         @compare the temp with r3(min value)
	 BGT s1;			 @if new temp value is greater then r3, skip updating the min value and jump to max compare(s1).
	 MOV r3, r6;         @if new value is smaller then r3, update r3 with new value
s1:  cmp r6, r4;		 @compare the temp with r4(max value)
	 BLT s2;           	 @if new temp value is smaller then r4, skip updating the max value and jump to s2.
	 MOV r4, r6;		 @if new value is greater then r4, update r4 with new value
s2:  ADD r5,r5, #1;		 @increment the number counter by 1
	 ADD r1,r1, #4;		 @increment the address by word size to access next data value
	 B Loop;			 @Loop till we find 0 in data and goto END
END:NOP
      
		@At the End
      	@r3 contain the Min value
      	@r4 contain the Max value
      	@r5 contain the size of input data excluding 0