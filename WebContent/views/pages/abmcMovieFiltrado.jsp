<%@page import="java.util.LinkedList"%>
<%@page import="entities.Movie"%>
<%@page import="logic.MovieController"%>
<%@page import="entities.Genre" %>
<%@page import="entities.Restriction" %>
<%@page import="logic.RestrictionController"%>
<%@page import="logic.GenreController"%>
<%
MovieController ctrlMovie = new MovieController();
GenreController ctrlGenre = new GenreController();
LinkedList<Genre> genres = ctrlGenre.getAll();
RestrictionController ctrlRest=new RestrictionController();
LinkedList<Restriction> restrictions = ctrlRest.getAll();
LinkedList<Movie> movies =(LinkedList<Movie>) request.getSession(false).getAttribute("movies");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Peliculas</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="./styles/styles.css"> 
	<link rel="stylesheet" href="../../styles/navbar.css">
	<link rel="stylesheet" href="../../styles/abmcMovie.css"/>

	<%
	
		/*if(session.getAttribute("usuario")==null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}*/
	%>
</head>
<body>
	<jsp:include page="../partials/navbar.jsp"></jsp:include>
	<main>
		<div class="header">
        	<div class="titulo"><h1><i>Peliculas</i></h1></div>
        	<div class="new"> <button type="button" class="btn btn-outline-light">+</button></div>
        	<form class="registerForm" method="POST" action="/TPI-Cine/src/servlet/filterMovie">
                    <div class="formContent">
                    <label>Ingrese Título de la pelicula</label>
                   <input class="inputForm" name="title" type="text" placeholder="Ingrese titulo de la pelicula"></input>
        			<p><label>Restriccion de edad</label>
                                <select name="restriction">
                                	<option value="0" selected="True">none</option>
                                	<%for(Restriction r: restrictions) {%>
                                    <option value="<%=r.getIdRestriction()%>"><%=r.getDescription() %></option>
                                    <%} %>
                                </select></p>
                                <p><select name="genre">
                                	<option value="0" selected="True">none</option>
                                	<%for (Genre g: genres) {%>
                                    <option value="<%=g.getIdGenre() %>"><%=g.getDescription() %></option>
                                    <% }%>
                              	</select></p>
                     </div>
                     <input type="submit" class="ButtonCreat">Filtrar</input>
             </form>
    	</div>
    <%for (Movie m: movies){ %>
    	<div class="wrapper">
        	<div class="foto"><img src="<%=m.getImage()%>" alt="Imagen html"></div>
        	<div class="data">
            	<h1><%=m.getTitle()%></h1>
            	<% 
	                            	
	           	Genre g = new Genre();
	           	g.setIdGenre(m.getGenre().getIdGenre());
	           	m.setGenre(ctrlGenre.getOne(g));
	                            	
	           	Restriction r = new Restriction();
	           	r.setIdRestriction(m.getRestriction().getIdRestriction());
	          	 m.setRestriction(ctrlRest.getOne(r));
	                            	
	         	%>
            	<h5><%=m.getGenre().getDescription()%></h5>
            	<small> Restricción: <%=m.getRestriction().getDescription()%></small> 
            	<h4><%=m.getDirector() %></h4>
            	<p><%=m.getCast() %></p> 
            	<p>Fecha de estreno: <%=m.getReleaseDate() %>          Duración: <%=m.getDuration() %></p>
            	</small>
        	</div>
        	<div class="upde">
            	<button type="button" class="btn btn-primary">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
 				<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
  				<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"></path>
				</svg>
              	</button>
            	<button type="button" class="btn btn-primary">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  				<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  				<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
				</svg>
              	</button>
        	</div>
    	</div>
    	<br>
    <%} %>
    </main>	
</body>
</html>

