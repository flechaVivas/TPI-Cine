<%@page import="entities.Genre"%>
<%@page import="logic.GenreController"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<title>Generos</title>

	<%
		User u = (User)session.getAttribute("usuario");
	
		if(u == null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		} else if(!u.estaAutorizado()){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}
		
		GenreController ctrlGen = new GenreController();
		LinkedList<Genre> genres = ctrlGen.getAll();
	
	%>

</head>
<body>
  
	<div class="container mt-4" style="min-height: 65vh;">

	<!-- Body de la pagina -->
	<div class="row">

		<% if(request.getAttribute("error")!=null){ %>
			<div class="col-12">
				<div class="alert alert-danger" role="alert">
					<strong style="color: #660708;">Error! <%=request.getAttribute("error")%></strong>
				</div>
			</div>
			
		<% } %>
	
		<jsp:include page="/views/partials/menuIzq.jsp"></jsp:include>
		
    	<!-- Content Column -->
		<div class="col-10 ">
        	<h2>PANEL ADMINISTRADOR</h2>
        	<h4>Restricciones</h4>  

			<div class="col-12 col-sm-12 col-lg-12">
            	<div class="table-responsive">
					<table class="table table-hover table-borderless ">
                    	<thead>
                    		<tr>
                    			<th>ID</th>
                    		    <th>Descripcion</th>
                        		<th> <a class="btn btn-success" href="/TPI-Cine/views/pages/ui-genre/newGenre.jsp">Nuevo Genero</a> </th>
                        		<th></th>
                      		</tr>
                      	</thead>
                    	<tbody>
                    		<% for (Genre g : genres) { %>
                    			<tr>
                    				<td><%=g.getIdGenre()%></td>
                    				<td><%=g.getDescription()%></td>
                    				
                    				<td>
                    					<a href="/TPI-Cine/views/pages/ui-genre/editGenre.jsp?idGenre=<%=g.getIdGenre()%>" class="btn">Editar</a><!-- editar -->
                    					<a href="/TPI-Cine/src/servlet/ABMCGenre?action=delete&idGenre=<%=g.getIdGenre()%>" class="btn btn-danger">Eliminar</a><!-- borrar -->
                    				</td>
                    			</tr>
                    		<% } %>
                    		</tbody>	
                   		</table>
                   	</div>
           		</div>	
            	<a href="/TPI-Cine/views/pages/adminPanel.jsp" class="btn">Volver al menu</a>
       		</div>
		</div>
	</div>


</body>
</html>