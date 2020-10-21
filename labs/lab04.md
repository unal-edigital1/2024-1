## Laboratorio 04

# Introducción


Para este paquete de trabajo, deben estar inscrito en un grupo y clonar la información del siguiente link [WP04](). Una vez aceptado el repositorio debe descargarlo en su computador, para ello debe clonar el mismo. Si no sabe cómo hacerlo revise la metodología de trabajo, donde se explica el proceso

Las documentación deben estar diligencia en el archivo README.md del repositorio clonado.

Una vez clone el repositorio, realice lo siguiente:


## Descripción 

Un banco de registros  es un grupo de n registro y señales de control  qe permiten que cada registros sea escrito o leido. Por lo generar el banco de registro tiene  un puerto de salida de datos y uno de entrada.  Dependiedo de la aplicación el banco de registro debe  permite la lectura y escritura simultánea de varios registros.  Para mayor información, si lo considera pertinente, puede leer la información complementaria de este [link](https://github.com/unal-edigital1/2020-2/tree/master/slides/week06) y la presentación.


![cn](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab07-BancosRgistro/doc/caja%20negra.png)

Para implementar en un banco de registro en esta laboratorio debe modificar los archivos  dados para que:

* El banco de registro tenga 8 registros de  4 bits R/W,
* Permita  la lectura de 2 registros  simultáneamente,
* Permita la escritura  de 1 registro, acorde a la señal de control regwrite y, 
* cuente con señal de rst, la cual  ponga  todos los registros en un valor conocido.


* Visualizar la información, en al menos dos display de 7 segmentos (información de cada registro leído).
* El ingreso de la información se debe hacer por medio de los interruptores.

 ![caja](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab07-BancosRgistro/doc/banco%20registro.png)

**Opcional:**
* Parametrizar el tamaño de palabra de cada registro  y la cantidad de registro ( Por defecto =4 bits). Se recomienda leer el documento de este [link](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-884-complex-digital-systems-spring-2005/related-resources/parameter_models.pdf) .
* Pre cargar el banco de registro con información.  _Usar $readmenh_  (Investigar: "Initialize Memory in Verilog").

Entregables:

* Documentación
* Archivo `testbench` el cuál debe simular la escritura de 16 registros y 8 lecturas mas el rst, el resultado de la simulación debe visualizarse en diagrama de tiempo.
* Vídeo de la implementación.
* Código HDL de la solución.
.



