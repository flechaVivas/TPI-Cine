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
<link rel="icon" href="../../assets/favicon/orfeos.png" type="image/x-icon">
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

    <div class="container movie-description">
        <div class="movie-info">
            <h1 class="genre"><%=m.getGenre().getDescription() %></h1>
            <h1 class="title"><b><%=m.getTitle() %></b></h1>
            <h2 class="details">Duración: <%=m.getDuration()%>m | Restricción: <%=m.getRestriction().getDescription()%></h2>
            <p class="synopsis"><%=m.getSynopsis()%></p>
            <div class="tickets">
                <h3>
                    <a href="/TPI-Cine/views/pages/entradas.jsp">
                        Ver tickets para esta película
                        <i class="fas fa-ticket-alt"></i>
                    </a>
                </h3>
            </div>
        </div>
        <div class="movie-details">
            <div class="movie-image">
                <img src="<%=m.getImage()%>" alt="Imagen de la película">
            </div>
            <div class="movie-cast">
                <table class="table table-dark table-borderless">
                    <tr>
                        <td>Director</td>
                        <td><%=m.getDirector() %></td>
                    </tr>
                    <tr>
                        <td>Reparto</td>
                        <td><%=m.getCast() %></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
	


</body>
</html>