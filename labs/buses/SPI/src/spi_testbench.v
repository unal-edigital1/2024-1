`timescale 1ns / 1ps

module spi_testbench;

    // Inputs
    reg clk;
    reg reset;
    reg [7:0] data_in;
    reg start;
    wire mosi;
    reg [15:0] div_factor;

    // Outputs
    reg miso;
    wire sclk;
    wire cs;
    wire [7:0] data_out;
    wire busy;
    wire avail;

    spi_master uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .start(start),
        .div_factor(div_factor),
        .miso(miso),
        .mosi(mosi),
        .sclk(sclk),
        .cs(cs),
        .data_out(data_out),
        .busy(busy),
        .avail(avail)
    );

    initial begin
        clk = 0;
        forever #1 clk = ~clk; 
    end

    initial begin
        reset = 1;
        start = 0;
        miso = 0;
        div_factor = 8;  // Divisor de frecuencia para el reloj SPI
        data_in = 8'hA3;  // Data to send
        #5; 
        reset = 0;
        #5;

        // Iniciar transmisión
        start = 1;
        #5;
        start = 0;

        // Simulación de respuesta del esclavo
        forever begin
            if (sclk == 1 && cs == 0) begin
                miso <= ~mosi;  // Simular que el esclavo envía datos invertidos
            end
            #5;  // Esperar medio ciclo de reloj
        end
    end
	 initial begin: TEST_CASE
     $dumpfile("spi_testbench.vcd");
     $dumpvars(-1, uut);
     #(500) $finish;
   end


endmodule
