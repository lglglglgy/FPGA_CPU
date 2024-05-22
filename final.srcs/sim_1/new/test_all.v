`timescale 1ns / 1ps

module cpu_top_tb;

    reg clk;
    reg rst;

    cpu_top uut (
        .clk(clk),
        .rst(rst)
    );

    initial begin
        clk = 0;
        #10000;
        rst = 0;
        #10;
        repeat(100) begin
            #500 clk = ~clk;
        end
        $finish;
    end
endmodule