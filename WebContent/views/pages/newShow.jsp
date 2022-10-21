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
    	<form name="showForm" action="" method="get">
        	<p><b>Película:</b>
        	<select name="pelicula">
        	<%for(Movie m: movies) {%>
                <option value="<%=m.getIdMovie()%>"><%=m.getTitle() %></option>
            <%} %>
        	</select>
        	<b>Dia y horario:</b>
        	<input type="datetime-local" name="dt" placeholder="fecha y hora">
        	<b>Sala:</b> 
        	<select name="sala">
            <%for(MovieRoom mr: movierooms) {%>
                <option value="<%=mr.getRoomNumber()%>"><%=mr.getRoomNumber() %></option>
            <%} %>
        	</select>                  
        	<input type="submit" id="boton" value="Crear funcion"></p>
    	</form>
	</main>
</body>
</html>