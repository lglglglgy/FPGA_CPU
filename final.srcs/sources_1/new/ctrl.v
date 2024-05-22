`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/18 15:35:56
// Design Name: 
// Module Name: ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module read(
    input wire clk,
    input wire [9:0] pc,
    input wire [31:0] data_pc_out,
    output reg [31:0] instr,
    output reg  pc_change_enable
    );
    always @(posedge clk) begin

        if (pc_change_enable == 0)
        begin
            instr = data_pc_out; 
            $display("pc: %b", pc);
            $display("===============================");
            pc_change_enable = 1;
        end
        else begin
            pc_change_enable = 0;
        end
    end
endmodule

module  Decode(
    input wire [31:0] instr,
    output reg [7:0] opcode,
    output reg [9:0] imm1,
    output reg [9:0] imm2,
    output reg [2:0] imm_flag,
    input wire clk,
    input wire pc_change_enable
    );
    always @(posedge clk) begin
        if (pc_change_enable == 0) begin
        opcode = instr[31:24];
        imm1 = instr[23:14];
        imm2 = instr[13:4];
        imm_flag = instr[3:1];
        $display("instr: %b", instr);
        $display("opcode: %b imm1: %b imm2: %b imm_flag: %b", opcode, imm1, imm2, imm_flag);
        end

        // $display("imm_num: %b %b", regs_inst.mem[imm1>>2], regs_inst.mem[imm2>>2]);
    end
endmodule

module find_num(
    input wire [31:0] imm1,
    input wire [31:0] imm2,
    input wire [7:0] immopcode,
    output reg [31:0] num1,
    output reg [31:0] num2,
    output reg [7:0] alu_tmp_op,
    input wire pc_change_enable,
    input wire clk
    );
    always @(posedge clk) begin
        if (pc_change_enable == 0) begin
        $display("find num imm1: %b imm2: %b", imm1, imm2);
        // num1 = regs_inst.mem[imm1>>2];
        // num2 = regs_inst.mem[imm2>>2];
        num1 = imm1;
        num2 = imm2;
        alu_tmp_op = immopcode;
        $display("num1: %b num2: %b", num1, num2);
        end
    end
endmodule

module write_back(
    input wire [9:0] addr_back,
    input wire [31:0] data_back,
    input wire we_back,
    input wire clk,
    input wire pc_change_enable
    );
    always @(posedge clk) begin
        if (pc_change_enable == 0) begin
        if (we_back) begin
            regs_inst.mem[addr_back>>2] = data_back;
        end
    end
    end
endmodule




