<%@page import="entities.Movie"%>
<%@page import="logic.MovieController"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.Role"%>
<%@page import="logic.RoleController"%>
<%@page import="entities.User"%>
<%@page import="logic.UserController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Películas</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<%
	
		User u = (User)session.getAttribute("usuario");
		
		if(u == null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		} else if(!u.estaAutorizado()){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}
	
		Integer id = Integer.parseInt((String)request.getParameter("idMovie"));
		MovieController ctrlMovie = new MovieController();
		Movie ur = new Movie();
		ur.setIdMovie(id);
		ur = ctrlMovie.getbyIdMovie(ur);
		
		RoleController ctrlRole = new RoleController();
		LinkedList<Role> roles = ctrlRole.getAll();		
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
				
				<form action="/TPI-Cine/src/servlet/ABMCMovie?action=update&idMovie=<%=ur.getIdMovie()%>" method="post">
				
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
			                  	</tr>
			                </thead>
							<tbody>
								<tr>
			                		<td><input type="number"  name="idMovie" value="<%=ur.getIdMovie()%>" readonly="" class="form-control"></td>
			                    	<td><input type="text" name="title"  	value="<%=ur.getTitle()%>" class="form-control" required></td>
			                    	<td><input type="text" name="image"  value="<%=ur.getImage()%>"	class="form-control" required></td>
									<td><input type="text" name="synopsis"  	value="<%=ur.getSynopsis()%>" class="form-control" required></td>
			                    	<td><input type="date" name="releaseDate" 	value="<%=ur.getReleaseDate()%>"	class="form-control" required></td>
									<td><input type="text" name="cast" value="<%=ur.getCast()%>"	class="form-control" required></td>
			                    	<td><input type="text" name="director" 	value="<%=ur.getDirector()%>"	class="form-control" required></td>
			                    	<td><input type="text" name="duration" value="<%=ur.getDuration()%>" class="form-control" required></td>
			                    	<td>
										<button class="btn btn-warning" type="submit">Confirmar</button>
			               			</td>
			                    </tr>
			               </tbody>
			            </table>
			         </div>
			      </div>
	    		</form>	
				<a href="/TPI-Cine/views/pages/ui-movie/listMovies.jsp" class="btn">Volver a Películas</a>
			</div>
		</div>
	</div>





</body>
</html>