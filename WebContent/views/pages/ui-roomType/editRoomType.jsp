<%@page import="logic.RoomTypeController"%>
<%@page import="entities.RoomType"%>
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
		Integer id = Integer.parseInt((String)request.getParameter("idRoomType"));
		RoomTypeController ctrlRT = new RoomTypeController();
		RoomType r = new RoomType();
		r.setIdRoomType(id);
		r = ctrlRT.getOne(r);
	
	%>


</head>
<body>


	<div class="container mt-4" style="min-height: 65vh;">

		<!-- Body de la pagina -->
		<div class="row"> 
		<!-- Menu de la izquierda-->
			<div id="Menu" class="col-2 mt-5">
				<!-- Sidebar Column -->
				<div class="list-group">
					<a class="list-group-item" href="listUsers.jsp">Usuarios</a>
					<a class="list-group-item" href="listRoles.jsp">Roles</a>
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
	        	<h4>Tipos de Salas</h4>
				
				<form action="/TPI-Cine/src/servlet/ABMCRoomType?action=update&idRoomType=<%=r.getIdRoomType()%>" method="post">
				
				<div class="col-12 col-sm-12 col-lg-12">
			     	<div class="table-responsive">
						<table class="table table-hover table-borderless ">
			            	<thead>
			                	<tr>
			                		<th>ID</th>
			                		<th>Descripcion</th>
			                		<th>Filas</th>
                    		   		<th>Columnas</th>
			                  	</tr>
			                </thead>
							<tbody>
								<tr>
			                		<td><input type="number" value="<%=r.getIdRoomType()%>" name="idRoomType" readonly="" class="form-control"></td>
			                    	<td><input type="text" value="<%=r.getDescription()%>"name="description"  class="form-control" required></td>
			                    	<td><input type="number" value="<%=r.getSizeRow()%>"name="row"  class="form-control" required></td>
			                    	<td><input type="number" value="<%=r.getSizeCol()%>"name="col" class="form-control" required></td>
			                    				
			                    	<td>
										<button class="btn btn-warning" type="submit">Confirmar</button>
			               			</td>
			                    </tr>
			               </tbody>
			            </table>
			         </div>
			      </div>
			      </form>	
	             <a href="/TPI-Cine/views/pages/ui-roomType/listRoomTypes.jsp" class="btn">Volver a Tipos de Sala</a>
			</div>
		</div>
	</div>





</body>
</html>