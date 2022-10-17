<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../styles/register.css" />
		<link rel="stylesheet" href="../../styles/navbar.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
		
		<title>Registrarse</title>
		
		<% 
			session.removeAttribute("usuario");
			String action = (String)request.getAttribute("action");
		%>
		
	</head>
	<body>
		<header> 
		
		<%@ include file="../partials/navbar.jsp" %>
		
		 </header>
		
		<main>
			<div class="Container">
			<% if(action == ("errorPasswd")){ %>

				<div class="alert alert-danger" role="alert">
		 			<strong style="color: #660708;">Las contraseñas ingresadas no coinciden</strong>
				</div>
			
			<% if(action == "errorIntegrity"){ %>
				<div class="alert alert-danger" role="alert">
	 				<strong style="color: #660708;">Las contraseñas ingresadas no coinciden</strong>
				</div>
			<%}
				
			} %>
						
				<h2>Registrarse</h2>
				<form class="RegisterForm" method="POST" action="/TPI-Cine/src/servlet/Register">
					<div class="formContent">
						<div>
							<div class="divForm">
								<label class="labelForm">Nombre</label>
								<input class="inputForm" name="name" type="text" >
							</div>
							<div class="divForm">
								<label class="labelForm">Apellido</label>
								<input class="inputForm" name="surname" type="text" >
							</div>
							<div class="divForm">
								<label class="labelForm">Email</label>
								<input class="inputForm" name="email" type="email" >
							</div>
							<div class="divForm">
								<label class="labelForm">Fecha Nacimiento</label>
								<input class="inputForm" name="birthDate" type="date">
							</div>
						</div>
						<div>
							<div class="divForm">
								<label class="labelForm">Direccion</label>
								<input class="inputForm" name="adress" type="text">
							</div>
							<div class="divForm">
								<label class="labelForm">Telefono</label>
								<input class="inputForm" name="phoneNumber" type="text" >
							</div>
							<div class="divForm">
								<label class="labelForm">Contraseña</label>
								<input class="inputForm" name="password" type="password" >
							</div>
							<div class="divForm">
								<label class="labelForm">Repetir Contraseña</label>
								<input class="inputForm" name="repeatPassword" type="password" >
							</div>
						</div>
					</div>
					<div class="buttonSend">
              			<button type="submit" class="ButtonCreat">Crear mi Cuenta</button>
            		</div>
            		
            		
				</form>
				
			</div>
		</main>
		
		<footer> </footer>

	</body>
</html>