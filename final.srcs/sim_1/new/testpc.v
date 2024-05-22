`timescale 1ns / 1ps
module tb_cpu_pc;
    reg clk;
    reg rst;
    reg [31:0] pc_in;
    wire [31:0] pc_out;
    reg pc_adder_enable;
    
    pc dut (
        .clk(clk),
        .rst(rst),
        .pc_in(pc_in),
        .pc_out(pc_out),
        .pc_adder_enable(pc_adder_enable),
        .pc_change_enable()
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 生成时钟信号
    end
    
    initial begin
        rst = 1; // 初始复位
        pc_in = 32'h00000000; // 初始PC值
        pc_adder_enable = 0; // 初始禁用PC加法器
        #10 rst = 0; // 释放复位
        #10; // 等待一段时间
        // 检查复位后pc_out的值是否为0
        if (pc_out !== 32'h00000000) begin
            $display("Error: pc_out expected 0 after reset, got %h", pc_out);
            $finish;
        end
        pc_in = 32'h00000004; // 更新pc_in值，以模拟指令执行
        #10 pc_adder_enable = 1; 
        #10; 
        pc_adder_enable = 1; // 禁用PC加法器
        #10; // 等待一段时间
        if (pc_out !== 32'h00000004) begin
            $display("Error: pc_out expected %h, got %h", 32'h00000004, pc_out);
            $finish;
        end
        #30 $finish; // 结束仿真
    end
    
endmodule