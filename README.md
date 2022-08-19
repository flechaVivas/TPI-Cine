## Integrantes
| Legajo | Apellido y Nombres |
| ------------- | ------------- |
| 48271  | Buschittari Nahuel  |
| 48059  | Taborra Facundo  |
| 47844  | Vivas Facundo Ignacio |
| 48056  | Hernandez Juan Pablo  |

## 1 - Idea inicial

Aplicación web cliente-servidor desarrollada Java para la gestión de entradas de un Cine.

### 2.1 - Alcance Funcional
Desde que el usuario se loguea en la aplicación, selecciona una película y compra el ticket hasta que recibe el comprobante por correo electrónico.


#### 3.2.1 Checklist

##### Regularidad

|Requerimiento|cant. mín.<br>1 o 2 integ|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|-:|:-|
|ABMC simple|1 x integ|1 x integ|Restriction, Genre, roomType o Actors|
|ABMC dependiente|1|2|Movie, MovieRoom|
|CU NO-ABMC|1|2|Crear Funcion, Reserva|
|Listado simple|1|-|-|
|Listado complejo|0|1(*)|Movies and Function|

##### Aprobación Directa

|Requerimiento|cant. mín.<br>1 o 2 integ|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|-:|:-|
|ABMC|todos|todos|
|CU "Complejo"(nivel resumen)|1|2|Buy Tickets (crear funcion venta de entrada, retirar y cancelar)|
|Listado complejo|1|2|Movies and Function, Today Tickets|
|Nivel de acceso|2|2|Admin, Advanced User, Client|
|Manejo de errores|obligatorio|obligatorio|no requiere detalle|
|requerimiento extra obligatorio (**)|0|1|Envío de mail o manejo de archivos|
|publicar el sitio|olbigatorio|obligatorio|no requiere detalle|


###### Requerimientos extra - AD
|Requerimiento |Detalle/Listado de casos incluidos|
|:-|:-|
|Manejo de archivos|Al cargar imagen de película|
|Custom exceptions|---|
|Log de errores|---|
|Envio de emails|Al enviar tickets al cliente.|

## Modelo de Datos

![DER-CINE](https://user-images.githubusercontent.com/78052165/185681129-da78a874-78f7-4e51-b7db-6c2bea36c0f9.png)

![DER-CINE-OP2](https://user-images.githubusercontent.com/78052165/185690935-835a3310-df20-4a4a-a37e-a8d7cf1e310e.png)


