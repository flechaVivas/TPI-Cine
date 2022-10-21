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
 * Servlet implementation class NewRestriction
 */
@WebServlet("/src/servlet/NewRestriction")
public class NewRestriction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewRestriction() {
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
			
			r.setDescription((String)request.getParameter("description"));
			ctrlRes.addOne(r);
			
			request.getRequestDispatcher("/views/pages/ui-restriction/listRestrictions.jsp").forward(request, response);
			
		} catch (Exception e) {
			
		}
		
		
	}

}
