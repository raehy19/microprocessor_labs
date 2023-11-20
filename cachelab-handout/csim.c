/* ************************************************************************** */
/* Student Name : Raehyeon Jeong                                              */
/* Student Id   : 2020142218                                                  */
/* Last Updated : 2023 Nov 20                                                 */
/* ************************************************************************** */

/*
 * csim.c - cache simulation program
 *   used getopt function to parse command line argument
 *   used dynamic allocated 2d array for cache lines
 *   used fscanf function to read tracefile
 *   used time tic increase and timestamp for every cache access for LRU
 */

#include "cachelab.h"
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

/*
 * Struct that contains line(Cache Block) info
 */
typedef struct s_line {
	int valid;                     // valid bit
	int tag;                       // tag bits
	unsigned long long timestamp;  // last accessed time
}t_line;

/*
 * Struct that contains cache info
 */
typedef struct s_cache {
	int num_of_set_index_bits;   // Number of set index bits (s)
	int num_of_set;              // Number of set (S)
	int line_per_set;            // Number of lines per set (E)
	int num_of_block_bits;       // Number of block bits (b)
	int block_size;              // Block size (B)
	int hits;                    // Cache hits
	int misses;                  // Cache misses
	int evictions;               // Cache evictions
	unsigned long long time_tic; // time ticker
	t_line **lines;              // Cache lines
}t_cache;

/*
 * Function that print help message
 * Input Params : ret_val == return value
 * Output Param : None
 */
int help(int ret_val) {
	printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>\n");
	return (ret_val);
}

/*
 * Function that simulate Cache Access
 * Input Params : cache == cache info structure, mem_addr == memory address to access
 * Output Param : None
 */
void access_cache(t_cache *cache, unsigned long long mem_addr) {
	unsigned long long selected_set_idx;
	unsigned long long tag;

	// Increase time tic
	++cache->time_tic;

	// Calculate Set index to select
	// 1. Shift left by (tag bits)
	// 2. Shift right by (tag bits + block bits)
	// => only Set index bits left
	selected_set_idx = mem_addr << (64 - (cache->num_of_block_bits + cache->num_of_set_index_bits));
	selected_set_idx >>= (64 - cache->num_of_set_index_bits);

	// Calculate tag
	// Shift right by (set index bits + block bits)
	tag = mem_addr >> (cache->num_of_set_index_bits + cache->num_of_block_bits);

	// Find data in Cache
	for (int i = 0; i < cache->line_per_set; ++i) {

		// Cache Hit
		if (cache->lines[selected_set_idx][i].valid &&
			cache->lines[selected_set_idx][i].tag == tag) {

			// Increase Hit count
			++cache->hits;

			// Update last access time
			cache->lines[selected_set_idx][i].timestamp = cache->time_tic;
			return;
		}
	}

	// Cache Miss occurred
	// Increase Miss count
	++cache->misses;

	// Find empty line
	int replace_line_idx = 0;

	for (int i = 0; i < cache->line_per_set; ++i) {
		if (!cache->lines[selected_set_idx][i].valid)
			replace_line_idx = i;
	}

	// If empty line found, update data
	if (!cache->lines[selected_set_idx][replace_line_idx].valid) {
		cache->lines[selected_set_idx][replace_line_idx].valid = 1;
		cache->lines[selected_set_idx][replace_line_idx].tag = tag;
		cache->lines[selected_set_idx][replace_line_idx].timestamp = cache->time_tic;
		return;
	}

	// If there is no empty line
	unsigned long long min_timestamp = ULLONG_MAX;
	replace_line_idx = 0;

	// Find Least Recently Used line
	for (int i = 0; i < cache->line_per_set; ++i) {
		if (cache->lines[selected_set_idx][i].timestamp < min_timestamp) {
			replace_line_idx = i;
			min_timestamp = cache->lines[selected_set_idx][i].timestamp;
		}
	}

	// Cache Eviction occurred
	++cache->evictions;

	// Update data
	cache->lines[selected_set_idx][replace_line_idx].valid = 1;
	cache->lines[selected_set_idx][replace_line_idx].tag = tag;
	cache->lines[selected_set_idx][replace_line_idx].timestamp = cache->time_tic;
}

/*
 * Main function of program that simulate cache access with command line argument and trace file
 * Input Params : information about Cache, trace file
 * Output Param : exit code
 */
int main(int argc, char **argv) {
	int opt;
	FILE *f = 0;
	t_cache cache = (t_cache){0, 0, 0, 0, 0, 0, 0, 0, 0, NULL};

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

	// Check command line argument
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

	// Read trace file
	char command;
	unsigned long long mem_addr;
	int bsize;

	while (fscanf(f, " %c %llx,%d", &command, &mem_addr, &bsize) != EOF) {
		switch (command) {
			case 'L': {
				// Load data
				access_cache(&cache, mem_addr);
				break;
			}
			case 'M': {
				// Modify data (access cache twice)
				access_cache(&cache, mem_addr);
				access_cache(&cache, mem_addr);
				break;
			}
			case 'S': {
				// Store data
				access_cache(&cache, mem_addr);
				break;
			}
			default: {
				break;
			}
		}
	}

	// Print hit, miss, eviction count
	printSummary(cache.hits, cache.misses, cache.evictions);

	// Free allocated memory
	for (int i = 0; i < cache.num_of_set; ++i) {
		free(*((cache.lines) + i));
	}
	free(cache.lines);

	// Close file
	fclose(f);

	return (0);
}
