<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="entities.*"%>
<%@page import="logic.UbicationController"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mi Cuenta</title>
<link rel="stylesheet" href="../../styles/navbar.css">
<link rel="stylesheet" href="../../styles/register.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../../styles/miCuenta.css">
<link rel="stylesheet" href="../../styles/ticket.css">
</head>
<%
	String action = (String)request.getAttribute("action");
%>
<body>
	<header>
		<%@ include file="../partials/navbar.jsp" %>
	</header>
	<main class="MiCuentaContainer">
		<%if( u != null){%>		
			<h1 class="tituloMiCuenta">Mi Cuenta</h1>
			
				<form class="RegisterForm" method="POST" action="/TPI-Cine/src/servlet/UpdateCuenta">
					<div class="formContent">
						<div>
							<div class="divForm">
								<label class="labelForm">Nombre</label>
								<input class="inputForm" name="name" type="text" value = "<%=u.getName()%>" >
							</div>
							<div class="divForm">
								<label class="labelForm">Apellido</label>
								<input class="inputForm" name="surname" type="text" value = "<%=u.getSurname()%>">
							</div>
							<div class="divForm">
								<label class="labelForm">Email</label>
								<input class="inputForm" name="email" type="email" value = "<%=u.getEmail() %>">
							</div>
							<div class="divForm">
								<label class="labelForm">Fecha Nacimiento</label>
								<input class="inputForm" name="birthDate" type="date" value = "<%=u.getBirthDate()%>">
							</div>
						</div>
						<div>
							<div class="divForm">
								<label class="labelForm">Direccion</label>
								<input class="inputForm" name="adress" type="text" value = "<%=u.getAdress()%>">
							</div>
							<div class="divForm">
								<label class="labelForm">Telefono</label>
								<input class="inputForm" name="phoneNumber" type="text" value = "<%=u.getPhoneNumber()%>">
							</div>
							<div class="divForm">
								<label class="labelForm">Cambiar Contraseña</label>
								<input class="inputForm" name="password" type="password" value = "<%=u.getPassword()%>>" >
								
								
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
		<h1>Mis Tickts</h1>
		<div class="MisEntradas">
			<div class="containerEntradas">
				<%UbicationController ctrlUbication = new UbicationController();
				 LinkedList<Ubication> UbicationsUser = ctrlUbication.getTicketswhithUser(u.getIdUser());
				if(UbicationsUser.size() > 0){ %>
					<%for(Ubication ubi: UbicationsUser){ %>
						<div class="ticket">
							<% 
								Show s = ubi.getShow();
								Ticket t = ubi.getTicket();
								Movie m = s.getMovie();
								MovieRoom mr = s.getMovieroom();
							%>
							<div class="ContectTitle">
								<img src="/TPI-Cine/assets/img/inglorious.png" alt="Inglourious Basterds">
								<h4><%=m.getTitle()%> </h4>
							</div>
							<div class="Information">
								<label class="dateShow">Fecha: <%=s.getDt()%></label>
								<label class="roww">Fila: <%=ubi.getRow()%></label>
								<label class="col">Asiento: <%=ubi.getCol()%></label>
								<label class="roomNumber">Sala: <%=mr.getRoomNumber()%></label>
								<label class="price">Precio: <%=t.getPrice()%></label>
							</div>
							<form>
								<input type="button" value:"<%=t.getIdTicket() %>">Cancelar Entrada</input>
							</form>
						</div>
					<%}
				}else{%>
					<div>
						<h3>No tiene tickets activos</h3>
					</div>
				<%} %> 
		<%request.removeAttribute("validate"); 
		} else { %>
			<div class = "cartelDeInicioSesion">
				<h1>Error De Busqueda</h1>
				<label class=""><a style="color: #03045eff " href="/TPI-Cine/views/pages/login.jsp" onclick="limpiarSesion()"><b>Iniciar Sesion</b></a></label>
			</div>
		<%} %>
		
			
			</div>
		</div>
		
	</main>

	<footer>
	</footer>
</body>
</html>