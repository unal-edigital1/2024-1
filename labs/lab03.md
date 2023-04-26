## Laboratorio 03: Simulación por medio de Testbench  e implementacion de 7 segmentos 
### BCD2sseg


# Introducción

En este paquete de trabajo los estudiantes deben familiarizarce con el  framework de trabajo de la FPGA seleccionado, a partir de la descripción dedecodificador BCD2SSeg

Para este paquete de trabajo, deben estar inscrito en un grupo y clonar la información del paquete de trabajo  [LAB03]. Una vez aceptado el repositorio debe descargarlo en su computador, para ello debe clonar el mismo. Si no sabe cómo hacerlo revise la metodología de trabajo, donde se explica el proceso

Las documentación deben estar diligencia en el archivo README.md del repositorio clonado.

Una vez clone el repositorio, realice lo siguiente:

## Ejercicio 1 Diseño BCD-7seg

En este punto, ya se estar en la capacidad de describir e implementar Hardware sencillo, con la ayuda de herramientas computaciones.  y como se vio en los  ejemplos anteriores, la suma se visualiza en leds,  algo que es difícil para  validad visualmente la respuesta. Por lo tanto, es aconsejable tener una visualización mas acorde a las necesidades, como por ejemplo  visualizar los resultados en el [ Display 7 Segmentos](https://en.wikipedia.org/wiki/Seven-segment_display) 

En este Ejercicio se propone que realicen el diseño, sintentización e implementación del Display de 7 sergmentos, el cual permita visualizar números  en representación hexadecimal (0x0 a 0xF).  En el siguiente gráfico, se observa cual es el funcionamiento deseado del display:


![gif display](https://upload.wikimedia.org/wikipedia/commons/2/2b/Seven_segment_display-animated.gif)

Imagen tomada de [User:Guam + Various](https://commons.wikimedia.org/wiki/File:Seven_segment_display-animated.gif)

A continuación se presentan los pasos recomendados para el ejercicio:

**1. Definir la caja funcional del BCD**: 

![bcd_black](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab03-BCD2SSeg/doc/BCD2SSeg.jpg)

Si observa la caja negra/ funcional  ademas  de la salidad de 7 segmentos contiene  una salida `An`. esta salida es para conectar eventualmente el ánodo del display y  poder hacer visualización dinámica, cuando se tiene mas de un display conectado.


**2 Definir la descripción Funcional**

Para ello recuerde  que puede hacer uso, bien sea, de las tablas de verdad o de la descripción algorítmica del BCD a  siete segmentos. Recuerde que cada Segmento es una salida  del diseño. Ejemplo, si desea  visualizar el número **1**, la salida seria  de `Sseg es 0110000`. observe la gráfica a continuación, para generar las salidas acorde al número de entrada.

![sseg](https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/7_segment_display_labeled.svg/1024px-7_segment_display_labeled.svg.png)


**3. Definir en  HDL el comportamiento del sistema** :  Use Verilog para hacer la descripción funcional
**4. Simulación de Sistema** :  Use el Testbench para este fin.
**5. Implementación**: en la tarjeta correspondiente implemente y valide el funcionamiento, recuerde definir el pinout


# Ejercicio 2- Visualización Dinámica 4 Display- Segmentos


Si el diseño digital de algún sistema se requiere mas de un display de 7 segmentos, es necesario  generar una visualización tal que sea necesario el menor número de pines para conectar todos los display en con la FPGA.

Por ahora, se ha visualizado el números en un solo display de 7 segmentos. Pero en la mayoría de los casos, los 7 pines de los cátodos están inter-conectados entre cada display, como se observa en la figura:

![conex](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/conex.png)

Por lo tanto, se debe  realizar una multiplexación  entre los Anodos de cada Display, con el fin de visualizar en cada display un número diferente.  En otras palabras, en cada instante de tiempo, solo un display se encuentra activo. En este sentido, se debe garantizar que el destello en la visualización entre cada display no se perciba. Para ello, cada display debe activarse máximo cada 16 ms.

Visualmente esto se entiende mas con la siguiente simulación, donde se desea visualizar el  número en representación hexadecimal `0x4321`:


![diagrama](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/4sseg.jpg)


## 1 Diagrama Caja negra 

Como siempre, antes de realizar la descripción del hardware se debe diseñar la caja funcional del modulo, con las entradas y salidas

![diagrama caja negra ](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/display_7segx4.jpg)

En este sentido, se adiciona al HDL de siete segmentos 4 señales de control para el LCD, llamadas An. cada bit de la señal `An` debe ser modificado en el tiempo, con el fin de activar solo un display.  

## 2 Diagrama Estructural 

![estructural](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/display_7segx4_Diag_Estructural.jpg)

Se evidencia que se deben construir cuatro módulos  básicos, de los cuales uno de ellos esta descrito en el ejercicio anterior, ***BCDtoSSeg.v***. Los otros tres bloques son:

* Divisor de frecuencia: Su función es dividir la frecuencia de  `clk` de entrada, en el tiempo requerido para cada camvio de ánodo
* Selector de Ánodo: Sincronizado con la frecuencia  que genera el divisor, cambia en cada instante de tiempo el  ánodo, se puede ver como un registro de desplazamiento del bit 0 `1110 1101 1011 0111`
* Selector de Datos: dependiendo del ánodo activado, activa los datos correspondientes.

# Entregables

Una vez clone el repositorio y lea la anterior guia, realice lo siguiente:

En el paquete de trabajo esta la descripción del hardware que se implementa para visualizar un número hexadecimal en un display de 7 segmentos  y 32 bits  4 display de 7 segmentos. (se recomienda usar esto como guia de trabajo )

* Comprenda cada línea del código HDL de los archivos que se encuentra en la carpera src. Si cree necesario realice los respectivos comentarios en el mismo archivo.

1.  Simulación
* Realice la simulación por medio de testbench para el BCD-7seg (1 display), analice los resultados.
* Cree el nuevo proyecto HDL para Visualización Dinámica 4 Display, tomando como base los archivos dados.
* Creer el archivo testbench.v para simular la visualización de 4 display
* Genera la simulación, Revise que el sistema funciona como usted lo esperaba. 
* Realice lo comentarios necesarios en el archivo README.md de las dos simulaciones.

2. Implementación
* implementar en la tarjeta el desarrollo de HDL según los parametros dados en clase, primero el de 1 display  y luego el de 4 display
* Comprobar la lógica en la FPGA 
* Introducir cada uno de los números posibles mediante los interruptores, y verifica que se muestran todos correctamente. recuerde para un display se requieren 4 pulsadores  y para  4 display es necesario 32 interruptores
* Realice lo comentarios necesarios en el archivo README.md.


3. Adicionales 
* Modificar o Añadir los bloques necesarios para que la visualización sea en representación Decimal y no Hexadecimal.
* Realice la respectiva publicación del repositorio antes de la fecha dada con todo el código fuente


# Deadline


