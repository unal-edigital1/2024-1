## Laboratorio 04 Banco de registro

# Introducción

Para este paquete de trabajo, deben estar inscritos en un grupo y clonar la información del paquete de trabajo. Una vez aceptado el repositorio, deben descargarlo en su computador. Para ello, deben clonar el mismo. Si no saben cómo hacerlo, revisen la metodología de trabajo, donde se explica el proceso.

La documentación debe estar diligenciada en el archivo README.md del repositorio clonado.


## Descripción de banco de registro 

El objetivo de este laboratorio es comprender el funcionamiento y la utilidad de un banco de registros dentro de un sistema digital, así como desarrollar habilidades en la descripción de hardware utilizando Verilog.

Un banco de registros es un grupo de _n_ registros y señales de control, las cuales permiten que cada registro sea escrito o leído. Por lo general, el banco de registros tiene un puerto de salida de datos y uno de entrada. Dependiendo de la aplicación, el banco de registros debe permitir la lectura y escritura simultánea de varios registros.

![inbR](https://github.com/unal-edigital1/2024-1/blob/master/labs/figs/br2.PNG)

Un banco de registros es una componente esencial en la arquitectura de procesadores y sistemas digitales, funcionando como un almacenamiento de acceso rápido para los datos que están siendo procesados. Cada registro dentro del banco puede contener un valor binario de tamaño fijo, el cual puede ser leído o modificado mediante operaciones de lectura y escritura. Los registros son fundamentales para realizar operaciones intermedias, almacenar resultados temporales y mantener estados necesarios durante la ejecución de programas y procesos digitales.

![br](https://github.com/unal-edigital1/2024-1/blob/master/labs/figs/br1.PNG)

La señalización y control en un banco de registros son aspectos críticos que garantizan su correcta operación. Se utilizan señales de control específicas para seleccionar los registros adecuados para las operaciones de lectura y escritura, así como para activar la escritura o el reseteo de los registros a valores predeterminados. Este nivel de control permite una gran flexibilidad y precisión en el manejo de datos dentro de un sistema digital.



## Requerimientos 


El objetivo es desarrollar un banco de registros como se observa en la imagen inferior. Los requisitos específicos son:

- El banco de registros debe tener 16 registros de R/W, cada uno de 8 bits, con capacidad de lectura y escritura (R/W).
- Debe ser posible leer dos registros al mismo tiempo, facilitando operaciones paralelas.
- La escritura en un registro se activará mediante una señal de control específica llamada "regwrite".
- Tener una señal de reset (rst) que inicialice todos los registros a un valor predefinido.
- La información de cada registro leído se mostrará en **al menos** dos displays de 7 segmentos, y en representación decimal.
- La carga de datos en los registros debe realizarse a través de interruptores o pines disponibles en la tarjeta de desarrollo de la FPGA.
- Tanto el tamaño de palabra de cada registro como el número total de registros deben ser parametrizables. Se sugiere consultar el siguiente documento para una comprensión más profunda: [link](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-884-complex-digital-systems-spring-2005/related-resources/parameter_models.pdf).
- Se debe pre-cargar el banco de registros con datos específicos utilizando _$readmemh_ (Investigar: "Initialize Memory in Verilog").


 ![caja](https://github.com/unal-edigital1/2024-1/blob/master/labs/figs/br3.PNG)

## Procedimiento

Para este paquete de trabajo usted debe llevar a cabo los siguientes pasos:

1. ***Configuración del laboratorio:***

Comience por crear un nuevo proyecto en su entorno de desarrollo. Proceda a generar el módulo principal denominado `TopLab.v`.


2. ***Visualización con display de 7 Segmentos:***

Integre la funcionalidad de visualización utilizando displays de 7 segmentos. Esto se logra mediante la reutilización del módulo `display.v`, empleado en el laboratorio anterior, para mostrar valores decimales almacenados en los registros. Esta fase implica instanciar correctamente los módulos utilizados previamente, pudiendo requerir ajustes en la entrada `num` para que acepte dos valores diferentes.


3. ***Implementación del Banco de Registros:***

Desarrolle el banco de registros siguiendo los requisitos detallados anteriormente, lo que incluye soporte para la lectura simultánea de dos registros y la escritura en un registro, entre otras funcionalidades. Conecte adecuadamente el banco de registros a los demás componentes del sistema. Para referencia y ejemplos de implementación, consulte el archivo `BancoRegistro.v` en la carpeta `src` de su paquete de trabajo.

Como guía, puede tener en cuenta el siguiente diagrama. Sin embargo, tenga en cuenta que el `display.v` presenta los datos en valor hexadecimal y, por lo tanto, `num` puede aceptar al mismo tiempo los dos registros que salen del `BancoRegistro.v`. Si se requiere visualización en decimal, debe separar los datos de entrada en 2 antes de hacer la decodificación. 

 ![cajaNegraEjemplo](https://github.com/unal-edigital1/2024-1/blob/master/labs/figs/br4.PNG)

4. ***Inicialización de Registros:***

Implemente la lógica necesaria para pre-cargar el banco de registros con valores iniciales, estableciendo un estado de partida conocido para las simulaciones y pruebas.

5. ***Simulación:***

Desarrolle un testbench que verifique todas las funcionalidades del banco de registros, incluyendo las operaciones de lectura y escritura simultáneas y la lógica de reset.

Utilice el testbench creado para simular su diseño, comprobando su correcto funcionamiento con diversas entradas de prueba.

6. ***Depuración:***

Si durante la simulación se identifican errores, proceda a ajustar el código y repita las pruebas necesarias hasta lograr que el diseño funcione de manera correcta.

Esta depuración debe estar documentada en su archivo README.md.

7. ***Implementación en Hardware:***

Transfiera el diseño a una FPGA y lleve a cabo pruebas reales para confirmar su funcionamiento en un entorno de hardware.

## Entregables

Para completar este laboratorio, se requiere la entrega de los siguientes componentes:

- **Código HDL de la Solución:** Debe incluirse el archivo o archivos que contienen la descripción en Verilog de su topLab. Esto abarca todos los módulos y submódulos desarrollados para este laboratorio, así como los archivos de inicialización de memoria.

- **Documentación:** En el archivo markdown (`README.md`), deben detallar el diseño, implementación y uso de su banco de registros. Es importante incluir explicaciones sobre la arquitectura del diseño, cómo realizar la simulación y cualquier otra información relevante para entender y replicar su trabajo.

- **Archivo `testbench`:** Se debe proporcionar un archivo de prueba que simule todas las operaciones posibles en el banco de registros. Esto incluye la escritura en todos los registros, la lectura de cuatro registros específicos y la verificación del correcto funcionamiento de la señal de reset (`rst`). Los resultados de estas simulaciones deben presentarse en un diagrama de tiempo.
 
- **Vídeo de la Implementación:** Se solicita un vídeo que demuestre la implementación funcional de su laboratorio en el hardware.
