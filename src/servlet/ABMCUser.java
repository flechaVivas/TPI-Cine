package servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Role;
import entities.User;
import logic.RoleController;
import logic.UserController;

/**
 * Servlet implementation class ABMCUser
 */
@WebServlet("/src/servlet/ABMCUser")
public class ABMCUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCUser() {
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
		
		UserController ctrlUser = new UserController();
		User u = new User();
		RoleController ctrlRole = new RoleController();
		Role r = new Role();
	
		try {
			
			switch ((String)request.getParameter("action")) {
			
			case "new":
			
				u.setName(request.getParameter("name"));
				u.setSurname(request.getParameter("surname"));
				u.setEmail(request.getParameter("email"));
				u.setBirthDate(LocalDate.parse(request.getParameter("birthDate")));
				u.setAdress(request.getParameter("adress"));
				u.setPhoneNumber(request.getParameter("phoneNumber"));
				r.setIdRole(Integer.parseInt((String)request.getParameter("rol")));
				r = ctrlRole.getOne(r);
				u.setRole(r);
				u.setPassword(request.getParameter("password"));
				ctrlUser.add(u);
				
				
				
				break;
			
			case "update":
				
				u.setIdUser(Integer.parseInt((String)request.getParameter("idUser")));
				u.setName(request.getParameter("name"));
				u.setSurname(request.getParameter("surname"));
				u.setBirthDate(LocalDate.parse(request.getParameter("birthDate")));
				u.setEmail(request.getParameter("email"));
				u.setAdress(request.getParameter("adress"));
				u.setPhoneNumber(request.getParameter("phoneNumber"));
				u.setPassword(request.getParameter("password"));
				
				ctrlUser.update(u);
				
				
				break;
				
			case "delete":
				
				u.setIdUser(Integer.parseInt((String)request.getParameter("idUser")));
				ctrlUser.delete(u);
				
				
				
				break;

			default:
				break;
			}
			
			request.getRequestDispatcher("/views/pages/ui-user/listUsers.jsp").forward(request, response);
			
		}finally {
			
		} 
//		catch (Exception e) {
//			
//			
//			
//		}
	
	
	}

}
