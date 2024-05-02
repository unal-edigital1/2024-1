
## EVALUACIÓN DE VGA  y MEMORÍA

Para el sistema de visualización y para almacenar en el buffer de memoria los datos se propone el siguiente esquema de trabajo, donde el estudiante puede testear el funcionamiento del driver de la VGA.

![DIAGRAMA](https://github.com/unal-edigital1/2024-1/blob/master/docs/figs/Diapositiva1.PNG)


![DIAGRAMA](https://github.com/unal-edigital1/2024-1/blob/master/docs/figs/Diapositiva2.PNG)

Se recomienda ver el siguiente video https://www.youtube.com/watch?v=l7rce6IQDWs para comprender el funcionamiento de la VGA.

## Introducción 

En esta laboratorio, se debe testear los posibles cambios de memoria, entender el HDL de la VGA y probar la implementación en la VGA.


![DIAGRAMA](https://github.com/unal-edigital1/2020-2/blob/master/docs/figs/Diapositiva3.PNG)

Antes de iniciar con el laboratorio y las pruebas, los estudiantes deben responder una serie de preguntas para la implementación de una memoria y la VGA en la FPGA, y evaluar los resultados a dichas preguntas por medio de simulación e implementación del repositorio dado.

Para este paquete de trabajo, deben estar inscritos en un grupo y clonar la información del link respectivo del laboratorio. Las respuestas deben estar diligenciadas en el archivo `README.md`.


***Recuerde: Revisar  las instrucciones dadas en metodología y documentación.***

### Material

Para este paquete de trabajo se debe contar con:

- Pantalla con entrada VGA y cuya resolución sea 640x480.
- FPGA que cuenta con puerto VGA.
- Cable VGA.
- Plantilla del proyecto sugerido.
- Video explicando parte del código en este [link](https://drive.google.com/drive/folders/1UzvxHlhPj7i8ucTnW9-f9m4tPIoTyhVY?usp=sharing).

### Material Adicional

- Revise la documentación técnica de su FPGA y el monitor VGA para asegurarse de que su diseño es compatible con el hardware.
- Consulte foros y comunidades en línea para solucionar problemas específicos que pueda encontrar durante la implementación.


## Desarrollo

Analizar la máxima memoria RAM que se puede alojar en la FPGA, y planear el método de almacenamiento de datos para el posible videojuego que se desarrollará en la siguiente semana.

### Pregunta 1:

Definir ¿Cuál es el tamaño máximo de buffer de memoria que puede crear, acorde a la FPGA?, contraste este resultado con la memoria necesaria para la visualización en una pantalla VGA 640 X 480 de RGB444, y compruebe si es posible dejando el 50% libre de la memoria.

### Pregunta 2:

Revise el datasheet de la Tarjeta de desarrollo que usted está usando y compruebe el pinout necesario para la implementación ¿Debe realizar algún cambio en el apartado anterior y qué criterios debe tener en cuenta para ello?.


### Simulación (TestBench):

Una vez resueltas las anteriores preguntas,debe  clonar el respectivo repositorio. Si no sabe cómo hacerlo, revise la metodología de trabajo, donde se explica el proceso.

![DIAGRAMA](https://github.com/unal-edigital1/2024-2/blob/master/docs/figs/Diapositiva4.PNG)

Como se observa en la figura anterior, el bloque en rojo y las señales en amarillo indican que el grupo de trabajo debe adicionar dicha información al proyecto `test_cam` para completar el funcionamiento.

El bloque en azul es el PLL que realiza el divisor de frecuencias requeridas 25MHz, en el ejemplo este módulo se implementa con una entrada de reloj de 32MHz y para la FPGA Spartan6. Por tal motivo, es necesario que cada grupo adapte este bloque a la tarjeta que está usando. En el desarrollo del paquete de trabajo se dan las indicaciones para hacer este proceso.



Una vez clone el repositorio, realice lo siguiente:

- Comprenda cada línea del código HDL del archivo `TestVGA.v` que se encuentra en la carpeta `src`. Si cree necesario, realice los respectivos comentarios en el mismo archivo.
- Configure los parámetros necesarios para la simulación e implementación.
- Cree el proyecto HDL.
- Modifique el archivo `image.men`, para que contenga todos los píxeles de un color de su preferencia y que corresponda a la memoria calculada.
- Modifique el archivo `TB_ram`, con el fin de adicionar los estímulos necesarios para simular la lectura y escritura de la memoria RAM. Genera la simulación.
- Revise que el sistema funciona como usted lo esperaba. Realice los comentarios necesarios en el archivo `README.md`.
- Ingrese a la web [vga-simulator](https://ericeastwood.com/lab/vga-simulator/) y cargue el archivo `test_vga.txt`, dejando los datos de configuración tal cual como aparecen.
- Ejecute `submit`.
- Compruebe que el resultado en la web es la siguiente imagen:

![DIAGRAMA](https://github.com/unal-edigital1/2020-2/blob/master/docs/figs/resultado1.png)

- Realice la respectiva publicación del repositorio antes de la fecha dada.

***Nota:*** Observe que en esta instancia usted no ha modificado el hardware del laboratorio, por lo tanto, lo que observa en la pantalla VGA simulada, es la imagen almacenada en memoria por defecto.


### Implementación

Una vez completadas las simulaciones y estando satisfechos con los resultados en el simulador de VGA, el próximo paso es implementar el diseño en una FPGA física y conectarla a un monitor VGA para pruebas en tiempo real. Siga estos pasos para la implementación y pruebas:

#### Ubicación de Pines

Para implementar la salida VGA en la FPGA, debe configurar correctamente el pinout VGA según la tarjeta de desarrollo FPGA que se está utilizando. Consulte el datasheet de su tarjeta de desarrollo FPGA para identificar los pines asignados para la salida VGA. Estos generalmente incluyen pines para las señales de color (Rojo, Verde, Azul) y para las señales de sincronización horizontal y vertical.

1. Revise el datasheet de su tarjeta de desarrollo FPGA.
2. Identifique los pines correspondientes a las señales VGA.
3. En su archivo de constraints (por ejemplo, `.xdc` para Vivado o `.qsf` para Quartus), asigne los pines encontrados a las señales de su diseño HDL.


#### Generación del Bitstream

- Realice una síntesis de su diseño y solucione cualquier error que aparezca.
- Genere el bitstream (archivo de configuración) necesario para programar su FPGA.

#### Programación de la FPGA
- Implemente el diseño en su FPGA, asegurándose de que todos los archivos de constraint estén correctamente configurados para mapear las señales de su diseño a los pines físicos en su tarjeta FPGA.
- Realice pruebas físicas conectando la tarjeta FPGA a una pantalla VGA con la resolución ajustada a 640x480.


#### Conexión y Prueba con Monitor VGA

- Conecte el monitor VGA a su FPGA utilizando un cable VGA. Asegúrese de que el cable y el monitor son compatibles con la resolución y configuración que ha definido en su diseño.
- Encienda el monitor y, si es necesario, configure el monitor para que use la entrada VGA como fuente de señal.
- Observe la salida en el monitor y verifique que el comportamiento es el esperado según su diseño.

####  Análisis y Depuración

- Si la salida no es la esperada, revise su diseño HDL y la configuración de la FPGA.
- Compruebe las conexiones físicas y asegúrese de que el monitor y la FPGA están configurados correctamente.
- Utilice herramientas de depuración disponibles en su entorno de desarrollo para analizar el comportamiento de la FPGA en tiempo real.

#### Documentación y Presentación de Resultados

- Documente el proceso de implementación y los resultados obtenidos.
- Suba la documentación y los recursos visuales al repositorio del proyecto, asegurándose de actualizar el archivo `README.md` con esta información.

Recuerde seguir las buenas prácticas de ingeniería y documentación durante todo el proceso de implementación para asegurar que su proyecto sea replicable y entendible para otros.




***RECUERDE: Es necesario documentar el módulo diseñado con los respectivos diagramas funcionales y estructurales y registrar la información en `README.md`.***





