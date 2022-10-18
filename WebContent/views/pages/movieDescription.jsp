<%@page import="logic.MovieController"%>
<%@page import="entities.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Descripcion Pelicula</title>
</head>

	<%
		MovieController ctrlMovie = new MovieController();
		Movie m = new Movie();
		int id = Integer.parseInt(request.getParameter("idMovie"));
		m.setIdMovie(id);
	
	%>


<body>

	
	


</body>
</html>