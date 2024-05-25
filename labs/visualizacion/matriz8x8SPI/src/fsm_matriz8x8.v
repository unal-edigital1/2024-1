module fsm_matriz8x8 (
	input clk,                // Reloj del sistema
   input reset,              // Señal de reset
   input [1:0] state,      // Datos de entrada para enviar
	output  mosi,               // Master Out Slave In
   output  sclk,          // Reloj SPI
   output  cs            // Chip Select

  
);


   reg [1:0] state2;
   reg [7:0] data_in;
   reg start;
   wire [7:0] data_out;
   wire busy;
   wire avail;
   wire [15:0] div_factor = 250000;  // Factor de división fijo

	spi_master spi (
       .clk(clk),
       .reset(~reset),
       .data_in(data_in),
       .start(start),
       .div_factor(div_factor),
       .mosi(mosi),
       .sclk(sclk),
       .cs(cs),
       .data_out(data_out),
       .busy(busy),
       .avail(avail)
   );
   reg sendByte;
	reg [10:0]count=0;
   always @(posedge clk) begin
		 if (~reset) begin
           count <= 0;
           sendByte <= 0;
       end else begin
		 case (count)
			0:	begin
				data_in <=0;
				sendByte <=1; 
				count <= 1;
				end
			1: begin
				count <= 2;
				end
			2: begin
				sendByte <=0; 
				if (avail)
					count <= 3;				
				end
			3:	begin
				data_in <=170;
				count <= 4;
				sendByte <=1; 
				end
			4: begin
				count <= 5;
				end
			5: begin
				sendByte <=0; 
				if (avail)
					count <=0;
				end
			endcase
			end
	end

	// para enviar un byte por spi
   always @(posedge clk) begin
		 if (~reset) begin
           start <= 0;
       end else begin
           case(start)
               0: begin  // IDLE
                   if (!busy && sendByte) begin
                       start <= 1;
                   end
               end
               1: begin  // SEND
                   if (avail) begin
                       start <= 0;
                   end
               end
           endcase
       end
   end
endmodule