<%@page import="entities.Movie"%>
<%@page import="entities.Show"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.RoomTypeController"%>
<%@page import="entities.RoomType"%>

	<%
		Show s = (Show)session.getAttribute("show");
	
		Movie m = s.getMovie();
		RoomTypeController ctrlRoomType = new RoomTypeController();
		LinkedList<RoomType> types = ctrlRoomType.getAvailables(m);
	
	%>

<form action="/TPI-Cine/src/servlet/EntradasServlet?step=tipoDeSala" method="post">
	<div class="row mt-5">
			<% if(types.isEmpty()) {
				session.removeAttribute("show");
			%>
				
				<div class="col-md-10">
					<h3>No hay salas disponibles!</h3>
					<div class="col-md-2">
						<a href="/TPI-Cine/views/pages/entradas.jsp"> Volver</a>
					</div>
				</div>
				
			<%} else { %>
				<div class="col-md-10">
					<label name="tipo">Seleccione el <strong>tipo</strong> de<strong> sala</strong></label>    
					<select name="tipo" id="tipo">	
					<% for (RoomType rt : types){ %>
						<option value="<%=rt.getIdRoomType()%>"><%=rt.getDescription() +" "+rt.getPrice()%></option>
					<%}%>
					</select>
					<br><br>
					<label> Seleccione <strong> cantidad de entradas  </strong></label>
					<input type="number" name="cantidad" value="1"  min="1" max="10">
					
				</div>
				
				<% if( ((String)request.getParameter("step")).equals("selecSala")) {%>
				
					<div class="col-md-2">
						<button class="btn btn-primary btn-block" type="submit">Aceptar</button>
					</div>
				
				<% }%>
				
			<% }%>
		</div>
</form>