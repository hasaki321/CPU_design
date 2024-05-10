|type|instr|discription|
|:--|:--|:--|
|R|add|rd = rs1 + rs2|
|R|sub|rd = rs1 - rs2|
|R|sll|rd = rs1 << rs2|
|R|srl|rd = rs1 >> rs2|
|I|addi|rd = r1 + imm|
|IL|lw|rd=M[rs1+imm][0:31]|
|IL|lb|rd=M[rs1+imm][0:7]|
|S|sw|M[rs1+imm][0:31]=rs2[0:31]|
|S|sb|M[rs1+imm][0:7]=rs2[0:7]|
|B|beq|if(rs1==rs2) pc=pc+imm|
|B|blt|if(rs1`<`rs2) pc=pc+imm|
|J|jal|rd=pc+4;pc = pc+imm|

aluctr:
|operate|aluctr|
|:-|:-|
|add|001|
|sub|010|
|and|011|
|or |100|
|sll|101|
<!-- |srl|100| -->

|beq|110|
|blt|111|

