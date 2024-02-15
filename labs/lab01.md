## Lab 01: Prueba básicas de Quartus con el Funcionamiento del sumador de 1 bit


En este paquete de trabajo los estudiantes deben familiarizarce con el framework de trabajo de la FPGA seleccionado, a partir de la descripción de un sumador de 1 y su simulación básica.


### 1 Especificación
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

### 2 Bloque funcional

Según la especificación del sumador completo de 1 bit, se deduce que el bloque o modulo funcional esta dado por la siguiente gráfica: 

![Sumador 1bit](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab01-sumador1b/doc/bloqSum1b.jpg)

### 3 Lógica combinacional 

Optimizando el circuito, según la tabla de verdad, podemos observar que la lógica combinación del ejercicio propuesto esta dada por:

![Sumador 1bit](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab01-sumador1b/doc/sum1bPuertas.jpg)
 
### 4 Implementación HDL con Verilog


   ***Nota*** : verifique que tenga el programa para sintetizar la descripción de hardware, para este ejemplo, se usa [Quartus prime lite](https://github.com/ELINGAP-7545/lab00#configuraci%C3%B3n-b%C3%A1sica-para-un-nuevo-proyecto-en-quartus-prime-lite), si desea usar el framework de Xilinx  ir al  [link](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/wiki/Introducci%C3%B3n).
 
#### a. HDL con bloques primitives

Una vez abierto el  framework  de [Quartus prime lite](https://github.com/ELINGAP-7545/lab00#configuraci%C3%B3n-b%C3%A1sica-para-un-nuevo-proyecto-en-quartus-prime-lite), cree el nuevo proyecto como se explico en el laboratorio anterior con el wizard.

***Nota***: Recuerde se debe clonar el repositorio en su computador, e importar el archivo ***sum1bcc_primitive.v***

Sin embargo si ***no*** importó el archivo ***sum1bcc_primitive.v*** ,  realice el siguiente procedimiento: 

1. Navegar en el menú ***File*** y hacer clic en``` ***New***. Selecionar ***Verilog HDL File***  según imagen:

![proyectWizard](./figs/f5.png) 

2.  Digitar o copiar el siguiente código, pero antes recuerde que el HDL lo encuentra en la carpeta ```src```. 


```verilog

module sum1bcc_primitive (A, B, Ci,Cout,S);

  input  A;
  input  B;
  input  Ci;***
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

Observe que el HDL inicia con la descripción del módulo ``` sum1bcc_primitive.v```: Se definen las  entradas  y salidas del bloque funcional, tal cual  como se estaba especificado en el bloque funcional.

Luego se instancia las respectivas puertas lógicas (AND, OR, XOR), acorde a los resultados de la lógica de la tabla de verdad. Se resalta la definición de tres componentes ```a_ab, x_ab, cout_t ```, de tipo ```wire ```, que no es más que 'cables' utilizados para conectar las salidas y entradas de unos módulos, en el actual ejemplo son conexiones de puertas. 


#### Entregables 1

* Comprenda cada línea del código HDL del archivo ```sum1bcc_primitive.v``` que se encuentra en la carpera ```src``` y comente si es necesario  en el archivo README.md

#### b. HDL con descripción de suma

como vimos en el paso anterior y su nombre lo indica se esta realizando una descripción funcional del módulo,este sentido, podemos tener varios tipos de descripción, pero que cumplen con el mismo funcionamiento. a continuacíón se presenta otra descripción a partir del mismo sumados. 

En el archivo ``` sum1bcc.v```, que se encuentra en la carpeta ```src``` de su paquete de trabajo clonado, pueden observar la siguiente descripción:


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
    st  <=   A+B+Ci;
  end
  
endmodule
```

Se evidencia que esta nueva descripción cuenta con un  ```reg```  de 2 bits ```st```. En este sentido, representa un elemento de almacenamiento de datos y conserva dicho valor hasta que se le asigna el siguiente valor.


#### Entregables 2

* Implemente un nuevo proyecto en quartus, pero donde el archivo top sea elmodule sum1bcc del archivo ``` sum1bcc.v```
* Comprenda cada línea del código HDL del archivo sum1bcc.v que se encuentra en la carpera src, si cree necesario realice los respectivos comentarios en el mismo archivo o el README.md
* Comente en el archivo README.md las diferencias entre las dos descripciones ```modulo sum1bcc``` y ```modulo sum1bcc_primitive```

### 5 Simulación Funcional  QUARTUS sum1bcc

#### a. Configure el path del simulador en quartus 

Para ejecutar el simulador de EDA (en este caso, Modelsim-Altera) automáticamente desde el software Quartus II usando la función NativeLink, se debe especificar la ruta de  herramienta de simulación realizando los siguientes pasos:

   1. En el menú tool, haga clic en ***Opciones***. Aparece el cuadro de diálogo ```Opciones```.
   2. En la lista ***Category***, en  ***General category***, seleccione ***EDA Tool Options***. 
   3. En la entrada Modelsim-Altera, la ubicación del ejecutable debería ser algo así como ```C:\intelFPGA_lite\19.1\modelsim_ase\win32aloem```.
   4. Si no es así, busque el directorio que contiene el ejecutable de Modelsim-Altera simulador.
  5. Haga clic en ***ok***.

#### b. ModelSim-Altera

Una vez configurado, estas listo para realizar las simulaciones del banco de pruebas (testBench), para ello:

1. Invocar ModelSim desde Quartus:  Tools --> Run Simulation Tool --> RTL Simulation
2. En ModelSim, abra la vista de la ***library***  si aún no está abierta (seleccionando ***View -->
Library*** y verifique que la libreria ***work***, tenga el archivo **sum1bcc**.
3. En la pestaña ***library***, seleccione ***work --> sum1bcc***, que es el banco de pruebas. Haga clic.
4. Deben cargarse dos ventanas de simulación: la ventana de ***Objects*** y la ventana de ***wave***. Si no, cargarlas usted mismo haciendo clic en el menú ***view*** y marcando la respectiva ventana.
5. Para mostrar todas las señales de prueba en la ventana Wave, teniendo como foco la ventana ***Objects***, haga clic en ***add -> A Wave -> Signals in Region***.  Alternativamente, puede mostrar algunas señales seleccionadas en la ventana Wave: En la ventana  ***Objects***, seleccione las señales que le gustaría monitorear y arrástrelas a la ventana Wave (o copiar y pegar).
6. configure las señales en sus estados, y haga clic en ***Run***.

####  Entregable 3
* Generar la simulación visual  y forzar la entradas ```A```, ```B``` y ```Ci``` a clock para  validar todas las posibles entradas.
* Analice la simulación de cada uno de los archivos y compruebe que el sumador funciona correctamente.
* Generar las gráficas respectivas y documente sus resultados en README.md.




