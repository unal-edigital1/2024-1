##  ELECTRÓNICA DIGITAL 1 2019 -2 UNIVERSIDAD NACIONAL DE COLOMBIA 


## Introducción 

En las próximas 6 semana se estara trabajando en la adquición , procesamiento y visualización de  imagenes. Para ello se hara uso de:

* Cámara OV7970 sin FIFO la cual :
	* Matriz fotosensible: 640 x 480, el tañama de la image   se puede configurar 
	* Formato de salida RGB, RGB (GRB4: 2: 2, RGB565 / 555/444) sin formato, YUV (4: 2: 2) e YCbCr (4: 2: 2) Admite VGA, CIF y de CIF a formato 40 x 30.
	* Se configura  por medio del  bus SCCB (compatible con I2C), para obtener los modos de  configuración se recomienda leer la hoja de datos de la camara.
* Tarjeta STM o Arduino, En primera instancia  y para las pruebas iniciales, se hara uso de la tarjeta de procesamiento comerciales, como Arduino o STM32 , 
* Tarjeta de desarrollo FPGA, Nexys4, quacho-basic 
* Sistema de visualización 
* Sistema de Capura,  sistema manual para iniciar la captura de imfrmación

En resumen se muestra la configuración del dispositivo que se implementará.

![Diagrama](./docs/figs/diagramaGeneral.jpg)

Como se observa en el diagrama anterior se debe  diseñar por parte de cada grupo de trabajo el contenido del bloque en verde  el cual se describr a cotinuación:


![Diagrama 2](./docs/figs/estructura_fpga.jpg)


En este sentido cada grupo debe trabajar en los bloques internos verdes junto con las interconexiones.  Se proporcionarán los bloques en naranja.

El plan de trabajo propuesto es:

* WP01: Buffer de memoria  [WP01](https://classroom.github.com/g/Ra4G34mi) 
	* Semana 1: Buffer de memoria  Simulación (TestBench).  Analizar la máxima memoria ram que podemos alojar en la FPGA,  y planear el método de adquisición de los datos de la cámara 
* WP02  Captura de Datos [WP02](https://classroom.github.com/g/fTcztVJQ)
	* Semana 2: Captura de datos Construcción del bloque de captura de datos y divisor de frecuencias según hoja de datos de la cámara.
	* Semana 3: Captura de datos Pruebas físicas con cámara 
* WP03: Procesador
	* Semana 4: Introducción al procesador *
* WP04: Envio de información 
	* Semana 5: Comunicación serial, gpio 
* WP05: Integración
	* Semana 6: Integración del proyecto y pruebas funcionales
Semana 7: Presentación  


## Metodologia de trabajo 

Para cada paquete de trabajo se debe clonar la plantilla dada, y los resultados del trabajo de cada grupo deben ser subidos antes de la fecha estipulada. se recomienda  leer la ayuda de github classroom en este [link](https://education.github.com/)

* Si no la hecho debe crear una cuenta de github. ver este [video](https://www.youtube.com/watch?v=ezxRcdJ8glM&feature=youtu.be)
* Para crear repositorios  revise ete [link](https://help.github.com/en/github/getting-started-with-github/create-a-repo)

Antes de comenzar con cada paquete de trabajo se debe leer las instrucciones  y tener todos los archivos. Para acceder a cada paquete de trabajo debe :
* Aceptar la asignación de cada link dado. 
* La aplicación les pregunta si desean crear un grupo nuevo o unirse a uno existente:
	* Para crear un grupo nuevo coloque "Grupo-xx", donde xx es el número del grupo.
	* Para unirse a un grupo existente, busque el nombre  y pulse l botón ´join´.
	
	***Nota: Todos los estudiantes debes uniser al grupo correspondiente  y tener cuidado de no equivocarse de grupo***
* Una vez realizado el proceso debe clonar,en su computador,  el repositorio creado automaticamente. 

```
git clone <link del repositorio>
```
## Documentación
Para todos los paquetes de trabajo se debe  teenr la documentación respectiva, que evidencie el progreso del trabajo, puede hacer uso de fotos, videos código y todo lo que el grupo considere necesario  para explicar los avances que va teniendo. 
En la evaluación de la documentacion sera  tenida en cuenta la minuciosidad y claridad de la misma.

La documentación se debe  diligenciar en el formato Markdown del archivo ´README.md´ ubicado en docs. Se recomienda revisar el siguiente [link](https://guides.github.com/features/mastering-markdown/) que les da una visión rapida de formato usado para hacer la documentación. 

Recuerde, todos los paquetes de trabajo son obligatorios

## Desarrollo 

WP  | semana | deadline  | Tema | Documentación| Repositorio 
--  | --     | --        | --   | --          | --  
01| semana 1 | 1 Nov | Bufer de memoria | [link](./docs/WP01.md) | [WP01](https://classroom.github.com/g/Ra4G34mi) 
02| semana 2 /semana 3 | 15 Nov | Captura de datos | [link]| [WP02](https://classroom.github.com/g/fTcztVJQ)  
03  | semana 4 | 22 Nov | Procesamiento | [link]| 
03| semana 5 | 29 Nov | Envio de Información | [link]| 
04| Semana 8 | 6  Dic | Integración | [link] | 



