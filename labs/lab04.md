## Laboratorio 04 Banco de registro

# Introducción

Para este paquete de trabajo, deben estar inscrito en un grupo y clonar la información del  paquete de trabajo. Una vez aceptado el repositorio debe descargarlo en su computador, para ello debe clonar el mismo. Si no sabe cómo hacerlo revise la metodología de trabajo, donde se explica el proceso

Las documentación deben estar diligencia en el archivo README.md del repositorio clonado.


## Descripción de banco de registro 

El objetivo de este laboratorio es comprender el funcionamiento y la utilidad de un banco de registros dentro de un sistema digital al igual qe ir desarrollar habilidades en la descripción de hardware utilizando Verilog.

Un banco de registros  es un grupo de _n_ registro y señales de control las cuales permiten que cada registros sea escrito o leido. Por lo generar el banco de registro tiene  un puerto de salida de datos y uno de entrada.  Dependiedo de la aplicación el banco de registro debe  permite la lectura y escritura simultánea de varios registros.  

![cn](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab07-BancosRgistro/doc/caja%20negra.png)


Un banco de registros es una componente esencial en la arquitectura de procesadores y sistemas digitales, funcionando como un almacenamiento de acceso rápido para los datos que están siendo procesados. Cada registro dentro del banco puede contener un valor binario de tamaño fijo, el cual puede ser leído o modificado mediante operaciones de lectura y escritura. Los registros son fundamentales para realizar operaciones intermedias, almacenar resultados temporales, y mantener estados necesarios durante la ejecución de programas y procesos digitales.

La señalización y control en un banco de registros son aspectos críticos que garantizan su correcta operación. Se utilizan señales de control específicas para seleccionar los registros adecuados para las operaciones de lectura y escritura, así como para activar la escritura o el reseteo de los registros a valores predeterminados. Este nivel de control permite una gran flexibilidad y precisión en el manejo de datos dentro de un sistema digital.

# Requerimientos 

El objetivo es desarrollar un banco de registros como se observa en la imagen inferior. Los requisitos específicos son:

* El banco de registro tenga 16 registros de  4 bits R/W, cada uno de 4 bits, con capacidad de lectura y escritura (R/W).
*  Debe ser posible leer dos registros al mismo tiempo, facilitando operaciones paralelas.
* La escritura en un registro se activará mediante una señal de control específica  llamada "regwrite".
* Tener una señal de reset (rst) inicialice todos los registros a un valor predefinido. 
* La información de cada registro leído se mostrará en al menos dos displays de 7 segmentos, y en reprecentación decimal.
* La carga de datos en los registros debe realizarce a través de interruptores o pines disponibles en la tarjeta de desarollo de la FPGA.
* Tanto el tamaño de palabra de cada registro como el número total de registros deben ser parametrizables. Se sugiere consultar el siguiente documento para una comprensión más profunda: [link](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-884-complex-digital-systems-spring-2005/related-resources/parameter_models.pdf) .
*  Se debe pre-cargar el banco de registros con datos específicos utilizando _$readmenh_.(Investigar: "Initialize Memory in Verilog").

 ![caja](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab07-BancosRgistro/doc/banco%20registro.png)


Entregables:

* Documentación
* Archivo `testbench` el cuál debe simular la escritura de 8 registros y 4 lecturas mas el rst, el resultado de la simulación debe visualizarse en diagrama de tiempo.
* Vídeo de la implementación.
* Código HDL de la solución.
.



