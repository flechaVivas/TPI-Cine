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

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="./styles/styles.css">
	<link rel="stylesheet" href="../../styles/navbar.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>

	<%
		MovieController ctrlMovie = new MovieController();
		LinkedList<Movie> movies = ctrlMovie.getAll();
		
// 		RoomTypeController ctrlRoomType = new RoomTypeController();
// 		LinkedList<RoomType> types = ctrlRoomType.getAvailableTypes();


	%>


</head>
<body>

	<jsp:include page="../partials/navbar.jsp"></jsp:include>
	
	<main style="margin-top: 30px;">
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
				
				<form action="ventaEntradas" method="post">
				<div class="row">
					<br><br>
					
					<label name="movie">Seleccione una <strong>película</strong></label>
					<select name="movie" id="movie">
						<% for (Movie m : movies){ %>
						<option value=" <%=m.getTitle()%> "><%=m.getTitle()%></option>
						<%} %>
				  	</select>
				  	
<!-- 				  	<label name="type">Seleccione un <strong>tipo</strong> de <strong>sala</strong></label> -->
<!-- 					<select name="type" id="type"> -->
<%-- 						<% for (RoomType rt : types){ %> --%>
<%-- 						<option value=" <%=m.getTitle()%> "><%=m.getTitle()%></option> --%>
<%-- 						<%} %> --%>
<!-- 				  	</select> -->


				</div>
				</form>
			</div>

			

				



	
			
			
			
			
			
		</section>
	</main>

</body>
</html>