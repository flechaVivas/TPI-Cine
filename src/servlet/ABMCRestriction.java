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
		// TODO Auto-generated method stub
	
		Restriction r = new Restriction();
		RestrictionController ctrlRes = new RestrictionController();
		
		try {
			
			switch ((String)request.getParameter("action")) {
			
			case "new":
			
				r.setDescription((String)request.getParameter("description"));
				ctrlRes.addOne(r);
				
				request.getRequestDispatcher("/views/pages/ui-restriction/listRestrictions.jsp").forward(request, response);
			
				break;
			
			case "update":
				
				r.setIdRestriction(Integer.parseInt(((String)request.getParameter("idRestriction"))));
				r.setDescription((String)request.getParameter("description"));
				
				ctrlRes.update(r);
				
				request.getRequestDispatcher("/views/pages/ui-restriction/listRestrictions.jsp").forward(request, response);

				
				break;
				
			case "delete":
				
				r.setIdRestriction(Integer.parseInt((String)request.getParameter("idRestriction")));
				
				ctrlRes.deleteOne(r);
				
				request.getRequestDispatcher("/views/pages/ui-restriction/listRestrictions.jsp").forward(request, response);
				
				break;

			default:
				break;
			}
			
		} catch (Exception e) {
			
			
		}
		
		
		
		
		
		
		
		
	}

}
