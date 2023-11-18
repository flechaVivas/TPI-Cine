<%@page import="entities.Movie"%>
<%@page import="logic.MovieController"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="logic.UserController"%>
<%@page import="entities.RoomType"%>
<%@page import="logic.RoomTypeController"%>
<%@page import="entities.Genre"%>
<%@page import="logic.GenreController"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<title>Películas</title>

	<%
		User u = (User)session.getAttribute("usuario");
		
		if(u == null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		} else if(!u.estaAutorizado()){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}
		
		MovieController ctrlMovie = new MovieController();
		LinkedList<Movie> movies = ctrlMovie.getAll();
		
		
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
        	<h4>Películas</h4>  

			<div class="col-12 col-sm-12 col-lg-12">
            	<div class="table-responsive">
					<table class="table table-hover table-borderless ">
                    	<thead>
                    		<tr>
                    			<th>ID</th>
                    		    <th>Título</th>
                    		    <th>URL Imagen</th>
                    		    <th>Sinopsis</th>
                    		    <th>Fecha de Estreno</th>
                    		    <th>Reparto</th>
                    		    <th>Director</th>
                    		    <th>Duración</th>
                        		<th> <a class="btn btn-success" href="/TPI-Cine/views/pages/ui-user/newUser.jsp">Nueva Película</a> </th>
                        		<th></th>
                      		</tr>
                      	</thead>
                    	<tbody>
                    		<% for (Movie ur : movies) { %>
                    			<tr>
                    				<td><%=ur.getIdMovie()%></td>
                    				<td><%=ur.getTitle()%></td>
                    				<td><%=ur.getImage()%></td>
                    				<td><%=ur.getSynopsis()%></td>
                    				<td><%=ur.getReleaseDate()%></td>
                    				<td><%=ur.getCast()%></td>
                    				<td><%=ur.getDirector()%></td>
                    				<td><%=ur.getDuration()%></td>
                    				<td>
                    					<a href="/TPI-Cine/views/pages/ui-movie/editMovie.jsp?idMovie=<%=ur.getIdMovie()%>" class="btn">Editar</a><!-- editar -->
                    					<a href="/TPI-Cine/src/servlet/ABMCMovie?action=delete&idMovie=<%=ur.getIdMovie()%>" class="btn btn-danger">Eliminar</a><!-- borrar -->
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