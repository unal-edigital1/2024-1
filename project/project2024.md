# Especificación de Diseño del Proyecto Tamagotchi en FPGA

## 1. Introducción

### 1.1 Objetivo
Desarrollar un sistema de Tamagotchi en FPGA (Field-Programmable Gate Array) que simule el cuidado de una mascota virtual. El diseño incorporará una lógica de estados para reflejar las diversas necesidades y condiciones de la mascota, junto con mecanismos de interacción a través de sensores y botones que permitan al usuario cuidar adecuadamente de ella.

### 1.2 Delimitaciones
El alcance del proyecto se centra en la creación de un sistema básico de Tamagotchi, que incluirá:
- Una interfaz de usuario operada mediante botones físicos.
- Al menos un sensor para ampliar las formas de interacción.
- Un sistema de visualización para representar el estado actual y las necesidades de la mascota virtual.

Este proyecto se diseñará e implementará utilizando la FPGA ciclone IV, con restricciones claras en términos de recursos de hardware disponibles. La implementación se detallará en Verilog.


## 2. Descripción General del Sistema

### 2.1 Contexto del Sistema
El proyecto Tamagotchi en FPGA es concebido como un sistema autónomo, destinado a emular la experiencia de mantener y cuidar una mascota virtual. Este diseño se fundamenta en el uso de máquinas de estado algorítmico para gestionar las diversas condiciones y comportamientos de la mascota.

### 2.2 Funcionalidad Principal
El núcleo del sistema está diseñado para simular interactivamente el cuidado de una mascota virtual, permitiendo al usuario participar en actividades esenciales tales como alimentar, jugar, dormir y curar, a través de una interfaz visual  y de un sistema de botones y sensores.

## 3. Requisitos del Sistema

La FPGA está programada para simular distintos estados de la mascota, basándose en el comportamiento y la interacción con el usuario a través de al menos tres sistemas principales:

### 3.1 Sistema de Botones:

#### 3.1.1 Botones Mínimos: 
La interacción usuario-sistema se realizará mediante los siguientes botones configurados:

1. **Reset:** Reestablece el Tamagotchi a un estado inicial conocido al mantener pulsado el botón durante al menos 5 segundos. Este estado inicial simula el despertar de la mascota con salud óptima.
2. **Test:** Activa el modo de prueba al mantener pulsado por al menos 5 segundos, permitiendo al usuario navegar entre los diferentes estados del Tamagotchi con cada pulsación.
3. **Botones de Interacción (2):** Facilitan acciones directas como alimentar, jugar, o curar, posibilitando la implementación de actividades específicas para el bienestar del Tamagotchi.

#### 3.1.2 Botones Adicionales (Opcional):
1. **Acelerador de Tiempo:** Permite modificar la velocidad del tiempo en el Tamagotchi, incrementando la rapidez de los cambios de estado para simular diferentes velocidades temporales.


### 3.2 Sistema de Sensado

Para integrar al Tamagotchi con el entorno real y enriquecer la experiencia de interacción, se incorporará al menos un sensor que modifique el comportamiento de la mascota virtual en respuesta a estímulos externos. Los sensores permitirán simular condiciones ambientales y actividades que afecten directamente el bienestar de la mascota. Los siguientes son ejemplos de sensores y sus aplicaciones potenciales:

1. **Sensor de Ultrasonido:** Utilizado para la detección de proximidad y movimiento, este sensor puede:
   - **Despertar:** Activar el Tamagotchi de un estado de reposo cuando se detecta proximidad cercana, simulando el despertar por la presencia del usuario.
   - **Jugar:** Interpreta gestos o movimientos cercanos como interacciones lúdicas, aumentando el nivel de felicidad de la mascota.

2. **Sensor de Humedad:** Evalúa el nivel de humedad ambiental, influyendo en:
   - **Estado de Ánimo/Salud:** Condiciones de humedad extremas pueden afectar negativamente la salud o el confort de la mascota, desencadenando posibles estados de enfermedad o descontento.

3. **Sensor de Color:** Permite al Tamagotchi "alimentarse" de colores específicos presentes en su entorno, cada uno asociado a diferentes tipos de nutrientes o efectos:
   - **Nutrición Variada:** La identificación de diferentes colores se traduce en una variedad de alimentos consumidos, impactando positiva o negativamente en la salud y el estado anímico del Tamagotchi.

4. **Sensor de Audio:** Hace que el Tamagotchi responda a estímulos sonoros, lo que permite:
   - **Comandos de Voz:** La mascota puede reconocer y reaccionar a comandos específicos o a sonidos ambientales, ajustando su comportamiento o estado emocional de acuerdo.
   - **Reacción a Sonidos:** Los sonidos agradables pueden aumentar la felicidad, mientras que los ruidos fuertes podrían generar estrés o miedo.

5. **Sensor de Temperatura:** Afecta la salud o estado anímico del Tamagotchi en función de las condiciones térmicas.

6. **Sensor de Luz:** Simula los ciclos de día y noche, influyendo en las rutinas de actividad y descanso de la mascota.

7. **Sensor de Movimiento:** Promueve la actividad física al requerir que el usuario mueva el dispositivo para mantener en forma al Tamagotchi, ejemplo el usuario se puede desplazar y dar la sensacion de caminar para el tamagotchi.

La selección y aplicación de los sensores dependerán de las metas del equipo, promoviendo un enfoque en la innovación y permitiendo la colaboración entre distintos grupos para compartir desarrollos y estrategias de interacción con los snesores.



### 3.3 Sistema de Visualización

#### 3.3.1 Visualización de Información de Estado:
- **Matriz de Puntos 8x8:** Esencial para representar visualmente el estado actual del Tamagotchi, incluyendo emociones y necesidades básicas.

#### 3.3.2 Indicadores Simples:
- **Display de 7 Segmentos:** Utilizado para mostrar niveles y puntuaciones específicas, como el nivel de hambre o felicidad, complementando la visualización principal.

Los equipos tienen libertad para seleccionar o combinar diferentes métodos de visualización para enriquecer la experiencia del usuario. Alternativas avanzadas pueden incluir pantallas OLED, LCD TFT, o interfaces HDMI/VGA, aumentando la complejidad y el alcance del proyecto.

## 4. Arquitectura del Sistema
### 4.1. Diagramas de Bloques:
(Incluiría un diagrama básico que muestre la FPGA, la pantalla, los botones de entrada y cualquier otro componente clave).

### 4.2 Descripción de Componentes:

FPGA: Corazón del sistema, ejecuta la lógica del Tamagotchi.
Pantalla: cuál.
Botones: Permiten al usuario interactuar con la mascota.
sensor: cuál

### 4.3. Interfaces:

Comunicación entre la FPGA y la pantalla.
Entradas digitales para los botones.
Comunicación entre la FPGA y el sensor.

## 5. Especificaciones de Diseño Detalladas

## 5.1 Modos de operación
### 5.1.1 Modo Test

El modo Test permite a los usuarios y desarrolladores validar la funcionalidad del sistema y sus estados sin necesidad de seguir el flujo de operación normal. En este modo, se pueden forzar transiciones de estado específicas mediante interacciones simplificadas, como pulsaciones cortas de botones, para verificar las respuestas del sistema y la visualización. Este modo es esencial durante la fase de desarrollo para pruebas rápidas y efectivas de nuevas características o para diagnóstico de problemas.

- **Activación:** Se ingresa al modo Test manteniendo pulsado el botón "Test" por un periodo de 5 segundos.
- **Funcionalidad:** Permite la navegación manual entre los estados del Tamagotchi, ignorando los temporizadores o eventos aleatorios, para observar directamente las respuestas y animaciones asociadas.

### 5.1.2 Modo Normal
El Modo Normal es el estado de operación estándar del Tamagotchi, donde la interacción y respuesta a las necesidades de la mascota virtual dependen enteramente de las acciones del usuario. 

- **Activación:** El sistema arranca por defecto en el Modo Normal tras el encendido o reinicio del dispositivo. No requiere una secuencia de activación especial, ya que es el modo de funcionamiento predeterminado.

- **Funcionalidad:** Los usuarios interactúan con la mascota a través de botones y, potencialmente, sensores para satisfacer sus necesidades básicas. La mascota transita entre diferentes estados (por ejemplo, Hambriento, Feliz, Dormido, Enfermo) en respuesta a las acciones del usuario y al paso del tiempo. El sistema proporciona retroalimentación inmediata sobre las acciones mediante la visualización.

### 5.1.3 Modo Aceleración (opcional)
El modo Aceleración incrementa la velocidad a la que transcurren los eventos y el paso del tiempo dentro de la simulación del Tamagotchi, permitiendo a los usuarios experimentar ciclos de vida más rápidos y evaluar cómo las interacciones afectan al estado de la mascota en un periodo comprimido.

- **Activación:** Se activa pulsando el botón dedicado a "Aceleración de Tiempo", con cada pulsación aumentando la velocidad de simulación (por ejemplo, 5x, 10x, 50x).
- **Funcionalidad:** Todos los temporizadores internos y los ciclos de eventos operan a una velocidad incrementada, acelerando la necesidad de interacciones como alimentar, jugar o curar.


## 5.2. Estados y Transiciones:

### 5.2.1. Estados Mínimos
El Tamagotchi operará a través de una serie de estados  que reflejan las necesidades físicas y emocionales de la mascota virtual, a saber:

- **Hambriento:** Este estado alerta sobre la necesidad de alimentar a la mascota. La falta de atención a esta necesidad puede desencadenar un estado de enfermedad.
  
- **Diversión:** Denota la necesidad de entretenimiento de la mascota. La inactividad prolongada puede llevar a estados de aburrimiento o tristeza.

- **Descansar:** Identifica cuando la mascota requiere reposo para recuperar energía, especialmente después de períodos de actividad intensa o durante la noche, limitando la interacción del usuario durante estas fases.

- **Salud:** va a niveles de enfermo por el descuido en el cuidado de la mascota, requiriendo intervenciones específicas para su recuperación.

- **Feliz:** Refleja el bienestar general de la mascota como resultado de satisfacer adecuadamente sus necesidades básicas.

### 5.2.2 Estados Adicionales
Para enriquecer la experiencia del usuario y aumentar la complejidad del sistema, se contemplan estados adicionales que ofrecen una simulación más detallada del cuidado de la mascota, esto estado no son obligatorios:

- **Triste:** Emergerá en respuesta a la negligencia continua de las necesidades de la mascota, pudiendo ser mitigado mediante la interacción y cuidado oportunos.

- **Aburrido:** Indica la necesidad de diversificar las actividades de entretenimiento para mantener el interés de la mascota.

- **Higiene:** Subraya la importancia de mantener la limpieza de la mascota, introduciendo otra dimensión al cuidado requerido.

- **Crecimiento/Evolución:** La mascota experimentará distintas fases de crecimiento, cada una con requisitos y comportamientos específicos, ilustrando el desarrollo y maduración de la mascota a lo largo del tiempo.

### 5.2.3 Transiciones

**Temporizadores**:

Se implementarán temporizadores para simular el avance temporal, afectando las necesidades básicas del Tamagotchi. A medida que el tiempo progresa, ciertas necesidades como el hambre incrementarán de forma gradual, requiriendo intervención del usuario para suministrar alimento a la mascota y mantener su estado de salud óptimo.

**Interacciones y Eventos Aleatorios:**

Las transiciones entre diferentes estados de la mascota se desencadenarán por interacciones directas del usuario, utilizando botones y sensores. Estas acciones permitirán al usuario influir activamente en el bienestar y comportamiento de la mascota virtual.

**Sistema de Niveles o Puntos:**

Se desarrollará un sistema de niveles o puntuación que reflejará la calidad del cuidado proporcionado al Tamagotchi. Aspectos como el nivel de hambre y felicidad fluctuarán en una escala de 1 a 5, donde acciones positivas como alimentar o interactuar con la mascota incrementarán dichos niveles, mientras que la inactividad o negligencia resultará en su disminución. Este mecanismo brindará retroalimentación constante al usuario sobre la condición actual de la mascota virtual.

**Eventos Aleatorios (Opcional):**

Se contempla la integración de eventos aleatorios capaces de alterar los estados emocionales o de salud de la mascota, introduciendo elementos de dinamismo e imprevisibilidad en la interacción. La incorporación de estos eventos, aunque opcional, contribuirá a la complejidad y riqueza del diseño del sistema, ofreciendo un nivel adicional de desafío y variabilidad en el cuidado de la mascota virtual.

## 6. Requisitos de Implementación

## 7. Plan de Verificación y Validación

## 8. plan de trabajo:

* WP01: 
* WP02:
* WP03:
* WP04: 
Semana 6: Integración del proyecto y pruebas funcionales
Semana 7: Presentación  

 
