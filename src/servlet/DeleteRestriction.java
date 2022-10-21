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
 * Servlet implementation class DeleteRestriction
 */
@WebServlet("/src/servlet/DeleteRestriction")
public class DeleteRestriction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRestriction() {
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
				
			RestrictionController ctrlRes = new RestrictionController();
			Restriction r = new Restriction();
			
			r.setIdRestriction(Integer.parseInt((String)request.getParameter("idRestriction")));
			
			ctrlRes.deleteOne(r);
			
			request.removeAttribute("action");
			
			request.getRequestDispatcher("/views/pages/ui-restriction/listRestrictions.jsp").forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	
	}

}
