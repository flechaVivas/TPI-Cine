<%@page import="entities.RoomType"%>
<%@page import="logic.RoomTypeController"%>
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
	
		if(u!=null){
			if(u.getRole().getDescription() != "admin"){
				session.invalidate();
				request.getRequestDispatcher("/TPI-Cine/views/pages/login.jsp");
			}
		}
		
		RoomTypeController ctrlRT = new RoomTypeController();
		LinkedList<RoomType> types = ctrlRT.list();
	
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
        	<h4>Tipos de Sala</h4>  

			<div class="col-12 col-sm-12 col-lg-12">
            	<div class="table-responsive">
					<table class="table table-hover table-borderless ">
                    	<thead>
                    		<tr>
                    			<th>ID</th>
                    		    <th>Descripcion</th>
                    		    <th>Filas</th>
                    		    <th>Columnas</th>
                    		    <th>Precio</th>
                        		<th> <a class="btn btn-success" href="/TPI-Cine/views/pages/ui-roomType/newRoomType.jsp">Nuevo Tipo de Sala</a> </th>
                        		<th></th>
                      		</tr>
                      	</thead>
                    	<tbody>
                    		<% for (RoomType r : types) { %>
                    			<tr>
                    				<td><%=r.getIdRoomType()%></td>
                    				<td><%=r.getDescription()%></td>
                    				<td><%=r.getSizeRow()%></td>
                    				<td><%=r.getSizeCol()%></td>
                    				<td><%=r.getPrice()%></td>
                    				<td>
                    					<a href="/TPI-Cine/views/pages/ui-roomType/editRoomType.jsp?idRoomType=<%=r.getIdRoomType()%>" class="btn">Editar</a><!-- editar -->
                    					<a href="/TPI-Cine/src/servlet/ABMCRoomType?action=delete&idRoomType=<%=r.getIdRoomType()%>" class="btn btn-danger">Eliminar</a><!-- borrar -->
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