`timescale 1ns / 1ps

module neuron#(
  parameter   W1 = 2,
  parameter   W2 = 3,
  parameter   W3 = 5,
  parameter BIAS = 1)(
    input        clk,
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3,
    output reg [31:0] out);

    integer w1, w2, w3, bias, sum;

    initial begin
        w1 = W1;
        w2 = W2;
        w3 = W3;
        bias = BIAS;
        sum = 0;
        out = 0;
    end

    always @(posedge clk) begin
        sum <= (w1 * in1 + w2 * in2 + w3 * in3 + bias);
        
        if (sum >= 0)
            out <= sum;
        else 
            out <= 32'd0;
    end

endmodule