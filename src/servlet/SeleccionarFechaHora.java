package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.RoomType;
import entities.Show;
import entities.Ticket;
import entities.User;
import logic.ShowController;
import logic.TicketController;

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

		ShowController ctrlShow = new ShowController();
		
		String date_time = (String) request.getParameter("date_time");
		
		
		
		Show s = (Show)request.getSession(false).getAttribute("show");
		s.setDt(LocalDateTime.parse(date_time));
		
		s = ctrlShow.getRoomByMovieDateTime(s);
		
		System.out.println(s.getMovie().getTitle()+" "+s.getMovieroom().getRoomNumber()+" "+s.getDt());
		
		Ticket t = new Ticket();
		TicketController ctrlTicket = new TicketController();
		RoomType rt = (RoomType)request.getSession(false).getAttribute("rt");
		User u = (User)request.getSession(false).getAttribute("usuario");
		
//		t.setOperationCode(ctrlTicket.getLastTicket().getOperationCode()+1);
		t.setDateTime(LocalDateTime.now());
		BigDecimal cant = new BigDecimal((String)request.getSession(false).getAttribute("price"));
		t.setPrice(rt.getPrice().multiply(cant));
		t.setUser(u);
		
		
		request.getSession(false).setAttribute("show", s);
		
		response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=selecAsiento");
		
	}

}
