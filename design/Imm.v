`include "defines.v"
module Imm (
    input [31:0] instr;
    input [6:0] op;

    output [31:0] imm;    
);

assign immI = {20{instr[31]}, instr[31:20]}
assign immU = {instr[31:12], 12'b0}
assign immS = {20{instr[31]}, instr[31:25], instr[11:7]}
assign immB = {20{instr[31]}, instr[7], instr[30:25], instr[11:8], 1'b0}
assign immJ = {12{instr[31]}, instr[19:12], instr[20], instr[30:21], 1'b0}

case (op)
    `INSTR_TYPE_R: assign imm=instr;
    `INSTR_TYPE_I: assign imm=immI;
    `INSTR_TYPE_U: assign imm=immU;
    `INSTR_TYPE_S: assign imm=immS;
    `INSTR_TYPE_B: assign imm=immB;
    `INSTR_TYPE_J: assign imm=immJ;
endcase

endmodule