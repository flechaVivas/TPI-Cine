<%@page import="entities.Restriction"%>
<%@page import="logic.RestrictionController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar usuario</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


</head>
<body>

	<%
		Integer id = Integer.parseInt((String)request.getParameter("idRestriction"));
		RestrictionController ctrlRes = new RestrictionController();
		Restriction r = new Restriction();
		r.setIdRestriction(id);
		r = ctrlRes.getOne(r);
	
	
	%>
	
	<div class="container mt-4" style="min-height: 65vh;">

		<!-- Body de la pagina -->
		<div class="row"> 
		<!-- Menu de la izquierda-->
			<div id="Menu" class="col-2 mt-5">
				<!-- Sidebar Column -->
				<div class="list-group">
					<a class="list-group-item" href="listUsers.jsp">Usuarios</a>
					<a class="list-group-item" href="/TPI-Cine/views/pages/ui-role/listRoles.jsp">Roles</a>
					<a class="list-group-item" href="listTickets.jsp">Tickets</a>
					<a class="list-group-item" href="listShows.jsp">Funciones</a>
					<a class="list-group-item" href="listMovies.jsp">Películas</a>
					<a class="list-group-item" href="/TPI-Cine/views/pages/ui-restriction/listRestrictions.jsp">Restricciones</a>
					<a class="list-group-item" href="/TPI-Cine/views/pages/ui-genre/listGenres.jsp">Generos</a>
					<a class="list-group-item" href="listMoovieRooms.jsp">Salas de Cine</a>
					<a class="list-group-item" href="/TPI-Cine/views/pages/ui-roomType/listRoomTypes.jsp">Tipos de Salas</a>
					<a class="list-group-item" href="listUbication.jsp">Ubicaciones</a>
				</div>
			</div>
	    	
	    	<!-- Content Column -->
			<div class="col-10 ">
	        	<h2>PANEL ADMINISTRADOR</h2>
	        	<p>Desde aquí podrá gestionar los datos</p>
	        	<h4>Restricciones</h4>
				
				<form action="/TPI-Cine/src/servlet/ABMCRestriction?action=update&idRestriction=<%=r.getIdRestriction()%>" method="post">
				
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
			                		<td><input type="text" value="<%=r.getIdRestriction()%>" name="idRestriction" readonly="" class="form-control"></td>
			                    	<td><input value="<%=r.getDescription()%>"name="description" type="text" class="form-control" required></td>
			                    				
			                    	<td>
										<button class="btn btn-warning" type="submit">Confirmar</button>
			               			</td>
			                    </tr>
			               </tbody>
			            </table>
			         </div>
			      </div>
			      </form>	
	             <a href="/TPI-Cine/views/pages/ui-restriction/listRestrictions.jsp" class="btn">Volver a restricciones</a>
			</div>
		</div>
	</div>
				
	

</body>
</html>