module Botones_antirebote(
	input reset,
	input clk,
	input test,
	input b_energia,
	input b_sueno,
	output reg led1,
	output reg led2,
	output reg led3
);


wire test_tmp;
wire energia_tmp;
wire sueno_tmp;

Boton_AR #(1) B_Test ( .reset(reset), .clk(clk), .boton_in(test), .boton_out(test_tmp));
Boton_AR #(1500000) B_Sueno (.reset(reset), .clk(clk), .boton_in(b_sueno), .boton_out(sueno_tmp));
Boton_AR #(15000000) B_Energia ( .reset(reset), .clk(clk), .boton_in(b_energia), .boton_out(energia_tmp));

always @(posedge test_tmp) begin
	led1=~led1;
end

always @(posedge energia_tmp) begin
	led2=~led2;
end

always @(posedge sueno_tmp) begin
	led3=~led3;
end


endmodule