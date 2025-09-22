import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.patches import FancyBboxPatch
import numpy as np

# 设置中文字体
plt.rcParams['font.sans-serif'] = ['SimHei', 'DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False

# 创建图形
fig, ax = plt.subplots(1, 1, figsize=(14, 10))
ax.set_xlim(0, 10)
ax.set_ylim(0, 12)
ax.axis('off')

# 定义颜色方案
colors = ['#FF6B6B', '#4ECDC4', '#45B7D1', '#96CEB4', '#FFEAA7', '#DDA0DD']

# 定义各个阶段的位置和信息
stages = [
    {
        'name': '词法分析\n(Lexical Analysis)',
        'desc': '源代码字符流 → 单词/记号(token)',
        'input': '源代码(.i)',
        'output': 'Token序列',
        'y': 10,
        'color': colors[0]
    },
    {
        'name': '语法分析\n(Syntax Analysis)', 
        'desc': 'Token串 → 语法树(AST)',
        'input': 'Token序列',
        'output': '抽象语法树',
        'y': 8.5,
        'color': colors[1]
    },
    {
        'name': '语义分析\n(Semantic Analysis)',
        'desc': '检查类型、作用域、语义正确性',
        'input': '抽象语法树',
        'output': '带语义信息的AST',
        'y': 7,
        'color': colors[2]
    },
    {
        'name': '中间代码生成\n(IR Generation)',
        'desc': '语法树 → 中间表示(IR)',
        'input': '带语义信息的AST',
        'output': '中间代码(IR)',
        'y': 5.5,
        'color': colors[3]
    },
    {
        'name': '优化\n(Optimization)',
        'desc': '对IR进行优化，提高执行效率',
        'input': '中间代码(IR)',
        'output': '优化后的IR',
        'y': 4,
        'color': colors[4]
    },
    {
        'name': '目标代码生成\n(Code Generation)',
        'desc': '生成汇编代码(.s)',
        'input': '优化后的IR',
        'output': '汇编代码(.s)',
        'y': 2.5,
        'color': colors[5]
    }
]

# 绘制标题
ax.text(5, 11.5, '编译阶段流程图\nCompilation Process Flow', 
        fontsize=18, fontweight='bold', ha='center', va='center')

# 绘制各个阶段
for i, stage in enumerate(stages):
    # 主要处理框
    main_box = FancyBboxPatch(
        (1.5, stage['y']-0.3), 3, 0.8,
        boxstyle="round,pad=0.1",
        facecolor=stage['color'],
        edgecolor='black',
        linewidth=2,
        alpha=0.8
    )
    ax.add_patch(main_box)
    
    # 阶段名称
    ax.text(3, stage['y'], stage['name'], 
            fontsize=11, fontweight='bold', ha='center', va='center')
    
    # 输入框
    input_box = FancyBboxPatch(
        (0.2, stage['y']-0.15), 1, 0.4,
        boxstyle="round,pad=0.05",
        facecolor='lightblue',
        edgecolor='gray',
        alpha=0.7
    )
    ax.add_patch(input_box)
    ax.text(0.7, stage['y'], stage['input'], 
            fontsize=8, ha='center', va='center')
    
    # 输出框
    output_box = FancyBboxPatch(
        (4.8, stage['y']-0.15), 1, 0.4,
        boxstyle="round,pad=0.05",
        facecolor='lightgreen',
        edgecolor='gray',
        alpha=0.7
    )
    ax.add_patch(output_box)
    ax.text(5.3, stage['y'], stage['output'], 
            fontsize=8, ha='center', va='center')
    
    # 描述文本
    ax.text(7.5, stage['y'], stage['desc'], 
            fontsize=9, ha='left', va='center',
            bbox=dict(boxstyle="round,pad=0.3", facecolor='white', alpha=0.8))
    
    # 绘制箭头
    if i < len(stages) - 1:
        # 垂直箭头（连接到下一阶段）
        ax.arrow(3, stage['y']-0.4, 0, -0.7, 
                head_width=0.1, head_length=0.1, 
                fc='black', ec='black', linewidth=2)
    
    # 输入到处理的箭头
    ax.arrow(1.3, stage['y'], 0.15, 0, 
            head_width=0.05, head_length=0.05, 
            fc='blue', ec='blue')
    
    # 处理到输出的箭头
    ax.arrow(4.6, stage['y'], 0.15, 0, 
            head_width=0.05, head_length=0.05, 
            fc='green', ec='green')

# 添加图例
legend_elements = [
    mpatches.Rectangle((0, 0), 1, 1, facecolor='lightblue', alpha=0.7, label='输入'),
    mpatches.Rectangle((0, 0), 1, 1, facecolor='lightgreen', alpha=0.7, label='输出'),
    mpatches.Rectangle((0, 0), 1, 1, facecolor='gray', alpha=0.5, label='编译阶段')
]
ax.legend(handles=legend_elements, loc='lower right', bbox_to_anchor=(0.98, 0.02))

# 添加流程说明
ax.text(5, 0.8, '.i文件 → 词法分析 → 语法分析 → 语义分析 → 中间代码生成 → 优化 → 目标代码生成 → .s文件', 
        fontsize=10, ha='center', va='center',
        bbox=dict(boxstyle="round,pad=0.5", facecolor='lightyellow', alpha=0.8))

plt.tight_layout()
plt.show()