`timescale 1ns / 1ps

module fsm_matriz8x8_TB;

    reg clk;
    reg reset;
    reg [1:0] state;

    wire mosi;
    wire sclk;
    wire cs;

    fsm_matriz8x8 uut (
        .clk(clk),
        .reset(reset),
        .state(state),
        .mosi(mosi),
        .sclk(sclk),
        .cs(cs)
    );

    initial begin
        clk = 0;
        forever #1 clk = ~clk;  
    end

    initial begin
        reset = 0;  
        state = 0;
        #10;        
        reset = 1;  
        #10;

        @(negedge clk);
        state = 2'b01;  // Ejemplo de estado para enviar datos
        #100;
        state = 2'b10;  // Cambiar estado
        #100;
        state = 2'b00;  // Regresa al estado inicial
        #100;

        $stop;
    end


endmodule