<%@page import="entities.User"%>
<%@page import="entities.Show"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.MovieController"%>
<%@page import="entities.Movie"%>

	<%
	
	User u = (User)session.getAttribute("usuario");
	
	if(u == null){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	}

	MovieController ctrlMovie = new MovieController();
	LinkedList<Movie> movies = ctrlMovie.getBillboard();
	
	Show s = (Show)session.getAttribute("show");
	
	%>


<form action="/TPI-Cine/src/servlet/EntradasServlet?step=pelicula" method="post">
	<div class="row mt-5">
		<div class="col-md-10">
			<label>Seleccione una <strong>película</strong></label>    
			
			
			<% 
				if(s == null){%>
					<select name="movie" id="movie">
					<% for (Movie m : movies){ %>
						
						<option value="<%=m.getIdMovie()%>"><%=m.getTitle()%></option>
						
					<%}%>
					</select>
				<%} else {%>
					<select name="movie" id="movie" disabled="disabled">
					<option value="<%=s.getMovie().getIdMovie()%>"><%=s.getMovie().getTitle()%></option> 
					</select>
				<% }%>
				
	  		
		</div>
		<%if(s == null){ %>
			<div class="col-md-2">
				<button class="btn btn-primary btn-block" type="submit">Aceptar</button>
			</div>
		<%} %>
	</div>
</form>