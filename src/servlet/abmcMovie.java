package servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Movie;
import logic.MovieController;
import entities.Genre;
import entities.Restriction;
import logic.GenreController;
import logic.RestrictionController;

/**
 * Servlet implementation class abmcMovie
 */
@WebServlet({ "/src/servlet/abmcMovie", "/src/servlet/abmcMOVIE", "/src/servlet/ABMCMovie", "/src/servlet/ABMCmovie" })
public class abmcMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public abmcMovie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Movie m=new Movie();
		MovieController ctrlMovie= new MovieController();
		Restriction r= new Restriction();
		RestrictionController ctrlRest= new RestrictionController();
		Genre g=new Genre();
		GenreController ctrlGen= new GenreController();
		System.out.println("Bienvenido a servlet");
		//try {
			switch((String)request.getParameter("action")) {
				case "new":
					m.setTitle((String)request.getParameter("title"));
					m.setImage((String)request.getParameter("image"));
					m.setSynopsis(getServletInfo()); //Agregar en new y edit
					m.setReleaseDate(LocalDate.parse((String)request.getParameter("releaseDate")));
					m.setCast((String)request.getParameter("cast"));
					m.setDirector((String)request.getParameter("director"));
					m.setDuration(Integer.parseInt((String)request.getParameter("duration")));
					r.setIdRestriction(Integer.parseInt((String)request.getParameter("restriction")));
					m.setRestriction(ctrlRest.getOne(r));
					g.setIdGenre(Integer.parseInt((String)request.getParameter("genre")));
					m.setGenre(ctrlGen.getOne(g));
					ctrlMovie.addOne(m);
				break;
				
				case "delete":
					m.setIdMovie(Integer.parseInt((String)request.getParameter("idM")));
					ctrlMovie.logicDelete(m);
				break;
				case "update":
					m.setIdMovie(Integer.parseInt((String)request.getParameter("idM")));
					m.setTitle((String)request.getParameter("title"));
					m.setImage((String)request.getParameter("image"));
					m.setSynopsis(getServletInfo());//Agregar en new y edit 
					m.setReleaseDate(LocalDate.parse((String)request.getParameter("releaseDate")));
					m.setCast((String)request.getParameter("cast"));
					m.setDirector((String)request.getParameter("director"));
					m.setDuration(Integer.parseInt((String)request.getParameter("duration")));
					r.setIdRestriction(Integer.parseInt((String)request.getParameter("restriction")));
					m.setRestriction(ctrlRest.getOne(r));
					g.setIdGenre(Integer.parseInt((String)request.getParameter("genre")));
					m.setGenre(ctrlGen.getOne(g));
					ctrlMovie.editOne(m);
				break;
			default:
				break;
			}
		request.getRequestDispatcher("/views/pages/abmcMovie.jsp").forward(request, response);	
		/*}catch(Exception e){
			e.getMessage();
		}*/
	}

}


