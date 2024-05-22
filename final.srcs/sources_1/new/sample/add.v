`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/18 15:30:16
// Design Name: 
// Module Name: add
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

module lw(
    input wire clk,
    input wire rst,
    input wire [9:0] addr_in,
    input wire [31:0] data_in,
    input wire we,
    input wire [9:0] addr_out1,
    output reg [31:0] data_out1,
    input wire [9:0] addr_out2,
    output reg [31:0] data_out2,
    input wire [9:0] pc_out,
    output reg [31:0] data_pc_out
    );