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
<head>
<meta charset="UTF-8">
<title>Funciones</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	<link rel="stylesheet" href="./styles/styles.css"> 
	<link rel="stylesheet" href="../../styles/navbar.css">
	<link rel="stylesheet" href="../../styles/abmcShow.css"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>

	<%
	
	User u = (User)session.getAttribute("usuario");
	
	if(u == null){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	} else if(!u.esTaquillero() && !u.estaAutorizado()){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	}
	%>
<%
MovieRoomController ctrlMR = new MovieRoomController();
LinkedList<MovieRoom> movierooms = ctrlMR.list();
MovieController ctrlMovie = new MovieController();
LinkedList<Movie> movies = ctrlMovie.getAll();
ShowController ctrlShow = new ShowController();
LinkedList<Show> shows = (LinkedList<Show>)request.getSession(false).getAttribute("shows");;
%>
</head>
<body>
	<jsp:include page="../partials/navbar.jsp"></jsp:include>
	<main>
		<div class="input-group">
    	<form class="registerForm" method="POST" action="/TPI-Cine/src/servlet/filterShow">
			<div class="input-group mb-3">
  			<div class="formContent">
                    <label>Ingrese Título de la pelicula</label>
                   <input class="inputForm" name="title" type="text" placeholder="Ingrese titulo de la pelicula"></input>
                   <b>Dia</b>
        	<input type="date" name="dt" placeholder="fecha"></input></div>  
			</div>     
			<button class="btn btn-success">Aceptar</button>    
    	</form>
    	<table class="table table-hover">
        	<thead>
          		<tr>
            		<th scope="col">Fecha y Hora</th>
            		<th scope="col">Pelicula</th>
            		<th scope="col">Sala</th>
            		<th scope="col"></th>
            		<th><a class="btn btn-outline-light" href="/TPI-Cine/views/pages/newShow.jsp">+</a></th>
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
            		<a class="btn btn-outline-dark" href="/TPI-Cine/views/pages/editShow.jsp?idM=<%=s.getMovie().getIdMovie() %>&room=<%=s.getMovieroom().getRoomNumber()%>&dt=<%=s.getDt()%>">
    				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
					<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"></path>
					</svg></a>
                	<form class="registerForm" method="POST" action="/TPI-Cine/src/servlet/abmcShow?action=delete&movie=<%=s.getMovie().getIdMovie()%>&room=<%=s.getMovieroom().getRoomNumber()%>&dt=<%=s.getDt()%>">
        				<button type="submit" class="btn btn-outline-dark">            	
            			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
						<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
						<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
						</svg>
						</button>
         			</form>  
            		</td>
          		</tr>
          		<%} %>	
        	</tbody>
      	</table>
    	</div>
	</main>
</body>
</html>
