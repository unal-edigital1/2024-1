# Laboratorio 05 Multiplicador 

Explicación generaL de FSM [slide](https://github.com/unal-edigital1-2020-1/page/tree/master/slides/week08)

# Descripción general del sistema: (tomado del documento de clase)

El algoritmo de multiplicación que se implementa se basa en productos parciales (PP). Se realiza la multiplicación iniciando con el bit menos significativo del multiplicador, el resultado de la multiplicación se suma al primer producto parcial y se obtiene  el segundo producto parcial; si el bit del multiplicador es 0 no se afecta el contenido de PP, por lo que no se realiza la suma. 
A continuación se realiza la multiplicación del siguiente bit (a la izquierda del LSB) y el resultado se suma al producto parcial pero corrido un bit a la izquierda.
Este proceso continua hasta completar todos los bits del multiplicador y el último producto parcial es el resultado final. 

![](https://github.com/Fabeltranm/FPGA-Game-D1/blob/master/HW/RTL/00EJEMPLOS/00MULTIPLICADOR%20(ejemplo)/Version_01/03%20document/img/imagen1.png)


## Descripción de la caja Funcional  (in/out)
la caja funcional o caja negra   tiene como entradas multiplicando y el multiplicador **(A y B)**, señales de **m** bits cada una. la salida es el resultado de la multiplicación **PP** (Bus de 2m Bits). Ademas, la señal de reloj (**CLOCK**), entrada. Las señales **INIT** y **DONE**, entrada y salida, se utilizan para iniciar el proceso de multiplicación e indicar que el resultado esta a disponible respectivamente

![](https://github.com/Fabeltranm/FPGA-Game-D1/blob/master/HW/RTL/00EJEMPLOS/00MULTIPLICADOR%20(ejemplo)/Version_01/03%20document/img/imagen2.png)


## Descripción funcional:

![](https://github.com/Fabeltranm/FPGA-Game-D1/blob/master/HW/RTL/00EJEMPLOS/00MULTIPLICADOR%20(ejemplo)/Version_01/03%20document/img/imagen3.png)


## Descripción Estructural:

![](https://github.com/Fabeltranm/FPGA-Game-D1/blob/master/HW/RTL/00EJEMPLOS/00MULTIPLICADOR%20(ejemplo)/Version_01/03%20document/img/imagen4.png)

## Diagrama de Estados:

![](https://github.com/Fabeltranm/FPGA-Game-D1/blob/master/HW/RTL/00EJEMPLOS/00MULTIPLICADOR%20(ejemplo)/Version_01/03%20document/img/imagen4_1.png)

# Entregable

* Simulación de la multiplicación
* Implementación integrando la visualización de los resultados en 7 segmentos
* Video de funcionamiento 
* implementar  la división a partir de maquinas de estados.




