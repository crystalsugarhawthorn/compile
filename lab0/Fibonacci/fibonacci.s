# 文件名: fibonacci_and_computation.s
# RISC-V 64 汇编实现，对应 SysY 复杂版斐波那契计算程序。
#
# 本文件功能总览：
# - 提供两个版本的 Fibonacci 计算：递归（fibonacci_recursive）与迭代（fibonacci_iterative）。
# - main 函数负责与外部 I/O（putf/putint/putch/getint）交互：读取用户输入 n，打印两种实现的结果，
#   并展示若干简单整数运算（加、乘、取模）。
#
# 注释与约定：
# - 严格遵守 RISC-V 的呼叫约定：a0-a7 用作函数参数与返回值；t0-t6 为临时寄存器（调用者不要求保存）；
#   s0-s11 为被调用者保存寄存器（callee-saved，若函数使用需保存并在返回前恢复）；ra 保存返回地址。
#
# 编译示例（交叉编译，需 riscv 工具链）：
# riscv64-unknown-elf-gcc -o fibonacci fibonacci.s lib/libsysy_riscv.a -static
# 运行示例（在 qemu-riscv64 下）：
# qemu-riscv64 fibonacci


.data
prompt_n:      .string "请输入一个整数 n：\n"
# prompt_n: 提示用户输入一个整数的字符串，调用 putf 并传入该标签地址即可打印
result_rec:    .string "递归 Fibonacci 结果："
# result_rec: 打印递归实现结果的标签
result_iter:   .string "迭代 Fibonacci 结果："
# result_iter: 打印迭代实现结果的标签
extra_intro:   .string "额外数值运算演示：\n"
# extra_intro: 额外演示运算的起始提示
add_label:     .string "n + 5 = "
# add_label: 用于打印 "n + 5 = " 这个字符串
mul_label:     .string "n * 2 = "
# mul_label: 用于打印 "n * 2 = "
mod_label:     .string "n %% 2 = "
# mod_label: 用于打印 "n % 2 = "（在字符串中使用 %% 转义 %）

.text
.globl getint
.globl putint
.globl putch
.globl putf
.globl main

# getint/putint/putch/putf 是外部提供的 I/O 函数（通常由 libsysy_riscv.a 或运行时库实现）。
# - getint: 从标准输入读取整数，返回值保存在 a0。
# - putf: 打印字符串，约定 a0 为字符串地址。
# - putint: 打印整数，约定 a0 为要打印的整数。
# - putch: 打印单个字符（例如换行），约定 a0 为字符的 ASCII 码（整数）。

# =========================
# fibonacci_recursive
# =========================
fibonacci_recursive:
    # -----------------------------------------------
    # fibonacci_recursive (递归实现)
    # 输入： a0 = n
    # 返回： a0 = fib(n)
    # 使用的寄存器约定：
    # - 使用 s0 保存传入的 n（被调保存寄存器，必须在返回前恢复）
    # - 使用 s1 临时保存 fib(n-1) 的结果（同样为被调保存寄存器）
    # - 使用 ra 保存返回地址
    # 堆栈帧（本实现）：
    #  偏移 16(sp) : 保存 ra
    #   8(sp)      : 保存 s0
    #   0(sp)      : 保存 s1
    #  总共分配 24 字节
    # 注意：这里只是为了保存被调保存寄存器和 ra，局部变量直接用 s寄存器或 a寄存器传递
    # -----------------------------------------------
    addi sp, sp, -24      # 栈分配 24 字节（为 ra、s0、s1 留空间）
    # addi sp, sp, -24 将栈指针向下移动 24 字节，给局部保存和寄存器保存腾出空间。
    #      在 RISC-V 中，栈生长方向为地址减小，因此分配内存是将 sp 减去所需字节数。
    sd   ra, 16(sp)       # 保存返回地址 ra 到栈上（偏移 16）
    # 保存 ra 是必要的，因为本函数会进行递归调用，调用返回后要回到正确的调用点。
    sd   s0, 8(sp)        # 保存被调保存寄存器 s0，用来保存 n
    # s0 用来保存调用参数 n 的副本，保存在被调用者保存寄存器中，递归调用后仍可访问。
    sd   s1, 0(sp)        # 保存被调保存寄存器 s1，用来临时保存 fib(n-1)
    # s1 用作临时寄存器来保存第一次递归的返回值 fib(n-1)，也需要在返回前恢复。

    mv   s0, a0           # 将函数参数 n (a0) 移到 s0 中，以便在递归调用后仍能访问
    # mv 指令是寄存器拷贝。因为 a0 会被递归调用覆盖，所以把 n 存入 s0（被调保存寄存器）。
    li   t0, 1            # 将立即数 1 放入 t0，用于比较是否为基准情形
    # li 将立即数加载进入寄存器 t0，本例用来判断 n <= 1 是否为递归的基准情形。
    ble  s0, t0, rec_base_case  # 如果 n <= 1，跳转到基准情形，直接返回 n
    # ble 比较 s0 和 t0，如果 s0 <= 1 则跳转到 rec_base_case 标签，基准情形直接返回 n 本身。

    # 计算 fib(n-1)
    addi a0, s0, -1       # a0 = n - 1（函数参数传递到 a0）
    # 递归计算 fib(n-1)，调用约定要求将参数放到 a0，因此先把 n-1 放入 a0。
    call fibonacci_recursive
    # call 会跳转并把返回地址保存到 ra，递归返回后，a0 中包含 fib(n-1)。
    mv   s1, a0           # fib(n-1) 的返回值在 a0，将其保存到 s1（被调保存寄存器）
    # 将 fib(n-1) 的结果保存到 s1，以便后续计算 fib(n-2) 时仍可使用该值。

    # 计算 fib(n-2)
    addi a0, s0, -2       # a0 = n - 2
    # 现在要计算 fib(n-2)，把 n-2 放入 a0 并再次递归调用。
    call fibonacci_recursive
    # 递归返回后，a0 保存 fib(n-2)。
    add  a0, a0, s1       # a0 = fib(n-2) + fib(n-1)（fib(n-1) 存在 s1）
    # 将两个子问题的结果相加，得到 fib(n)。注意：add 的两个操作数都是寄存器。

    j    rec_epilogue     # 跳转到函数尾处理恢复与返回

rec_base_case:
    # 基准情形：n <= 1 时，返回 n 本身
    mv   a0, s0           # a0 = n（返回值）
    # 基准情形直接把 n 放到 a0，作为返回值，符合函数调用约定。

rec_epilogue:
    # 恢复现场并返回
    ld   ra, 16(sp)       # 恢复 ra
    # 从栈上恢复 ra，以便 ret 能跳回到正确的调用点。
    ld   s0, 8(sp)        # 恢复 s0
    # 恢复被调保存寄存器 s0
    ld   s1, 0(sp)        # 恢复 s1
    # 恢复被调保存寄存器 s1
    addi sp, sp, 24       # 释放栈空间
    # 将 sp 加回 24，回收之前分配的栈帧空间
    ret

# =========================
# fibonacci_iterative
# =========================
fibonacci_iterative:
    # -----------------------------------------------
    # fibonacci_iterative (迭代实现)
    # 输入： a0 = n
    # 返回： a0 = fib(n)
    # 采用迭代方式，以常量空间（寄存器）保存中间值
    # 使用的寄存器
    # - s0 保存 n（被调保存）
    # - s1 保存当前的 a（初始为 0）
    # - s2 保存当前的 b（初始为 1）
    # - t1 用作循环计数 i
    # - t2 用作临时保存 c = a + b
    # 堆栈帧：为 ra, s0, s1, s2 分配 32 字节空间，并在返回前恢复
    # -----------------------------------------------
    addi sp, sp, -32
    # 为 ra, s0, s1, s2 分配栈空间。采用 32 字节对齐（或按本例固定偏移）来保存这些寄存器。
    sd   ra, 24(sp)
    # 将返回地址保存到栈上的偏移 24 位置，防止后续调用覆盖 ra。
    sd   s0, 16(sp)
    # 保存被调保存寄存器 s0（保存参数 n 的副本）。
    sd   s1, 8(sp)
    # 保存 s1，用作迭代中的 a
    sd   s2, 0(sp)
    # 保存 s2，用作迭代中的 b

    mv   s0, a0       # 将参数 n 保存在 s0 中
    # 把输入参数 n 从 a0 移到 s0，以便在后续调用或循环中保持不变。
    li   s1, 0        # a = 0
    # 初始化迭代变量 a=0（fib(0)），使用被调保存寄存器 s1 存放，便于在返回前保持值不变。
    li   s2, 1        # b = 1
    # 初始化迭代变量 b=1（fib(1)），使用 s2。

    # 处理特殊情况：n == 0 -> 返回 a (0)，n == 1 -> 返回 b (1)
    beqz s0, iter_ret_a
    # beqz s0, iter_ret_a 如果 s0 == 0 跳转到 iter_ret_a，直接返回 a（即 0）。
    li   t0, 1
    beq  s0, t0, iter_ret_b
    # 如果 s0 == 1 则跳转到 iter_ret_b，返回 b（即 1）。

    # 从 i = 2 开始循环，直到 i > n
    li   t1, 2        # i = 2
    # 把循环计数器 i 初始化为 2，因为已经处理了 n=0 和 n=1 的情形。
iter_loop:
    bgt  t1, s0, iter_end  # 如果 i > n，循环结束
    # 当 i 超过 n 时，说明迭代到达或超过目标，跳转到 iter_end 并返回 b（即 fib(n)）。
    add  t2, s1, s2   # c = a + b
    # t2 临时保存新值 c = a + b
    mv   s1, s2       # a = b
    # 将 a 更新为上一次的 b
    mv   s2, t2       # b = c
    # 将 b 更新为计算得到的 c
    addi t1, t1, 1    # i++
    # i 自增，继续下一轮
    j    iter_loop

iter_end:
    mv   a0, s2       # 返回值 a0 = b（循环结束时 b = fib(n)）
    # 循环结束后，s2 保存的是 fib(n)，将其放入 a0 作为返回值
    j    iter_epilogue

iter_ret_a:
    mv   a0, s1       # n == 0 时，返回 a (0)
    # 直接返回 a（0）
    j    iter_epilogue
iter_ret_b:
    mv   a0, s2       # n == 1 时，返回 b (1)
    # 直接返回 b（1）

iter_epilogue:
    # 恢复保存的寄存器并返回
    ld   ra, 24(sp)
    # 恢复 ra
    ld   s0, 16(sp)
    # 恢复 s0
    ld   s1, 8(sp)
    # 恢复 s1
    ld   s2, 0(sp)
    # 恢复 s2
    addi sp, sp, 32
    # 释放栈空间并返回调用者
    ret

# =========================
# main
# =========================
main:
    # -----------------------------------------------
    # main (程序入口)
    # 作用：交互式读取用户输入 n，分别计算递归和迭代的 Fibonacci 并打印结果，
    #       还演示若干简单的整数运算（加法、乘法、取模）并打印
    # 寄存器约定：在 main 中使用 s0 保存用户输入的 n；在打印前使用 s1 保存中间返回结果
    # -----------------------------------------------
    addi sp, sp, -16
    # main 为了保存 ra 与 s0，需要在栈上开辟 16 字节空间
    sd   ra, 8(sp)
    # 保存返回地址（虽然 main 通常不需要返回，但为了统一和保险性保存 ra）
    sd   s0, 0(sp)
    # 保存被调保存寄存器 s0（程序中我们将用 s0 存放用户输入 n）

    # ---------- 输入 n ----------
    la   a0, prompt_n   # 将提示字符串地址放入 a0
    # la 指令将标签地址载入寄存器 a0，putf 要求参数（字符串地址）放在 a0
    call putf           # 打印提示（putf: 打印字符串）
    # 调用外部函数 putf 打印提示信息
    call getint         # 读取整数，返回值放在 a0
    # getint 负责从输入读取整数并将其放在 a0 中作为返回值
    mv   s0, a0         # 将读取到的 n 保存到 s0
    # 把用户输入的 n 存入 s0，后面多个地方需要使用该值，放在 s0 保证在调用其他函数后仍能访问

    # ---------- 递归 Fibonacci ----------
    mv   a0, s0
    # 把 n 传入 a0 作为 fibonacci_recursive 的参数
    call fibonacci_recursive
    # 调用递归实现，返回值存于 a0
    mv   s1, a0         # 保存递归结果到 s1
    # 把返回的结果放入 s1，方便后续打印时使用（避免在打印前被其他调用覆盖）
    la   a0, result_rec
    call putf           # 打印“递归 Fibonacci 结果：”
    mv   a0, s1
    call putint         # 打印整数结果
    li   a0, 10
    call putch          # 打印换行（ASCII 10）
    # 使用 putf/putint/putch 组合打印标签和数值，并换行

    # ---------- 迭代 Fibonacci ----------
    mv   a0, s0
    # 将相同的 n 传给迭代函数
    call fibonacci_iterative
    # 迭代实现返回后，结果存于 a0
    mv   s1, a0         # 保存迭代结果到 s1
    la   a0, result_iter
    call putf           # 打印“迭代 Fibonacci 结果：”
    mv   a0, s1
    call putint         # 打印整数结果
    li   a0, 10
    call putch          # 换行
    # 同样打印迭代实现的结果并换行

    # ---------- 额外数值运算演示 ----------
    la   a0, extra_intro
    call putf
    # 打印额外演示的标题

    # n + 5
    la   a0, add_label
    call putf
    # 先打印标签 "n + 5 = "
    addi a0, s0, 5      # a0 = n + 5
    # addi 将立即数 5 加到 s0（n）上并放入 a0，用作参数传递给 putint
    call putint
    li   a0, 10
    call putch
    # 打印结果后输出换行

    # n * 2
    la   a0, mul_label
    call putf
    # 打印 "n * 2 = " 标签
    li   t0, 2
    # 将常数 2 加载到临时寄存器 t0 以便乘法使用
    mul  a0, s0, t0     # a0 = n * 2
    # mul 指令将 s0 和 t0 相乘，结果放入 a0（供 putint 打印）
    call putint
    li   a0, 10
    call putch

    # n % 2
    la   a0, mod_label
    call putf
    # 打印 "n % 2 = " 标签
    li   s2, 2
    # 把 2 放入 s2（这里使用 s2 而非 t 寄存器，注意 s2 为被调保存寄存器，若 main 后还要保持该值需恢复）
    rem a0, s0, s2      # a0 = n % 2
    # rem 指令计算 s0 对 s2 的余数，并将结果存入 a0
    call putint
    li   a0, 10
    call putch
    # 打印余数结果并换行


    # ---------- 结束程序，恢复现场并返回 ----------
    li   a0, 0
    # 通常，在系统调用或程序退出时，会将 a0 设置为返回值或状态；这里设置为 0 表示正常结束
    ld   ra, 8(sp)
    # 恢复保存的 ra
    ld   s0, 0(sp)
    # 恢复保存的 s0
    addi sp, sp, 16
    # 回收 main 的栈帧空间
    ret
    