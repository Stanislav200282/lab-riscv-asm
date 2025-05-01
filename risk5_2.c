#include <stdio.h>

#define N 4
#define M 3

void process(int n, int m, int matrix[M][N], int *x, int *y)
{
    *x = 0;
    *y = 0;
    int max = matrix[0][0];
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            if (matrix[i][j] > max)
            {
                max = matrix[i][j];
                *x = i;
                *y = j;
            }
        }
    }

}

int main(int argc, char** argv)
{
    int matrix[M][N];
    

    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }
    int x = 0;
    int y = 1;
    process(N, M, matrix, &x,&y);

   
        printf("%d %d ", x,y);
    

    return 0;
}