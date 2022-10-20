<%@page import="entities.Restriction"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.RestrictionController"%>
<%@page import="entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Restricciones</title>

	<%
		User u = (User)request.getSession().getAttribute("usuario");
		
		RestrictionController ctrlRes = new RestrictionController();
		LinkedList<Restriction> restrictions = ctrlRes.getAll();
	
	%>
	

</head>
<body>

	<div class="container mt-4" style="min-height: 65vh;">

	<!-- Body de la pagina -->
	<div class="row"> 
	<!-- Menu de la izquierda-->
		<div id="Menu" class="col-2">
			<!-- Sidebar Column -->
			<div class="list-group">
				<a class="list-group-item" href="listUsers.jsp">User</a>
				<a class="list-group-item" href="listRoles.jsp">Role</a>
				<a class="list-group-item" href="listTickets.jsp">Ticket</a>
				<a class="list-group-item" href="listShows.jsp">Show</a>
				<a class="list-group-item" href="listMovies.jsp">Movie</a>
				<a class="list-group-item" href="listRestrictions.jsp">Restriction</a>
				<a class="list-group-item" href="listGenres.jsp">Genre</a>
				<a class="list-group-item" href="listMoovieRooms.jsp">Moovie Room</a>
				<a class="list-group-item" href="listRoomTypes.jsp">Room Type</a>
				<a class="list-group-item" href="listUbication.jsp">Ubication</a>
			</div>
		</div>
    	
    	<!-- Content Column -->
		<div class="col-10 ">
        	<h2>PANEL ADMINISTRADOR</h2>
        	<p>Desde aquí podrá gestionar los datos</p>
        	<h4>Restricciones</h4>

            <div class="col-12 col-sm-12 col-lg-12">
            	<div class="table-responsive">
					<table class="table table-hover table-borderless ">
                    	<thead>
                    		<tr>
                    			<th>ID</th>
                    		    <th>Descripcion</th>
                        		<th> <a class="btn btn-success" href="./newRestriction.jsp">Nueva Restriccion</a> </th>
                        		<th></th>
                      		</tr>
                      	</thead>
                    	<tbody>
                    		<% for (Restriction r : restrictions) { %>
                    			<tr>
                    				<td><%=r.getIdRestriction()%></td>
                    				<td><%=r.getDescription()%></td>
                    				
                    				<td>
                    					<!-- Button trigger modal -->
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCentered">
										  Editar
										</button><!-- editar -->
										<!-- Modal -->
										<div class="modal" id="exampleModalCentered" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenteredLabel" aria-hidden="true">
										  <div class="modal-dialog modal-dialog-centered" role="document">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="exampleModalCenteredLabel">Modal title</h5>
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										          <span aria-hidden="true">&times;</span>
										        </button>
										      </div>
										      <div class="modal-body">
										        ...
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										        <button type="button" class="btn btn-primary">Save changes</button>
										      </div>
										    </div>
										  </div>
										</div>
                    					<a href="deleteRestriction?idRestriction=<%=r.getIdRestriction()%>" class="btn btn-danger">Eliminar</a><!-- borrar -->
                    				</td>
                    			</tr>
                    		<% } %>
                    		</tbody>	
                   		</table>
                   	</div>
           		</div>	
            	<a href="../adminPanel.jsp" class="btn">Volver al menu</a>
       		</div>
		</div>
	</div>
	
	
	
	
	
	
</body>
</html>