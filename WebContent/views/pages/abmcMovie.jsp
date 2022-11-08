<%@page import="entities.User"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.Movie"%>
<%@page import="logic.MovieController"%>
<%@page import="entities.Genre" %>
<%@page import="entities.Restriction" %>
<%@page import="logic.RestrictionController"%>
<%@page import="logic.GenreController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Peliculas</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../styles/abmcMovie.css"/>
	<link rel="stylesheet" href="./styles/styles.css"> 
	<link rel="stylesheet" href="../../styles/navbar.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
	<%
	
	User u = (User)session.getAttribute("usuario");
	
	if(u == null){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	} else if(!u.esTaquillero() && !u.estaAutorizado()){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	}
	
	MovieController ctrlMovie = new MovieController();
	GenreController ctrlGenre = new GenreController();
	LinkedList<Genre> genres = ctrlGenre.getAll();
	RestrictionController ctrlRest=new RestrictionController();
	LinkedList<Restriction> restrictions = ctrlRest.getAll();
	LinkedList<Movie> movies =ctrlMovie.getAll();%>
	
</head>
<body>
	<jsp:include page="../partials/navbar.jsp"></jsp:include>
	<main>
		<div class="header">
        	<div class="titulo"><h1><i>Peliculas</i></h1></div>
        </div>
        	<div class="wrapper">
        		<table class="table table-borderless">
        			<tr>
                    	<div class="formContent">
                    	<form class="registerForm" method="POST" action="/TPI-Cine/src/servlet/filterMovie">
                   			<th>Ingrese Título de la pelicula
                   			<input class="inputForm" name="title" type="text" placeholder="..."></input></th>
        					<th><p>Restriccion de edad
                            <select name="restriction">
                                <option value="0">none</option>
                                <%for(Restriction r: restrictions) {%>
                                <option value="<%=r.getIdRestriction()%>"><%=r.getDescription() %></option>
                                <%} %>
                                </select></p></th>
                   			<th><p>Genero
                             <select name="genre">
                                <option value="0">none</option>
                                <%for (Genre g: genres) {%>
                                <option value="<%=g.getIdGenre() %>"><%=g.getDescription() %></option>
                                <% }%>
                              	</select></p></th>
                     	<th><button class="btn btn-dark">Aceptar</button></th>
             			</form>
             			</div>
             			<th><a class="btn btn-outline-light" href="/TPI-Cine/views/pages/newMovie.jsp">+</a></th>
             		</tr>
             </table>
    		</div>
    		<br>
    <%for (Movie m: movies){%>  
    	<div class="wrapper">
    	<div class="foto">
    		<%if(m.getRetirementDate()!=null){ %>
    		<p><b>Fecha de baja: <%=m.getRetirementDate()%></b></p><%} %>
    		<img src="<%=m.getImage()%>" alt="Imagen html">
    	</div>
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
        	<h5><%=m.getGenre().getDescription()%> </h5>
        	<small> Restricción: <%=m.getRestriction().getDescription()%></small> 
        	<h4><%=m.getDirector() %></h4>
        	<p><%=m.getCast() %></p> 
        	<p>Fecha de estreno: <%=m.getReleaseDate()%>
        	Duración: <%=m.getDuration() %>
        	</p>
        	</small>
    	</div>
    	<div class="upde">
    		<a class="btn btn-outline-dark" href="/TPI-Cine/views/pages/editMovie.jsp?idM=<%=m.getIdMovie() %>">
    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
				<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
				<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"></path>
			</svg></a>
		<%if(m.getRetirementDate()==null){ %>
        <form class="registerForm" method="POST" action="/TPI-Cine/src/servlet/abmcMovie?action=delete">
        	<button type="submit" name="idM" class="btn btn-outline-dark" value="<%=m.getIdMovie() %>">            	
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
				<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
				<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
			</svg>
			</button>
         </form>
     	<%}else{ %>	
     	<form class="registerForm" method="POST" action="/TPI-Cine/src/servlet/abmcMovie?action=undelete">
        	<button type="submit" name="idM" class="btn btn-outline-dark" value="<%=m.getIdMovie() %>">            	
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-counterclockwise" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
				<path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
			</svg>
			</button>
         </form>
     	<%} %>
     </div>
     </div>
     <br>
     <%} %> 
    </main>	
</body>
</html>

