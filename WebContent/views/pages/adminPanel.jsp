<%@page import="entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Panel Administrador </title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<% 
	User u = (User)session.getAttribute("usuario");

	if(u == null){
		request.getRequestDispatcher("/views/pages/login.jsp").forward(request, response);
	} else if(!u.estaAutorizado()){
		request.getRequestDispatcher("/views/pages/login.jsp").forward(request, response);
	}
	%>


</head>
<body>

	<jsp:include page="/views/partials/adminMenu.jsp"></jsp:include>

	
	
	

</body>
</html>