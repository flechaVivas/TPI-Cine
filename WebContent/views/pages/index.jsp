<!DOCTYPE html>
<%@page import="entities.User"%>
<%@page import="entities.Movie"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.*"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="./styles/styles.css">


	 
    <% // Me mapeo los datos de la db
    
    	MovieController ctrlMovie = new MovieController();
    	LinkedList<Movie> ml = ctrlMovie.getAll();
    	
	%>


</head>
<body>

	<jsp:include page="../partials/navbar.jsp"></jsp:include>
	
	<jsp:include page="../partials/carrusel.jsp"></jsp:include>
	

	

</body>
</html>