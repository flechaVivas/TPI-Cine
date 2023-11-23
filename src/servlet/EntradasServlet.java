package servlet;

import java.io.IOException;
import java.math.BigDecimal;
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
import entities.Ubication;
import logic.MovieController;
import logic.MovieRoomController;
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
	
		Show s = new Show();
		Movie m = new Movie();
		RoomType rt = new RoomType();
		MovieController ctrlMovie = new MovieController();
		ShowController ctrlShow = new ShowController();
		RoomTypeController ctrlRT = new RoomTypeController();
		MovieRoomController ctrlMovieRoom = new MovieRoomController();
			
			
		switch ((String)request.getParameter("step")) {
		case "pelicula":
			
			try {
				
				if (request.getParameter("movie") != null) {
					
					m.setIdMovie((Integer.parseInt((String)request.getParameter("movie"))));
					
					m = ctrlMovie.getbyIdMovie(m);
					
					s.setMovie(m);
					
					request.getSession(false).setAttribute("show", s);
					
					response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=selecSala");
					
				}
				
				break;
				
			} catch (Exception e) {
				request.setAttribute("error", e.getMessage());
				request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
			}
			
			
		case "tipoDeSala":
			
			try {
				
				s = (Show) request.getSession(false).getAttribute("show");
				
				if(request.getParameter("tipo") != null && s != null){
					
					rt.setIdRoomType(Integer.parseInt((String)request.getParameter("tipo")));
					m = s.getMovie();
					
					LinkedList<Show> shows = ctrlShow.getDateTimeByRoomTypeMovie(m,rt);
					
					rt = ctrlRT.getOne(rt);
					
					request.getSession().setAttribute("cantidad", Integer.parseInt(request.getParameter("cantidad")));
					BigDecimal total = new BigDecimal(Integer.parseInt(request.getParameter("cantidad")));
					request.getSession().setAttribute("total", total);
					request.getSession().setAttribute("tipoSala", rt);
					request.getSession().setAttribute("showsDateTime", shows);
					response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=selecHora");
				}
				
				break;
				
			} catch (Exception e) {
				request.setAttribute("error", e.getMessage());
				request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
			}
			
			
			
			
		case "diaHora":
			
			try {
				String date_time = (String) request.getParameter("date_time");
				
				s = (Show)request.getSession(false).getAttribute("show");
				s.setDt(LocalDateTime.parse(date_time));
				
				Show s_traido = new Show();
				s_traido = ctrlShow.getRoomByMovieDateTime(s);
				
				s_traido.setMovieroom(ctrlMovieRoom.getOne(s_traido.getMovieroom()));
				
				s_traido.getMovieroom().setRt((RoomType)request.getSession().getAttribute("tipoSala"));
				
				s.setMovieroom(s_traido.getMovieroom());
				
				request.getSession(false).removeAttribute("show");
				request.getSession(false).setAttribute("show", s);
				
				LinkedList<Ubication> ubicElegidas = new LinkedList<Ubication>();
				request.getSession(false).setAttribute("ubicElegidas", ubicElegidas);
				
				response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=selecAsiento");
				
				break;
				
			} catch (Exception e) {
				request.setAttribute("error", e.getMessage());
				request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
			}
			
		case "asiento":
			
			try {
				LinkedList<Ubication> ubicElegidas = (LinkedList<Ubication>)request.getSession(false).getAttribute("ubicElegidas");
				
				request.getSession(false).setAttribute
				("cantidad", (Integer)request.getSession(false).getAttribute("cantidad") - 1);
				
				if((Integer)request.getSession(false).getAttribute("cantidad") >= 0) {
					
					Ubication u_elegida = new Ubication();
					
					int fila = Integer.parseInt( (String)request.getParameter("fila"));
					int colu = Integer.parseInt( (String)request.getParameter("col"));
					
					u_elegida.setRow(fila);
					u_elegida.setCol(colu);
					
					ubicElegidas.add(u_elegida);
					
					request.getSession(false).setAttribute("ubicElegidas", ubicElegidas);
					
					if ((Integer)request.getSession(false).getAttribute("cantidad") != 0) {
						response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=selecAsiento");
						
					} else {
						
						request.getSession(false).setAttribute("ubicElegidas", ubicElegidas);
						response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=confirmar");
					}
					
				}
				
				break;
			} catch (Exception e) {
				request.setAttribute("error", e.getMessage());
				request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
			}
			
		
		default:
			break;
		}
			
			
		
	}

}
