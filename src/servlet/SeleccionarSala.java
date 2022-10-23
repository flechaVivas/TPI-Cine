package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			Show s = (Show) request.getSession(false).getAttribute("show");
			
			if(request.getParameter("tipo") != null && s != null){

				RoomType rt = new RoomType();
				rt.setIdRoomType(Integer.parseInt((String)request.getParameter("tipo")));
				Movie m = s.getMovie();
				
				LinkedList<Show> shows = ctrlShow.getDateTimeByRoomTypeMovie(m,rt);
				
				request.getSession().setAttribute("tipoSala", rt);
				request.getSession().setAttribute("showsDateTime", shows);
				response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=selecHora");
			}
			
			
		} finally {}
//		catch (Exception e) {
//			System.out.println(e.getCause()+"\n"+e.getMessage());
//		}
		
		
		
		
		
		
		
	}

}
