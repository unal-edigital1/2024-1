## Laboratorio 03: implementación por medio de plataforma virtual labsland

### Introducción

El objetivo es la implemetación  en una  FPGA remota del HDL  del display de 7 segmentos.

En este sentido  el  estudiante  se  familiriza con el entorno de labsland, por medio de la implentación de un 7 segmentos  para luego dar paso a la implementación  de los dos  resultados del laboratorio 02.

para este paquete de trabajo, deben estar inscrito en un grupo y clonar la información del siguiente link [WP03](). Una vez aceptado el repositorio debe descargarlo en su computador, para ello debe clonar el mismo. Si no sabe cómo hacerlo revise la metodología de trabajo, donde se explica el proceso

Las documentación deben estar diligencia en el archivo README.md del repositorio clonado.

### Desarrollo

1. Debe seguir la guía dada en el pdf [laboratorio de implementación.pdf] y copiar el siguiente código HDL en la plataforma labsland

```verilog

module bcd2sseg (V_SW, G_HEX0);

   input wire [3:0] V_SW;
   output wire [6:0] G_HEX0;

    reg [6:0] SSeg;
    wire [3:0]  BCD;
    
    assign BCD =V_SW;
    assign G_HEX0 = SSeg;


always @ ( * ) begin
  case (BCD)
    4'b0000: SSeg = 7'b1000000; // "0"  
	4'b0001: SSeg = 7'b1111001; // "1" 
	4'b0010: SSeg = 7'b0100100; // "2" 
	4'b0011: SSeg = 7'b0110000; // "3" 
	4'b0100: SSeg = 7'b0011001; // "4" 
	4'b0101: SSeg = 7'b0010010; // "5" 
	4'b0110: SSeg = 7'b0000010; // "6" 
	4'b0111: SSeg = 7'b1111000; // "7" 
	4'b1000: SSeg = 7'b0000000; // "8"  
	4'b1001: SSeg = 7'b0011000; // "9" 
   4'ha: SSeg = 7'b0001000;  
   4'hb: SSeg = 7'b0000011;
   4'hc: SSeg = 7'b0100111;
   4'hd: SSeg = 7'b0100001;
   4'he: SSeg = 7'b0000100;
   4'hf: SSeg = 7'b0001110;
    default:
    SSeg = 0;
  endcase
end

endmodule
```
