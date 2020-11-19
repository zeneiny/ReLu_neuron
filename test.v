`timescale 1ns / 1ps

module test;
    reg clk = 0;

    always #10 clk = !clk;

    initial begin
        $dumpfile("neurontest.vcd");
        $dumpvars(0, test);
    end

    integer in1 = 10;
    integer in2 = 100;
    integer in3 = 1000;
    wire [31:0] out = 0;

    neuron testneuron(.clk(clk),
                      .in1(in1),
                      .in2(in2),
                      .in3(in3),
                      .out(out));
    always @(posedge clk)
    begin   
    #100 in1 <= in1 * -1;
    #200 in2 <= in2 * -1;
    #300 in3 <= in3 * -1;
    end
    
endmodule