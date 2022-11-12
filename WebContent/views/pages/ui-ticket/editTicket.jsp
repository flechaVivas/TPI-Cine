<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="entities.Ticket"%>
<%@page import="logic.TicketController"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usuarios</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<%
	
		User u = (User)session.getAttribute("usuario");
		
		if(u == null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		} else if(!u.estaAutorizado()){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}
	
		Integer id = Integer.parseInt((String)request.getParameter("idTicket"));
		TicketController ctrlTicket = new TicketController();
		Ticket t = new Ticket();
		t.setIdTicket(id);
		t = ctrlTicket.getOne(t);
		
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
				
				<form action="/TPI-Cine/src/servlet/ABMCTicket?action=update&idTicket=<%=t.getIdTicket()%>" method="post">
				
				<div class="col-12 col-sm-12 col-lg-12">
			     	<div class="table-responsive">
						<table class="table table-hover table-borderless ">
			            	<thead>
			                	<tr>
			                		<th>ID</th>
	                    		    <th>Codigo de Operacion</th>
	                    		    <th>Fecha y Hora</th>
	                    		    <th>Precio</th>
	                    		    <th>ID Usuario</th>
	                    		    <th>Fecha Cancelacion</th>
			                  	</tr>
			                </thead>
							<tbody>
								<tr>
			                		<td><input type="number"  name="idTicket" value="<%=t.getIdTicket()%>" readonly="" class="form-control"></td>
			                    	<td><input type="text" name="opcode"  	value="<%=t.getOperationCode()%>" class="form-control" required></td>
			                    	<td><input type="datetime-local" name="datetime"  value="<%=t.getDateTime()%>"	class="form-control" required></td>
									<td><input type="number" name="price"  	value="<%=t.getPrice()%>" class="form-control" required></td>
			                    	<td><input type="text" name="idUser" 	value="<%=t.getUser().getIdUser()%>"	class="form-control" required></td>
									<td><input type="datetime-local" name="canceldate" value="<%=t.getRetirementDate()%>"	class="form-control"></td>
			                    	<td>
										<button class="btn btn-warning" type="submit">Confirmar</button>
			               			</td>
			                    </tr>
			               </tbody>
			            </table>
			         </div>
			      </div>
	    		</form>	
				<a href="/TPI-Cine/views/pages/ui-ticket/listTickets.jsp" class="btn">Volver a Tickets</a>
			</div>
		</div>
	</div>



</body>
</html>