<%@page import="entities.User"%>
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
	
	User u = (User)session.getAttribute("usuario");
	
	if(u == null){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	} else if(!u.esTaquillero() && !u.estaAutorizado()){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	}
	
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
	<link rel="icon" href="../../assets/favicon/orfeos.png" type="image/x-icon">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../styles/abmcShow.css"/>
	<link rel="stylesheet" href="./styles/styles.css"> 
	<link rel="stylesheet" href="../../styles/navbar.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
</head>
<body>
	<jsp:include page="../partials/navbar.jsp"></jsp:include>
	<main>
	<a href="/TPI-Cine/views/pages/abmcShow.jsp" style="color:white">
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  		<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
		</svg>
	</a>
		<div class="input-group">
    	<form name="showForm" method="post" action="/TPI-Cine/src/servlet/abmcShow?action=new">
        	<p><b>Película:</b>
        	<select name="movie" required >
        	<%for(Movie m: movies) {%>
                <option style="background-color:#0077b6" value="<%=m.getIdMovie()%>"><%=m.getTitle() %></option>
            <%} %>
        	</select>
        	<b>Dia y horario:</b>
        	<input type="datetime-local" name="dt" placeholder="fecha y hora" required style="background-color:#0077b6">
        	<b>Sala:</b> 
        	<select name="room" required>
            <%for(MovieRoom mr: movierooms) {%>
                <option style="background-color:#0077b6" value="<%=mr.getRoomNumber()%>"><%=mr.getRoomNumber() %></option>
            <%} %>
        	</select>                  
        	<button class="btn btn-dark">Crear función</button></p>
    	</form>
    	</div>
	</main>
</body>
</html>