/*
 * mm-naive.c - The fastest, least memory-efficient malloc package.
 * 
 * In this naive approach, a block is allocated by simply incrementing
 * the brk pointer.  A block is pure payload. There are no headers or
 * footers.  Blocks are never coalesced or reused. Realloc is
 * implemented directly using mm_malloc and mm_free.
 *
 * NOTE TO STUDENTS: Replace this header comment with your own header
 * comment that gives a high level description of your solution.
 *
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

	// Set heap_list_p to point to the prologue block
	heap_list_p += (2 * WSIZE);

	// Extend the empty heap with a free block of MINIMUM size
//	extend_heap();

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
