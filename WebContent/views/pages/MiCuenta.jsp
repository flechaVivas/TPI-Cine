<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mi Cuenta</title>
<link rel="stylesheet" href="../../styles/navbar.css">
<link rel="stylesheet" href="../../styles/MiCuenta.css">
<link rel="stylesheet" href="../../styles/register.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<%
	String action = (String)request.getAttribute("action");
%>
<body>
	<header>
		<%@ include file="../partials/navbar.jsp" %>
	</header>
	<main>
		<%if( u != null){%>
			<label>Mi Cuenta</label>
			
			<form class="RegisterForm" method="POST" action="/TPI-Cine/src/servlet/MiCuenta">
					<div class="formContent">
						<div>
							<div class="divForm">
								<label class="labelForm">Nombre</label>
								<input class="inputForm" name="name" type="text" value = "<%u.getName(); %>" >
							</div>
							<div class="divForm">
								<label class="labelForm">Apellido</label>
								<input class="inputForm" name="surname" type="text" value = "<%u.getSurname(); %>">
							</div>
							<div class="divForm">
								<label class="labelForm">Email</label>
								<input class="inputForm" name="email" type="email" value = "<% u.getEmail(); %>">
							</div>
							<div class="divForm">
								<label class="labelForm">Fecha Nacimiento</label>
								<input class="inputForm" name="birthDate" type="date" value = "<% u.getBirthDate(); %>">
							</div>
						</div>
						<div>
							<div class="divForm">
								<label class="labelForm">Direccion</label>
								<input class="inputForm" name="adress" type="text" value = "<% u.getAdress();%>">
							</div>
							<div class="divForm">
								<label class="labelForm">Telefono</label>
								<input class="inputForm" name="phoneNumber" type="text" value = "<%u.getPhoneNumber();%>">
							</div>
							<div class="divForm">
								<label class="labelForm">Cambiar Contraseña</label>
								<input class="inputForm" name="password" type="password" value = "<% u.getPassword(); %>>" >
								
								
							</div>
							<div class="divForm">
								<label class="labelForm">Confirmar nueva Contraseña</label>
								<input class="inputForm" name="repeatPassword" type="password" >
								<% if(action == ("errorPasswd")){ %>
									<label color="red">Las contraseñas no coiciden</label>
								<%}%>
							</div>
						</div>
					</div>
					<div class="buttonSend">
              			<button type="submit" class="ButtonCreat">Editar mi Cuenta</button>
            		</div>
            		
				</form>
		<%request.removeAttribute("validate"); 
		} %>
	</main>
	<footer>
	</footer>
</body>
</html>