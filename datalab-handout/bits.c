/* 
 * CS:APP Data Lab 
 * 
 * < Raehyeon Jeong 2020142218 >
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
	  /* brief description of how your implementation works */
	  int var1 = Expr1;
	  ...
	  int varM = ExprM;

	  varJ = ExprJ;
	  ...
	  varN = ExprN;
	  return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
	  not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>

  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
	 cannot use arrays, structs, or unions.


  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting if the shift amount
	 is less than 0 or greater than 31.


EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
	 /* exploit ability of shifts to compute powers of 2 */
	 return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
	 /* exploit ability of shifts to compute powers of 2 */
	 int result = (1 << x);
	 result += 4;
	 return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implement floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants. You can use any arithmetic,
logical, or comparison operations on int or unsigned data.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
	 cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to
	 check the legality of your solutions.
  2. Each function has a maximum number of operations (integer, logical,
	 or comparison) that you are allowed to use for your implementation
	 of the function.  The max operator count is checked by dlc.
	 Note that assignment ('=') is not counted; you may use as many of
	 these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
	 header comment for each function. If there are any inconsistencies
	 between the maximum ops in the writeup and in this file, consider
	 this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
/* Copyright (C) 1991-2020 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses Unicode 10.0.0.  Version 10.0 of the Unicode Standard is
   synchronized with ISO/IEC 10646:2017, fifth edition, plus
   the following additions from Amendment 1 to the fifth edition:
   - 56 emoji characters
   - 285 hentaigana
   - 3 additional Zanabazar Square characters */

/*
 * bitNor - ~(x|y) using only ~ and & 
 *   Example: bitNor(0x6, 0x5) = 0xFFFFFFF8
 *   Legal ops: ~ &
 *   Max ops: 8
 *   Rating: 1
 */
int bitNor(int x, int y) {
	/*
	 * 	(~(x | y)) == (~x & ~y)
	 */
	return (~x & ~y);
}

/*
 * getByte - Extract byte n from word x
 *   Bytes numbered from 0 (least significant) to 3 (most significant)
 *   Examples: getByte(0x12345678,1) = 0x56
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int getByte(int x, int n) {
	/*
	 * 	(n << 3) == (n * 2^3) == (n * 8)
	 * 		: 1byte == 8bit, so need to bit shift 8 times per n
	 * 	(x >> (n << 3))
	 * 		: shift target 1byte(8bit) to LSB
	 * 	(x >> (n << 3) & 0xFF)
	 * 		: use & operator with 0xFF, to remove 3byte(24bit) from MSB
	 * 		  == get only 8 bit from LSB
	 * 		  ( 0xFF == 0b00000000000000000000000011111111 )
	 */
	return (x >> (n << 3) & 0xFF);
}

/*
 * bitMask - Generate a mask consisting of all 1's 
 *   lowbit and highbit
 *   Examples: bitMask(5,3) = 0x38
 *   Assume 0 <= lowbit <= 31, and 0 <= highbit <= 31
 *   If lowbit > highbit, then mask should be all 0's
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int bitMask(int highbit, int lowbit) {
	/*
	 * 	BIT_MAX == 0b11111111111111111111111111111111 == -1
	 *
	 * 	(2 << highbit) + BIT_MAX == (2 << highbit) - 1
	 * 		: mask bit to 1 : highbit ~ LSB
	 * 	(1 << lowbit) + BIT_MAX == (1 << lowbit) - 1
	 * 		: mask bit to 1 : (lowbit - 1)bit ~ LSB
	 * 	~((1 << lowbit) + BIT_MAX)
	 * 		: mask bit 1 : MSB ~ lowbit
	 * 	((2 << highbit) + BIT_MAX) & ~((1 << lowbit) + BIT_MAX)
	 * 		: get bit mask by executing BITWISE_AND(&) operation
	 */
	const int BIT_MAX = ~0;

	return (((2 << highbit) + BIT_MAX) & ~((1 << lowbit) + BIT_MAX));
}

/*
 * bang - Compute !x without using !
 *   Examples: bang(3) = 0, bang(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 */
int bang(int x) {
	/*
	 * 	If x == 0
	 * 		: x == 0, ~x == 0xFFFFFF, ~x + 1 == 0
	 * 		  so, ((~x + 1) | x)'s MSB == 0
	 * 	If x > 0
	 * 		:  x > 0, x's MSB == 0
	 * 		  ~x < 0, ~x + 1 < 0 (cause ~x + 1 == 0 only if x = 0),
	 * 		          (~x + 1)`s MSB == 1
	 * 		  so, ((~x + 1) | x)'s MSB == 1
	 * 	If x < 0
	 * 		: x < 0, x's MSB == 1
	 * 		  so, ((~x + 1) | x)'s MSB == 1
	 *
	 * 	((~x + 1) | x) >> 31 + 1
	 * 		: Machine performs right shifts arithmetically, so if
	 * 		  x == 0, ((~x + 1) | x) >> 31 == 0x00000000
	 * 		          ((~x + 1) | x) >> 31 + 1 == 0x00000000 + 1
	 * 		                                   == 1
	 * 		  x != 0, ((~x + 1) | x) >> 31 == 0xFFFFFFFF
	 * 		          ((~x + 1) | x) >> 31 + 1 == 0xFFFFFFFF + 1
	 * 		                                   == 0x00000000
	 * 		                                   == 0
	 */
	return ((((~x + 1) | x) >> 31) + 1);
}

/*
 * bitParity - returns 1 if x contains an odd number of 0's
 *   Examples: bitParity(5) = 0, bitParity(7) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 4
 */
int bitParity(int x) {
	/*
	 * 	With XOR(^) operation, for two calculated bit
	 * 		if there are odd number of 0's => return 1
	 * 		if there are even number of 0's => return 0
	 * 	So execute XOR operation for every bit by shifting right :
	 * 		16bit from LSB
	 * 		8bit from LSB
	 * 		4bit from LSB
	 * 		2bit from LSB
	 * 		1bit from LSB
	 * 	Then, the value of LSB is the result of bitParity
	 * 	To get only LSB value, execute BITWISE_AND(&) operation with 1
	 */
	x ^= (x >> 16);
	x ^= (x >> 8);
	x ^= (x >> 4);
	x ^= (x >> 2);
	x ^= (x >> 1);

	return (x & 1);
}

/*
 * TMax - return maximum two's complement integer 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmax(void) {
	/*
	 * 	Maximum two's complement integer in binary:
	 * 		0b01111111111111111111111111111111
	 * 	(1 << 31) ==
	 * 		0b10000000000000000000000000000000
	 * 	~(1 << 31) ==
	 * 		0b01111111111111111111111111111111
	 * 		== Maximum two's complement integer
	 */
	return (~(1 << 31));
}

/*
 * isNegative - return 1 if x < 0, return 0 otherwise 
 *   Example: isNegative(-1) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int isNegative(int x) {
	/*
	 * 	Signbit of integer is MSB
	 * 		if MSB == 1, negative integer
	 * 		if MSB == 0, positive integer
	 * 	So, value of MSB is the return value of isNegative
	 * 	To get only MSB value :
	 * 		execute Shift Right(>>) 31 times,
	 * 		then execute BITWISE_AND(&) operation with 1
	 */
	return ((x >> 31) & 1);
}

/*
 * fitsBits - return 1 if x can be represented as an 
 *  n-bit, two's complement integer.
 *   1 <= n <= 32
 *   Examples: fitsBits(5,3) = 0, fitsBits(-4,3) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int fitsBits(int x, int n) {
	/*
	 * 	For input integer x,
	 * 	execute Shift Left(<<) for (32 - n) bit,
	 * 	then execute Shift Right(>>) for (32 - n) bit
	 * 		this makes only n bit from LSB is valid
	 * 		(32 - n) == 32 + (~n + 1) == 33 + ~n
	 * 	Then compare original value and shifted value with XOR(^) operation
	 * 		if XOR result == 0,
	 * 			x can be represented as an n-bit, two's complement integer
	 * 		if XOR result != 0,
	 * 			x can't be represented as an n-bit, two's complement integer
	 * 	For expected the result, execute Not(!) operation with XOR result
	 */
	const int SHIFT = 33 + (~n);

	return !(x ^ ((x << SHIFT) >> SHIFT));
}

/*
 * dividePower2 - Compute x/(2^n), for 0 <= n <= 30
 *  Round toward zero
 *   Examples: dividePower2(15,1) = 7, dividePower2(-33,4) = -2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int dividePower2(int x, int n) {
	/*
	 * 	If x is positive, to compute x/(2^n), round toward zero,
	 * 		execute Shift Right(>>) operation on x by n
	 * 	If x is negative, to compute x/(2^n), round toward zero,
	 * 		execute Shift Right(>>) operation on x by n,
	 * 		but it round toward INT_MIN, not zero
	 * 			(because of Machine performs right shifts arithmetically)
	 * 		To correct this error,
	 * 			add (2^n - 1) to x, before executing Shift Right(>>) operation
	 * 	Correction value : ((x >> 31) & ((1 << n) + ~0))
	 * 		(x >> 31) : check if x negative, by sign bit (MSB)
	 * 		((1 << n) + ~0) : correction value, 2^n -1
	 */
	return ((x + ((x >> 31) & ((1 << n) + ~0))) >> n);
}

/*
 * conditional - same as x ? y : z 
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int conditional(int x, int y, int z) {
	/*
	 * 	To determine results, to condition x,
	 * 		execute two NOT(!) operation
	 * 			If condition is false, (!!x) == 0
	 * 			If condition is true, (!!x) == 1
	 * 	CONDITION_MASK
	 * 		If condition is false, CONDITION_MASK
	 * 			== (!!x) + ~0 == 0 - 1 == 0xFFFFFFFF
	 * 		If condition is true, CONDITION_MASK
	 * 			== (!!x) + ~0 == 1 - 1 == 0
	 * 	Execute BITWISE_AND(&) with CONDITION_MASK,
	 * 	then execute BITWISE_OR(|) for both results
	 */
	const int CONDITION_MASK = (!!x) + ~0;

	return ((y & ~CONDITION_MASK) | (z & CONDITION_MASK));
}

/*
 * ezThreeFourths - multiplies by 3/4 rounding toward 0,
 *   Should exactly duplicate effect of C expression (x*3/4),
 *   including overflow behavior.
 *   Examples: ezThreeFourths(11) = 8
 *             ezThreeFourths(-9) = -6
 *             ezThreeFourths(1073741824) = -268435456 (overflow)
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 3
 */
int ezThreeFourths(int x) {
	/*
	 * 	Multiply x by 3
	 * 		MUL_3 = x + (x << 1)
	 * 			== x + x * 2 == x * 3
	 * 	Divide MUL_3 by 4, rounding toward 0
	 * 		execute same operations of dividePower2
	 * 		(previous implemented function),
	 * 		which is n == 2
	 * 		(2^2 == 4)
	 */
	const int MUL_3 = x + (x << 1);

	return ((MUL_3 + ((MUL_3 >> 31) & ((1 << 2) + ~0))) >> 2);
}

/*
 * signMag2TwosComp - Convert from sign-magnitude to two's complement
 *   where the MSB is the sign bit
 *   Example: signMag2TwosComp(0x80000005) = -5.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 4
 */
int signMag2TwosComp(int x) {
	/*
	 * 	Only need to convert when x is negative => sign bit == 1
	 * 	Two's complement of x:
	 * 			make sign bit of x (MSB) to 0,
	 * 			then compute ~x + 1
	 * 	SIGN_MASK
	 * 		If x is positive, SIGN_MASK == 0x0
	 * 		If x is negative, SIGN_MASK == 0xFFFFFFFF
	 * 	Compute Two's complement when x is negative
	 * 		x &= ~(1 << 31)
	 * 			: make sign bit of x (MSB) to 0
	 * 		~x == x ^ 0xFFFFFFFF
	 * 		 1 == 0xFFFFFFFF & 1
	 */
	const int SIGN_MASK = x >> 31;
	x &= ~(1 << 31);
	return ((x ^ SIGN_MASK) + (SIGN_MASK & 1));
}

/*
 * floatAbsVal - Return bit-level equivalent of absolute value of f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument..
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 10
 *   Rating: 2
 */
unsigned floatAbsVal(unsigned uf) {
	/*
	 * 	Check NaN
	 * 		NaN : EXPONENT are all 1's, FRACTION != 0
	 * 		if NAN, return argument (uf)
	 * 	Compute ABS
	 * 		To change MSB to 0, execute BIT_AND(&) with 0x7FFFFFFF
	 */
	const unsigned EXPONENT = uf & 0x7F800000;
	const unsigned FRACTION = uf & 0x007FFFFF;

	if (EXPONENT == 0x7F800000 && FRACTION)
		return (uf);
	return (uf & (0x7FFFFFFF));
}

/*
 * floatFloat2Int - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int floatFloat2Int(unsigned uf) {
	return 2;
}

/*
 * floatScale4 - Return bit-level equivalent of expression 4*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned floatScale4(unsigned uf) {
	return 2;
}
