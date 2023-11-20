/* ************************************************************************** */
/* Student Name : Raehyeon Jeong                                              */
/* Student Id   : 2020142218                                                  */
/* Last Updated : 2023 Nov 20                                                 */
/* ************************************************************************** */

/*
 * csim.c -
 *
 */


#include "cachelab.h"
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct s_line {
	int valid;        // valid bit
	int tag;          // tag bits
	int timestamp;    // time
}t_line;

typedef struct s_cache_info {
	int num_of_set_index_bits;  // Number of set index bits (s)
	int num_of_set;             // Number of set (S)
	int line_per_set;           // Number of lines per set (E)
	int num_of_block_bits;      // Number of block bits (b)
	int block_size;             // Block size (B)
	t_line **lines;             // Cache lines
}t_cache;

int help(int ret_val) {
	printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>\n");
	return (ret_val);
}

void access_cache(t_cache *cache, unsigned long long mem_addr) {
	unsigned long long selected_set_idx;
	unsigned long long tag;

	// Calculate Set index to select
	// 1. Shift left by (tag bits)
	// 2. Shift right by (tag bits + block bits)
	// => only Set index bits left
	selected_set_idx = mem_addr << (64 - (cache->num_of_block_bits + cache->num_of_set_index_bits));
	selected_set_idx >>= (64 - cache->num_of_set_index_bits);

	// Calculate tag
	// Shift right by (set index bits + block bits)
	tag = mem_addr >> (cache->num_of_set_index_bits + cache->num_of_block_bits);

	printf("set idx : %lld, tag : %lld\n", selected_set_idx, tag);
}

int main(int argc, char **argv) {
	int opt;
	FILE *f = 0;
	t_cache cache = (t_cache){0, 0, 0, 0, 0, NULL};

	// Parse command line argument
	while ((opt = getopt(argc, argv, "s:E:b:t:h")) != EOF) {
		switch (opt) {
			case 's':
				cache.num_of_set_index_bits = atoi(optarg);
				break;
			case 'E':
				cache.line_per_set = atoi(optarg);
				break;
			case 'b':
				cache.num_of_block_bits = atoi(optarg);
				break;
			case 't':
				if (!(f = fopen(optarg, "r")))
					return (help(1));
				break;
			case 'h':
				help(0);
				break;
			default:
				return (help(1));
		}
	}
	if (!cache.num_of_set_index_bits || !cache.line_per_set || !cache.num_of_block_bits || !f) {
		printf("./csim: Missing required command line argument\n");
		return (help(1));
	}

	// Calculate Variables
	cache.num_of_set = 1 << cache.num_of_set_index_bits;
	cache.block_size = 1 << cache.num_of_block_bits;

	// Allocate Cache Memory Space
	cache.lines = (t_line **)malloc(sizeof(t_line *) * cache.num_of_set);
	for (int i = 0; i < cache.num_of_set; ++i) {
		*((cache.lines) + i) = (t_line *)calloc(cache.line_per_set, sizeof(t_line));
	}

	char command;
	unsigned long long mem_addr;
	int bsize;

	while (fscanf(f, " %c %llx,%d", &command, &mem_addr, &bsize) != EOF) {
		switch (command) {
			case 'L': {
				access_cache(&cache, mem_addr);
				break;
			}
			case 'M': {
				access_cache(&cache, mem_addr);
				access_cache(&cache, mem_addr);
				break;
			}
			case 'S': {
				access_cache(&cache, mem_addr);
				break;
			}
			default: {
				break;
			}
		}
	}

	printf("%d %d %d\n", cache.num_of_set_index_bits, cache.line_per_set, cache.num_of_block_bits
	);


	printSummary(0, 0, 0);

	// close file
	fclose(f);

	return (0);
}
