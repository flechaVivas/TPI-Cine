package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Genre;
import entities.Movie;
import entities.Restriction;
import logic.MovieController;

/**
 * Servlet implementation class filterMovie
 */
@WebServlet({ "/src/servlet/filterMovie", "/src/servlet/FilterMovie", "/src/servlet/filtermovie", "/src/servlet/Filtermovie" })
public class filterMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public filterMovie() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Movie m = new Movie();
		m.setTitle((String)request.getParameter("title"));
		
		Genre g = new Genre();
       	g.setIdGenre(Integer.parseInt((String)request.getParameter("genre")));
                        	
       	Restriction r = new Restriction();
       	r.setIdRestriction(Integer.parseInt((String)request.getParameter("restriction")));
       
       	MovieController ctrlMovie = new MovieController();
       	
			if((String)request.getParameter("restriction")!="0") {
				if((String)request.getParameter("genre")!="0") {
					if((String)request.getParameter("title")!=null) {
						//genero,titulo y restriccion
					}else{
						//genero y restriccion
					}
				
				}else{
					if((String)request.getParameter("title")!=null){
						//restriccion y titulo
					}else{
						LinkedList<Movie> movies=ctrlMovie.getByRestri(r);
						request.getSession(false).setAttribute("movies",movies);
					}
				}
			}else {
				if((String)request.getParameter("genre")!="0") {
					if((String)request.getParameter("title")!=null) {
						//genero y titulo
					}else{
						LinkedList<Movie> movies = ctrlMovie.getByGenre(g);
						request.getSession(false).setAttribute("movies",movies);
					}
				
				}else{
					if((String)request.getParameter("title")!=null){
						//titulo
					}else{
						LinkedList<Movie> movies = ctrlMovie.getAll();
						request.getSession(false).setAttribute("movies",movies);
					}
				}
				
			}
	response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");	
	}
}



