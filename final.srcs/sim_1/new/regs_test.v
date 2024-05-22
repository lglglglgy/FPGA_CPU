`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 16:48:52
// Design Name: 
// Module Name: regs_test
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

`timescale 1ns / 1ps

module regs_tb;

    // Inputs
    reg clk;
    reg rst;
    reg [31:0] addr_in;
    reg [31:0] data_in;
    reg we;
    reg [31:0] addr_out1;
    reg [31:0] addr_out2;

    // Outputs
    wire [31:0] data_out1;
    wire [31:0] data_out2;

    // 实例化被测试模块
    regs uut (
        .clk(clk),
        .rst(rst),
        .addr_in(addr_in),
        .data_in(data_in),
        .we(we),
        .addr_out1(addr_out1),
        .data_out1(data_out1),
        .addr_out2(addr_out2),
        .data_out2(data_out2)
    );

    // 时钟信号生成
    always #5 clk = ~clk;

    initial begin
        // 初始化
        clk = 0;
        rst = 1;
        addr_in = 0;
        data_in = 0;
        we = 0;
        addr_out1 = 0;
        addr_out2 = 0;

        // 保持复位状态一段时间
        #100;
        rst = 0;

        // 写入测试
        we = 1;
        addr_in = 10;
        data_in = 32'hA5A5A5A5;
        #10;
        we = 0;

        // 读取测试
        addr_out1 = 10;
        addr_out2 = 10;
        #10;

        // 观察结果
        $display("Time=%t, addr_out1=%d, data_out1=%h, addr_out2=%d, data_out2=%h", $time, addr_out1, data_out1, addr_out2, data_out2);

        // 测试结束
        #100;
        $finish;
    end

endmodule