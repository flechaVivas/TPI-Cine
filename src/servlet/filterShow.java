package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Movie;
import entities.Show;
import logic.ShowController;

/**
 * Servlet implementation class filterShow
 */
@WebServlet({ "/filterShow", "/FilterShow", "/filtershow", "/Filtershow" })
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
		Movie m = new Movie();
		m.setTitle((String)request.getParameter("titulo"));       
       	ShowController ctrlShow = new ShowController();
       	
			if((String)request.getParameter("title")!=null) {
				if((String)request.getParameter("dt")!=null) {
						//titulo y fecha
				}else{
						//titulo
				}
				
			}else{
				if((String)request.getParameter("dt")!=null){
						//fecha
				}else{
						LinkedList<Show> shows=ctrlShow.getAll();
						request.getSession(false).setAttribute("shows",shows);
				}
			}
				
		response.sendRedirect("/TPI-Cine/views/pages/abmcShowFiltrado.jsp");		
	}
}



