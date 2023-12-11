/*
 * mm-naive.c - The fastest, least memory-efficient malloc package.
 * 
 * NOTE TO STUDENTS: Replace this header comment with your own header
 * comment that gives a high level description of your solution.
 *
 * Structure of Heap
 * | Padding | Prologue Header | Prologue Footer | Block1 | Block2 | ... | Epilogue Header |
 *  Padding : 4 bytes
 *  Prologue Header : 4 bytes
 *  Prologue Footer : 4 bytes
 *  Block : min 16 bytes (header 4 bytes + payload 8 * n bytes + footer 4 bytes)
 *  Epilogue Header : 4 bytes
 *  - heap_list_p points to the between prologue header and prologue footer
 *  - Prologue Header, Prologue Footer, Epilogue Header are same as Block Header and Block Footer
 *
 * Structure of Block
 * | Header (4 bytes) | Payload | Footer (4 bytes) |
 *  Header : 4 bytes
 *  Payload : 8 * n bytes
 *  Footer : 4 bytes
 *  - Header and Footer contain size and allocation bit
 *  - Payload contains user data
 *  - block_p points to the payload of the block
 *  - Block Header and Block Footer are the same
 *
 * Structure of Block Header and Block Footer
 * | Size (29 bits) | Padding (2 bits) | Allocation bit (1 bit) |
 *  Size : 29 bits
 *  Padding : 2 bits
 *  Allocation bit : 1 bit
 *  - Size is the size of the block including header and footer
 *  - Allocation bit is 1 if the block is allocated, 0 if the block is free
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"

/*********************************************************
 * NOTE TO STUDENTS: Before you do anything else, please
 * provide your team information in the following struct.
 ********************************************************/
team_t team = {
		/* Team name */
		"EEE3540",
		/* First member's full name */
		"Raehyeon Jeong",
		/* First member's email address */
		"raehy19@yonsei.ac.kr",
		/* Second member's full name (leave blank if none) */
		"",
		/* Second member's email address (leave blank if none) */
		""
};

/* Constant */
/* Size of single word (4), double word (8), alignment (8) */
#define WSIZE      4  // Word and header/footer size (bytes)
#define DSIZE      8  // Double word size (bytes)
#define ALIGNMENT  8  // Alignment size (bytes)

/* Rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size)           (((size) + (ALIGNMENT-1)) & ~0x7)

/* Combine size and allocation bit into a word size data */
#define PACK(size, is_alloc)  ((size) | (is_alloc))

/* Put word size data into the address p */
#define PUT(p, val)           (*(unsigned int *)(p) = (unsigned int)(val))

/* Get word size data from the address p */
#define GET(p)                (*(unsigned int *)(p))

/* Get information of block from the header and footer */
// Get size of the block from the header and footer
#define GET_SIZE(p)           (GET(p) & ~0x7)
// Get allocation bit of the block : 1 if allocated, 0 if free
#define GET_ALLOC(p)          (GET(p) & 0x1)


/* heap_listp points to the prologue block */
static void *heap_list_p = NULL;  // Pointer to the first block

/*
 * Coalesce - Coalesce adjacent free blocks
 */
static void *coalesce(void *block_p) {
	size_t prev_size;  // Size of the previous block
	size_t curr_size;  // Size of the current block
	size_t next_size;  // Size of the next block

	// Coalesce if the previous block is free block
	while (!GET_ALLOC(block_p - 2 * WSIZE)) {

		// Get the size of the current block
		curr_size = GET_SIZE(block_p - WSIZE);

		// Get the size of the previous block
		prev_size = GET_SIZE(block_p - 2 * WSIZE);

		// Set the header of the previous block to the coalesced block
		PUT(block_p - prev_size - WSIZE, PACK(prev_size + curr_size, 0));

		// Set the footer of the current block to the coalesced block
		PUT(block_p + curr_size - 2 * WSIZE, PACK(prev_size + curr_size, 0));

		// Set block_p to point to the payload of the coalesced block
		block_p -= prev_size;
	}

	// Coalesce if the next block is free block
	while (!GET_ALLOC(block_p + GET_SIZE(block_p - WSIZE) - WSIZE)) {

		// Get the size of the current block
		curr_size = GET_SIZE(block_p - WSIZE);

		// Get the size of the next block
		next_size = GET_SIZE(block_p + curr_size - WSIZE);

		// Set the header of the current block to the coalesced block
		PUT(block_p - WSIZE, PACK(curr_size + next_size, 0));

		// Set the footer of the next block to the coalesced block
		PUT(block_p + curr_size + next_size - 2 * WSIZE, PACK(curr_size + next_size, 0));

		// Don't need to change block_p because it points to the payload of the current block
	}

	// Return the pointer to the coalesced block
	return (block_p);
}

/*
 * extend_heap - Extend heap with free block and return its block pointer
 */
static void *extend_heap(size_t size) {

	// Pointer to the extended block
	char *block_p;

	// Calculate size to extend heap and extend heap
	block_p = mem_sbrk(ALIGN(size) + 2 * WSIZE);

	// If mem_sbrk fails, return NULL
	if (block_p == (void *)(-1))
		return NULL;

	// Set header of the extended block
	PUT(block_p, PACK(size, 0));

	// Set footer of the extended block
	PUT(block_p + ALIGN(size) + WSIZE, PACK(size, 0));

	// Set epilogue header
	PUT(block_p + ALIGN(size) + 2 * WSIZE, PACK(0, 1));

	// Set block_p to point to the payload of the extended block
	block_p += WSIZE;

	// Coalesce if the previous block is free
	block_p = coalesce(block_p);

	// Return the pointer to the extended block
	return (block_p);
}


/*
 * mm_init - initialize the malloc package.
 */
int mm_init(void) {

	// Call sbrk for Size of 4 words
	// for padding, prologue header, prologue footer, epilogue header
	heap_list_p = mem_sbrk(4 * WSIZE);

	// If mem_sbrk fails, return -1
	if (heap_list_p == (void *)(-1))
		return (-1);

	// Set padding
	PUT(heap_list_p, 0);

	// Set prologue header
	PUT(heap_list_p + (1 * WSIZE), PACK(ALIGNMENT, 1));

	// Set prologue footer
	PUT(heap_list_p + (2 * WSIZE), PACK(ALIGNMENT, 1));

	// Set epilogue header
	PUT(heap_list_p + (3 * WSIZE), PACK(0, 1));

	// Set heap_list_p to point to the prologue block, between prologue header and prologue footer
	heap_list_p += (2 * WSIZE);

	// Extend the empty heap with a free block of MINIMUM size
	extend_heap(DSIZE);

	return 0;
}

/*
 * mm_malloc - Allocate a block by incrementing the brk pointer.
 *     Always allocate a block whose size is a multiple of the alignment.
 */
void *mm_malloc(size_t size) {

	int newsize = ALIGN(size + 2 * WSIZE);

	void *p = mem_sbrk(newsize);

	if (p == (void *)(-1))
		return NULL;
	else {
		*(size_t *)p = size;
		return (void *)((char *)p + WSIZE);
	}
}

/*
 * mm_free - Freeing a block does nothing.
 */
void mm_free(void *ptr) {

	// If ptr is NULL, no operation is performed.
	if (!ptr)
		return;

	// Check if ptr is valid
	if (ptr < mem_heap_lo() || ptr > mem_heap_hi())
		return;

	// Get the size of the block
	size_t size = GET_SIZE(ptr - WSIZE);

	// Set the header and footer of the block to free
	PUT(ptr - WSIZE, PACK(size, 0));


}

/*
 * mm_realloc - Implemented simply in terms of mm_malloc and mm_free
 */
void *mm_realloc(void *ptr, size_t size) {
	void *oldptr = ptr;
	void *newptr;
	size_t copySize;

	//
	newptr = mm_malloc(size);


	if (newptr == NULL)
		return NULL;
	copySize = *(size_t *)((char *)oldptr - WSIZE);
	if (size < copySize)
		copySize = size;
	memcpy(newptr, oldptr, copySize);
	mm_free(oldptr);
	return newptr;
}


int mm_check(void) {
	// Check if every adjacent free blocks are coalesced
	// Check if every free block actually exists in the free list
	// Check if heap_list_p points to valid address


	return (1);
}