<%@page import="logic.UserController"%>
<%@page import="entities.Ticket"%>
<%@page import="logic.TicketController"%>
<%@page import="entities.User"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<title>Usuarios</title>

	<%
		User u = (User)session.getAttribute("usuario");
		
		if(u == null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		} else if(!u.estaAutorizado()){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}
		
		TicketController ctrlTicket = new TicketController();
		LinkedList<Ticket>tickets = ctrlTicket.getAll();
		
		UserController ctrlUser = new UserController();
		User user = new User();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
		
		
		
	%>

</head>
<body>
  
	<div class="container mt-4" style="min-height: 65vh;">

	<!-- Body de la pagina -->
	<div class="row"> 

		<% if(request.getAttribute("error")!=null){ %>
			<div class="col-12">
				<div class="alert alert-danger" role="alert">
					<strong style="color: #660708;">Error! <%=request.getAttribute("error")%></strong>
				</div>
			</div>
			
		<% } %>
	
		<jsp:include page="/views/partials/menuIzq.jsp"></jsp:include>
    	
    	<!-- Content Column -->
		<div class="col-10 ">
        	<h2>PANEL ADMINISTRADOR</h2>
        	<h4>Tickets</h4>  

			<div class="col-12 col-sm-12 col-lg-12">
            	<div class="table-responsive">
					<table class="table table-hover table-borderless ">
                    	<thead>
                    		<tr>
                    			<th>ID</th>
                    		    <th>Codigo de Operacion</th>
                    		    <th>Fecha y Hora</th>
                    		    <th>Precio</th>
                    		    <th>Email Usuario</th>
                    		    <th>Fecha Cancelacion</th>
                        		<th> <a class="btn btn-success" href="/TPI-Cine/views/pages/ui-ticket/newTicket.jsp">Nuevo Ticket</a> </th>
                        		<th></th>
                      		</tr>
                      	</thead>
                    	<tbody>
                    		<% for (Ticket t : tickets) { %>
                    			<%	
                    				user.setIdUser(t.getUser().getIdUser());
               						user = ctrlUser.getOne(user);
               						t.setUser(user);
               					%>
                    			<tr>
                    				<td><%=t.getIdTicket()%></td>
                    				<td><%=t.getOperationCode()%></td>
                    				<td><%=t.getDateTime().format(formatter)%></td>
                    				<td><%=t.getPrice()%></td>
                    				<td><%=t.getUser().getEmail()%></td>
                    				<td><%=t.getRetirementDate()%></td>
                    				<td>
                    					<a href="/TPI-Cine/views/pages/ui-ticket/editTicket.jsp?idTicket=<%=t.getIdTicket()%>" class="btn">Editar</a><!-- editar -->
                    					<a href="/TPI-Cine/src/servlet/ABMCTicket?action=delete&idTicket=<%=t.getIdTicket()%>" class="btn btn-danger">Eliminar</a><!-- borrar -->
                    				</td>
                    			</tr>
                    		<% } %>
                    		</tbody>	
                   		</table>
                   	</div>
           		</div>	
            	<a href="/TPI-Cine/views/pages/adminPanel.jsp" class="btn">Volver al menu</a>
       		</div>
		</div>
	</div>


</body>
</html>