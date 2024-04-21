## Bus de datos serial SPI

## Introducción

Los buses seriales son interfaces de comunicación que transmiten datos entre dispositivos utilizando líneas de señalización mínimas. En lugar de transmitir múltiples bits en paralelo, los buses seriales envían los datos bit a bit de forma secuencial. Un ejemplo de bus serial es el Bus SPI (Serial Peripheral Interface), que utiliza generalmente cuatro líneas principales: SCLK (reloj serial), MOSI (Master Out Slave In), MISO (Master In Slave Out) y CS (Chip Select). El bus SPI permite una comunicación rápida y fiable entre un dispositivo maestro y uno o varios dispositivos esclavos, facilitando el control preciso de dispositivos periféricos como sensores, memorias y pantallas.

### Descripción en HDL

El HDL de Spi_master lo encuentran en la carpeta [src](./src)

El módulo spi_master, se encuentra en scr/spi_master.v actúa como un maestro en la interfaz SPI, controlando la comunicación serial con dispositivos esclavos. Al recibir una señal de inicio (start) y datos de entrada (data_in), el módulo inicia una transmisión SPI. Utiliza un divisor de reloj (clock_div) para configurar la velocidad del reloj SPI (sclk), permitiendo ajustes en la tasa de transmisión de datos. El proceso de transmisión implica enviar los datos desde el maestro al esclavo bit por bit, comenzando desde el bit más significativo hasta el menos significativo, mediante la línea MOSI (Master Out Slave In). Simultáneamente, el módulo recibe datos desde el esclavo a través de la línea MISO (Master In Slave Out), también bit por bit en sincronización con el reloj SPI.

                                _______________
                               |               |
                      clk -----|               |
                      rst -----|               |
            data_in [7:0] -----|               |---- sclk
           data_out [7:0] <----|  SPI MASTER   |---- mosi
           freq_div[15:0] -----|               |---- miso
                    start -----|               |---- cs
                     busy <----|               |
                    avail <----|               |
                               |_______________|


Durante una comunicación activa, el módulo genera señales para controlar la comunicación y el estado de la comunicación. La señal cs (Chip Select) se activa (baja) para seleccionar el dispositivo esclavo con el que se comunica, y se desactiva (alta) al finalizar la transacción. El módulo también mantiene una señal busy que indica si una operación SPI está en curso, asegurando que no se inicie una nueva transacción hasta que la actual se complete. Al finalizar la recepción de los datos, se activa la señal avail para indicar que los datos del esclavo han sido completamente recibidos y están disponibles en data_out para su uso posterior. 


### El Diagrama  de caja Negra 
El diagrama del maestro SPI ilustra las diferentes señales y registros que interactúan dentro del módulo para realizar la comunicación SPI. La descripción general del flujo de operación es:

1. **Control de Inicio**: Al recibir una señal de start y no estar en estado de reset, el módulo se prepara para transmitir datos iniciando el proceso y bajando la señal de cs para seleccionar el dispositivo esclavo.
2. **División del Reloj**: El divisor de reloj (freq_div) ajusta la frecuencia de la señal de reloj SPI (sclk) controlando los intervalos de tiempo en que los datos son muestreados y enviados.
3. **Transmisión y Recepción de Datos**: Los datos de entrada (data_in) son cargados en un registro de desplazamiento y transmitidos bit a bit al dispositivo esclavo a través de MOSI, mientras que simultáneamente se reciben los datos del esclavo a través de MISO.
4. **Gestión de Estados de Transacción**: La señal busy indica si una transacción está en curso, y avail se activa una vez que todos los bits han sido recibidos en MISO correctamente.
### Estados
Por lo tanto se  puede ver tres estados de funcionamiento 

1. Estado Inicial (IDLE):
Entrada: El módulo permanece en este estado hasta que la señal start se activa.
Transición: Al activar start, transita al estado TRANSMIT.
2. Estado de Transmisión (TRANSMIT):
Entrada: El módulo carga data_in en el registro de desplazamiento y comienza la transmisión/recepción de datos.
Actividad: Los bits se envían y reciben sincronizados con el reloj SPI.
Transición: Una vez transmitidos todos los bits, se transita al estado COMPLETE.
3. Estado de Completo (COMPLETE):
Entrada: Todos los bits han sido enviados y recibidos.
Actividad: La señal avail se activa para indicar que la transmisión ha terminado.
Transición: Retorna al estado IDLE para estar listo para una nueva operación.

### Diseño de FSM para controlar el MAX7219

Para crear el FSM que controle el envío de datos a un MAX7219 a una matriz de LED 8x8, debemos diseñar el FSM de modo que genere los patrones correctos para los registros del MAX7219 y los envíe mediante el SPI master que ya tenemos. El MAX7219 controla una matriz de LEDs y permite configurar individualmente cada columna y fila.

                   _______________       ______________________       _________________
                  |      FSM      |     |       SPI MASTER     |     | O O O O O O O O |
                  |     CARAS     |   --| >clk                 |     | O ▓ ▓ O O ▓ ▓ O |
      50Mhz clk --|               |   --| rst                  |     | O ▓ ▓ O O ▓ ▓ O |
            rst --|       Reg/Val |-----| data_in [7:0]    sclk|-----| O O O O O O O O |
                  |            NC |   --| data_out [7:0]   mosi|-----| O O O O O O O O |
      State[2:0]--|           500 |-----| freq_div[9:0]    miso|--   | O ▓ ▓ O O ▓ ▓ O |
           init --|      spiStart |-----| start              cs|-----| O O ▓ ▓ ▓ ▓ O O |
          done <--|       spiBusy |-----| busy                 |     | O O O ▓ ▓ O O O |
                  |      spiAvail |-----| avail                |     |   MAX7219 8X8   |
                  |_______________|     |______________________|     |_________________|
                  
Este es un ejemplo de para configurar y usar el MAX7219:

1. Inicialización: Configura el MAX7219 para modo normal (no en modo de prueba), brillo adecuado, y modo de decodificación desactivado.
2. Envío de datos: Cada columna de la matriz LED se controla enviando datos al respectivo registro del MAX7219.Los datos para cada columna deben representar los LEDs que deben estar encendidos para crear la imagen.

**Diseño de la FSM**

La FSM para el control del MAX7219 puede tener los siguientes estados:
1. RESET: Estado inicial que prepara la FSM.
2. INIT: Configura el MAX7219 (intensidad, modo de escaneo, etc.).
3. LOAD_FACE: Carga los datos para visualizar en la matriz 8x8.
4. UPDATE_DISPLAY: Envía los datos al MAX7219 via SPI.
5. DONE: Indica que la cara ha sido cargada y está siendo mostrada.
6. IDLE: Espera hasta que se necesite una nueva actualización o cambio de imagen.

**Procesimiento para escribir en un registro via SPI**

se debe describir un ciclo completo de comunicación con un dispositivo SPI, donde se escribe en un registro específico, gestionando las señales de control necesarias para sincronizar correctamente las transacciones y evitar colisiones de datos o errores de comunicación. 

La secuencia debe asegura que cada paso se complete adecuadamente antes de proceder al siguiente, utilizando las señales spi_start, spi_done y spi_avail para manejar el flujo de datos eficientemente.

**Proceso de Escritura**

1. **Estado Inicial (IDLE):** La máquina de estados comienza en el estado IDLE, donde espera estar lista para iniciar una nueva operación de escritura o lectura.
Desde IDLE, la FSM transita automáticamente al estado WRITE_REG para comenzar la secuencia de escritura en un registro del dispositivo SPI, si spi_done esta en cero y si hay dato para enviar.
2. **Escribir Dirección del Registro (WRITE_REG):** En este estado, se asigna la dirección del registro a spi_data_in (por ejemplo, 0x01, que corresponde a la columna 1 de la matriz8x8). Se activa la señal spi_start para indicar al módulo SPI maestro que inicie la transmisión de los datos hacia el dispositivo SPI. Una vez iniciada la transmisión, se transita al estado WAIT_WRITE.
3. **Espera de Finalización de Escritura (WAIT_WRITE):** En este estado, la FSM espera la finalización de la operación de escritura, monitoreando la señal spi_done. spi_start se desactiva para asegurar que no se reinitie la transacción SPI antes de tiempo. Cuando spi_done se activa, indicando que la escritura de la dirección del registro ha concluido, la FSM transita al estado WRITE_VAL.
4. **Escribir Valor en el Registro (WRITE_VAL):** Aquí se carga el valor deseado a escribir en el registro en spi_data_in (por ejemplo, 0xFF, todo la columna 1 prendida).
Se activa nuevamente spi_start para iniciar otra transmisión SPI. Luego, la FSM transita al estado WAIT_READ. 
5. **Espera de Finalización de Valor Escrito (WAIT_READ):** Similar al estado WAIT_WRITE, se espera la finalización de la escritura del valor en el registro, monitoreando spi_done. Se desactiva spi_start para no iniciar nuevas transacciones.
Una vez que spi_done indica que la transacción ha terminado, se transita al estado READ_VAL para proceder a leer el valor del registro o retorna al estado IDLE, listo para iniciar otro ciclo o esperar nuevas instrucciones.






