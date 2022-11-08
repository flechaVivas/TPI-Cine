<%@page import="entities.User"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.ShowController"%>
<%@page import="entities.Show"%>
	
	<%
	
	User u = (User)session.getAttribute("usuario");
	
	if(u == null){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	}
	

	ShowController ctrlShow = new ShowController();
	LinkedList<Show> shows = (LinkedList<Show>) session.getAttribute("showsDateTime");
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
	
	%>


<form action="/TPI-Cine/src/servlet/EntradasServlet?step=diaHora" method="post">
	<div class="row mt-5">
		
		
			<%if(shows.isEmpty()){ session.removeAttribute("show"); %>
				
				<div class="col-md-10">
					<h3>No hay funciones disponibles!</h3>
					<div class="col-md-2">
						<a href="/TPI-Cine/views/pages/entradas.jsp"> Volver</a>
					</div>
				</div>
				
			<%} else {%>
				<div class="col-md-10">
					<label name="date_time">Seleccione <strong>fecha y hora</strong></label>    
					<select name="date_time" id="date_time">
					
						<% for (Show s : shows){ %>
						<option value="<%=s.getDt()%>"><%=s.getDt().format(formatter)%></option>
						<%} %>
						
			  		</select>
				</div>
				<div class="col-md-2">
					<button class="btn btn-primary btn-block" type="submit">Aceptar</button>
				</div>
			<%} %>
	</div>
</form>