`timescale 1ns / 1ps

module alu_test;

    reg [31:0] a;
    reg [31:0] b;
    reg [2:0] alu_op;
    wire [31:0] result;
    wire zero;
    wire overflow;
    wire carry;
    wire sign;

    // Instantiate the alu module
    alu u1 (
        .a(a), 
        .b(b), 
        .alu_op(alu_op), 
        .result(result), 
        .zero(zero), 
        .overflow(overflow), 
        .carry(carry), 
        .sign(sign)
    );

    initial begin
        // Test case 1: Addition
        a = 32'h00000001;
        b = 32'h00000001;
        alu_op = 3'b000;
        #10;
        $display("Addition: a = %h, b = %h, result = %h, zero = %b, overflow = %b, carry = %b, sign = %b", a, b, result, zero, overflow, carry, sign);

        // Test case 2: Subtraction
        a = 32'h00000002;
        b = 32'h00000001;
        alu_op = 3'b001;
        #10;
        $display("Subtraction: a = %h, b = %h, result = %h, zero = %b, overflow = %b, carry = %b, sign = %b", a, b, result, zero, overflow, carry, sign);

        // Test case 3: Bitwise AND
        a = 32'h00000003;
        b = 32'h00000001;
        alu_op = 3'b010;
        #10;
        $display("Bitwise AND: a = %h, b = %h, result = %h, zero = %b, overflow = %b, carry = %b, sign = %b", a, b, result, zero, overflow, carry, sign);

        // Test case 4: Bitwise OR
        a = 32'h00000002;
        b = 32'h00000001;
        alu_op = 3'b011;
        #10;
        $display("Bitwise OR: a = %h, b = %h, result = %h, zero = %b, overflow = %b, carry = %b, sign = %b", a, b, result, zero, overflow, carry, sign);

        // Test case 5: Bitwise XOR
        a = 32'h00000003;
        b = 32'h00000001;
        alu_op = 3'b100;
        #10;
        $display("Bitwise XOR: a = %h, b = %h, result = %h, zero = %b, overflow = %b, carry = %b, sign = %b", a, b, result, zero, overflow, carry, sign);

        // Test case 6: Shift left
        a = 32'h00000001;
        b = 32'h00000001;
        alu_op = 3'b101;
        #10;
        $display("Shift left: a = %h, b = %h, result = %h, zero = %b, overflow = %b, carry = %b, sign = %b", a, b, result, zero, overflow, carry, sign);

        // Test case 7: Shift right
        a = 32'h00000002;
        b = 32'h00000001;
        alu_op = 3'b110;
        #10;
        $display("Shift right: a = %h, b = %h, result = %h, zero = %b, overflow = %b, carry = %b, sign = %b", a, b, result, zero, overflow, carry, sign);

        // Test case 8: Unsigned shift right
        a = 32'h80000000;
        b = 32'h00000001;
        alu_op = 3'b111;
        #10;
        $display("Unsigned shift right: a = %h, b = %h, result = %h, zero = %b, overflow = %b, carry = %b, sign = %b", a, b, result, zero, overflow, carry, sign);

        // Test case 9: Default case
        a = 32'h00000001;
        b = 32'h00000001;
        alu_op = 3'b010;
        #10;
        $display("Default: a = %h, b = %h, result = %h, zero = %b, overflow = %b, carry = %b, sign = %b", a, b, result, zero, overflow, carry, sign);

        $finish;
    end
endmodule