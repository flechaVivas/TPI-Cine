<%@page import="java.util.LinkedList"%>
<%@page import="logic.RoomTypeController"%>
<%@page import="entities.RoomType"%>

	<%
	
		RoomTypeController ctrlRoomType = new RoomTypeController();
		//LinkedList<RoomType> types = ctrlRoomType.getAvailableTypes();
	
	%>





<form action="/TPI-Cine/src/servlet/seleccionTipo" method="post">
	<div class="row mt-5">
		<div class="col-md-10">
			<label name="tipo">Seleccione el <strong>tipo</strong> de<strong> sala</strong></label>    
			<select name="tipo" id="tipo">
			
<%-- 				<% for (RoomType rt : types){ %> --%>
<%-- 				<option value="<%=rt.getDescription()%>"><%=rt.getDescription()%></option> --%>
<%-- 				<%} %> --%>
				
	  		</select>
		</div>
		<div class="col-md-2">
			<button class="btn btn-lg btn-primary btn-block" type="submit">Aceptar</button>
		</div>
	</div>
</form>