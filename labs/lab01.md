# Laboratorio 01: introducción al HDL  quartus
## sumador 4 bits

# Introducción

En este paquete de trabajo los estudiantes deben familiarizarce con el  framework de trabajo de la FPGA seleccionado, a partir de la descripción de un sumador de 1, y su instanciación para un sumador de 4 bit 

Para este paquete de trabajo, deben estar inscrito en un grupo y clonar la información del siguiente link [WP01](https://classroom.github.com/a/2d6Bcm-f). Una vez aceptado el repositorio debe descargarlo en su computador, para ello debe clonar el mismo. Si no sabe cómo hacerlo revise la metodología de trabajo, donde se explica el proceso

Las documentación deben estar diligencia en el archivo README.md del repositorio clonado.

Una vez clone el repositorio, realice lo siguiente:

#  Desarrollo
## 1 Diseño de sumador 1 bit 

### Especificación
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

### Bloque Funcional

Según la especificación del sumador completo de 1 bit. se deduce que el bloque o modulo funcional esta dado por la siguiente gráfica: 

![Sumador 1bit](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab01-sumador1b/doc/bloqSum1b.jpg)

### Lógica Combinacional 

Optimizando el circuito, según la Tabla de verdad , podemos observar que la lógica combinacional del ejercicio propuesto esta dada por:

![Sumador 1bit](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab01-sumador1b/doc/sum1bPuertas.jpg)
 
### HDL verilog

Antes que nada  verifique que tenga el programa para sintetizar la descripción de hardware.

Una vez abierto el  framework  de su preferencia, digitar o copiar el siguiente código, recuerde que el HDL lo encuentra en la carpeta src [WP01](https://classroom.github.com/a/2d6Bcm-f). 
   
   ***Nota:*** Recuerde  se debe clonar el repositorio en su computador, e importar el archivo ***sum1bcc_primitive.v***

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
Observe que el HDL inicia con la descripción del módulo ``` sum1bcc_primitive``` : Se definen las  entradas  y salidas del bloque funcional , tal cual  como se estaba especificado en el bloque funcional.

Luego se instancia las respectivas puertas lógicas (AND, OR, XOR), acorde a los resultados de la lógica de la tabla de verdad. Se resalta la definición de tres componentes ```a_ab, x_ab, cout_t ``` , de tipo ```wire ```, que no es  mas que 'cables' utilizados para conectar las salidas y entradas de unos módulos, en el actual ejemplo son conexiones de puertas. 


Sin embargo,  como su nombre lo indica se esta realizando una descripción funcional del módulo, y en este sentido, podemos tener varios  tipos de descripción. 

En el archivo ``` sum1bcc.v```, que se encuentra en la carpeta src de  su paquete de trabajo clonado, pueden observar la siguiente descripción:

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
  	st  = 	A+B+Ci;
  end
  
endmodule
```

Se evidencia que esta nueva descripción cuenta con un  ```  Reg ```  de 2 bits ``` st ```. ``` Reg ``` , en este sentido, representan un elemento de almacenamiento de datos y conserva dicho valor hasta que se les asigna el siguiente valor.



### Simulación Funcional  QUARTUS 
1. General la simulación visual  y forzar la entradas A B y Ci a clock para  validar todas las posibles entradas.
2. Comprobar su funcionamiento.
#### a. Configure el path del simulador en quartus 

Para ejecutar el simulador de EDA (en este caso, Modelsim-Altera) automáticamente desde el software Quartus II usando la función NativeLink, se debe especificar la ruta de  herramienta de simulación realizando los siguientes pasos:

   1. En el menú tool, haga clic en ***Opciones***. Aparece el cuadro de diálogo Opciones.
   2. En la lista ***Category***, en  ****General category***, seleccione ***EDA Tool Options***. 
   3. En la entrada Modelsim-Altera, la ubicación del ejecutable debería ser algo así como ```C:\intelFPGA_lite\19.1\modelsim_ase\win32aloem```.
   4. Si no es así, busque el directorio que contiene el ejecutable de Modelsim-Altera
simulador
  5. Haga clic en ***ok***

#### b. ModelSim-Altera

una vez configurado, estas listo para realizar las simulaciones del banco de pruebas, (testBench), para ello:

1. Invocar ModelSim desde Quartus:  Tools --> Run Simulation Tool --> RTL Simulation
2. En ModelSim, abra la vista de la ***library***  si aún no está abierta (seleccionando ***View -->
Library*** y verifique que la libreria ***work***, tenga el archivo **sum1bcc**.
3. En la pestaña library, seleccione work --> sum1bcc, que es el banco de pruebas. Haga clic.
4. Deben cargarse dos ventanas de simulación: la ventana de ***Objects*** y la ventana de ***wave***. Si no, las cargarlos usted mismo haciendo clic en el menú ***view*** y marcando la respectiva ventana.
5. Para mostrar todas las señales de prueba en la ventana Wave, teniendo como foco la ventana ***Objects***, haga clic en add -> A Wave -> Signals in Region.  Alternativamente, puede mostrar algunas señales seleccionadas en la ventana Wave: En la ventana  ***Objects***, seleccione las señales que le gustaría monitorear y arrástrelas a la ventana Wave (o copiar y pegar).
6. configure las señales en sus estados , y haga clic en ***Run***


## Ejercicio 2 - Diseño de sumador 4 bit 

A partir del bloque funcional del sumador de 1 bit se puede construir el sumador de 4 bits. para ello se debe instancia 4 bloques sumadores de 1 bit.

### Bloque Funcional

![Sumador 4bit](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab02-sumador4b/doc/sum4bgeneral.jpg)

Teniendo en cuenta que el sumador en paralelo de 4 bits, se puede construir a partir de la  implementación de sumadores de 1 bit, el diagrama de bloques es:

![Sumador 4ibit](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab02-sumador4b/doc/sum4b.jpg)


### Descripción Funcional 

Como ejercicio académico, se presenta la descripción funcional del sumador de 4 bit, a partir de 4 módulos sumadores de 1 bit. Para instanciar estos módulos sumadores de 1 bit se debe usar la siguiente sintaxis

```verilog
nameOfModule  nameOfInstance(.port1(signal1),..,.portn(signaln))
```

Donde ```nameOfModule``` es el  nombre del módulo a instanciar, para este ejemplo es ```sum1bcc```.  ```nameOfInstance```, el nombre local que se le da a los módulos. Y ```Port1 ... portn``` los puertos tanto de entrada como salida del módulo instanciado. De esta manera, la descripción funcional podrá ser mas una descripción estructural organizada  gracias a la biblioteca del componente creado anteriormente; ```sum1bcc```

Cree un nuevo proyecto, y construya un archivo llamado Sum4bcc.v, y adicione el siguiente HDL del sumador de 4 bits:

```verilog

module sum4bcc (xi, yi,co,zi);

  input [3 :0] xi;
  input [3 :0] yi;
  output co;
  output [3 :0] zi;

  wire c1,c2,c3;
  sum1bcc s0 (.A(xi[0]), .B(yi[0]), .Ci(0),  .Cout(c1) ,.S(zi[0]));
  sum1bcc s1 (.A(xi[1]), .B(yi[1]), .Ci(c1), .Cout(c2) ,.S(zi[1]));
  sum1bcc s2 (.A(xi[2]), .B(yi[2]), .Ci(c2), .Cout(c3) ,.S(zi[2]));
  sum1bcc s3 (.A(xi[3]), .B(yi[3]), .Ci(c3), .Cout(co) ,.S(zi[3]));


endmodule

```
Observe que hay 4 instancias de **sum1bcc**, y por lo tanto, se debe adicionar el archivo sum1bcc.v a la raiz del actual proyecto. 
En conclusión el proyecto de sumador de 4 bit, debe tener dos archivos de HDL: sum4bcc.v y sum1bcc.v. Donde sum4bcc.v es el top del proyecto.

### TestBench

Para la generación de estímulos de la señales de entrada y ver la respuesta de la señales de salida, se puede hacer uso  de un módulo  Verilog  que  genere dichas pruebas. 

![Testbench](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab02-sumador4b/doc/testbench.jpg)

Para probar el módulo diseñado se debe construir el archivo testbench.v  en el cual se generan los estímulos en el tiempo  de las señales de entrada.

![test2](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab02-sumador4b/doc/testbench2.jpg.png)


Para generar el archivo testbech.v , se recomienda seguir el procedimientos dado en clase, o seguir el manual ***Simulation-Lab_Manual*** de la carpeta doc del repositorio   y  copie en el archivo lo siguiente:

```` verilog
module testbench;

  // Inputs
  reg [3:0] xi;
  reg [3:0] yi;

  // Outputs
  wire co;
  wire [3:0] zi;

  // Instantiate the Unit Under Test (UUT)
  sum4b uut (
    .xi(xi), 
    .yi(yi), 
    .co(co), 
    .zi(zi)
  );

  initial begin
  // Initialize Inputs
    xi=0;
    for (yi = 0; yi < 16; yi = yi + 1) begin
      if (yi==0)
        xi=xi+1;
      #5 $display("el valor de %d + %d = %d", xi,yi,zi) ;
    end
  end      

endmodule

````
Una vez, copie el archivo genere la simulación  y revise los resultados  dados


# Entregables

Una vez clone el repositorio y lea la anterior guia, realice lo siguiente:

* Comprenda cada línea del código HDL del archivo sum1bcc_primitive.v y  sum1bcc.v que se encuentra en la carpera src. Si cree necesario realice los respectivos comentarios en el mismo archivo y comente las diferencias entre las dos descripciones.

* Analice la simulación de cada uno de los archivos y compruebe que el sumador funciona correctamente.

* Cree el nuevo proyecto HDL para el sumador de 4 bit, onde el top sea sum4bcc.v e instancie el sumador de 1 bit ***sum1bcc.v***
* Creer el archivo testbench.v
* Genera la simulación, Revise que el sistema funciona como usted lo esperaba. Realice lo comentarios necesarios en el archivo README.md.
* Realice la respectiva publicación del repositorio antes de la fecha dada con todo el código  fuente 

# Deadline

    16 de septiembre 8 de la Noche

