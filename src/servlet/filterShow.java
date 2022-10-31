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
import entities.Show;
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
		ShowController ctrlShow = new ShowController();
		Movie m= new Movie();
		System.out.println((String)request.getParameter("dt"));
		m.setTitle((String)request.getParameter("title"));
		String date=(String)request.getParameter("dt")+"T00:00";
		s.setDt(LocalDateTime.parse(date));
       	LinkedList<Show>shows=new LinkedList<Show>();
       	
		if((String)request.getParameter("title")!="") {
			if((String)request.getParameter("dt")!="") {
					//Filtro por fecha y titulo
					shows=ctrlShow.getByTityFech(s,m);					
			}else{
					//Filtro por titulo
					shows=ctrlShow.getByTit(m);
			}
				
		}else{
			if((String)request.getParameter("dt")!=""){
					//Filtro por fecha
					shows=ctrlShow.getByFech(s);
			}else{
					//No filtro"
					shows=ctrlShow.getAll();
			}
		}
		System.out.println("Titulo: "+(String)request.getParameter("title"));
		System.out.println("fecha: "+(String)request.getParameter("dt"));
		request.getSession(false).setAttribute("shows",shows);
		response.sendRedirect("/TPI-Cine/views/pages/abmcShowFiltrado.jsp");		
	}
}



