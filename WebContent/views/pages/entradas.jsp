<%@page import="entities.User"%>
<%@page import="entities.Show"%>
<%@page import="logic.RoomTypeController"%>
<%@page import="entities.RoomType"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.Movie"%>
<%@page import="logic.MovieController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boletería Virtual</title>
	
	<script src="https://kit.fontawesome.com/a23ea6f378.js" crossorigin="anonymous"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="./styles/styles.css">
	<link rel="stylesheet" href="../../styles/navbar.css">
	
	<%
	
		User u = (User)session.getAttribute("usuario");
		
		if(u == null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}
		
		Show s = (Show)session.getAttribute("show");
	
	%>


</head>
<body style="background-color: #d9d9d9">

	<jsp:include page="../partials/navbar.jsp"></jsp:include>
	
	<main style="margin-top: 30px;">
		<a href="/TPI-Cine/views/pages/index.jsp" style="color:black">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  			<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
		</svg>
		</a>
		<section class="content-section">
		
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="section-title text-center">
							<h1>BOLETERÍA VIRTUAL</h1>
							<h2>Venta de Entradas</h2>
						</div>
					</div>
				</div>
				
				
				<% if((String)request.getParameter("step") == null) { %>
					
					<% 
						request.getSession().removeAttribute("show");
						request.getSession().removeAttribute("showsDateTime");
						request.getSession().removeAttribute("tipoSala");
						request.getSession().removeAttribute("cantidad");
					%>
					
					<jsp:include page="/views/partials/selecPelicula.jsp"></jsp:include>
				
				<%}else { %>
				
					<% switch ((String)request.getParameter("step") )	{
					
						case "selecSala": %>
							
							<jsp:include page="/views/partials/selecPelicula.jsp"></jsp:include>
							<jsp:include page="/views/partials/selecHabitacion.jsp"></jsp:include>
							
						<% 	break;
						
						case "selecHora": %>
						
							<jsp:include page="/views/partials/selecPelicula.jsp"></jsp:include>
							<jsp:include page="/views/partials/selecHabitacion.jsp"></jsp:include>
							<jsp:include page="/views/partials/selecDiaHora.jsp"></jsp:include>
							
						<% break;
						
						case "selecAsiento": %>
						
							<jsp:include page="/views/partials/selecAsiento.jsp"></jsp:include>
						
						<% break;
						
						case "confirmar": %>
						
							<jsp:include page="/views/partials/confirmarEntrada.jsp"></jsp:include>
						
						<% break; 
						
						case "informarExito": %>
							
							<jsp:include page="/views/partials/informarExito.jsp"></jsp:include>
						
					<%}%>
				<%}%>
				
				
			</div>
			
		</section>
	</main>

</body>
</html>