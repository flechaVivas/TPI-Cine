package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Movie;
import logic.MovieController;

/**
 * Servlet implementation class abmcMovie
 */
@WebServlet({ "/abmcMovie", "/abmcMOVIE", "/ABMCMovie", "/ABMCmovie" })
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
		try {
			switch((String)request.getParameter("action")) {
				case "new":
				break;
				case "delete":
					m.setIdMovie(Integer.parseInt((String)request.getParameter("idM")));
					ctrlMovie.deleteOne(m);
				break;
				case "update":
					m.setIdMovie(Integer.parseInt((String)request.getParameter("idM")));
					ctrlMovie.editOne(m);
				break;
			default:
				break;
			}
		request.getRequestDispatcher("/views/pages/abmcMovie.jsp");	
		}catch(Exception e){
			e.getMessage();
		}
	}

}


