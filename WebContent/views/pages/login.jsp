<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>LogIn</title>
   <link rel="stylesheet" href="../../styles/login.css">
   
</head>

<%
String action = (String)request.getAttribute("action");
%>

<script type="text/javascript">
   function limpiarSesion(){
       <%
           session.removeAttribute("usuario");
           session.invalidate();
       %>
   }
</script>

<body>
   <div class="input-group d-flex align-items-center justify-content-center w-50" style="margin-top: 50px;">
       <% if(action == ("success")){ %>
           <div class="alert alert-success" role="alert">
               <strong style="color: #2feaa8;">USUARIO creado con ÉXITO</strong>
           </div>
           <% request.removeAttribute("action"); %>
       <% } %>

       <h1>Inicio de Sesion</h1>
       <form action="/TPI-Cine/src/servlet/login" method="post">
           <input type="email" name="email" class="input" placeholder="Usuario" required>
           <br>
           <br>
           <input type="password" name="password" class="input" placeholder="Contraseña" required>
           <br>
           <br>
           <input id="boton" type="submit" name="enviar" value="Ingresar">
           <br>
           <br>
           <span style="color:#90e0efff">¿No tienes una cuenta?</span>
           <a style="color: #03045eff " href="/TPI-Cine/views/pages/register.jsp" onclick="limpiarSesion()"><b>Crea una</b></a> <!--Enlace a otro fichero-->
           <br>
           <br>
       </form>
       <% if(action == ("error")){ %>
           <div class="alert alert-danger" role="alert">
               <strong style="color: #660708;">USUARIO y/o CONTRASEÑA INCORRECTOS!</strong>
           </div>
           <% request.removeAttribute("action"); %>
       <% } %>
   </div>
</body>
</html>
