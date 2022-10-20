package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Restriction;
import logic.RestrictionController;

/**
 * Servlet implementation class ABMCRestriction
 */
@WebServlet("/src/servlet/ABMCRestriction")
public class ABMCRestriction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCRestriction() {
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
		
		response.getWriter().append((String)request.getAttribute("action"));
		
//		switch ((String)request.getAttribute("action")) {
//		case "update":
//			
//			RestrictionController ctrlRes = new RestrictionController();
//			Restriction r = new Restriction();
//			
//			Integer id = Integer.parseInt((String)request.getParameter("idRestriction"));
//			r.setIdRestriction(id);
//			r.setDescription((String)request.getParameter("description"));
//			
//			ctrlRes.update(r);
//			
//			break;
//			
//		case "":
//			
//			break;
//
//		default:
//			break;
//		}
	
//		request.getRequestDispatcher("/views/pages/ui-restriction/listRestriction");
		
		
		
	}

}
