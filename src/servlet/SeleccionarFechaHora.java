package servlet;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Show;

/**
 * Servlet implementation class SeleccionarFechaHora
 */
@WebServlet({ "/src/servlet/SeleccionarFechaHora", "/src/servlet/seleccionarFechaHora" })
public class SeleccionarFechaHora extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeleccionarFechaHora() {
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

		String date_time = (String) request.getParameter("date_time");
		
		System.out.println(date_time);
		
		Show s = (Show)request.getSession(false).getAttribute("show");
		s.setDt(LocalDateTime.parse(date_time));
		request.getSession(false).setAttribute("show", s);
		
		
		
		
		
	}

}
