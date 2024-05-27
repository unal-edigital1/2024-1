module fsm_matriz8x8 (
	input clk,                // Reloj del sistema
   input reset,              // Señal de reset
   input [1:0] state,      // Datos de entrada para enviar
	output  mosi,               // Master Out Slave In
   output  sclk,          // Reloj SPI
   output  cs            // Chip Select

  
);


   reg [7:0] data_in;
   wire [7:0] data_out;
 
   reg start;
   wire busy;
   wire avail;
  
   wire [15:0] div_factor = 200000;  // Factor de división fijo

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
  
   
	reg [7:0] memory4send [0:9];

	reg [3:0] mem_index = 0;
	 
	reg sendByte;
	reg [10:0]state_send=0;

	
	initial begin
        memory4send[0] = 8'h0C;
        memory4send[1] = 8'h01;
        memory4send[2] = 8'h09;
        memory4send[3] = 8'h00;
        memory4send[4] = 8'h00;
		  
    end
	
   always @(posedge clk) begin
		 if (~reset) begin
           state_send <= 0;
           sendByte <= 0;
			  mem_index <= 0;
       end else begin
		 case (state_send)
			0:	begin
				data_in <= memory4send[mem_index]; 
				sendByte <=1; 
				state_send <= 1;
				end
			1: begin
				state_send <= 2;
				end
			2: begin
				sendByte <=0; 
				if (avail) begin
					state_send <= 0;	
   				mem_index <= mem_index+1;
					if (mem_index > 3)
						  mem_index <= 0;
					
				end			
				end
			endcase
			end
	end

	
	// para enviar un byte por spi
   always @(negedge clk) begin
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