<%@page import="entities.User"%>
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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="./styles/styles.css"> 
	<link rel="stylesheet" href="../../styles/newMovie.css"/>
	<link rel="stylesheet" href="../../styles/navbar.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
	<%
	
	User u = (User)session.getAttribute("usuario");
	
	if(u == null){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	} else if(!u.esTaquillero() && !u.estaAutorizado()){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	}
	
	MovieController ctrlMovie= new MovieController();
	GenreController ctrlGenre = new GenreController();
	LinkedList<Genre> genres = ctrlGenre.getAll();
	RestrictionController ctrlRest=new RestrictionController();
	LinkedList<Restriction> restrictions = ctrlRest.getAll();
	Movie m= new Movie();
	m.setIdMovie(Integer.parseInt((String)request.getParameter("idM")));
	m=ctrlMovie.getbyIdMovie(m);
	%>
	</head>
	<body>
		<header> 
		<jsp:include page="../partials/navbar.jsp"></jsp:include>
		
		 </header>
         <main>
         <a href="/TPI-Cine/views/pages/abmcMovie.jsp" style="color:white">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
				</svg>
		</a>
            <div class="Container">
                <h2><i>Modificar pelicula</i></h2>
                <form class="RegisterForm" method="POST" action="/TPI-Cine/src/servlet/abmcMovie?action=update&idM=<%=m.getIdMovie() %>">
                    <div class="formContent">
                        <div>
                            <div class="divForm">
                                <label class="labelForm">Título</label>
                                <input class="inputForm" name="title" type="text" value="<%=m.getTitle()%>" required>
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Imagen</label>
                                <input class="inputForm" name="image" type="text" value="<%=m.getImage()%>" >
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Fecha estreno</label>
                                <input class="inputForm" name="releaseDate" type="date" value="<%=m.getReleaseDate()%>" required>
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Sinopsis:</label>
                                <input class="inputForm" name="synopsis" type="text" value="<%=m.getSynopsis()%>" required>
                            </div>
                        </div>
                        <div>
                            <div class="divForm">
                                <label class="labelForm">Reparto</label>
                                <input class="inputForm" name="cast" type="text" value="<%=m.getCast()%>" required>
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Director</label>
                                <input class="inputForm" name="director" type="text" value="<%=m.getDirector()%>" required>
                            </div>
                            <div class="divForm">
                                <label class="labelForm">Duracion en minutos</label>
                                <input class="inputForm" name="duration" type="number" value="<%=m.getDuration()%>" required>
                            </div>
                            <div class="divForm">                            
                                <p>Restriccion de edad
                                <select style="background-color:#0077b6" name="restriction" required>
                                	<%for(Restriction r: restrictions) {
                                	if(r.getIdRestriction()==m.getRestriction().getIdRestriction()){%>
                                    	<option style="background-color:#2a2b38" value="<%=r.getIdRestriction()%>" selected> <%=r.getDescription() %> </option>
                                    <%} else {%>
                                    	<option value="<%=r.getIdRestriction()%>"> <%=r.getDescription() %> </option>
                                    	<%}
                                	}%>
                                </select></p>
                                <p><select style="background-color:#0077b6" name="genre" required>
                                	<%for (Genre g: genres) {
                                	if(g.getIdGenre()==m.getGenre().getIdGenre()){%>
                                    	<option style="background-color:#2a2b38" value="<%=g.getIdGenre()%>" selected> <%=g.getDescription() %> </option>
                                    <%} else {%>
                                    <option value="<%=g.getIdGenre() %>"><%=g.getDescription() %></option>
                                    <% }
                                	}%>
                                </select></p>
                                <button class="btn btn-dark">Modificar pelicula</button>
                            </div>
                            
                        </div>
                    </div>
                </form>                
            </div>
        </main>
        
        <footer> </footer>
        
        </body>
        </html>