<%@page import="entities.User"%>
<%@page import="entities.Genre"%>
<%@page import="logic.GenreController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<%
	
		User u = (User)session.getAttribute("usuario");
	
		if(u == null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		} else if(!u.estaAutorizado()){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}
	
		Integer id = Integer.parseInt((String)request.getParameter("idGenre"));
		GenreController ctrlGen = new GenreController();
		Genre g = new Genre();
		g.setIdGenre(id);
		g = ctrlGen.getOne(g);
	
	%>


</head>
<body>


	<div class="container mt-4" style="min-height: 65vh;">

		<!-- Body de la pagina -->
		<div class="row"> 
		
			<jsp:include page="/views/partials/menuIzq.jsp"></jsp:include>

			<% if(request.getAttribute("error")!=null){ %>
				<div class="col-12">
					<div class="alert alert-danger" role="alert">
						<strong style="color: #660708;">Error! <%=request.getAttribute("error")%></strong>
					</div>
				</div>
				
			<% } %>
	    	
	    	<!-- Content Column -->
			<div class="col-10 ">
	        	<h2>PANEL ADMINISTRADOR</h2>
	        	<h4>Generos</h4>
				
				<form action="/TPI-Cine/src/servlet/ABMCGenre?action=update&idGenre=<%=g.getIdGenre()%>" method="post">
				
				<div class="col-12 col-sm-12 col-lg-12">
			     	<div class="table-responsive">
						<table class="table table-hover table-borderless ">
			            	<thead>
			                	<tr>
			                		<th>ID</th>
			                		<th>Descripcion</th>
			                  	</tr>
			                </thead>
							<tbody>
								<tr>
			                		<td><input type="text" value="<%=g.getIdGenre()%>" name="idGenre" readonly="" class="form-control"></td>
			                    	<td><input value="<%=g.getDescription()%>"name="description" type="text" class="form-control" required></td>
			                    				
			                    	<td>
										<button class="btn btn-warning" type="submit">Confirmar</button>
			               			</td>
			                    </tr>
			               </tbody>
			            </table>
			         </div>
			      </div>
			      </form>	
	             <a href="/TPI-Cine/views/pages/ui-genre/listGenres.jsp" class="btn">Volver a Generos</a>
			</div>
		</div>
	</div>





</body>
</html>