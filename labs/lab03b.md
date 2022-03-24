## Laboratorio 03: Implementación por medio de plataforma remota labsland

### Introducción

El objetivo es la implemetación  en una  FPGA remota del HDL  del display de 7 segmentos.

En este sentido  el  estudiante  se  familiriza con el entorno de labsland, por medio de la implentación de un 7 segmentos  para luego dar paso a la implementación  de los dos  resultados del laboratorio 02.

para este paquete de trabajo, deben estar inscrito en un grupo y clonar la información del siguiente link [WP03](https://classroom.github.com/g/pHyeUqlc). Una vez aceptado el repositorio debe descargarlo en su computador, para ello debe clonar el mismo. Si no sabe cómo hacerlo revise la metodología de trabajo, donde se explica el proceso

Las documentación deben estar diligencia en el archivo README.md del repositorio clonado.

### Desarrollo

1. Debe seguir la guía dada en el pdf [laboratorio de implementación.pdf](https://github.com/unal-edigital1/2020-2/blob/master/slides/week06/laboratorio%20de%20%20implementaci%C3%B3n.pdf) y copiar el siguiente código HDL en la plataforma labsland

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
2. Verifica que funciona los 7 segmentos  en la plataforma labsland,  para ello: 
	1. Comprobar la lógica en la FPGA real.
	2. Introducir cada uno de los números posibles mediante los interruptores, y verifica que se muestran todos correctamente, desde el 0 hasta el 15.

3. Realice lo comentarios necesarios en el archivo README.md.
4. Una vez se familiarece con la plataforma modificar o añadir los archivos necesarios  de la visualziación hexadecimal  del laboratorio 02 en la fpga  de labsland, tenga encuenta  los parametros dados en clase.
5. Realice lo comentarios necesarios en el archivo README.md.
6. Repita el procedimiento para la visualización sea en representación Decimal.
7. Realice la respectiva publicación del repositorio antes de la fecha dada con todo el código fuente

### RECUERDEN: 

1. Todos los integrantes del grupo deben trabajar en el respectivo repositorio y participar en los commit push, y la construcción de la documentación
2. El trabajo que ustedes documenten, será el que leerán sus compañeros de los próximos semestres. En este contexto, en la evaluación de la documentación será tenida en cuenta la minuciosidad y claridad de la misma.
3 La documentación se debe diligenciar en el archivo README.md, que se encuentra en cada repositorio. El archivo README.md, se debe escribir en formato Markdown. Para aprender cual es el formato de este documento se recomienda revisar el siguiente [link](https://guides.github.com/features/mastering-markdown/) que les da una visión rápida de formato usado para hacer la documentación. Las imágenes, fotos y soportes gráficos deben ser alojados en la carpeta ‘figs’ y deben ser vinculadas en documento README.md.
