`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 15:31:17
// Design Name: 
// Module Name: pc
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


module pc(
    input wire clk,
    input wire rst,
    input wire [9:0] pc_in,
    output reg [9:0] pc_out,
    input wire pc_change_enable
    );

    always @( pc_change_enable or   rst)
    begin
        $display("pc_adder_enable: %b ,", pc_change_enable);
        if (rst) begin
            pc_out = 10'h0;
        end
        if (pc_change_enable) begin
            pc_out = pc_in;
        end
    end
endmodule
