package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Role;
import logic.RoleController;

/**
 * Servlet implementation class ABMCRestriction
 */
@WebServlet("/src/servlet/ABMCRole")
public class ABMCRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCRole() {
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
	
		Role r = new Role();
		RoleController ctrlRole = new RoleController();
		
		try {
			
			switch ((String)request.getParameter("action")) {
			
			case "new":
			
				r.setDescription((String)request.getParameter("description"));
				ctrlRole.add(r);
				
				break;
			
			case "update":
				
				r.setIdRole(Integer.parseInt(((String)request.getParameter("idRole"))));
				r.setDescription((String)request.getParameter("description"));
				
				ctrlRole.update(r);
				
				break;
				
			case "delete":
				
				r.setIdRole(Integer.parseInt((String)request.getParameter("idRole")));
				
				ctrlRole.delete(r);
				
				break;

			default:
				break;
			}
			
			request.getRequestDispatcher("/views/pages/ui-role/listRoles.jsp").forward(request, response);
			
		} catch (Exception e) {
			
			
		}
		
		
		
		
		
		
		
		
	}

}
