<%@page import="logic.MovieController"%>
<%@page import="entities.Movie"%>
<%@page import="logic.RestrictionController"%>
<%@page import="entities.Restriction"%>
<%@page import="logic.GenreController"%>
<%@page import="entities.Genre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Descripcion Pelicula</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="./styles/styles.css">
<link rel="stylesheet" href="../../styles/movieDescription.css"> 
<link rel="stylesheet" href="../../styles/navbar.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
</head>

	<%
		MovieController ctrlMovie = new MovieController();
		GenreController ctrlGenre= new GenreController();
		RestrictionController ctrlRest=new RestrictionController();
		Movie m = new Movie();
		int id = Integer.parseInt(request.getParameter("idMovie"));
		m.setIdMovie(id);
		m=ctrlMovie.getbyIdMovie(m);
		Genre g = new Genre();
		g.setIdGenre(m.getGenre().getIdGenre());
		m.setGenre(ctrlGenre.getOne(g));
		
		Restriction r = new Restriction();
		r.setIdRestriction(m.getRestriction().getIdRestriction());
		m.setRestriction(ctrlRest.getOne(r));
	%>


<body style="background-image: url(../../assets/background/vanishing-stripes.png)">
	
	<jsp:include page="../partials/navbar.jsp"></jsp:include>
	
	<div class="container" style="color: white;">
  		<div class="genero"><h1><%=m.getGenre().getDescription() %></h1></div>
  		<div class="titulo"><h1><b><%=m.getTitle() %></b></h1></div>
  		<div class="duracion-restriccion"><h2>Duracion: <%=m.getDuration()+"		"%> Restriccion: <%=m.getRestriction().getDescription()%></h2></div>
  		<div class="entradas"><h3><a href="/TPI-Cine/views/pages/entradas.jsp">
  			Ver tickets para esta pelicula
  			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-ticket-perforated" viewBox="0 0 16 16">
 		 	<path d="M4 4.85v.9h1v-.9H4Zm7 0v.9h1v-.9h-1Zm-7 1.8v.9h1v-.9H4Zm7 0v.9h1v-.9h-1Zm-7 1.8v.9h1v-.9H4Zm7 0v.9h1v-.9h-1Zm-7 1.8v.9h1v-.9H4Zm7 0v.9h1v-.9h-1Z"/>
  			<path d="M1.5 3A1.5 1.5 0 0 0 0 4.5V6a.5.5 0 0 0 .5.5 1.5 1.5 0 1 1 0 3 .5.5 0 0 0-.5.5v1.5A1.5 1.5 0 0 0 1.5 13h13a1.5 1.5 0 0 0 1.5-1.5V10a.5.5 0 0 0-.5-.5 1.5 1.5 0 0 1 0-3A.5.5 0 0 0 16 6V4.5A1.5 1.5 0 0 0 14.5 3h-13ZM1 4.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v1.05a2.5 2.5 0 0 0 0 4.9v1.05a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-1.05a2.5 2.5 0 0 0 0-4.9V4.5Z"/>
			</svg></a></h3></div>
  		<div class="sinopsis"><h3><%=m.getSynopsis()%></h3></div>
  		<div class="foto"><img src="<%=m.getImage()%>" alt="Imagen html" width="600"></div>
  		<div class="data">
  			<table class="table table-dark table-borderless">
  				<tr>
  					<td>Director</td>
  					<td><%=m.getDirector() %></td>
  				</tr>
  				<tr>
  					<td>Reparto</td>
  					<td><%=m.getCast() %></td>
  				</tr>
  			</table></div>
	</div>
	


</body>
</html>