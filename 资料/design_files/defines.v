`define     REG_WIDTH           32
`define     REG_ADDR_WIDTH      5
`define     INSTR_WIDTH         32
`define     ALUCON_WIDTH        4
 
 
`define     INSTR_TYPE_R        7'b0110011
`define     INSTR_TYPE_I        7'b0010011
`define     INSTR_TYPE_IL       7'b0000011
`define     INSTR_TYPE_S        7'b0100011
`define     INSTR_TYPE_B        7'b1100011
`define     INSTR_TYPE_J        7'b1101111
`define     INSTR_TYPE_JR       7'b1100111
`define     INSTR_TYPE_U        7'b0110111
`define     INSTR_TYPE_UPC      7'b0010111
`define     INSTR_TYPE_IE       7'b1110011
 
 
`define     ALUOP_WIDTH         2
 
`define     ADD                 3'b000    //SUB
`define     XOR                 3'b100
`define     OR                  3'b110
`define     AND                 3'b111
`define     SLL                 3'b001
`define     SRL                 3'b101    //SRA
`define     SLT                 3'b010
`define     SLTU                3'b011
 
 
`define     L_BYTE              4'b0000
`define     L_HALF              4'b0001
`define     L_WORD              4'b0010
`define     L_BYTE_U            4'b0100
`define     L_HALF_U            4'b0101 
`define     S_BYTE              3'b000
`define     S_HALF              3'b001
`define     S_WORD              3'b010