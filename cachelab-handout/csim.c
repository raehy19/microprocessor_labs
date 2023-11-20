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
}t_cache_info;

int help(int ret_val) {
	printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>\n");
	return (ret_val);
}

int main(int argc, char **argv) {
	int opt;
	FILE *f = 0;
	t_cache_info cache = (t_cache_info){0, 0, 0, 0, 0, NULL};

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
		return(help(1));
	}
	printf("%d %d %d\n", cache.num_of_set_index_bits, cache.line_per_set, cache.num_of_block_bits
	);
	printSummary(0, 0, 0);
	return 0;
}
