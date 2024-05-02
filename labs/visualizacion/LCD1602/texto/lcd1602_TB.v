`timescale 1ns / 1ps
`include "lcd1602_text.v"

module LCD1602_controller_TB();
    reg clk;
    reg rst;
    reg ready_i;

    LCD1602_controller #(4, 32, 16, 50) uut (
        .clk(clk),
        .reset(rst),
        .ready_i(ready_i)
    );

    initial begin
        clk = 0;
        rst = 1;
        ready_i = 1;
        #10 rst = 0;
        #10 rst = 1;
    end

    always #10 clk = ~clk;

    initial begin: TEST_CASE
        $dumpfile("LCD1602_controller_TB.vcd");
        $dumpvars(-1, uut);
        #(100000) $finish;
    end


endmodule