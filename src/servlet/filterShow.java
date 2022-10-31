package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Movie;
import entities.Show;
import logic.MovieController;
import logic.ShowController;

/**
 * Servlet implementation class filterShow
 */
@WebServlet({ "/src/servlet/filterShow", "/src/servlet/FilterShow", "/src/servlet/filtershow", "/src/servlet/Filtershow" })
public class filterShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public filterShow() {
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
		Show s= new Show();
		MovieController ctrlMovie= new MovieController();
		ShowController ctrlShow = new ShowController();
		Movie m= new Movie();
		m.setTitle((String)request.getParameter("title"));
		m=ctrlMovie.getbyTitle(m);
		s.setMovie(m);
		s.setDt(LocalDateTime.parse((String)request.getParameter("dt")));  	
       	
			if((String)request.getParameter("title")!="") {
				if((String)request.getParameter("dt")!="") {
						LinkedList<Show>sw=ctrlShow.getByTityFech(s);
				}else{
						//titulo
				}
				
			}else{
				if((String)request.getParameter("dt")!=""){
						//fecha
				}else{
						LinkedList<Show> shows=ctrlShow.getAll();
						request.getSession(false).setAttribute("shows",shows);
				}
			}
				
		response.sendRedirect("/TPI-Cine/views/pages/abmcShowFiltrado.jsp");		
	}
}



