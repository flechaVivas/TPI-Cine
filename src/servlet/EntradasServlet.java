package servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Movie;
import entities.RoomType;
import entities.Show;
import logic.MovieController;
import logic.RoomTypeController;
import logic.ShowController;

/**
 * Servlet implementation class EstradasServlet
 */
@WebServlet("/src/servlet/EntradasServlet")
public class EntradasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EntradasServlet() {
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
			
			Show s = new Show();
			Movie m = new Movie();
			RoomType rt = new RoomType();
			MovieController ctrlMovie = new MovieController();
			ShowController ctrlShow = new ShowController();
			RoomTypeController ctrlRT = new RoomTypeController();
			
			
			switch ((String)request.getParameter("step")) {
			case "pelicula":
				
				if (request.getParameter("movie") != null) {
					
					m.setIdMovie((Integer.parseInt((String)request.getParameter("movie"))));
					
					m = ctrlMovie.getbyIdMovie(m);
					
					s.setMovie(m);
					
					request.getSession(false).setAttribute("show", s);
					
					response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=selecSala");
					
				}
				
				break;
				
			case "tipoDeSala":
				
				s = (Show) request.getSession(false).getAttribute("show");
				
				if(request.getParameter("tipo") != null && s != null){
					
					rt.setIdRoomType(Integer.parseInt((String)request.getParameter("tipo")));
					m = s.getMovie();
					
					LinkedList<Show> shows = ctrlShow.getDateTimeByRoomTypeMovie(m,rt);
					
					rt = ctrlRT.getOne(rt);
					
					request.getSession().setAttribute("cantidad", request.getParameter("cantidad"));
					request.getSession().setAttribute("tipoSala", rt);
					request.getSession().setAttribute("showsDateTime", shows);
					response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=selecHora");
				}
				
				break;
				
			case "diaHora":
				
				String date_time = (String) request.getParameter("date_time");
				
				s = (Show)request.getSession(false).getAttribute("show");
				s.setDt(LocalDateTime.parse(date_time));
				
				s = ctrlShow.getRoomByMovieDateTime(s);
				
				System.out.println(s.getMovie().getTitle()+" "+s.getMovieroom().getRoomNumber()+" "+s.getDt() +" "+request.getSession(false).getAttribute("cantidad"));
				
				request.getSession(false).setAttribute("show", s);
				
				response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=selecAsiento");
				
				
				break;
			

			default:
				break;
			}
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
