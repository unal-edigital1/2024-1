## Laboratorio 0: instalación y configuración de Framework para FPGA

***Field Programmable Gate Array (FPGA)*** son dispositivos reconfigurables, en los cuales se puede implementar cualquier lógica combinacional o secuencia, en generial un amplio abanico de funciones electronicas. Esto es gracias a que las FPGAS son dispositivos que integran bloques lógicos y que se pueden interconectar según la funcional deseada escrita en el Lenguaje de descripción de hardware (HDL).

Para obtener mas información, se recomienda leer [FPGAs For Dummies eBook](https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/misc/FPGAs_For_Dummies_eBook.pdf)

# Configuración Framework para FPGA

Para general el bitstream, archivo que contiene la información de programación de la FPGA, los fabricantes de FPGAS ofrencen las herramientas de desarrollo propias, como Intel, Xilinx, Lattice, etc., que facilitan la integración del sistema hardware con el HDL.
Por ellos, y acorde con la tecnología de trabajo se recomienda instalar las herramientas IDE y de sintetización, según gustos y tecnología. en este sentido el primer paso en este laboratorio es descargar las herramientas de diseño de hardware.

### Herramientas de Sintetización

* [ISEWebpack](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/wiki/Instalaci%C3%B3n-y-Configuraci%C3%B3n#instalaci%C3%B3n-de-isewebpack) Descontinuado 
* [Vivado](https://www.xilinx.com/products/design-tools/vivado.html) (redomendada para Digital 1 )
* [yosys](http://www.clifford.at/yosys/) Open
* [Quartus Prime lite](http://fpgasoftware.intel.com/?edition=lite) [guia](https://github.com/ELINGAP-7545/lab00#instalaci%C3%B3n-de-quartus-prime-lite)

### Instalar el IDE de su preferencia (si no desea utilizar los del fabricante)
* [Vim](https://www.vim.org/)
* [Atom](https://atom.io/)
* [Eclipse](https://www.eclipse.org) + [PyDev](https://www.pydev.org/)
* [Sublime Text](http://www.sublimetext.com)


### Descargar instalador
## Instalación de Vivado
Primero es necesario que descarguen el archivo .tar que usaran para realizar la instalacion.

[Descarga](https://www.xilinx.com/support/download.html)

Escogen el paquete que es para todos los sistemass operativos
![Download(https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/Imagen2.png)

Para poder descargar el archivo el sistema les pedira que creen una cuenta
![sigin](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/Imagen1.png)

luego de descargar el archivo deben abrirlo, les paarecera la sigueinte ventana
![instlacion1](https://github.com/unal-edigital1-2020-1/page/tree/master/labs/figs/Imagen3.png)

Ingresan su usuario y contraseña, activan ***Download and Install Now***
![instalacion2](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/Imagen4.png)

Activan las 3 casillas como muestra en la imagen y le dan Next
![instalacion3](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/Imagen5.png)

Activan la casilla ***Vivado*** y le dan Next
![instalacion4](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/Imagen6.png)

Seleccionan la casilla ***Vivado HL WebPACK***
![instalacion5](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/Imagen7.png)

En esta ventana solo deben dejar las casillas seleccionadas como se muestra en la siguiente imagen
![instalacion6](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/Imagen8.png)

Cuando les pida crear la carpeta donde guardar los proyectos darle ***Yes*** (recuerden dicha caroeta, ya qu ela vamos a necesitar mas adelante)
![instalacion6](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/Imagen10.png)

por ultimo es darle en ***Install*** y esperar que el programa se instale
![instalacion6](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/Imagen11.png)


## Configuración básica para un nuevo proyecto en Vivado
### Creacion de un nuevo proyecto

![project1](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/image13.jpg)

![project2](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/image14.jpg)


![project3](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/imagen15.jpg)


![project4](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/imagen16.jpg)


![project5](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/imagen17.jpg)


![project6](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/imagen18.jpg)


![project7](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/imagen19.jpg)


![project8](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/imagen20.jpg)


![project9](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/imagen21.jpg)


![project10](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/image22.jpg)


![project11](https://github.com/unal-edigital1-2020-1/page/blob/master/labs/figs/image23.jpg)
