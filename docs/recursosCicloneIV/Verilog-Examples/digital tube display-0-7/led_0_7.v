


module led_0_7 (clk,rst,dataout,en);

input clk,rst;         //????50M?? ?17????
output[7:0] dataout;   //????????
output[7:0] en;        //??????????

reg[7:0] dataout;     
reg[7:0] en;

reg[15:0] cnt_scan;   //???????????
reg[4:0] dataout_buf;

always@(posedge clk or negedge  rst)
begin
	if(!rst) begin
		cnt_scan<=0;
		
	 end
	else begin
		cnt_scan<=cnt_scan+1;
                  //?????????????
		end
end

always @(cnt_scan)
begin
   case(cnt_scan[15:13])
                //case??????????????????
                //??cnt_scan[15:13]??????????????
       3'b000 :
          en = 8'b1111_1110;  //????????

       3'b001 :
          en = 8'b1111_1101;

       3'b010 :
          en = 8'b1111_1011;

       3'b011 :
          en = 8'b1111_0111;

       3'b100 :
          en = 8'b1110_1111;

       3'b101 :
          en = 8'b1101_1111;

       3'b110 :
          en = 8'b1011_1111;

       3'b111 :
          en = 8'b0111_1111;

       default :
          en = 8'b1111_1110;  //????????
    endcase
end
always@(en) //??COM????????
begin
	case(en)
		8'b1111_1110:          //??????????
			dataout_buf=0; //??????????
		8'b1111_1101:
			dataout_buf=1;
		8'b1111_1011:
			dataout_buf=2;
		8'b1111_0111:
			dataout_buf=3;	
		8'b1110_1111:
			dataout_buf=4;
		8'b1101_1111:
			dataout_buf=5;
		8'b1011_1111:
			dataout_buf=6;
		8'b0111_1111:
			dataout_buf=7;
		default: 
			dataout_buf=8;
	 endcase
end

always@(dataout_buf)
begin

	case(dataout_buf)
		4'b0000:
			dataout=8'b1100_0000; //???????0???
		4'b0001:
			dataout=8'b1111_1001;
		4'b0010:
			dataout=8'b1010_0100;
		4'b0011:
			dataout=8'b1011_0000;
		4'b0100:
			dataout=8'b1001_1001;
		4'b0101:
			dataout=8'b1001_0010;
		4'b0110:
			dataout=8'b1000_0010;
		4'b0111:
			dataout=8'b1111_1000; //???????7???
		default: 
			dataout=8'b1000_0000;
	 endcase
end

endmodule 