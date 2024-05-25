/*
Modulo:	SPI_ master 
Autor: 	ferney alberto beltran 
Curso: 	Digital 1
Año:	 	2024

Descripción:

                     _______________
                    |               |
           clk -----|               |
           rst -----|               |
 data_in [7:0] -----|               |---- sclk
         start -----|               |---- mosi
freq_div[15:0] -----|               |---- miso
data_out [7:0] <----|               |---- cs
          busy <----|               |
         avail <----|               |
                    |_______________|

CLK: 		Entrada del reloj del sistema.
RST: 		Señal de reset que inicializa el módulo.

CLOCK_DIV: Valor para configurar la velocidad de la comunicación SPI.

DATA_IN:  Datos que se van a transmitir al esclavo SPI.
DATA_OUT: Datos recibidos del esclavo.

START: 	Señal que inicia la transmisión de datos.
BUSY: 	Señal que indica si el módulo está ocupado en una transmisión.
AVAIL: 	Señal que indica que se ha recibido un dato completo.

MISO: 	Salida del Maestro, Entrada del Esclavo (Master In Slave Out).
MOSI: 	Entrada del Maestro, Salida del Esclavo (Master Out Slave In).
SCLK: 	Señal de reloj SPI que sincroniza la transmisión de datos.
CS: 		Chip Select, activa o desactiva el esclavo seleccionado.

*/

module spi_master(
   input clk,                // Reloj del sistema
   input reset,              // Señal de reset
   input [7:0] data_in,      // Datos de entrada para enviar
   input start,              // Inicio de la transmisión
   input [15:0] div_factor,   // Divisor del reloj para la velocidad SPI
   input  miso,          // Master In Slave Out
   output reg mosi,               // Master Out Slave In
   output reg sclk,          // Reloj SPI
   output reg cs,            // Chip Select
   output reg [7:0] data_out, // Datos recibidos
   output reg busy,          // Señal de ocupado
   output reg avail  // Señal de dato recibido
);

   reg [7:0] shift_reg;
   reg [3:0] bit_count;
   reg [15:0] clk_count;
	reg active;
   
	

	always @(posedge clk or posedge reset) begin
	  if (reset) begin
			sclk <= 0;
			cs <= 1;
			shift_reg <= 0;
			bit_count <= 0;
			clk_count <= 0;
			active <= 0;
			busy <= 0;
			avail <= 0;
	  end else if (start && !active) begin
			active <= 1;
			busy <= 1;
			avail <= 0;
			cs <= 0;
			shift_reg <= data_in;
			bit_count <= 8;
	  end else if (active) begin
			if (clk_count < div_factor - 1) begin
				 clk_count <= clk_count + 1;
			end else begin
				 clk_count <= 0;
				 sclk <= !sclk;

				 if (sclk) begin
						mosi <= shift_reg[7];
				 end else begin
					  if (bit_count > 0) begin
							bit_count <= bit_count - 1;
							shift_reg <= {shift_reg[6:0], miso};
					  end else begin
							data_out <= shift_reg;
							cs <= 1;
							active <= 0;
							busy <= 0;
							avail <= 1;
					  end
				 end
			end
	  end
	end
endmodule
