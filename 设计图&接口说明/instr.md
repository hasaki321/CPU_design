| type | instr | discription                |
| :--- | :---- | :------------------------- | --- |
| R    | add   | rd = rs1 + rs2             |
| R    | sub   | rd = rs1 - rs2             |
| R    | sll   | rd = rs1 << rs2            |
| R    | sra   |                            | 1   |
| R    | add   | rd = r1 + imm              |
| I    | andi  |                            | 1   |
| I    | slti  |                            | 1   |
| IL   | lw    | rd=M[rs1+imm][0:31]        |
| IL   | lb    | rd=M[rs1+imm][0:7]         |
| IL   | lbu   |                            | 1   |
| S    | sw    | M[rs1+imm][0:31]=rs2[0:31] |
| S    | sb    | M[rs1+imm][0:7]=rs2[0:7]   |
| B    | beq   | if(rs1==rs2) pc=pc+imm     |
| B    | bne   |                            |
| B    | blt   | if(rs1`<`rs2) pc=pc+imm    |
| B    | bltu  |                            | 1   |
| B    | bgeu  |                            | 1   |
| U    | auipc |                            | 2   |
| U    | lui   |                            | 2   |
| J    | jal   | rd=pc+4;pc = pc+imm        |
| JR   | jalr  |                            | 2   |

aluctr:
|operate|aluctr|
|:-|:-|
|add|001|
|sub|010|
|and|011|
|sll|100|
|sra|101|
|addpci|110|
|addpc|111|

<!-- |srl|100| -->

alub[2:0]:
|beq|001|
|bne|010|
|blt|011|
|bltu|100|
|bgeu|101|
