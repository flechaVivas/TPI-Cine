<%@page import="entities.Restriction"%>
<%@page import="entities.Genre"%>
<%@page import="logic.RestrictionController"%>
<%@page import="logic.GenreController"%>
<%@page import="entities.Movie"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.MovieController"%>
<%
	MovieController ctrlMovie = new MovieController();
	LinkedList<Movie> movies = ctrlMovie.getAll();

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

					<% for (Movie m : movies){ %>

	                    <div class="col-lg-3 col-sm-6">
	                        <div class="category-thumb">
	                            <figure class="category-image">
	                            	<a href="entradas.jsp">
	                            		<img src="" alt="">
	                            	</a>
	                            </figure>
	                        </div>
	                        <div class="category-content">
	                            <h3><%=m.getTitle()%></h3>
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
	                            <small><%=m.getGenre().getDescription()%></small>
	                            <br>
	                            <small><%=m.getRestriction().getDescription()%></small>
	                        </div>
	                    </div>
                    
                    <%} %>


                </div>
            </div>
        </section>
    </main>

