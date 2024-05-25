module Boton_AR #(parameter COUNT_BOT=50000)(
	input reset,
	input clk,
	input boton_in,
	output reg boton_out
);

reg [$clog2(COUNT_BOT)-1:0] counter;


// antirebote  energia
always @(posedge clk) begin
	if (~reset)begin
		counter <=0;
		boton_out<=~boton_in;
	end else begin
		if (boton_in==boton_out) begin
			counter <= counter+1;			
		end else begin
			counter<=0;			
		end
		if (boton_in==0 && counter==COUNT_BOT)begin
 // 			boton_out<=~boton_out;
	 			boton_out<=1;
				counter<=0;
				
		end
		if (boton_in==1 && counter==COUNT_BOT/100+1)begin
 // 			boton_out<=~boton_out;
	 			boton_out<=0;
				counter<=0;
				
		end
	
	end
		

end	


endmodule