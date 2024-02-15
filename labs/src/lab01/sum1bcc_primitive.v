module sum1bcc_primitive (A, B, Ci,Cout,S);

    input  A;
    input  B;
    input  Ci;
    output Cout;
    output S;
  
    wire a_ab;
    wire x_ab;
    wire cout_t;
  
    and(a_ab,A,B);
    xor(x_ab,A,B);
  
    xor(S,x_ab,Ci);
    and(cout_t,x_ab,Ci);
  
    or (Cout,cout_t,a_ab);
  
  endmodule