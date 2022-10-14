<%@page import="java.util.LinkedList"%>
<%@page import="logic.MovieController"%>
<%@page import="entities.Movie"%>

	<%

	MovieController ctrlMovie = new MovieController();
	LinkedList<Movie> movies = ctrlMovie.getAll();
	
	%>


<form action="/TPI-Cine/src/servlet/SeleccionarPelicula" method="post">
	<div class="row mt-5">
		<div class="col-md-10">
			<label name="movie">Seleccione una <strong>película</strong></label>    
			<select name="movie" id="movie">
			
				<% for (Movie m : movies){ %>
				<option value="<%=m.getIdMovie()%> "><%=m.getTitle()%></option>
				<%} %>
				
	  		</select>
		</div>
		<div class="col-md-2">
			<button class="btn btn-lg btn-primary btn-block" type="submit">Aceptar</button>
		</div>
	</div>
</form>