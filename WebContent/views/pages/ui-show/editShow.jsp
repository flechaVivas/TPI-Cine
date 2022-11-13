<%@page import="java.time.LocalDateTime"%>
<%@page import="entities.Show"%>
<%@page import="entities.MovieRoom"%>
<%@page import="entities.Movie"%>
<%@page import="logic.ShowController"%>
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
	

		ShowController ctrlShow = new ShowController();
		Movie mo=new Movie();
		MovieRoom mrm=new MovieRoom();
		Show s=new Show();
		mo.setIdMovie(Integer.parseInt((String)request.getParameter("movie")));
		s.setMovie(mo);
		mrm.setRoomNumber(Integer.parseInt((String)request.getParameter("room")));
		s.setMovieroom(mrm);
		s.setDt(LocalDateTime.parse((String)request.getParameter("dt")));
		
		s = ctrlShow.getOne(s);
		
		
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
	        	<h4>Funciones</h4>
				
				<form action="/TPI-Cine/src/servlet/abmcShow?action=admin_update&exMovie=<%=s.getMovie().getIdMovie() %>&exRoom=<%=s.getMovieroom().getRoomNumber() %>&exdt=<%=s.getDt()%>" method="post">
				
				<div class="col-12 col-sm-12 col-lg-12">
			     	<div class="table-responsive">
						<table class="table table-hover table-borderless ">
			            	<thead>
			                	<tr>
			                		<th>ID Pelicula</th>
	                    		    <th>Nro Sala</th>
	                    		    <th>Fecha y Hora</th>
			                  	</tr>
			                </thead>
							<tbody>
								<tr>
									<td><input type="number" name="movie"  	value="<%=s.getMovie().getIdMovie()%>" class="form-control" required></td>
			                    	<td><input type="text" name="room" 	value="<%=s.getMovieroom().getRoomNumber()%>"	class="form-control" required></td>
									<td><input type="datetime-local" name="dt" value="<%=s.getDt()%>"	class="form-control"></td>
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