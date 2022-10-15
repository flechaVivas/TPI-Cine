<%@page import="entities.Movie"%>
<%@page import="entities.Show"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.RoomTypeController"%>
<%@page import="entities.RoomType"%>

	<%
	
		Show s = (Show)request.getAttribute("show");
	
	%>





<form action="/TPI-Cine/src/servlet/seleccionTipo" method="post">
	<div class="row mt-5">
		<div class="col-md-10">
			<label name="tipo">Seleccione el <strong>tipo</strong> de<strong> sala</strong></label>    
			
			<% if(s != null ) { 
				Movie m = s.getMovie();
				RoomTypeController ctrlRoomType = new RoomTypeController();
				LinkedList<RoomType> types = ctrlRoomType.getAvailables(m);
			%>
				<select name="tipo" id="tipo">	
				<% for (RoomType rt : types){ %>
					<option value="<%=rt.getIdRoomType()%>"><%=rt.getDescription()%></option>
				<%}%>
				</select>
				
		<% }else{%>
			<h3>No hay disponibles!</h3>
		<%}%>
				
				
	  		
		</div>
		<div class="col-md-2">
			<button class="btn btn-lg btn-primary btn-block" type="submit">Aceptar</button>
		</div>
	</div>
</form>