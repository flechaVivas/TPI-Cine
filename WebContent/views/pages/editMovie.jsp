<%@page import="entities.Genre" %>
<%@page import="entities.Restriction" %>
<%@page import="logic.RestrictionController"%>
<%@page import="logic.GenreController"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.Movie" %>
<%@page import="logic.MovieController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Modificar Pelicula</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="./styles/styles.css"> 
	<link rel="stylesheet" href="../../styles/navbar.css">
	<link rel="stylesheet" href="../../styles/newMovie.css"/>
<%
MovieController ctrlMovie= new MovieController();
GenreController ctrlGenre = new GenreController();
LinkedList<Genre> genres = ctrlGenre.getAll();
RestrictionController ctrlRest=new RestrictionController();
LinkedList<Restriction> restrictions = ctrlRest.getAll();
Movie m= new Movie();
m.setIdMovie(Integer.parseInt((String)request.getParameter("idM")));
m=ctrlMovie.getbyIdMovie(m);%>
	</head>
	<body>
		<header> 
		<nav class="navbar"> <%@ include file="../partials/navbar.jsp" %> </nav>
		
		 </header>
         <main>
            <div class="Container">
                <h2><i>Modificar pelicula</i></h2>
                <form class="RegisterForm" method="POST" action="/TPI-Cine/src/servlet/abmcMovie?action=update&idM=<%=m.getIdMovie() %>">
                    <div class="formContent">
                        <div>
                            <div class="divForm">
                                <label class="labelForm">Título</label>
                                <input class="inputForm" name="title" type="text" value="<%=m.getTitle()%>">
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Imagen</label>
                                <input class="inputForm" name="image" type="text" value="<%=m.getImage()%>">
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Fecha estreno</label>
                                <input class="inputForm" name="releaseDate" type="date" value="<%=m.getReleaseDate()%>">
                            </div>
                        </div>
                        <div>
                            <div class="divForm">
                                <label class="labelForm">Reparto</label>
                                <input class="inputForm" name="cast" type="text" value="<%=m.getCast()%>">
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Director</label>
                                <input class="inputForm" name="director" type="text" value="<%=m.getDirector()%>">
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Duracion en minutos</label>
                                <input class="inputForm" name="duration" type="number" value="<%=m.getDuration()%>">
                            </div>
                            <div class="divForm">
                            
                                <p>Restriccion de edad
                                <select name="restriction">
                                	<%for(Restriction r: restrictions) {
                                	if(r.getIdRestriction()==m.getRestriction().getIdRestriction()){%>
                                    	<option value="<%=r.getIdRestriction()%>" selected> <%=r.getDescription() %> </option>
                                    <%} else {%>
                                    	<option value="<%=r.getIdRestriction()%>"> <%=r.getDescription() %> </option>
                                    	<%}
                                	}%>
                                </select></p>
                                <p><select name="genre">
                                	<%for (Genre g: genres) {
                                	if(g.getIdGenre()==m.getGenre().getIdGenre()){%>
                                    	<option value="<%=g.getIdGenre()%>" selected> <%=g.getDescription() %> </option>
                                    <%} else {%>
                                    <option value="<%=g.getIdGenre() %>"><%=g.getDescription() %></option>
                                    <% }
                                	}%>
                                </select></p>
                            </div>
                        </div>
                    </div>
                    <div class="buttonSend">
                          <button type="submit" class="ButtonCreat">Modificar pelicula</button>
                    </div>
                </form>
                
            </div>
        </main>
        
        <footer> </footer>
        
        </body>
        </html>