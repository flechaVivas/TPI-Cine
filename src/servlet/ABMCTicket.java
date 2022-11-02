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

import entities.Show;
import entities.Ticket;
import entities.Ubication;
import entities.User;
import logic.TicketController;
import logic.UbicationController;

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
			UbicationController ctrlUbi = new UbicationController();
			
			User u = (User) request.getSession(false).getAttribute("usuario");
			Show s = (Show) request.getSession(false).getAttribute("show");
			LinkedList<Ubication> ubicElegidas = (LinkedList<Ubication>)request.getSession(false).getAttribute("ubicElegidas");
			
			Integer cant_entradas = (Integer)request.getSession().getAttribute("cantidad");
			
			switch ((String)request.getParameter("action")) {
			
			case "new":
				
				
				for (Ubication ubi : ubicElegidas) {
					
					Ticket t = new Ticket();
					
					Integer op = Integer.parseInt(ctrlTicket.getLastTicket().getOperationCode());
					op = op + 1;
					t.setOperationCode(op.toString());
					t.setDateTime(LocalDateTime.now());
					t.setPrice(s.getMovieroom().getRt().getPrice());
					t.setUser(u);
					ctrlTicket.add(t);
					
					ubi.setShow(s);
					ubi.setTicket(t);
					ctrlUbi.createUbication(ubi);
					
					System.out.println(ubi.getRow()+" "+ubi.getCol()+" "+ubi.getShow().getMovieroom()+" "+ubi.getShow().getMovie().getIdMovie()+" "+ubi.getShow().getDt()+""+ubi.getTicket().getIdTicket());
				}
				
				response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=informarExito");
				
				break;

			default:
				break;
			}
			
			
			
		}finally {} 
//		catch (Exception e) {
//			// TODO: handle exception
//		}
		
		
		
	}

}
