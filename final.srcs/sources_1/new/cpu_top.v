`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 07:08:12
// Design Name: 
// Module Name: cpu_top
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


module cpu_top(
    input wire clk,
    input wire rst
    );
    wire [9:0] pc_in;
    wire [9:0] pc_out;
    wire pc_adder_enable ;
    wire pc_change_enable;
    //reg [31:0] memory [0:1023];
    initial begin
        $readmemb("io.in", regs_inst.mem); // 从文件"filename"中读取十六进制数据到内存
        //打印所有内存数据
        $display("memory: test");
        $display("regs_inst.mem[0]: %h", regs_inst.mem[0]);
        $display("regs_inst.mem[1]: %h", regs_inst.mem[1]);
        $display("regs_inst.mem[2]: %h", regs_inst.mem[2]);
        $display("regs_inst.mem[3]: %h", regs_inst.mem[3]);
        $display("regs_inst.mem[4]: %h", regs_inst.mem[4]);
        $display("regs_inst.mem[5]: %h", regs_inst.mem[5]);
        $display("regs_inst.mem[6]: %h", regs_inst.mem[6]);
        pc_inst.pc_out = 10'b0;
    end
    pc pc_inst(
        .clk(clk),
        .rst(rst),
        .pc_in(pc_out + 10'h4),
        .pc_out(pc_out),
        .pc_change_enable(pc_change_enable)
        );

    reg [31:0] data_in;
    wire [31:0] data_out1;
    wire [31:0] data_out2;
    wire [31:0] data_pc_out;
    wire [9:0] imm1;
    wire [9:0] imm2;
    wire we;
    regs regs_inst(
        .clk(clk),
        .rst(rst),
        .addr_in(),
        .data_in(data_in),
        .we(we),
        .addr_out1(imm1),
        .data_out1(data_out1),
        .addr_out2(imm2),
        .data_out2(data_out2),
        .pc_out(pc_out),
        .data_pc_out(data_pc_out)
        );
    read read_inst(
        .clk(clk),
        .pc(pc_out),
        .instr(data_pc_out),
        .pc_change_enable(pc_change_enable)
        );
        wire [7:0] opcode;

    Decode Decode_inst(
        .instr(data_pc_out),
        .opcode(opcode),
        .imm1(imm1),
        .imm2(imm2),
        .imm_flag(),
        .clk(clk),
        .pc_change_enable(pc_change_enable)
        );
        wire [31:0] num1;
        wire [31:0] num2;
        wire [7:0] alu_tmp_op;
    find_num find_num_inst(
        .imm1(data_out1),
        .imm2(data_out2),
        .immopcode(opcode),
        .num1(num1),
        .num2(num2),
        .alu_tmp_op(alu_tmp_op),
        .clk(clk),
        .pc_change_enable(pc_change_enable)
        );

    alu alu_inst(
        .a(num1),
        .b(num2),
        .alu_op(alu_tmp_op[6:4]),
        .result(),
        .zero(),
        .overflow(),
        .carry(),
        .sign(),
        .clk(clk)
        );
endmodule
