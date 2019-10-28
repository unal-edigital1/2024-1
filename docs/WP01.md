##  ELECTRÓNICA DIGITAL 1 2019 -2 UNIVERSIDAD NACIONAL DE COLOMBIA 


## Introducción 
TODO


## TRABAJO 01- EVALUACIÓN DE MEMORIA  MÁXIMA 

Analizar la máxima memoria ram que podemos alojar en la FPGA,  y planear el método de adquisición de los datos de la cámara  para lo cual se debe responder las siguientes:

### Pregunta 1:
¿Definir cuál es el tamaño máximo de búfer de memoria que puede crear?, se recomienda leer las especificaciones de la FPGA que esta usando cada grupo. La respuesta se debe dar en bytes-

### Pregunta 2:
¿Cuál formato  y el tamaño de imagen de la cámara OV7670  que se ajusta mejor al tamaño de memoria calculado en la pregunta 1?. Para ello revisar la hoja de datos de la camara OV7670. la cual se encuentra [aquí](https://github.com/unal-edigital1-2019-2/work1-ram/blob/master/docs/datasheet/OV7670_2006.pdf)

### Pregunta 3:
¿Cuales son los registro de configuración de la cámara OV7670 que permiten tener la cofiguración dada en la pregunta 2?. Revisen los registros dados de la pagina 11 a la 23 del datasheet e indiquen la configuración para:

* Restablecer todos los registros
* Habilitar el escalado
* Configurar el formato y el tamaño del pixel
* Habilitar el test de barra de colores

### Simulación (TestBench):

Una vez resultas las anteriores preguntas se  debe descargar el paquete de trabajo 01 de este link  [WP01](https://classroom.github.com/g/Ra4G34mi)  revise las instruciones dadas en metodología y documentación.

Una vez clone el respositorio, realice lo siguiente:

* Comprenda cada linea del codigo HDL del archivo **buffer_ram_dp.v** que se encuentra en la carpera src.
* Configure los parametros del ancho de palabra **DW**  y tamaño de dirección **AW**, según los resultados dados en la pregunta 1 y 2.
* Cree el proyecto HDL  donde el top sea **buffer_ram_dp.v**.
* Modifique el archivo **image.men**, para que contenga todos los pixeles de un solo color  y que corresponda a la memoria calculada.
* Modifique el archivo **TB_ram**, con el fin de adicionar las estimulos necesarios para simular la lectura y escritura de la memoria ram
* Revise que el sitema funciona como usted lo esperaba y realice la respectiva publicación del repositorio antes de la fecha dada.







