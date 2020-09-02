## Laboratorio 0: instalación y configuración de Framework para FPGA

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


