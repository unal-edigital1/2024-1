# Laboratorio 02: sumador de 4 bits en HDL  quartus


# Introducción

En este paquete de trabajo los estudiantes deben familiarizarce con el  framework de trabajo de la FPGA seleccionado, a partir de la descripción de un sumador de 1, y su instanciación para construir un sumador de 4 bit con su respectiva simulación e implementación.

Para este paquete de trabajo, deben estar inscritos en un grupo y clonar la información del paquete de trabajo. Una vez aceptado el repositorio debe descargarlo en su computador, para ello debe clonar el mismo. Si no sabe cómo hacerlo revise la metodología de trabajo, donde se explica el proceso

Las documentación debe estar diligenciada en el archivo README.md del repositorio clonado.

Una vez clone el repositorio, realice lo siguiente:

## Diseño de sumador 4 bits

A partir del bloque funcional del sumador de 1 bit se puede construir el sumador de 4 bits. para ello se debe instancia 4 bloques sumadores de 1 bit.

### Bloque funcional

![Sumador 4bit](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab02-sumador4b/doc/sum4bgeneral.jpg)

Teniendo en cuenta que el sumador en paralelo de 4 bits, se puede construir a partir de la  implementación de sumadores de 1 bit. El diagrama de bloques es:

![Sumador 4ibit](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab02-sumador4b/doc/sum4b.jpg)


### Descripción funcional 

Como ejercicio académico, se presenta la descripción funcional del sumador de 4 bits, a partir de 4 módulos sumadores de 1 bit. Para instanciar estos módulos sumadores de 1 bit se debe usar la siguiente sintaxis

```verilog
nameOfModule  nameOfInstance(.port1(signal1),..,.portn(signaln))
```

Donde **nameOfModule** es el  nombre del módulo a instanciar, para este ejemplo es **sum1bcc**.  **nameOfInstance**, el nombre local que se le da a los módulos y **port1** ... **portn** los puertos tanto de entrada como salida del módulo instanciado. De esta manera, la descripción funcional podrá ser mas una descripción estructural organizada  gracias a la biblioteca del componente creado anteriormente; ```sum1bcc```.

Cree un nuevo proyecto, y construya un archivo llamado Sum4bcc.v, y adicione el siguiente HDL del sumador de 4 bits:

```verilog

module sum4bcc (xi, yi, co, zi);

  input [3 :0] xi;
  input [3 :0] yi;
  output co;
  output [3 :0] zi;

  wire c1,c2,c3;
  sum1bcc s0 (.A(xi[0]), .B(yi[0]), .Ci(0),  .Cout(c1), .S(zi[0]));
  sum1bcc s1 (.A(xi[1]), .B(yi[1]), .Ci(c1), .Cout(c2), .S(zi[1]));
  sum1bcc s2 (.A(xi[2]), .B(yi[2]), .Ci(c2), .Cout(c3), .S(zi[2]));
  sum1bcc s3 (.A(xi[3]), .B(yi[3]), .Ci(c3), .Cout(co), .S(zi[3]));


endmodule

```
Observe que hay 4 instancias de **sum1bcc** y, por lo tanto, se debe adicionar el archivo **sum1bcc.v** a la raiz del actual proyecto. 

En conclusión, el proyecto de sumador de 4 bits, debe tener dos archivos HDL: **sum4bcc.v** y **sum1bcc.v**. Donde **sum4bcc.v** es el Top del proyecto.

### Test bench

Para la generación de estímulos de la señales de entrada y ver la respuesta de la señales de salida, se puede hacer uso de un módulo  Verilog  que  genere dichas pruebas. 

![Testbench](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab02-sumador4b/doc/testbench.jpg)

Para probar el módulo diseñado se debe construir el archivo **testbench.v**  en el cual se generan los estímulos en el tiempo  de las señales de entrada.

![test2](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab02-sumador4b/doc/testbench2.jpg.png)


Para generar el archivo **testbech.v**, se recomienda seguir el procedimientos dado en clase, o seguir el manual ***Simulation-Lab_Manual*** de la carpeta doc del repositorio  y  copie en el archivo lo siguiente:

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
Una vez copie el archivo genere la simulación para ello se deben seguir estos pasos:

1. Seguir el mismo procedimiento detallado de el lab01.md para agregar un archivo HDL, en este caso el **testbench.v**.

2. Hacer doble click en la opción **Analysis & Synthesis**.

3. En el menú **Assignments** &rarr; **Settings** escoger la opción **Simulation** en la lista **Category**.

4. En la sección **NativeLink settings** seleccionar la opción **Compile test bench** y haga click en el botón ```Test Benches...```. Se desplegará el cuadro de diálogo ```Test Benches```.

5. Hacer click en el botón ```New...```. Se desplegará el cuadro de diálogo ```New Test Bench Settings```

6. Diligencie el nombre del test bench (y por default el Top del test bench).

7. En la sección **Simulation period** seleccione alguna de las dos opciones. En la opción **End simulation at:** puede especificar la duración total de la simulación.

8. En la sección **Test bench and simulation files** haga click en el botón ```...``` y escoja el archivo HDL del test bench, es decir **testbench.v**.

9. Haga click en el botón ```Add``` para incluir el archivo.

10. Haga click en los botones ```OK``` y ```Apply``` según corresponda.

11. Finalmente en el menú **Tools** &rarr; **Run Simulation Tool** &rarr; **RTL Simulation**.
 

### Entregables

Una vez clone el repositorio y lea la anterior guia, realice lo siguiente:

* Cree el nuevo proyecto HDL para el sumador de 4 bits, donde el top sea **sum4bcc.v** e instancie el sumador de 1 bit **sum1bcc.v**.

* Creer el archivo **testbench.v**.

* Genera la simulación, revise que el sistema funciona como usted lo esperaba. Realice los comentarios necesarios en el archivo README.md.

* Realice la respectiva publicación del repositorio antes de la fecha dada con todo el código fuente. 

