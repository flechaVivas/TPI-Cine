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
       	System.out.println("Restriccion: "+r.getIdRestriction());
       	System.out.println("Genero: "+g.getIdGenre() );
       	System.out.println("Titulo: "+m.getTitle());
       /*	if((String)request.getParameter("restriction")!="0" && 
       			(String)request.getParameter("genre")!="0" && 
       			(String)request.getParameter("title")!=null) {
       		LinkedList<Movie> movies=ctrlMovie.getByGRT(g, r, m);
			request.getSession(false).setAttribute("movies",movies);
			response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");
       	}
       	if((String)request.getParameter("restriction")!="0" && 
       			(String)request.getParameter("genre")!="0" && 
       			(String)request.getParameter("title")==null) {
       		LinkedList<Movie> movies=ctrlMovie.getByGR(g, r);
			request.getSession(false).setAttribute("movies",movies);
			response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");
       	}
       	if((String)request.getParameter("restriction")!="0" && 
       			(String)request.getParameter("genre")=="0" && 
       			(String)request.getParameter("title")==null) {
       		LinkedList<Movie> movies=ctrlMovie.getByRestri(r);
			request.getSession(false).setAttribute("movies",movies);
			response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");}
       	
       	if((String)request.getParameter("restriction")=="0" && 
       			(String)request.getParameter("genre")=="0" && 
       			(String)request.getParameter("title")==null) {
       		LinkedList<Movie> movies=ctrlMovie.getAll();
			request.getSession(false).setAttribute("movies",movies);
			response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");}
       	
       	if((String)request.getParameter("restriction")!="0" && 
       			(String)request.getParameter("genre")=="0" && 
       			(String)request.getParameter("title")!=null) {
       		LinkedList<Movie> movies=ctrlMovie.getByRT(r, m);
			request.getSession(false).setAttribute("movies",movies);
			response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");}*/
       	
       	
       	
       	
       	
      	if(Integer.parseInt((String)request.getParameter("restriction"))!=0) {
				if(Integer.parseInt((String)request.getParameter("genre"))!=0) {
					if((String)request.getParameter("title")!="") {
						
								 System.out.println("Todos los filtros");
						LinkedList<Movie> movies=ctrlMovie.getByGRT(g, r, m);
						request.getSession(false).setAttribute("movies",movies);
						response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");
					}else{
						
								System.out.println("Genero y restriccion");
						LinkedList<Movie> movies=ctrlMovie.getByGR(g, r);
						request.getSession(false).setAttribute("movies", movies);
						response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");}
				}else{
					
								System.out.println("Restriccion y titulo");		
					if((String)request.getParameter("title")!=""){
						LinkedList<Movie> movies=ctrlMovie.getByRT(r, m);
						request.getSession(false).setAttribute("movies",movies);
						response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");
					}else{
								System.out.println("Restriccion");
						LinkedList<Movie> movies=ctrlMovie.getByRestri(r);
						request.getSession(false).setAttribute("movies",movies);
						response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");
					}
				}
		}else {
				if(Integer.parseInt((String)request.getParameter("genre"))!=0) {
					if((String)request.getParameter("title")!="") {
						
								System.out.println("//Genero y titulo");
						LinkedList<Movie> movies = ctrlMovie.getByGT(g, m);
						request.getSession(false).setAttribute("movies",movies);
						response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");
					}else{
								System.out.println("//Genero");
						LinkedList<Movie> movies = ctrlMovie.getByGenre(g);
						request.getSession(false).setAttribute("movies",movies);
						response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");
					}
				
				}else{
					if((String)request.getParameter("title")!=""){
								System.out.println("//titulo");
						LinkedList<Movie> movies = ctrlMovie.getbySimilTitle(m);
						request.getSession(false).setAttribute("movies",movies);
						response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");
					}else{
								System.out.println("//Sin filtro");
						LinkedList<Movie> movies = ctrlMovie.getAll();
						request.getSession(false).setAttribute("movies",movies);
						response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");
					}
				}
				
			}
	/*System.out.println((String)request.getParameter("title")+(String)request.getParameter("restriction")+(String)request.getParameter("genre"));
	response.sendRedirect("/TPI-Cine/views/pages/abmcMovieFiltrado.jsp");	*/
	
	}
}



