<%@page import="java.util.LinkedList"%>
<%@page import="entities.Role"%>
<%@page import="logic.RoleController"%>
<%@page import="entities.User"%>
<%@page import="logic.UserController"%>
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
		Integer id = Integer.parseInt((String)request.getParameter("idUser"));
		UserController ctrlUser = new UserController();
		User ur = new User();
		ur.setIdUser(id);
		ur = ctrlUser.getOne(ur);
		
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
			<div class="col-10 ">
	        	<h2>PANEL ADMINISTRADOR</h2>
	        	<h4>Usuarios</h4>
				
				<form action="/TPI-Cine/src/servlet/ABMCUser?action=update&idUser=<%=ur.getIdUser()%>" method="post">
				
				<div class="col-12 col-sm-12 col-lg-12">
			     	<div class="table-responsive">
						<table class="table table-hover table-borderless ">
			            	<thead>
			                	<tr>
			                		<th>ID</th>
	                    		    <th>Nombre</th>
	                    		    <th>Apellido</th>
	                    		    <th>Fecha Nacimiento</th>
	                    		    <th>Direccion</th>
	                    		    <th>Telefono</th>
	                    		    <th>Email</th>
	                    		    <th>Contraseña</th>
	                    		    <th>Rol</th>
			                  	</tr>
			                </thead>
							<tbody>
								<tr>
			                		<td><input type="number" value="<%=ur.getIdUser()%>" name="idUser" readonly="" class="form-control"></td>
			                    	<td><input type="text" value="<%=ur.getName()%>"name="nombre"  class="form-control" required></td>
			                    	<td><input type="text" value="<%=ur.getSurname()%>"name="apellido"  class="form-control" required></td>
			                    	<td><input type="date" value="<%=ur.getBirthDate()%>"name="nacimiento"  class="form-control" required></td>
			                    	<td><input type="text" value="<%=ur.getAdress()%>"name="direccion" class="form-control" required></td>
			                    	<td><input type="text" value="<%=ur.getPhoneNumber()%>"name="tel" class="form-control" required></td>
			                    	<td><input type="text" value="<%=ur.getEmail()%>"name="email" class="form-control" required></td>
			                    	<td><input type="password" value="<%=ur.getPassword()%>"name="passwd" class="form-control" required></td>
			                    	<td>
										<select class="form-control" name="rol" id="rol">
											<% for (Role r : roles){  %>
												<%if(r.getIdRole()==ur.getRole().getIdRole()){%>
                                    				<option value="<%=r.getIdRole()%>" selected> <%=r.getDescription() %> </option>
                                    			<%} else {%>
                                    				<option value="<%=r.getIdRole()%>"> <%=r.getDescription() %> </option>
                                    			<%}%>
											<%} %>
										</select>
			                    	</td>
			                    				
			                    	<td>
										<button class="btn btn-warning" type="submit">Confirmar</button>
			               			</td>
			                    </tr>
			               </tbody>
			            </table>
			         </div>
			      </div>
	    		</form>	
				<a href="/TPI-Cine/views/pages/ui-user/listUsers.jsp" class="btn">Volver a Usuarios</a>
			</div>
		</div>
	</div>





</body>
</html>