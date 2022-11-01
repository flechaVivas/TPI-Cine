<%@page import="entities.Role"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.RoleController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta Genero</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<%
	RoleController ctrlRole = new RoleController();
	LinkedList<Role> roles = ctrlRole.getAll();	

%>


</head>
<body>

    <div class="container mt-4" style="min-height: 65vh;">

        <!-- Body de la pagina -->
        <div class="row"> 
        
        	<jsp:include page="/views/partials/menuIzq.jsp"></jsp:include>
            
            <!-- Content Column -->
            <div class="col-10">
                <h2>PANEL ADMINISTRADOR</h2>
                <h4>Usuarios</h4>  

                <form action="/TPI-Cine/src/servlet/ABMCUser?action=new" method="post">
                
                	<div class="col-12 col-sm-12 col-lg-12">
                
                   		<div class="table-responsive">
            
                        	<h2>Alta de Usuario</h2>
                
                        	<table class="table table-borderless">
	                            <tr>
	                    		    <td>Nombre</td>
	                    		    <td>Apellido</td>
	                    		    <td>Fecha Nacimiento</td>
	                    		    <td>Direccion</td>
	                    		    <td>Telefono</td>
	                    		    <td>Email</td>
	                    		    <td>Password</td>
	                    		    <td>Rol</td>
	                            </tr>
	                            <tr>
			                    	<td><input type="text" name="nombre"  class="form-control" required></td>
			                    	<td><input type="text" name="apellido"  class="form-control" required></td>
			                    	<td><input type="date" name="nacimiento"  class="form-control" required></td>
			                    	<td><input type="text" name="direccion" class="form-control" required></td>
			                    	<td><input type="text" name="tel" class="form-control" required></td>
			                    	<td><input type="text" name="email" class="form-control" required></td>
			                    	<td><input type="password" name="passwd" class="form-control" required></td>
			                    	<td>
										<select class="form-control" name="rol" id="rol">
											<% for (Role r : roles){  %>
                                   				<option value="<%=r.getIdRole()%>"> <%=r.getDescription() %> </option>
                                   			<%}%>
										</select>
			                    	</td>
									<td><button class="btn btn-warning" type="submit">Confirmar</button></td>
	                            </tr>
                        	</table>
                        	<a href="/TPI-Cine/views/pages/ui-user/listUsers.jsp" class="btn">Volver a Usuarios</a>
                    	</div>
                    </div>
                </form>
            </div>
        </div>
    </div>




</body>
</html>