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
		
		TicketController ctrlTicket = new TicketController();
		UbicationController ctrlUbi = new UbicationController();
		
		User u = (User) request.getSession(false).getAttribute("usuario");
		User user = new User();
		Show s = (Show) request.getSession(false).getAttribute("show");
		LinkedList<Ubication> ubicElegidas = (LinkedList<Ubication>)request.getSession(false).getAttribute("ubicElegidas");
		Ticket t = new Ticket();
		
		
		switch ((String)request.getParameter("action")) {
		
		
		case "newA":
			
			try {
				
				t.setOperationCode((String)request.getParameter("opcode"));
				t.setDateTime(LocalDateTime.parse((String)request.getParameter("datetime")));
				BigDecimal price = new BigDecimal(Integer.parseInt(request.getParameter("price")));
				t.setPrice(price);
				user.setIdUser(Integer.parseInt(request.getParameter("idUser")));
				t.setUser(user);
				if ((String)request.getParameter("canceldate") != "") {
					t.setRetirementDate(LocalDateTime.parse((String)request.getParameter("canceldate")));
				}
				
				ctrlTicket.add(t);
				
				response.sendRedirect("/TPI-Cine/views/pages/ui-ticket/listTickets.jsp");
				
				break;
				
			} catch (Exception e) {
				request.setAttribute("error", e.getMessage());
				request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
			}
		
		
		
		
		case "update":
			try {
				
				t.setIdTicket(Integer.parseInt((String)request.getParameter("idTicket")));
				t.setOperationCode((String)request.getParameter("opcode"));
				t.setDateTime(LocalDateTime.parse((String)request.getParameter("datetime")));
				BigDecimal price = new BigDecimal(Integer.parseInt(request.getParameter("price")));
				t.setPrice(price);
				user.setIdUser(Integer.parseInt(request.getParameter("idUser")));
				t.setUser(user);
				if ((String)request.getParameter("canceldate") != "") {
					t.setRetirementDate(LocalDateTime.parse((String)request.getParameter("canceldate")));
				}
				
				ctrlTicket.update(t);
				
				response.sendRedirect("/TPI-Cine/views/pages/ui-ticket/listTickets.jsp");
				
				break;
				
			} catch (Exception e) {
				request.setAttribute("error", e.getMessage());
				request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
			}
		
		case "delete":
			
			try {
				t.setIdTicket(Integer.parseInt((String)request.getParameter("idTicket")));
				ctrlTicket.delete(t);
				
				response.sendRedirect("/TPI-Cine/views/pages/ui-ticket/listTickets.jsp");

				
			} catch (Exception e) {
				request.setAttribute("error", e.getMessage());
				request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
			}
			
			
			break;
		
		
		case "new":
			
			try {
				
				LinkedList<Ticket> ticktes = new LinkedList<Ticket>();
				
				for (Ubication ubi : ubicElegidas) {
					
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
					
					ticktes.add(t);
					
				}
				
				ctrlTicket.envioEmail(ticktes,u,s,ubicElegidas);
				
				response.sendRedirect("/TPI-Cine/views/pages/entradas.jsp?step=informarExito");
				
				break;
				
			} catch (Exception e) {
				request.setAttribute("error", e.getMessage());
				request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
			}
			
			
			
		case "cancel":
			
			try {
				
				t.setIdTicket(Integer.parseInt((String)request.getParameter("idTicket")));
				ctrlTicket.cancelTicket(t);
				
				Ubication ubi = new Ubication();
				ubi.setTicket(t);
				ubi = ctrlUbi.getByTicket(ubi);
				ctrlUbi.delete(ubi);
				
				response.sendRedirect("/TPI-Cine/views/pages/MiCuenta.jsp");
				
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
