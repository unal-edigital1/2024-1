module sum1bcc (A, B, Ci,Cout,S);

    input  A;
    input  B;
    input  Ci;
    output Cout;
    output S;
  
    reg [1:0] st;
  
    assign S = st[0];
    assign Cout = st[1];
  
    always @ ( * ) begin
      st  =   A+B+Ci;
    end
    
  endmodule