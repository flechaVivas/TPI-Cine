<%@page import="java.util.LinkedList"%>
<%@page import="entities.Movie"%>
<%@page import="logic.MovieController"%>
<%@page import="entities.Show" %>
<%@page import="entities.MovieRoom" %>
<%@page import="logic.MovieRoomController"%>
<%@page import="logic.ShowController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
ShowController ctrlShow = new ShowController();
LinkedList<Show> shows = ctrlShow.getAll();

MovieController ctrlMovie = new MovieController();
LinkedList<Movie> movies = ctrlMovie.getBillboard();

MovieRoomController ctrlMR = new MovieRoomController();
LinkedList<MovieRoom> movierooms = ctrlMR.list();
%>
<head>
<meta charset="UTF-8">
<title>Nueva funcion</title>

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
    	<form name="showForm" method="post" action="/TPI-Cine/src/servlet/abmcShow?action=new">
        	<p><b>Película:</b>
        	<select name="movie" required>
        	<%for(Movie m: movies) {%>
                <option value="<%=m.getIdMovie()%>"><%=m.getTitle() %></option>
            <%} %>
        	</select>
        	<b>Dia y horario:</b>
        	<input type="datetime-local" name="dt" placeholder="fecha y hora" required>
        	<b>Sala:</b> 
        	<select name="room" required>
            <%for(MovieRoom mr: movierooms) {%>
                <option value="<%=mr.getRoomNumber()%>"><%=mr.getRoomNumber() %></option>
            <%} %>
        	</select>                  
        	<input type="submit" value="Crear funcion"></p>
    	</form>
    	</div>
	</main>
</body>
</html>