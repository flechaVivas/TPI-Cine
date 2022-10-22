<%@page import="entities.User"%>
<% 
	User u = (User)session.getAttribute("usuario");
%>

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
        	<h2>Bienvenido <strong> <%=u.getName()+" "+u.getSurname()%> </strong> al PANEL ADMINISTRADOR</h2>
        	<p>Desde aquí podrá gestionar los datos</p>
       	</div>
	
	</div>
	
</div>