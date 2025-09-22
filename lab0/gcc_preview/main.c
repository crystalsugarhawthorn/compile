#include <stdio.h>
#include <time.h>

int main() {
    int i, j, n;
    long long sum = 0; 

    clock_t start, end;
    double cpu_time_used;

    printf("Enter a large integer (e.g., 40000): ");
    scanf("%d", &n);

    start = clock();

    // ---- 主要计算部分：替换为计算密集型任务 ----
    // 使用双重循环，总共执行 n * n 次计算
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            sum += (i * j) % 100;
        }
    }

    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("Result (sum): %lld\n", sum);
    printf("Calculation took %f seconds to execute\n", cpu_time_used);

    return 0;
}