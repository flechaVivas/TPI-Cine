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

<link rel="stylesheet" href="../../styles/register.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../../styles/miCuenta.css">
<link rel="stylesheet" href="../../styles/ticket.css">
<link rel="stylesheet" href="../../styles/navbar.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>

</head>
<%

	User u = (User)session.getAttribute("usuario");
	
	if(u == null){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	}

	String action = (String)request.getAttribute("action");
	User userSession = (User)session.getAttribute("usuario");
	
	Character c = '@';
%>
<body>
	<header>
		<jsp:include page="../partials/navbar.jsp"></jsp:include>
	</header>
	<main class="MiCuentaContainer">
		<%if( u != null){%>		
			<h1 class="tituloMiCuenta">Mi Cuenta</h1>
			
				<form class="RegisterForm" method="POST" action="/TPI-Cine/src/servlet/ABMCUser?action=actualizar">
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
		<h1>Mis Tickets Activos</h1>
		<div class="MisEntradas">
			<div class="containerEntradas">
				<%
				UbicationController ctrlUbication = new UbicationController();
				LinkedList<Ubication> UbicationsUserAct = ctrlUbication.getTicketsWithUser(userSession);
				LinkedList<Ubication> UbicationsUserInac = ctrlUbication.getTicketsWithUserInac(userSession);
				if(UbicationsUserAct.size() > 0){ %>
					<%for(Ubication ubi: UbicationsUserAct){ %>
						<div class="ticket">
							<% 
								Show s = ubi.getShow();
								Ticket t = ubi.getTicket();
								Movie m = s.getMovie();
								MovieRoom mr = s.getMovieroom();
							%>
							
							<div class="ContectTitle">
								<img src="<%=m.getImage()%>" alt="<%=m.getTitle()%>">
								<h4><%=m.getTitle()%> </h4>
							</div>
							<div class="Information">
								<label class="dateShow">Fecha: <%=s.getDt()%></label>
								<label class="roomNumber">Sala: <%=mr.getRoomNumber()%></label>
								<label class="row">Fila:<%=Character.toString(c+ubi.getRow()) %> </label>
								<label class="col">Asiento: <%=ubi.getCol()%></label>
								<label class="price">Precio: <%=t.getPrice()%></label>
							</div>
							<a href="/TPI-Cine/src/servlet/ABMCTicket?action=cancel&idTicket=<%=ubi.getTicket().getIdTicket()%>" type="submit" class="btn-cancelar-entrada">Cancelar Ticket</a>
						</div>
					<%}
					}else{%>
					<div>
						<h3>No tiene tickets activos</h3>
					</div>
				<%} %>
				<h1>Mis Tickets Caducados</h1>
				<% if(UbicationsUserInac.size() > 0){ %>
					<%for(Ubication ubi: UbicationsUserInac){ %>
						<div class="ticket">
							<% 
								Show s = ubi.getShow();
								Ticket t = ubi.getTicket();
								Movie m = s.getMovie();
								MovieRoom mr = s.getMovieroom();
							%>
							
							<div class="ContectTitle">
								<img src="<%=m.getImage()%>" alt="<%=m.getTitle()%>">
								<h4><%=m.getTitle()%> </h4>
							</div>
							<div class="Information">
								<label class="dateShow">Fecha: <%=s.getDt()%></label>
								<label class="row">Fila: <%=Character.toString(c+ubi.getRow())%></label>
								<label class="col">Asiento: <%=ubi.getCol()%></label>
								<label class="roomNumber">Sala: <%=mr.getRoomNumber()%></label>
								<label class="price">Precio: <%=t.getPrice()%></label>
							</div>
						</div>
					<%}
					}else{%>
						<div>
							<h3>No tiene tickets caducados</h3>
						</div>
					<%} %>  
		<%request.removeAttribute("validate"); 
		} else { %>
			<div class = "cartelDeInicioSesion">
				<h1>Error De Busqueda</h1>
				<label class=""><a style="color: #03045eff " href="/TPI-Cine/views/pages/login.jsp"><b>Iniciar Sesion</b></a></label>
			</div>
		<%} %>
			</div>
		</div>
		
	</main>

	<footer>
	
	</footer>
</body>
</html>