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
<body>

	<%if(request.getAttribute("action")=="incorrect"){%>
	<div class="alert alert-danger" role="alert">
 	 	Usuario o Contraseña Incorrectos!
	</div>
	<%} %>
		
    <div class="input-group">
        <h1>Inicio de Sesion</h1>
        <form action="/TPI-Cine/src/servlet/login" method="post">
                <input type="email" name="email" class="input" placeholder="Usuario" required>
            <br>
            <br>
                <input  type="password" name="password" class="input" placeholder="Contraseña" required>
            <br>
            <br>
                <input id="boton" type="submit" name="enviar"  value="Ingresar">
            <br>
            <br>
            <span style="color:#90e0efff">¿No tienes una cuenta?</span>
            <a style="color: #03045eff " href="register.jsp"><b>Crea una</b></a> <!--Enlace a otro fichero-->
            <br>
            <br>
        </form>
    </div>
</body>
</html>