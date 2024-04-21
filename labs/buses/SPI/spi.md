## bus de datos serial SPI

## Introducción

Los buses seriales son interfaces de comunicación que transmiten datos entre dispositivos utilizando líneas de señalización mínimas. En lugar de transmitir múltiples bits en paralelo, los buses seriales envían los datos bit a bit de forma secuencial. Un ejemplo de bus serial es el Bus SPI (Serial Peripheral Interface), que utiliza generalmente cuatro líneas principales: SCLK (reloj serial), MOSI (Master Out Slave In), MISO (Master In Slave Out) y CS (Chip Select). El bus SPI permite una comunicación rápida y fiable entre un dispositivo maestro y uno o varios dispositivos esclavos, facilitando el control preciso de dispositivos periféricos como sensores, memorias y pantallas.

### Descripción en HDL

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

