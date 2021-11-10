//深圳市21EDA电子.
//www.21eda.com
//LED流水灯试验
//利用分频计数器得到显示流水灯的效果
//视频教程适合我们21EDA电子的所有学习板
module ledwater (clk_50M,rst,dataout);

input clk_50M,rst;     //系统时钟50M输入 从12脚输入。
output [11:0] dataout;  //我们这里用12个LED灯，
reg [11:0] dataout;
reg [27:0] count; //分频计数器

//分频计数器
always @ ( posedge clk_50M )
 begin
  count<=count+1;
 end

always @ ( posedge clk_50M or negedge rst)

 begin
  case ( count[27:24] )
  //  case ( count[25:22] )这一句希望初学者看明白,
  //  也是分频的关键
  //  只有在0的那一位 对应的LED灯才亮。
  0: dataout<=12'b111000111000;
  
  1: dataout<=12'b000111000111;
  
  2: dataout<=12'b110110110110;
  
  3: dataout<=12'b101101101101;
  
  4: dataout<=12'b011011011011;
  
  5: dataout<=12'b000000000000;
  
  6: dataout<=12'b010000010000;
    
  7: dataout<=12'b111000111000; 
  
  8: dataout<=12'b111101111101;
  
  9: dataout<=12'b111111111111;
  
  10: dataout<=12'b111101111101;
  
  11:dataout<=12'b111000111000;
  
  12:dataout<=12'b010000010000;
  
  13:dataout<=12'b000000000000;
  
  14:dataout<=12'b111110000011;
  
  15:dataout<=12'b000011111110;
  endcase
 end
endmodule










