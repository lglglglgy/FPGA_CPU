`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/18 14:45:21
// Design Name: 
// Module Name: alu
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

module alu(
    input [31:0] a,
    input [31:0] b,
    input [2:0] alu_op,
    output reg [31:0] result,
    output reg zero,
    output reg overflow,
    output reg carry,
    output reg sign,
    input wire clk
    );
    
    always @(posedge clk ) begin
        case (alu_op)
            3'b000: begin
                result = a + b;
                zero = (result == 0);
                overflow = (a[31] == b[31] && a[31] != result[31]);
                carry = (result < a);
                sign = result[31];
            end
            3'b001: begin
                result = a - b;
                zero = (result == 0);
                overflow = (a[31] != b[31] && a[31] != result[31]);
                carry = (result > a);
                sign = result[31];
            end
            3'b010: begin
                result = a & b;
                zero = (result == 0);
                overflow = 0;
                carry = 0;
                sign = result[31];
            end
            3'b011: begin
                result = a | b;
                zero = (result == 0);
                overflow = 0;
                carry = 0;
                sign = result[31];
            end
            3'b100: begin
                result = a ^ b;
                zero = (result == 0);
                overflow = 0;
                carry = 0;
                sign = result[31];
            end
            3'b101: begin
                result = a << b[4:0];
                zero = (result == 0);
                overflow = 0;
                carry = 0;
                sign = result[31];
            end
            3'b110: begin
                result = a >> b[4:0];
                zero = (result == 0);
                overflow = 0;
                carry = 0;
                sign = result[31];
            end
            3'b111: begin
                result = a >>> b[4:0];
                zero = (result == 0);
                overflow = 0;
                carry = 0;
                sign = result[31];
            end
            default: begin
                result = 0;
                zero = 1;
                overflow = 0;
                carry = 0;
                sign = 0;
            end
        endcase
        $display("a: %b b: %b alu_op: %b result: %b zero: %b overflow: %b carry: %b sign: %b", a, b, alu_op, result, zero, overflow, carry, sign);
    end
endmodule
