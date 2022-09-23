<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="../../styles/register.css" />
		<link rel="stylesheet" href="../../styles/navbar.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
		
		<title>Registrarse</title>
	</head>
	<body>
		<header> 
		<nav class="navbar"> <%@ include file="../partials/navbar.jsp" %> </nav>
		
		 </header>
		
		<main>
			<div class="Container">
				<h2>Registrarse</h2>
				<form class="RegisterForm" method="POST" action="HACIA DONDE VA">
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
								<input class="inputForm" name="phoneNumber" type="number" >
							</div>
							<div class="divForm">
								<label class="labelForm">Contraseña</label>
								<input class="inputForm" name="password" type="password" >
							</div>
							<div class="divForm">
								<label class="labelForm">Repetir Contraseña</label>
								<input class="inputForm" name="repitPassword" type="password" >
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