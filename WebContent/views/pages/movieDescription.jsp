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
	<nav class="navbar"> <%@ include file="../partials/navbar.jsp" %> </nav>
	
	<div class="container">
  		<div class="genero"><h1><%=m.getGenre().getDescription() %></h1></div>
  		<div class="titulo"><h1><%=m.getTitle() %></h1></div>
  		<div class="duracion-restriccion"><h3>Duracion<%=m.getDuration()+"		"+m.getRestriction().getDescription()%></h3></div>
  		<div class="entradas">ver que onda</div>
  		<div class="sinopsis"><h2><%=m.getSynopsis()%></h2></div>
  		<div class="foto"><img src="<%=m.getImage()%>" alt="Imagen html"></div>
  		<div class="data">ver de hacer tabla acá</div>
	</div>
	


</body>
</html>