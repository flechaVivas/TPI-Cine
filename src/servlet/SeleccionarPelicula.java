package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Movie;
import entities.Show;
import logic.MovieController;

/**
 * Servlet implementation class SeleccionarPelicula
 */
@WebServlet({ "/src/servlet/SeleccionarPelicula", "/src/servlet/seleccionarpelicula", "/src/servlet/seleccionarPelicula" })
public class SeleccionarPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeleccionarPelicula() {
        super();
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
		
		try {
			
			Movie m = new Movie();
			MovieController ctrlMovie = new MovieController();
			Show s = new Show();
			
			if (request.getParameter("movie") != null) {
				m.setIdMovie(Integer.parseInt(request.getParameter("movie")));
				
				m = ctrlMovie.getbyIdMovie(m);
				
				s.setMovie(m);
				
				request.setAttribute("show", s);
				request.getRequestDispatcher("/TPI-Cine/views/pages/entradas.jsp").forward(request, response);
				
			}
			
			
			
			
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		
		
		
		
		
	}

}
