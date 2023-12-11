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
 *  Block : min 24 bytes (header 4 bytes + payload 8 * n bytes + footer 4 bytes) (n >= 1)
 *  Epilogue Header : 4 bytes
 *  - heap_list_p points to the between prologue header and prologue footer
 *  - Prologue Header, Prologue Footer, Epilogue Header are same as Block Header and Block Footer
 *
 * Structure of Block
 * | Header (4 bytes) | Payload | Footer (4 bytes) |
 *  Header : 4 bytes
 *  Payload : 8 * n bytes (n >= 1)
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
 * Structure of Free Block
 * | Header | Previous free block pointer | Next free block pointer | (Payload) | Footer |
 *  Header : 4 bytes
 *  Previous free block pointer : 8 bytes
 *  Next free block pointer : 8 bytes
 *  Payload : 8 * n bytes (n >= 0)
 *  Footer : 4 bytes
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

/* Minimum heap extension size */
#define CHUNKSIZE  (1 << 12)  // Extend heap by this amount (bytes)


/* Macro */

/* Maximum of two numbers */
#define MAX(x, y) (x > y ? x : y)

/* Rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size)           (((size) + (ALIGNMENT-1)) & ~0x7)

/* Combine size and allocation bit into a word size data */
#define PACK(size, is_alloc)  ((size) | (is_alloc))

/* Put word size data into the address p */
#define PUT(p, val)           (*(unsigned int *)(p) = (unsigned int)(val))

/* Get word size data from the address p */
#define GET(p)                (*(unsigned int *)(p))

/* Put double word size data into the address p */
#define PUTD(p, val)          (*(unsigned long *)(p) = (unsigned long)(val))

/* Get double word size data from the address p */
#define GETD(p)               (*(unsigned long *)(p))


/* Get information of block from the header and footer */

// Get size of the block from the header and footer
#define GET_SIZE(p)           (GET(p) & ~0x7)

// Get allocation bit of the block : 1 if allocated, 0 if free
#define GET_ALLOC(p)          (GET(p) & 0x1)

/* Get information of block from the current block pointer */

// Get the address of the header of the current block
#define CURR_HDRP(bp)         ((char *)(bp) - WSIZE)

// Get the address of the footer of the current block
#define CURR_FTRP(bp)         ((char *)(bp) + GET_SIZE(CURR_HDRP(bp)) - DSIZE)

// Get the address of the payload of the next block
#define NEXT_BP(bp)           ((char *)(bp) + GET_SIZE(CURR_HDRP(bp)))

// Get the address of the header of the next block
#define NEXT_HDRP(bp)         ((char *)(bp) + GET_SIZE(CURR_HDRP(bp)) - WSIZE)

// Get the address of the footer of the next block
#define NEXT_FTRP(bp)         ((char *)(bp) + GET_SIZE(CURR_HDRP(bp)) + GET_SIZE(NEXT_HDRP(bp)) - DSIZE)

// Get the address of the footer of the previous block
#define PREV_FTRP(bp)         ((char *)(bp) - DSIZE)

// Get the address of the payload of the previous block
#define PREV_BP(bp)           ((char *)(bp) - GET_SIZE(PREV_FTRP(bp)))

// Get the address of the header of the previous block
#define PREV_HDRP(bp)         ((char *)(bp) - GET_SIZE(PREV_FTRP(bp)) - WSIZE)

// Get the pointer which contians address of the next free block
#define NEXT_FREEP(bp)        ((char *)(bp) + DSIZE)

// Get the pointer which contians address of the previous free block
#define PREV_FREEP(bp)        ((char *)(bp))

// Get the address of the previous free block
#define PREV_FREE_BP(bp)    ((char *)GETD((char *)(bp)))

// Get the address of the next free block
#define NEXT_FREE_BP(bp)    ((char *)GETD((char *)(bp) + DSIZE))


/* heap_listp points to the prologue block */
static void *heap_list_p = NULL;  // Pointer to the first block

/* first_free_p points to the first free block */
static void *first_free_p = NULL;  // Pointer to the first free block

/* Function prototypes */

int mm_init(void);

void *mm_malloc(size_t size);

void mm_free(void *ptr);

void *mm_realloc(void *ptr, size_t size);

int mm_check(void);

/* Function prototypes for internal helper routines */

static void *coalesce(void *block_p);

static void *extend_heap(size_t size);

static void *find_best_fit(size_t size);

static void place(void *block_p, size_t size);

static void link_next_free_block(void *curr_free_block_p, void *next_free_block_p);

static void relink_prev_next_free_block(void *curr_free_block_p);


/*
 * mm_init - initialize the malloc package.
 */
int mm_init(void) {

	// Call sbrk for Size of 4 words
	// for padding, prologue header, prologue footer, epilogue header
	heap_list_p = mem_sbrk(4 * WSIZE);

	// Set first_free_p to NULL
	first_free_p = NULL;

	// If mem_sbrk fails, return -1
	if (heap_list_p == (void *)(-1))
		return (-1);

	// Set padding
	PUT(heap_list_p, 0);

	// Set prologue header
	PUT(heap_list_p + (1 * WSIZE), PACK(DSIZE, 1));

	// Set prologue footer
	PUT(heap_list_p + (2 * WSIZE), PACK(DSIZE, 1));

	// Set epilogue header
	PUT(heap_list_p + (3 * WSIZE), PACK(0, 1));

	// Set heap_list_p to point to the prologue block, between prologue header and prologue footer
	heap_list_p += (DSIZE);

	// Extend the empty heap with a free block of CHUNKSIZE bytes
	extend_heap(CHUNKSIZE);

	return 0;
}


/*
 * mm_malloc - Allocate a block by incrementing the brk pointer.
 *     Always allocate a block whose size is a multiple of the alignment.
 */
void *mm_malloc(size_t size) {
	size_t new_size;
	void *block_p;

	// Initialize heap_list_p if it is NULL
	if (heap_list_p == NULL) {
		mm_init();
	}

	// If size is 0, return NULL
	if (!size)
		return NULL;

	// Calculate new_size to include header and footer
	// minimum size is 24 bytes
	// - add DSIZE because the size of the block includes header and footer
	// - 2 * 8 byte payload : previous free block pointer and next free block pointer
	new_size = MAX(ALIGN(size) + DSIZE, 3 * DSIZE);


	// Search for best fit block
	block_p = find_best_fit(new_size);

	// If there is no enough size free block, extend heap
	if (!block_p) {
		block_p = extend_heap(MAX(new_size, CHUNKSIZE));

		if (!block_p)
			return (NULL);
	}

	// If there is best fit block
	place(block_p, new_size);

	// Return the pointer to the payload of the allocated block
	return (block_p);
}


/*
 * mm_free - Freeing a block does nothing.
 */
void mm_free(void *ptr) {
	size_t size;

	// If ptr is NULL, no operation is performed.
	if (!ptr)
		return;

	// Get the size of the block
	size = GET_SIZE(CURR_HDRP(ptr));

	// Set the header of the block to free
	PUT(CURR_HDRP(ptr), PACK(size, 0));

	// Set the footer of the block to free
	PUT(CURR_FTRP(ptr), PACK(size, 0));

	// Coalesce
	coalesce(ptr);
}

/*
 * mm_realloc - Implemented simply in terms of mm_malloc and mm_free
 */
void *mm_realloc(void *ptr, size_t size) {
	size_t old_block_size;
	size_t new_block_size;
	void *new_ptr;

	// If ptr is NULL, the call is equivalent to mm_malloc(size)
	if (!ptr)
		return mm_malloc(size);

	// If size is 0, the call is equivalent to mm_free(ptr)
	if (!size) {
		mm_free(ptr);
		return NULL;
	}

	// Check if ptr is valid
	if (ptr < mem_heap_lo() || ptr > mem_heap_hi()) {
		return NULL;
	}

	// Allocate new block
	new_ptr = mm_malloc(size);

	// If mm_malloc fails, return NULL
	if (!new_ptr) {
		return NULL;
	}

	// Copy data from old block to new block
	// Copy the smaller size of the old block and the new block
	// - add DSIZE because the size of the block includes header and footer
	old_block_size = GET_SIZE(CURR_HDRP(ptr));
	new_block_size = ALIGN(size) + DSIZE;

	if (old_block_size < new_block_size) {
		memcpy(new_ptr, ptr, old_block_size - DSIZE);
	} else {
		memcpy(new_ptr, ptr, new_block_size - DSIZE);
	}

	// Free old block
	mm_free(ptr);

	// Return the pointer to the new block
	return (new_ptr);
}


int mm_check(void) {
	// Check if every adjacent free blocks are coalesced
	// Check if every free block actually exists in the free list
	// Check if heap_list_p points to valid address

	void *block_p;

	// Check if ptr is valid
	if (block_p < mem_heap_lo() || block_p > mem_heap_hi() || (size_t)block_p % 8 != 0)
		return 0;


	printf("heap_list_p : %p\n", heap_list_p);
	block_p = heap_list_p;

	printf("all blocks\n");
	printf("--------------------\n");
	while (GET_SIZE(CURR_HDRP(block_p))) {
		printf("block_p      : %p\n", block_p);
		printf("is allocated : %d\n", GET_ALLOC(CURR_HDRP(block_p)));
		printf("size         : %d\n", GET_SIZE(CURR_HDRP(block_p)));
		block_p = NEXT_BP(block_p);
	}
	printf("--------------------\n");


	return (1);
}

/*
 * Coalesce - Coalesce adjacent free blocks
 */
static void *coalesce(void *block_p) {

	size_t prev_alloc;
	size_t next_alloc;
	size_t size;

	// Get the allocation bit of the previous block
	prev_alloc = GET_ALLOC(PREV_FTRP(block_p));

	// Get the allocation bit of the next block
	next_alloc = GET_ALLOC(NEXT_HDRP(block_p));

	// Get the size of the current block
	size = GET_SIZE(CURR_HDRP(block_p));

	// If the previous block and the next block are allocated
	if (prev_alloc && next_alloc) {

		// Set the previous free block pointer of the current block to NULL
		PUTD(PREV_FREEP(block_p), NULL);

		// Set the next free block pointer of the current block to NULL
		PUTD(NEXT_FREEP(block_p), NULL);

		// Set the pointer to the first free block to the current block
		if (first_free_p) {
			PUTD(PREV_FREEP(first_free_p), block_p);
			PUTD(NEXT_FREEP(block_p), first_free_p);
		}
		first_free_p = block_p;
	}

		// If the previous block is allocated and the next block is free
	else if (prev_alloc && !next_alloc) {

		// Get the size of the next block
		size += GET_SIZE(NEXT_HDRP(block_p));

		// Relink the previous free block and the next free block of the next block
		relink_prev_next_free_block(NEXT_BP(block_p));

		// Set the previous free block pointer of the current block to NULL
		PUTD(PREV_FREEP(block_p), NULL);


		if (NEXT_BP(block_p) == first_free_p) {

			PUTD(NEXT_FREEP(block_p), NEXT_FREE_BP(NEXT_BP(block_p)));

			if (NEXT_FREE_BP(NEXT_BP(block_p))) {
				PUTD(PREV_FREEP(NEXT_FREE_BP(NEXT_BP(block_p))), block_p);
			}

		}

		else {
			// Set the next free block pointer of the current block to NULL
			PUTD(NEXT_FREEP(block_p), first_free_p);

			// first_free_p is not NULL
			PUTD(PREV_FREEP(first_free_p), block_p);


		}


		// Set the header of the current block to free
		PUT(CURR_HDRP(block_p), PACK(size, 0));

		// Set the footer of the current block to free
		PUT(CURR_FTRP(block_p), PACK(size, 0));

	}

		// If the previous block is free and the next block is allocated
	else if (!prev_alloc && next_alloc) {

		// Get the size of the previous block
		size += GET_SIZE(PREV_FTRP(block_p));

		// Relink the previous free block and the next free block of the previous block
		relink_prev_next_free_block(PREV_BP(block_p));

		// Set the header of the previous block to free
		PUT(PREV_HDRP(block_p), PACK(size, 0));

		// Set the footer of the current block to free
		PUT(CURR_FTRP(block_p), PACK(size, 0));

		// Set the pointer to the current block to the previous block
		block_p = PREV_BP(block_p);
	}

		// If the previous block and the next block are free
	else {
		// Get the size of the previous block
		size += GET_SIZE(PREV_FTRP(block_p));

		// Get the size of the next block
		size += GET_SIZE(NEXT_HDRP(block_p));

		if (PREV_BP(block_p) != first_free_p && NEXT_BP(block_p) != first_free_p) {
			// Relink the previous free block and the next free block of the previous block
			relink_prev_next_free_block(PREV_BP(block_p));

			// Relink the previous free block and the next free block of the next block
			relink_prev_next_free_block(NEXT_BP(block_p));

		} else if (PREV_BP(block_p) == first_free_p && NEXT_BP(block_p) !=



		// Set the header of the previous block to free
		PUT(PREV_HDRP(block_p), PACK(size, 0));

		// Set the footer of the next block to free
		PUT(NEXT_FTRP(block_p), PACK(size, 0));

		// Set the pointer to the current block to the previous block
		block_p = PREV_BP(block_p);
	}

	return (block_p);
}

/*
 * extend_heap - Extend heap with free block and return its block pointer
 */
static void *extend_heap(size_t size) {

	// Pointer to the extended block
	char *block_p;

	// Calculate size to extend heap and extend heap
	block_p = mem_sbrk(ALIGN(size) + DSIZE);


	// If mem_sbrk fails, return NULL
	if (block_p == (void *)(-1)) {
		return NULL;
	}

	// Set header of the extended block
	PUT(CURR_HDRP(block_p), PACK(ALIGN(size + DSIZE), 0));

	// Set footer of the extended block
	PUT(CURR_FTRP(block_p), PACK(ALIGN(size + DSIZE), 0));

	// Set epilogue header
	PUT(NEXT_HDRP(block_p), PACK(0, 1));

	// Coalesce if the previous block is free
	block_p = coalesce(block_p);

	// Return the pointer to the extended block
	return (block_p);
}

/*
 * find_best_fit - Find the best fit block
 */
static void *find_best_fit(size_t size) {

	void *best_fit_p;
	void *block_p;
	size_t best_fit_size;
	size_t block_size;

	// Initialize block_p to point to the first free block
	block_p = first_free_p;

	// Initialize best_fit_p to NULL
	best_fit_p = NULL;

	// Initialize best_fit_size to 0
	best_fit_size = 0;

	// Search for the best fit block
	while (block_p) {
		block_size = GET_SIZE(CURR_HDRP(block_p));

		if (block_size >= size) {

			if (best_fit_size == 0 || block_size < best_fit_size) {
				best_fit_p = block_p;
				best_fit_size = block_size;
			}

			if (block_size == size) {
				break;
			}
		}
		block_p = NEXT_FREE_BP(block_p);
	}

	// Return the pointer to the best fit block
	return (best_fit_p);
}

static void place(void *block_p, size_t size) {
	char *remaining_block_p;
	size_t block_size;
	char *next_free_p;
	char *prev_free_p;

	// Get the size of the block
	block_size = GET_SIZE(CURR_HDRP(block_p));

	// Get the pointer to the next free block
	next_free_p = NEXT_FREEP(block_p);

	// Get the pointer to the previous free block
	prev_free_p = PREV_FREEP(block_p);

	// If block size is bigger than size + 24
	// Split the block
	if (block_size >= size + 3 * DSIZE) {
		remaining_block_p = NEXT_BP(block_p);

		// Initialize the previous free block pointer of the remaining block to NULL
		PUTD(PREV_FREEP(remaining_block_p), NULL);

		// Initialize the next free block pointer of the remaining block to NULL
		PUTD(NEXT_FREEP(remaining_block_p), NULL);

		// If the block is not the last free block
		if (next_free_p) {
			PUTD(PREV_FREEP(next_free_p), remaining_block_p);
			PUTD(NEXT_FREEP(remaining_block_p), next_free_p);
		}

		// If the block is not the first free block
		if (prev_free_p) {
			PUTD(PREV_FREEP(remaining_block_p), prev_free_p);
			PUTD(NEXT_FREEP(prev_free_p), remaining_block_p);
		}


		// Set the header of the block to allocated
		PUT(CURR_HDRP(block_p), PACK(size, 1));

		// Set the footer of the block to allocated
		PUT(CURR_FTRP(block_p), PACK(size, 1));

		// Set the header of the remaining free block
		PUT(CURR_FTRP(remaining_block_p), PACK(block_size - size, 0));

		// Set the footer of the remaining free block
		PUT(CURR_HDRP(remaining_block_p), PACK(block_size - size, 0));

	}
		// If the block size is smaller than size + 24
		// Use the whole block
	else {

		// Set the header of the block to allocated
		PUT(CURR_HDRP(block_p), PACK(block_size, 1));

		// Set the footer of the block to allocated
		PUT(CURR_FTRP(block_p), PACK(block_size, 1));


		// Remove the block from the free list
		// If the block is the first free block
		if (!next_free_p && !prev_free_p) {
			first_free_p = NULL;

		}
			// If the block is the last free block
		else if (!next_free_p) {
			PUTD(PREV_FREEP(next_free_p), prev_free_p);

		}
			// If the block is the first free block
		else if (!prev_free_p) {
			PUTD(NEXT_FREEP(prev_free_p), next_free_p);

		}
			// If the block is in the middle of the free list
		else {
			PUTD(NEXT_FREEP(prev_free_p), next_free_p);
			PUTD(PREV_FREEP(next_free_p), prev_free_p);
		}

	}
}


static void link_next_free_block(void *curr_free_block_p, void *next_free_block_p) {
	// If the next free block exists
	if (next_free_block_p) {
		// Set the previous free block pointer of the next free block to the current free block
		PUTD(PREV_FREEP(next_free_block_p), curr_free_block_p);
	}

	// Set the next free block pointer of the current free block to the next free block
	PUTD(NEXT_FREEP(curr_free_block_p), next_free_block_p);
}

static void relink_prev_next_free_block(void *curr_free_block_p) {
	void *prev_free_block_p;
	void *next_free_block_p;

	// Get the pointer to the previous free block
	prev_free_block_p = PREV_FREE_BP(curr_free_block_p);

	// Get the pointer to the next free block
	next_free_block_p = NEXT_FREE_BP(curr_free_block_p);

	// If the previous free block exists
	if (prev_free_block_p) {
		// Set the next free block pointer of the previous free block to the next free block
		PUTD(NEXT_FREEP(prev_free_block_p), next_free_block_p);
	}

	// If the next free block exists
	if (next_free_block_p) {
		// Set the previous free block pointer of the next free block to the previous free block
		PUTD(PREV_FREEP(next_free_block_p), prev_free_block_p);
	}
}

