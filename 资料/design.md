| 部件 | 形式   | 端口     | 类型 | 位宽 | 功能                        |
| :--- | :----- | :------- | :--- | :--- | :-------------------------- |
| PC   |        |          |      |      | 程序计数器                  |
|      | input  |          |      |      |                             |
|      |        | clk      | wire | 1    | 时钟                        |
|      |        | reset    | wire | 1    | 为 1 重置                   |
|      |        | jump     | wire | 1    | 为 1 跳转                   |
|      |        | branch   | wire | 1    | 为 1 切换分支               |
|      |        | pc_imm   | wire | 32   | 跳转立即数                  |
|      | output |          |      |      |                             |
|      |        | pc_out   | reg  | 32   | 输出 pc 值                  |
|      |        | instr    | reg  | 32   | 取出的指令                  |
| Imm  |        |          |      |      | 立即数生成器                |
|      | input  |          |      |      |                             |
|      |        | instr    | wire | 32   | 输入指令                    |
|      |        | op       | wire | 32   | 输入操作码                  |
|      | output |          |      |      |                             |
|      |        | imm      | wire | 32   | 输出立即数                  |
| ID   |        |          |      |      | 指令译码器                  |
|      | input  |          |      |      |                             |
|      |        | instr    | wire | 32   | 取出的的指令                |
|      |        | pc       | wire | 32   | 当前 pc 值                  |
|      |        | op       | wire | 32   | 7 位操作码                  |
|      |        | funct    | wire | 4    | {funct7[5],funct3}          |
|      |        | imm      | wire | 32   | 扩展立即数                  |
|      |        | rs1_addr | wire | 32   | 源寄存器地址                |
|      |        | rs2_addr | wire | 32   | 源寄存器地址                |
|      | output |          |      |      |                             |
|      |        | rs1_data | wire | 32   | 目标寄存器数据              |
|      |        | rs2_data | wire | 32   | 目标寄存器数据              |
|      |        | rd_data  | wire | 32   | 目标寄存器数据              |
| ALU  |        |          |      |      | 算术逻辑单元                |
|      | input  |          |      |      |                             |
|      |        | rs1_data | wire | 32   | 寄存器 1 数据               |
|      |        | rs2_data | wire | 32   | 寄存器 2 数据               |
|      |        | imm      | wire | 32   | 立即数                      |
|      |        | funct    | wire | 4    |                             |
|      | output |          |      |      |                             |
|      |        | MentoReg |      | 1    | 保证 ALU 输出送到目的寄存器 |
|      |        | RegWr    |      | 1    | 寄存器写使能                |
|      |        | MemWr    |      | 1    | 数据存储器写使能            |
