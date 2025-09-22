# 文件名: fibonacci_and_computation.s
# RISC-V 64 汇编实现，对应 SysY 复杂版斐波那契计算程序。

.data
prompt_n:      .string "请输入一个整数 n：\n"
result_rec:    .string "递归 Fibonacci 结果："
result_iter:   .string "迭代 Fibonacci 结果："
extra_intro:   .string "额外数值运算演示：\n"
add_label:     .string "n + 5 = "
sub_label:     .string "n - 3 = "
mul_label:     .string "n * 2 = "
div_label:     .string "n / 2 = "
mod_label:     .string "n %% 2 = "

.text
.globl getint
.globl putint
.globl putch
.globl putf
.globl main

# =========================
# fibonacci_recursive
# =========================
fibonacci_recursive:
    # --- BEGIN MODIFICATION ---
    addi sp, sp, -24      # 栈分配 24 字节 (原为 16)
    sd   ra, 16(sp)       # 保存 ra
    sd   s0, 8(sp)        # 保存 s0 (用于 n)
    sd   s1, 0(sp)        # 保存 s1 (用于 fib(n-1) 的结果)

    mv   s0, a0           # s0 = n
    li   t0, 1
    ble  s0, t0, rec_base_case

    # 计算 fib(n-1)
    addi a0, s0, -1
    call fibonacci_recursive
    mv   s1, a0           # 将 fib(n-1) 的结果保存在 callee-saved 寄存器 s1 中

    # 计算 fib(n-2)
    addi a0, s0, -2
    call fibonacci_recursive
    add  a0, a0, s1       # 结果 = fib(n-2) + s1 (其中 s1 存有 fib(n-1))

    j    rec_epilogue

rec_base_case:
    mv   a0, s0

rec_epilogue:
    ld   ra, 16(sp)       # 恢复 ra
    ld   s0, 8(sp)        # 恢复 s0
    ld   s1, 0(sp)        # 恢复 s1
    addi sp, sp, 24       # 释放栈空间
    ret
    # --- END MODIFICATION ---

# =========================
# fibonacci_iterative
# (此函数无需修改)
# =========================
fibonacci_iterative:
    addi sp, sp, -32
    sd   ra, 24(sp)
    sd   s0, 16(sp)
    sd   s1, 8(sp)
    sd   s2, 0(sp)

    mv   s0, a0       # n
    li   s1, 0        # a
    li   s2, 1        # b

    beqz s0, iter_ret_a
    li   t0, 1
    beq  s0, t0, iter_ret_b

    li   t1, 2        # i
iter_loop:
    bgt  t1, s0, iter_end
    add  t2, s1, s2   # c = a + b
    mv   s1, s2       # a = b
    mv   s2, t2       # b = c
    addi t1, t1, 1
    j    iter_loop

iter_end:
    mv   a0, s2
    j    iter_epilogue

iter_ret_a:
    mv   a0, s1
    j    iter_epilogue
iter_ret_b:
    mv   a0, s2

iter_epilogue:
    ld   ra, 24(sp)
    ld   s0, 16(sp)
    ld   s1, 8(sp)
    ld   s2, 0(sp)
    addi sp, sp, 32
    ret

# =========================
# main
# (此函数无需修改)
# =========================
main:
    addi sp, sp, -16
    sd   ra, 8(sp)
    sd   s0, 0(sp)

    # 输入 n
    la   a0, prompt_n
    call putf
    call getint
    mv   s0, a0

    # 递归 Fibonacci
    mv   a0, s0
    call fibonacci_recursive
    mv   s1, a0
    la   a0, result_rec
    call putf
    mv   a0, s1
    call putint
    li   a0, 10
    call putch

    # 迭代 Fibonacci
    mv   a0, s0
    call fibonacci_iterative
    mv   s1, a0
    la   a0, result_iter
    call putf
    mv   a0, s1
    call putint
    li   a0, 10
    call putch

    # 额外运算
    la   a0, extra_intro
    call putf

    # n + 5
    la   a0, add_label
    call putf
    addi a0, s0, 5
    call putint
    li   a0, 10
    call putch

    # n - 3
    la   a0, sub_label
    call putf
    addi a0, s0, -3
    call putint
    li   a0, 10
    call putch

    # n * 2
    la   a0, mul_label
    call putf
    li   t0, 2
    mul  a0, s0, t0
    call putint
    li   a0, 10
    call putch

    # n / 2
    la   a0, div_label
    call putf
    li   t0, 2
    div  a0, s0, t0
    call putint
    li   a0, 10
    call putch

    # n % 2
    la   a0, mod_label
    call putf
    li   s2, 2
    rem a0, s0, s2
    call putint
    li   a0, 10
    call putch


    # 结束程序
    li   a0, 0
    ld   ra, 8(sp)
    ld   s0, 0(sp)
    addi sp, sp, 16
    ret
    