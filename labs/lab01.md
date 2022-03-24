## Prueba basicas de Quartuus con el Funcionamiento del sumador de 1 bit

### Introducción

En este paquete de trabajo los estudiantes deben familiarizarce con el framework de trabajo de la FPGA seleccionado, a partir de la descripción de un sumador de 1, y su simulación básica 

### Diseño de sumador 1 bit 

##### 1 Especificación
Diseñar un sumador de un bit A y un bit B completo. Es decir el sumador cuenta con carrier  y se comporta acorde a la siguiente tabla de verdad.

A  | B  | Cin | Out | Cout 
-- | -- | --  | --  |  --
0| 0 | 0 |0 | 0
0| 0 | 1 | 1| 0
0| 1 | 0 | 1| 0
0| 1 | 1 | 0| 1
1| 0 | 0 | 1| 0
1| 0 | 1 | 0| 1
1| 1 | 0 | 0| 1
1| 1 | 1 | 1| 1

##### 2 Bloque Funcional

Según la especificación del sumador completo de 1 bit. se deduce que el bloque o modulo funcional esta dado por la siguiente gráfica: 

![Sumador 1bit](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab01-sumador1b/doc/bloqSum1b.jpg)

##### 3 Lógica Combinacional 

Optimizando el circuito, según la Tabla de verdad , podemos observar que la lógica combinación del ejercicio propuesto esta dada por:

![Sumador 1bit](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab01-sumador1b/doc/sum1bPuertas.jpg)
 
##### 4 Implementación HDL verilog

   ***Nota*** : verifique que tenga el programa para sintetizar la descripción de hardware, para este ejemplo, se usa [Quartus prime lite](https://github.com/ELINGAP-7545/lab00#configuraci%C3%B3n-b%C3%A1sica-para-un-nuevo-proyecto-en-quartus-prime-lite), si desea usar el framework de Xilinx  ir al  [link](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/wiki/Introducci%C3%B3n)
 

Una vez abierto el  framework  de [Quartus prime lite](https://github.com/ELINGAP-7545/lab00#configuraci%C3%B3n-b%C3%A1sica-para-un-nuevo-proyecto-en-quartus-prime-lite), cree el nuevo proyecto como se explico en el laboratorio anterior con el wizard.

![proyectWizard](./figs/f5.png) 

***Nota***: Recuerde se debe clonar el repositorio en su computador, e importar el archivo ***sum1bcc_primitive.v***

Sin embargo si no importo el archivo ***sum1bcc_primitive.v*** , digitar o copiar el siguiente código, recuerde que el HDL lo encuentra en la carpeta src





```verilog

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
```
Observe que el HDL inicia con la descripción del módulo ``` sum1bcc_primitive.v``` : Se definen las  entradas  y salidas del bloque funcional , tal cual  como se estaba especificado en el bloque funcional

Luego se instancia las respectivas puertas lógicas (AND, OR, XOR), acorde a los resultados de la lógica de la tabla de verdad. Se resalta la definición de tres componentes ```a_ab, x_ab, cout_t ``` , de tipo ```wire ```, que no es  mas que 'cables' utilizados para conectar las salidas y entradas de unos módulos, en el actual ejemplo son conexiones de puertas. 

Sin embargo,  como su nombre lo indica se esta realizando una descripción funcional del módulo, y en este sentido, podemos tener varios  tipos de descripción. en el archivo ``` sum1bcc.v```, pueden observar la siguiente descripción:

```verilog
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
```

Se evidencia que esta nueva descripción cuenta con un  ```  Reg ```  de 2 bits ``` st ```. ``` Reg ``` , en este sentido, representan un elemento de almacenamiento de datos y conserva dicho valor hasta que se les asigna el siguiente valor.

### Entregables 

Comprenda cada línea del código HDL del archivo sum1bcc_primitive.v y sum1bcc.v que se encuentra en la carpera src. Si cree necesario realice los respectivos comentarios en el mismo archivo y comente las diferencias entre las dos descripciones.

Analice la simulación de cada uno de los archivos y compruebe que el sumador funciona correctamente. la simulación se debe realizar con  quartus ModelSim, acorde a la guia de simulación.




