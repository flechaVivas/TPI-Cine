<%@page import="entities.User"%>
<%@page import="entities.Show"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.MovieController"%>
<%@page import="entities.Movie"%>

	<%
	
	User u = (User)session.getAttribute("usuario");

	MovieController ctrlMovie = new MovieController();
	LinkedList<Movie> movies = ctrlMovie.getAll();
	
	Show s = (Show)session.getAttribute("show");
	
	%>


<form action="/TPI-Cine/src/servlet/SeleccionarPelicula" method="post">
	<div class="row mt-5">
		<div class="col-md-10">
			<label name="movie">Seleccione una <strong>película</strong></label>    
			<select name="movie" id="movie">
			
			<% 
				if(s == null){
					for (Movie m : movies){ %>
						<option value="<%=m.getIdMovie()%>"><%=m.getTitle()%></option>
					<%}
				} else {%><option value="<%=s.getMovie().getIdMovie()%>"><%=s.getMovie().getTitle()%></option> <% }%>
				
	  		</select>
		</div>
		<%if(s == null){ %>
			<div class="col-md-2">
				<button class="btn btn-primary btn-block" type="submit">Aceptar</button>
			</div>
		<%} %>
	</div>
</form>