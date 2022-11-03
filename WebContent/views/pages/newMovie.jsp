<%@page import="entities.Genre" %>
<%@page import="entities.Restriction" %>
<%@page import="logic.RestrictionController"%>
<%@page import="logic.GenreController"%>
<%@page import="java.util.LinkedList"%>
<%
GenreController ctrlGenre = new GenreController();
LinkedList<Genre> genres = ctrlGenre.getAll();
RestrictionController ctrlRest=new RestrictionController();
LinkedList<Restriction> restrictions = ctrlRest.getAll();%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Nueva Pelicula</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="./styles/styles.css">
	<link rel="stylesheet" href="../../styles/navbar.css">
	<link rel="stylesheet" href="../../styles/newMovie.css"/> 
	<%
	
		if(session.getAttribute("usuario")==null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}
	%>
	</head>
	<body>
	<nav class="navbar"> <%@ include file="../partials/navbar.jsp" %> </nav>
		<header> 
		
		 </header>
         <main>
            <div class="Container">
                <h2><i>Nueva pelicula</i></h2>
                <form class="RegisterForm" method="POST" action="/TPI-Cine/src/servlet/abmcMovie?action=new" enctype="multipart/form-data">
                    <div class="formContent">
                        <div>
                            <div class="divForm">
                                <label class="labelForm">Título</label>
                                <input class="inputForm" name="title" type="text" required>
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Imagen</label>
                                <input class="inputForm" name="image" type="file">
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Fecha estreno</label>
                                <input class="inputForm" name="releaseDate" type="date" required>
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Sinopsis:</label>
                                <input class="inputForm" name="synopsis" type="text" required>
                            </div>
                        </div>
                        <div>
                            <div class="divForm">
                                <label class="labelForm">Reparto</label>
                                <input class="inputForm" name="cast" type="text" required>
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Director</label>
                                <input class="inputForm" name="director" type="text" required>
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Duracion en minutos</label>
                                <input class="inputForm" name="duration" type="number" required>
                            </div>                            
                            <div class="divForm">
                            
                                <p>Restriccion de edad
                                <select name="restriction" required>
                                	<%for(Restriction r: restrictions) {%>
                                    <option value="<%=r.getIdRestriction()%>"><%=r.getDescription() %></option>
                                    <%} %>
                                </select></p>
                                <p>Genero
                                <select name="genre" required>
                                	<%for (Genre g: genres) {%>
                                    <option value="<%=g.getIdGenre() %>"><%=g.getDescription() %></option>
                                    <%}%>
                                </select></p> 
                            </div>
                        </div>
                    </div>
                    <input type="submit" name="new"  value="new">   
                </form> 
            </div>
        </main>
        
        <footer> </footer>
        
        </body>
        </html>
		
