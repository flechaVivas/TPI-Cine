<%@page import="entities.User"%>
<% 
	User u = (User)session.getAttribute("usuario");
%>

<div class="container mt-4" style="min-height: 65vh;">

	<!-- Body de la pagina -->
	<div class="row"> 
	<!-- Menu de la izquierda-->
		<jsp:include page="/views/partials/menuIzq.jsp"></jsp:include>
    	
    	<!-- Content Column -->
		<div class="col-10 ">
        	<h2>Bienvenido <strong> <%=u.getName()+" "+u.getSurname()%> </strong> al PANEL ADMINISTRADOR</h2>
        	<p>Desde aquí podrá gestionar los datos</p>
       	</div>
	
	</div>
	
</div>