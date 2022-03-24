## Laboratorio 0: Instalación y Configuración de Framework para FPGA 
## Prueba basicas de funcionamiento del sumador de 1 bit

***Field Programmable Gate Array (FPGA)*** son dispositivos reconfigurables, en los cuales se puede implementar cualquier lógica combinacional o secuencia, en generial un amplio abanico de funciones electronicas. Esto es gracias a que las FPGAS son dispositivos que integran bloques lógicos y que se pueden interconectar según la funcional deseada escrita en el Lenguaje de descripción de hardware (HDL).

Para obtener mas información, se recomienda leer [FPGAs For Dummies eBook](https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/misc/FPGAs_For_Dummies_eBook.pdf)

# Configuración Framework para FPGA

Para general el bitstream, archivo que contiene la información de programación de la FPGA, los fabricantes de FPGAS ofrencen las herramientas de desarrollo propias, como Intel, Xilinx, Lattice, etc., que facilitan la integración del sistema hardware con el HDL.
Por ellos, y acorde con la tecnología de trabajo se recomienda instalar las herramientas IDE y de sintetización, según gustos y tecnología. en este sentido el primer paso en este laboratorio es descargar las herramientas de diseño de hardware.

### Herramientas de Sintetización

* [ISEWebpack](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/wiki/Instalaci%C3%B3n-y-Configuraci%C3%B3n#instalaci%C3%B3n-de-isewebpack) Descontinuado 
* [Vivado](https://www.xilinx.com/products/design-tools/vivado.html)  [guia](https://github.com/ELINGAP-7545/lab00/blob/master/laboo_vivado.md)
* [yosys](http://www.clifford.at/yosys/) Open
* [Quartus Prime lite](http://fpgasoftware.intel.com/?edition=lite) [guia](https://github.com/ELINGAP-7545/lab00#instalaci%C3%B3n-de-quartus-prime-lite) (recomendada para Digital 1 )

### Instalar el IDE de su preferencia (si no desea utilizar los del fabricante)
* [Vim](https://www.vim.org/)
* [Atom](https://atom.io/)
* [Eclipse](https://www.eclipse.org) + [PyDev](https://www.pydev.org/)
* [Sublime Text](http://www.sublimetext.com)


### Solo para Quartus
#### Instalación de Quartus Prime lite
Esta guia esta basada en el lab0 de intel [link](./docs//Intro_to_FPGA.pdf) 

#### Descargar instalador
* Descargar los archivos de instalaciòn de Quartus Prime lite del siguiente [link](http://fpgasoftware.intel.com/?edition=lite)
* Selecione  la version 19.4 (o superior) y  seleciones el sistema operativo  respectivo
* Descomprima  y ejecute el arcivo ***setup***. Siga las instrucciones de instalación de Quartus tools para su computador.

**NOTA**: si no cuenta con usuario registrado en la pagina de Intel debe crear uno.

#### Configuración básica para un nuevo proyecto en Quartus Prime lite

* Una vez instalado, debe abrir el programa ´Quartus´.
* En la barra de herramientas (toolbar) de Quartus, navegar en el menu ```File``` y hacer clic en  ```New Project Wizard```. (ver imagen)

![proyectWizard](./figs/f1.png) 

* ***Directory,Name,Top-LevelEntity***,  seleccione el directorio donde se guarda el proyecto y el nombre del mismo. Tenga presente que debe colocar el nombre del módulo top en la tercera casilla, puede ser el mismo del proyecto. (ver imagen) 
    ***Recuerde:*** El nombre del módulo-top es sensible a mayusculas

![proyectWizard](./figs/f2.png) 

* ***Project Type***, seleccione el template ```Empy project```.

* ***Add File***, si ya cuenta con los archivos fuentes de HDL adicione los ficheros respectivos. De igual manera, pueden agragar archivos fuentes mas adelante.

*  ***Family, Device & Board Settings***,  Busque la tarjeta de desarrollo o la referencia de la FPGA  que se va a utilizar, ```10M50DAF484```, si considera necesario busque  el nombre la casilla  ```Name filter```, seleccione en el panel  Available devices el dispositivo usado. (ver imagen)

![proyectWizard](./figs/f3.png) 


* ***EDA Tool Settings***,  espeficar la herramienta de simulación que se va a utilizar, se recomienda  ```ModemSim```. (ver imagen)

![proyectWizard](./figs/f4.png) 

* ***Summary***, se debe revisar que la información de este panel este acorde según la configuración realizada . (ver imagen)

![proyectWizard](./figs/f4b.png) 


## Entregables 

Tener configurado el frameword según los pasos anteriores

