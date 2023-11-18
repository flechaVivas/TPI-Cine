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
                <div class="col-12 p-5">
                    <div class="section-title text-center">
                        <h1 style="color:white; font-size: 2.5rem; font-weight: bold;">Explora las películas en cartelera</h1>
                        <p style="color:white; font-size: 1.2rem;">¡Descubre las últimas películas que no te puedes perder!</p>
                    </div>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-md-3 g-4">
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
                    <div class="col">
                        <div class="card text-center m-3" style="background-color: #023E8A; color: #fff; border-radius: 10px; overflow: hidden;">
                            <a href="/TPI-Cine/views/pages/movieDescription.jsp?idMovie=<%=m.getIdMovie()%>">
                                <img src="<%=m.getImage()%>" alt="<%=m.getTitle()%>" style="border-radius: 10px 10px 0 0; width: 100%;">
                            </a>
                            <div class="card-body">
                                <h3 class="card-title" style="margin-bottom: 0;"><%=m.getTitle()%></h3>
                                <p class="card-text" style="margin-bottom: 0;"><strong>Género:</strong> <%=m.getGenre().getDescription()%></p>
                                <p class="card-text"><strong>Restricción:</strong> <%=m.getRestriction().getDescription()%></p>
                            </div>
                        </div>
                    </div>
                <%} %>
            </div>
        </div>
    </section>
</main>
