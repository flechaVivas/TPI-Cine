<%@page import="java.util.LinkedList"%>
<%@page import="entities.Movie"%>
<%@page import="logic.MovieController"%>
<%@page import="entities.Show" %>
<%@page import="entities.MovieRoom" %>
<%@page import="logic.MovieRoomController"%>
<%@page import="logic.ShowController"%>
<%
ShowController ctrlShow = new ShowController();
LinkedList<Show> shows = ctrlShow.getAll();

MovieController ctrlMovie = new MovieController();
LinkedList<Movie> movies = ctrlMovie.getAll();

MovieRoomController ctrlMR = new MovieRoomController();
LinkedList<MovieRoom> movierooms = ctrlMR.list();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Funciones</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="./styles/styles.css"> 
	<link rel="stylesheet" href="../../styles/navbar.css">
	<link rel="stylesheet" href="../../styles/abmcShow.css"/>

	<%
	
		/*if(session.getAttribute("usuario")==null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}*/
	%>
</head>
<body>
	<jsp:include page="../partials/navbar.jsp"></jsp:include>
	<main>
		<div class="input-group">
    	<!--<form name="showForm" action="" method="get">
			<div class="input-group mb-3">
  			<input type="text" placeholder="Ingrese el nombre de la pelicula" aria-label="Recipient's username" aria-describedby="button-addon2">
  				<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="bi bi-search"></i></button>
			</div>
			<b>Dia</b>
        	<input type="date" name="dt" placeholder="fecha">               
    	</form>-->
    	<table class="table table-hover">
        	<thead>
          		<tr>
            		<th scope="col">Fecha y Hora</th>
            		<th scope="col">Pelicula</th>
            		<th scope="col">Sala</th>
            		<th scope="col"></th>
            		<th><input type="submit" id="boton" value="+"></p></th>
          		</tr>
        	</thead>
        	<tbody>
          		<tr>
          			
          			<%for (Show s:shows ){ %>
          			<td><%=s.getDt()%></td>
            		<%	Movie m=new Movie();
            			m.setIdMovie(s.getMovie().getIdMovie());
            			s.setMovie(ctrlMovie.getbyIdMovie(m));
            
            			MovieRoom mr=new MovieRoom();
            			mr.setRoomNumber(s.getMovieroom().getRoomNumber());
            			s.setMovieroom(ctrlMR.getOne(mr));
            		%>
            		<td><%=s.getMovie().getTitle()%></td>
            		<td><%=s.getMovieroom().getRoomNumber()%></td>
            		<td>
                	<button type="button" class="btn btn-outline-dark">
                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  					<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  					<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
					</svg>
              		</button>  
            		</td>
          		</tr>
          		<%} %>	
        	</tbody>
      	</table>
    	</div>
	</main>
</body>
</html>