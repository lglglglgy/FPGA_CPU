`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 16:38:52
// Design Name: 
// Module Name: regs
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


module regs(
    input wire clk,
    input wire rst,

    //in
    input wire [9:0] addr_in,
    input wire [31:0] data_in,
    input wire we,

    //out1
    input wire [9:0] addr_out1,
    output reg [31:0] data_out1,

    //out2
    input wire [9:0] addr_out2,
    output reg [31:0] data_out2,

    //pc_out
    input wire [9:0] pc_out,
    output reg [31:0] data_pc_out


    );
    reg [31:0] mem [0:1023];
    integer i;
    always@(posedge clk )
    begin
        if(rst) begin
            for( i=0; i<1023; i=i+1) begin
                mem[i] <= 32'h0;
            end
        end
        if(we) begin
            mem[addr_in] <= data_in;
        end
        data_out1 <= mem[addr_out1>>2];
        data_out2 <= mem[addr_out2>>2];
        data_pc_out <= mem[pc_out>>2]; 
        $display(" add_out1: %b data_out1: %b", addr_out1, data_out1);

    end
endmodule

