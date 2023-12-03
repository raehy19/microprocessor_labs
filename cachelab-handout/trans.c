/* ************************************************************************** */
/* Student Name : Raehyeon Jeong                                              */
/* Student Id   : 2020142218                                                  */
/* Last Updated : 2023 Nov 20                                                 */
/* ************************************************************************** */

/*
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";

/*
 * Transpose function that transpose A to B
 * Divide matrix into specific size blocks and solve them step by step
 * To reduce the miss rate by maximize the spatial locality of the cache
 * Input Params : M, N == Size of Matrix, A, B == Matrix
 * Output Param : None
 */
void transpose_submit(int M, int N, int A[N][M], int B[M][N]) {
	int i, j, p, q, tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;

	// For Square Matrix, M = 32
	if (M == 32 && N == 32) {
		// Use 8 * 8 Block
		for (i = 0; i < N; i += 8) {
			for (j = 0; j < M; j += 8) {
				for (p = i; p < i + 8; ++p) {
					// Store A's data to tmp variables
					tmp0 = A[p][j + 0];
					tmp1 = A[p][j + 1];
					tmp2 = A[p][j + 2];
					tmp3 = A[p][j + 3];
					tmp4 = A[p][j + 4];
					tmp5 = A[p][j + 5];
					tmp6 = A[p][j + 6];
					tmp7 = A[p][j + 7];

					// Store tmp data to B
					B[j + 0][p] = tmp0;
					B[j + 1][p] = tmp1;
					B[j + 2][p] = tmp2;
					B[j + 3][p] = tmp3;
					B[j + 4][p] = tmp4;
					B[j + 5][p] = tmp5;
					B[j + 6][p] = tmp6;
					B[j + 7][p] = tmp7;
				}
			}
		}
	}
		// For Square Matrix, M = 64
	else if (M == 64 && N == 64) {
		// Use 8 * 8 Block
		for (i = 0; i < N; i += 8) {
			for (j = 0; j < M; j += 8) {
				// Move Top 4 * 8 first
				for (p = i; p < i + 4; ++p) {
					// Store A's data to tmp variables
					tmp0 = A[p][j + 0];
					tmp1 = A[p][j + 1];
					tmp2 = A[p][j + 2];
					tmp3 = A[p][j + 3];
					tmp4 = A[p][j + 4];
					tmp5 = A[p][j + 5];
					tmp6 = A[p][j + 6];
					tmp7 = A[p][j + 7];

					// Store tmp data to B (right place)
					B[j + 0][p] = tmp0;
					B[j + 1][p] = tmp1;
					B[j + 2][p] = tmp2;
					B[j + 3][p] = tmp3;

					// Store tmp data to B (wrong place (other side of diagonal line))
					B[j + 0][p + 4] = tmp7;
					B[j + 1][p + 4] = tmp6;
					B[j + 2][p + 4] = tmp5;
					B[j + 3][p + 4] = tmp4;
				}
				// Then Move Next 4 * 8
				for (q = 0; q < 4; ++q) {
					// Store A's data to tmp variables
					tmp0 = A[i + 4][j + 3 - q];
					tmp1 = A[i + 5][j + 3 - q];
					tmp2 = A[i + 6][j + 3 - q];
					tmp3 = A[i + 7][j + 3 - q];
					tmp4 = A[i + 4][j + 4 + q];
					tmp5 = A[i + 5][j + 4 + q];
					tmp6 = A[i + 6][j + 4 + q];
					tmp7 = A[i + 7][j + 4 + q];

					// Move B's stored value to right place
					B[j + 4 + q][i + 0] = B[j + 3 - q][i + 4];
					B[j + 4 + q][i + 1] = B[j + 3 - q][i + 5];
					B[j + 4 + q][i + 2] = B[j + 3 - q][i + 6];
					B[j + 4 + q][i + 3] = B[j + 3 - q][i + 7];

					// Store tmp data to B
					B[j + 3 - q][i + 4] = tmp0;
					B[j + 3 - q][i + 5] = tmp1;
					B[j + 3 - q][i + 6] = tmp2;
					B[j + 3 - q][i + 7] = tmp3;
					B[j + 4 + q][i + 4] = tmp4;
					B[j + 4 + q][i + 5] = tmp5;
					B[j + 4 + q][i + 6] = tmp6;
					B[j + 4 + q][i + 7] = tmp7;
				}
			}
		}
	}
		// For other Matrix
	else {
		// Use 18 * 18 Block
		for (i = 0; i < N; i += 18) {
			for (j = 0; j < M; j += 18) {
				for (p = i; p < N && p < i + 18; ++p) {
					for (q = j; q < M && q < j + 18; ++q) {
						// Store A's data to tmp variables
						tmp0 = A[p][q];

						// Store tmp data to B
						B[q][p] = tmp0;
					}
				}
			}
		}
	}
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";

void trans(int M, int N, int A[N][M], int B[M][N]) {
	int i, j, tmp;

	for (i = 0; i < N; i++) {
		for (j = 0; j < M; j++) {
			// Store A's data to tmp variables
			tmp = A[i][j];

			// Store tmp data to B
			B[j][i] = tmp;
		}
	}

}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions() {
	/* Register your solution function */
	registerTransFunction(transpose_submit, transpose_submit_desc);

	/* Register any additional transpose functions */
	registerTransFunction(trans, trans_desc);

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N]) {
	int i, j;

	for (i = 0; i < N; i++) {
		for (j = 0; j < M; ++j) {
			if (A[i][j] != B[j][i]) {
				return 0;
			}
		}
	}
	return 1;
}

