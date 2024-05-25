module fsm_matriz8x8 (
	input clk,                // Reloj del sistema
   input reset,              // Señal de reset
   input [1:0] state,      // Datos de entrada para enviar
	output  mosi,               // Master Out Slave In
   output  sclk,          // Reloj SPI
   output  cs            // Chip Select

  
);

   reg  [7:0] data_in;     
   reg start;              
   wire [15:0] div_factor;   
   wire busy; 
   wire avail;
	wire cs2;
   assign div_factor = 25000;
  
  assign cs =start;
  spi_master spi (
        .clk(clk),
        .reset(~reset),
        .data_in(data_in),
        .start(start),
        .div_factor(div_factor),
        .mosi(mosi),
        .sclk(sclk),
        .cs(cs2),
        .data_out(data_out),
        .busy(busy),
        .avail(avail)
  );
	reg [26:0]count;
	reg [2:0] estado;
	always @(posedge clk) begin
	
		if (reset==0) begin
			estado <=0;
			start <=0;
		end 
		else begin
		case (estado)
		00: begin
				start <=0;
				data_in <= 100;
				estado <=1;
				count <=0;
		end
		01: begin
				start <=0;
				estado <=2;
			end
		
		10: begin	
				start <=1;
				data_in <= 02;
				estado <=3;
				count <=0;
		end
		11: begin
				start <=0;
				estado <=0;
			end
		
			
		endcase 
		end 
	end	
	
endmodule


