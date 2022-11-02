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
		//try {
			switch((String)request.getParameter("action")) {
				case "new":
					m.setIdMovie(Integer.parseInt((String)request.getParameter("movie")));
					s.setMovie(m);
					mr.setRoomNumber(Integer.parseInt((String)request.getParameter("room")));
					s.setMovieroom(mr);
					s.setDt(LocalDateTime.parse((String)request.getParameter("dt")));
					ctrlShow.addOne(s);
				break;
				case "delete":
					m.setIdMovie(Integer.parseInt((String)request.getParameter("movie")));
					s.setMovie(m);
					mr.setRoomNumber(Integer.parseInt((String)request.getParameter("room")));
					s.setMovieroom(mr);
					s.setDt(LocalDateTime.parse((String)request.getParameter("dt")));
					ctrlShow.deleteOne(s);
				break;
				case "update":
					m.setIdMovie(Integer.parseInt((String)request.getParameter("movie")));
					s.setMovie(m);
					mr.setRoomNumber(Integer.parseInt((String)request.getParameter("room")));
					s.setMovieroom(mr);
					s.setDt(LocalDateTime.parse((String)request.getParameter("dt")));
					//ctrlShow.editOne(s);
					System.out.println("Movie editada: "+s.getMovie().getIdMovie());
					System.out.println("Room editada: "+s.getMovieroom().getRoomNumber());
					System.out.println("Fecha editada: "+s.getDt());
			default:
				break;
			}
		/*}catch(Exception e){
			e.getMessage();}*/
		request.getRequestDispatcher("/views/pages/abmcShow.jsp").forward(request, response);
	}

}




