package servlet;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Movie;
import entities.MovieRoom;
import entities.Show;
import logic.ShowController;

/**
 * Servlet implementation class ABMCShow
 */
@WebServlet({ "/src/servlet/ABMCShow", "/src/servlet/abmcShow", "/src/servlet/abmcshow", "/src/servlet/ABMCshow" })
public class abmcShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public abmcShow() {
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
		Movie m= new Movie();
		Show s=new Show();
		MovieRoom mr= new MovieRoom();
		ShowController ctrlShow=new ShowController();
			switch((String)request.getParameter("action")) {
				case "new":
					
					try {
						m.setIdMovie(Integer.parseInt((String)request.getParameter("movie")));
						s.setMovie(m);
						mr.setRoomNumber(Integer.parseInt((String)request.getParameter("room")));
						s.setMovieroom(mr);
						s.setDt(LocalDateTime.parse((String)request.getParameter("dt")));
						ctrlShow.addOne(s);
						
						request.getRequestDispatcher("/views/pages/abmcShow.jsp").forward(request, response);
						
						break;
					} catch (Exception e) {
						request.setAttribute("error", e.getMessage());
						request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
					}
					
				case "admin_new":
					
					try {
						m.setIdMovie(Integer.parseInt((String)request.getParameter("movie")));
						s.setMovie(m);
						mr.setRoomNumber(Integer.parseInt((String)request.getParameter("room")));
						s.setMovieroom(mr);
						s.setDt(LocalDateTime.parse((String)request.getParameter("dt")));
						ctrlShow.addOne(s);
						
						request.getRequestDispatcher("/views/pages/ui-show/listShows.jsp").forward(request, response);

						break;
					} catch (Exception e) {
						request.setAttribute("error", e.getMessage());
						request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
					}
					
					
				case "delete":
					
					try {
						m.setIdMovie(Integer.parseInt((String)request.getParameter("movie")));
						s.setMovie(m);
						mr.setRoomNumber(Integer.parseInt((String)request.getParameter("room")));
						s.setMovieroom(mr);
						s.setDt(LocalDateTime.parse((String)request.getParameter("dt")));
						ctrlShow.deleteOne(s);
						
						request.getRequestDispatcher("/views/pages/abmcShow.jsp").forward(request, response);
						
					} catch (Exception e) {
						request.setAttribute("error", e.getMessage());
						request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
					}
					
				break;
				case "update":
					try {
						Show sw=new Show();
						Movie mo=new Movie();
						MovieRoom mrm=new MovieRoom();
						mo.setIdMovie(Integer.parseInt((String)request.getParameter("exMovie")));
						sw.setMovie(mo);
						mrm.setRoomNumber(Integer.parseInt((String)request.getParameter("exRoom")));
						sw.setMovieroom(mrm);
						sw.setDt(LocalDateTime.parse((String)request.getParameter("exdt")));
						m.setIdMovie(Integer.parseInt((String)request.getParameter("movie")));
						s.setMovie(m);
						mr.setRoomNumber(Integer.parseInt((String)request.getParameter("room")));
						s.setMovieroom(mr);
						s.setDt(LocalDateTime.parse((String)request.getParameter("dt")));
						ctrlShow.editOne(s,sw);
						
						request.getRequestDispatcher("/views/pages/abmcShow.jsp").forward(request, response);
						
					} catch (Exception e) {
						request.setAttribute("error", e.getMessage());
						request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
					}
					
				case "admin_update":
					try {
						Show sw=new Show();
						Movie mo=new Movie();
						MovieRoom mrm=new MovieRoom();
						mo.setIdMovie(Integer.parseInt((String)request.getParameter("exMovie")));
						sw.setMovie(mo);
						mrm.setRoomNumber(Integer.parseInt((String)request.getParameter("exRoom")));
						sw.setMovieroom(mrm);
						sw.setDt(LocalDateTime.parse((String)request.getParameter("exdt")));
						m.setIdMovie(Integer.parseInt((String)request.getParameter("movie")));
						s.setMovie(m);
						mr.setRoomNumber(Integer.parseInt((String)request.getParameter("room")));
						s.setMovieroom(mr);
						s.setDt(LocalDateTime.parse((String)request.getParameter("dt")));
						ctrlShow.editOne(s,sw);
						
						request.getRequestDispatcher("/views/pages/ui-show/listShows.jsp").forward(request, response);
						
					} catch (Exception e) {
						request.setAttribute("error", e.getMessage());
						request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
					}
					
			default:
				break;
			}
			
		
	}

}




