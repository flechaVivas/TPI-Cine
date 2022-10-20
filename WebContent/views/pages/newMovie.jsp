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
	</head>
	<body>
		<header> 
		<nav class="navbar"> <%@ include file="../partials/navbar.jsp" %> </nav>
		
		 </header>
         <main>
            <div class="Container">
                <h2><i>Nueva pelicula</i></h2>
                <form class="RegisterForm" method="POST" action="HACIA DONDE VA">
                    <div class="formContent">
                        <div>
                            <div class="divForm">
                                <label class="labelForm">Título</label>
                                <input class="inputForm" name="title" type="text" >
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Imagen</label>
                                <input class="inputForm" name="image" type="image" >
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Fecha estreno</label>
                                <input class="inputForm" name="releaseDate" type="date">
                            </div>
                        </div>
                        <div>
                            <div class="divForm">
                                <label class="labelForm">Reparto</label>
                                <input class="inputForm" name="cast" type="text">
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Director</label>
                                <input class="inputForm" name="director" type="text">
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Duracion en minutos</label>
                                <input class="inputForm" name="duration" type="number">
                            </div>
                            <div class="divForm">
                            
                                <p>Restriccion de edad
                                <select name="restriction">
                                	<%for(Restriction r: restrictions) {%>
                                    <option value="<%=r.getIdRestriction()%>"><%=r.getDescription() %></option>
                                    <%} %>
                                </select></p>
                                <p>Genero
                                <select name="genre">
                                	<%for (Genre g: genres) {%>
                                    <option value="<%=g.getIdGenre() %>"><%=g.getDescription() %></option>
                                    <%}%>
                                </select></p>
                            </div>
                        </div>
                    </div>
                    <div class="buttonSend">
                          <button type="submit" class="ButtonCreat">Agregar pelicula</button>
                    </div>
                </form>
                
            </div>
        </main>
        
        <footer> </footer>
        
        </body>
        </html>
		
