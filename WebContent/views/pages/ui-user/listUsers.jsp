<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="logic.UserController"%>
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

<title>Usuarios</title>

	<%
		User u = (User)session.getAttribute("usuario");
	
		if(u!=null){
			if(u.getRole().getDescription() != "admin"){
				session.invalidate();
				request.getRequestDispatcher("/TPI-Cine/views/pages/login.jsp");
			}
		}
		
		UserController ctrlUser = new UserController();
		LinkedList<User> users = ctrlUser.getAll();
		
		
	%>

</head>
<body>
  
	<div class="container mt-4" style="min-height: 65vh;">

	<!-- Body de la pagina -->
	<div class="row"> 
	
		<jsp:include page="/views/partials/menuIzq.jsp"></jsp:include>
    	
    	<!-- Content Column -->
		<div class="col-10 ">
        	<h2>PANEL ADMINISTRADOR</h2>
        	<h4>Usuarios</h4>  

			<div class="col-12 col-sm-12 col-lg-12">
            	<div class="table-responsive">
					<table class="table table-hover table-borderless ">
                    	<thead>
                    		<tr>
                    			<th>ID</th>
                    		    <th>Nombre y Apellido</th>
                    		    <th>Fecha Nacimiento</th>
                    		    <th>Direccion</th>
                    		    <th>Telefono</th>
                    		    <th>Email</th>
                    		    <th>Rol</th>
                        		<th> <a class="btn btn-success" href="/TPI-Cine/views/pages/ui-user/newUser.jsp">Nuevo Usuario</a> </th>
                        		<th></th>
                      		</tr>
                      	</thead>
                    	<tbody>
                    		<% for (User ur : users) { %>
                    			<tr>
                    				<td><%=ur.getIdUser()%></td>
                    				<td><%=ur.getName()+" "+ur.getSurname()%></td>
                    				<td><%=ur.getBirthDate()%></td>
                    				<td><%=ur.getAdress()%></td>
                    				<td><%=ur.getPhoneNumber()%></td>
                    				<td><%=ur.getEmail()%></td>
                    				<td><%=ur.getRole().getDescription()%></td>
                    				<td>
                    					<a href="/TPI-Cine/views/pages/ui-user/editUser.jsp?idUser=<%=ur.getIdUser()%>" class="btn">Editar</a><!-- editar -->
                    					<a href="/TPI-Cine/src/servlet/ABMCRoomType?action=delete&idUser=<%=ur.getIdUser()%>" class="btn btn-danger">Eliminar</a><!-- borrar -->
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