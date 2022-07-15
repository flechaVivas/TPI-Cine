## Integrantes
| Legajo | Apellido y Nombres |
| ------------- | ------------- |
| 48271  | Buschittari Nahuel  |
| 48059  | Taborra Facundo  |
| 47844  | Vivas Facundo |
| 48056  | Hernandez Juan Pablo  |

## 1 - Enunciado

Desarrollar una sistema/aplicación web cliente-servidor en Java.

El mismo deberá cumplir con los requerimientos técnicos, alcance funcional y requisitos de entrega propuestos a continuación

### 2.1 - Alcance Funcional
Desde que el usuario se loguea en la aplicación, selecciona una película y compra el ticket hasta que lo recibe por correo electrónico

#### 3.2.1 Checklist

##### Regularidad

|Requerimiento|cant. mín.<br>1 o 2 integ|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|-:|:-|
|ABMC simple|1 x integ|1 x integ|Client, Movie, Ticket, Ubication|
|ABMC dependiente|1|2|Restriction, Genre|
|CU NO-ABMC|1|2|Login, Logout |
|Listado simple|1||
|Listado complejo|0|1(*)|Movies by Title|

##### Aprobación Directa

|Requerimiento|cant. mín.<br>1 o 2 integ|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|-:|:-|
|ABMC|todos|todos|
|CU "Complejo"(nivel resumen)|1|2|Buy Tickets, 
|Listado complejo|1|2|Movies By Genre, Today Tickets|
|Nivel de acceso|2|2|Admin, Advanced User, Client|
|Manejo de errores|obligatorio|obligatorio|no requiere detalle|
|requerimiento extra obligatorio (**)|0|1|Envío de mail, manejo de archivos|
|publicar el sitio|olbigatorio|obligatorio|no requiere detalle|


###### Requerimientos extra - AD
|Requerimiento |Detalle/Listado de casos incluidos|
|:-|:-|
|Manejo de archivos|Al cargar imagen de película|
|Custom exceptions|---|
|Log de errores|---|
|Envio de emails|Al enviar tickets al cliente.|

## Modelo de Datos

![DominioCine](https://user-images.githubusercontent.com/83438929/179276336-719185e8-b506-43de-9424-985153198a5b.jpg)

