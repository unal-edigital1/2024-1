

module buzzer(clk,rst,out);

input clk,rst;
output out;
reg out;

reg[3:0] clk_div1; //???????????4M
reg[12:0] clk_div2;//???????????????????
reg[21:0] cnt;//????????????
reg[2:0] state;

parameter   duo=3822,   //?????????
		    lai=3405,
			mi=3034,
			fa=2865,
			suo=2551,
			la=2273,
			xi=2024,
			duo1=1911;


always@(posedge clk or negedge rst)
begin
	if(!rst) begin
		clk_div1<=0;
	 end
	else begin
		if(clk_div1!=11)
			clk_div1<=clk_div1+1;
		else
			clk_div1<=0;
	 end
end

always@(posedge clk or negedge rst)
begin
	if(!rst) begin
		clk_div2<=0;
		state<=0;
		cnt<=0;
		out<=0;
	 end
	else if(clk_div1==11) begin
		case(state)
			3'b000: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b001;
				if(clk_div2!=duo)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					out<=~out;
				end
			 end
			3'b001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b010;
				if(clk_div2!=lai)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					out<=~out;
				end
			 end
			3'b010:begin                //?"??
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b011;
				if(clk_div2!=mi)
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					out<=~out;
				end
			 end
			3'b011: begin				 //?"??
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b100;
				if(clk_div2!=fa)
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					out<=~out;
				end
			 end
			3'b100: begin               //?"??   
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b101;
				if(clk_div2!=suo)
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					out<=~out;
				end
			 end
			3'b101: begin                  //?"??
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b110;
				if(clk_div2!=la)
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					out<=~out;
				end
			 end
			3'b110: begin                   //?"??
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b111;
				if(clk_div2!=xi)
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					out<=~out;
				end
			 end
			3'b111: begin                   //?"??????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b000;
				if(clk_div2!=duo1)
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					out<=~out;
				end
			 end
		 endcase
	 end
end

endmodule
					