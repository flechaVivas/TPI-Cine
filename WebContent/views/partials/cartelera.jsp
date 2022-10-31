<%@page import="entities.User"%>
<%@page import="entities.Restriction"%>
<%@page import="entities.Genre"%>
<%@page import="logic.RestrictionController"%>
<%@page import="logic.GenreController"%>
<%@page import="entities.Movie"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.MovieController"%>

<%
	MovieController ctrlMovie = new MovieController();
	LinkedList<Movie> movies = ctrlMovie.getBillboard();
	
	User u = (User)session.getAttribute("usuario");

%>

    <main class="mt-8">
        <section class="content-section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h1>PELICULAS</h1>
                            <h4>en CARTELERA</h4>
                        </div>
                    </div>
               	</div>
				<div class="row row-cols-1 row-cols-md-2 g-4">
						<% for (Movie m : movies){ %>
							<% 
							GenreController ctrlGenre = new GenreController(); 
							RestrictionController ctrlRest = new RestrictionController();
							
							Genre g = new Genre();
							g.setIdGenre(m.getGenre().getIdGenre());
							m.setGenre(ctrlGenre.getOne(g));
							
							Restriction r = new Restriction();
							r.setIdRestriction(m.getRestriction().getIdRestriction());
							m.setRestriction(ctrlRest.getOne(r)); 
							%>
							<div class="card text-center m-4" style="width:25rem; background-color: #fff; color: #2a2b38; border-radius: 5%">
								<a class="card-img-top" href="/TPI-Cine/views/pages/movieDescription.jsp?idMovie=<%=m.getIdMovie()%>">
									<img style="border-radius: 7%" src="<%=m.getImage()%>" alt="<%=m.getTitle()%>">
								</a>
								<div class="card-body">
									<h3 class="card-title"><%=m.getTitle()%></h3>
									<h5 class="card-text"><%=m.getGenre().getDescription()%></h5>
									<h5 class="card-text"><%=m.getRestriction().getDescription()%></h5>
								</div>
								
							</div>
						<%} %>

					
				</div>
            </div>
        </section>
    </main>

