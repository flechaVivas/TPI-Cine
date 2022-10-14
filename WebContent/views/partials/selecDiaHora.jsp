<%@page import="java.util.LinkedList"%>
<%@page import="logic.ShowController"%>
<%@page import="entities.Show"%>
	
	<%

	Show s = new Show();
	ShowController ctrlShow = new ShowController();
	
// 	LinkedList<Show> shows = ctrlShow.getByMovieAndRoom();
	
	%>


<form action="/TPI-Cine/src/servlet/seleccionFechaHora" method="post">
	<div class="row mt-5">
		<div class="col-md-10">
			<label name="date_time">Seleccione <strong>fecha y hora</strong></label>    
			<select name="date_time" id="date_time">
			
<%-- 				<% for (Show s : shows){ %> --%>
<%-- 				<option value="<%=s.getDt()%>"><%=s.getDt()%></option> --%>
<%-- 				<%} %> --%>
				
	  		</select>
		</div>
		<div class="col-md-2">
			<button class="btn btn-lg btn-primary btn-block" type="submit">Aceptar</button>
		</div>
	</div>
</form>