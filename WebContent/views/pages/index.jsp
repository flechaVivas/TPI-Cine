<!DOCTYPE html>
<%@page import="entities.User"%>
<%@page import="entities.Movie"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.*"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../../assets/favicon/orfeos.png" type="image/x-icon">
<title>Cines Orfeo's</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="./styles/styles.css">
	<link rel="stylesheet" href="../../styles/navbar.css">
	<link rel="stylesheet" href="../../styles/cartelera.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
	

	<% User u = (User)session.getAttribute("usuario"); %>

</head>
<body style="background-image: url(../../assets/background/vanishing-stripes.png)">

	<% try{ %>

		<jsp:include page="../partials/navbar.jsp"></jsp:include>
		
		<jsp:include page="../partials/cartelera.jsp"></jsp:include>
	
	<%} catch(Exception e){
		request.setAttribute("error", e.getMessage());
		request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
	} %>
	

</body>
</html>