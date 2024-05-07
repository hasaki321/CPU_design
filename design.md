|部件|端口|形式|类型|位宽|功能|
|:--|:--|:--|:--|:--|:--|
|PC|||||程序计数器|
||clk|input|wire|1|时钟|
||reset|input|wire|1|为1重置|
||jump|input|wire|1|为1跳转|
||branch|input|wire|1|为1切换分支|
||pc_imm|input|wire|32|跳转立即数|
||pc_out|output|wire|32|输出pc值|
||instr|output|wire|32|取出的指令|
|Imm|||||立即数生成器|
||instr|input|wire|32|输入指令|
||op|input|wire|32|输入操作码|
||imm|output|wire|32|输出立即数|
|ID||||指令译码器|
|ID|instruc|input|wire|32|输入的指令|


