package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Movie;
import entities.RoomType;
import entities.Show;
import logic.ShowController;

/**
 * Servlet implementation class SeleccionarSala
 */
@WebServlet({"/src/servlet/SeleccionarSala", "/src/servlet/seleccionarSala"})
public class SeleccionarSala extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeleccionarSala() {
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
			
			ShowController ctrlShow = new ShowController();
			Show s = (Show) request.getAttribute("show");
			
			response.getWriter().append((CharSequence)s.getMovieroom());
			
			if(request.getParameter("tipo") != null){

				RoomType rt = new RoomType();
				rt.setIdRoomType(Integer.parseInt((String)request.getParameter("tipo")));
				Movie m = s.getMovie();
				
				LinkedList<Show> shows = ctrlShow.getDateTimeByRoomTypeMovie(m,rt);
				
				request.setAttribute("showsDateTime", shows);
				request.getRequestDispatcher("/views/pages/entradas.jsp").forward(request, response);
				
			}
			
			
		} catch (Exception e) {
			System.out.println(e.getCause()+"\n"+e.getMessage());
		}
		
		
		
		
		
		
		
	}

}
