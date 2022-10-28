package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Show;
import entities.Ticket;
import entities.User;
import logic.TicketController;

/**
 * Servlet implementation class ABMCTicket
 */
@WebServlet("/src/servlet/ABMCTicket")
public class ABMCTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCTicket() {
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
			
			TicketController ctrlTicket = new TicketController();
			
			User u = (User) request.getSession(false).getAttribute("usuario");
			Show s = (Show) request.getSession(false).getAttribute("show");
			
			BigDecimal cant_entradas = (BigDecimal)request.getSession().getAttribute("total");
			
			switch ((String)request.getParameter("action")) {
			
			case "new":
				
				Ticket t = new Ticket();
//				t.setOperationCode(ctrlTicket.getLastTicket().getOperationCode());
				t.setDateTime(LocalDateTime.now());
				t.setPrice(s.getMovieroom().getRt().getPrice().multiply(cant_entradas));
				t.setUser(u);
				
//				ctrlTicket.add(t);
				
				System.out.println(t.getDateTime()+" "+t.getPrice()+ " " +t.getUser());
				
				
				break;

			default:
				break;
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
	}

}
