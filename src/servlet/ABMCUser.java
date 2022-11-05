package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.time.DateTimeException;
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
				
				try {
					
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
					
				} catch (SQLIntegrityConstraintViolationException sqli) {
					
					System.out.println("Error integridad");
					response.sendRedirect("/TPI-Cine/views/pages/register.jsp");
					
				}
				
			
			case "register":
				
				try {

					u.setName(request.getParameter("name"));
					u.setSurname(request.getParameter("surname"));
					u.setEmail(request.getParameter("email"));
					u.setBirthDate(LocalDate.parse(request.getParameter("birthDate")));
					u.setAdress(request.getParameter("adress"));
					u.setPhoneNumber(request.getParameter("phoneNumber"));
					r.setIdRole(1);
					u.setRole(r);
					
					if (request.getParameter("password").equals(request.getParameter("repeatPassword"))) {
						
						u.setPassword(request.getParameter("password"));
						ctrlUser.add(u);
						
						request.setAttribute("action", "success");
						request.getRequestDispatcher("/views/pages/login.jsp").forward(request, response);
						
					} else {
						request.setAttribute("action", "errorPasswd");
						request.getRequestDispatcher("/views/pages/register.jsp").forward(request, response);
					}
				
					break;
				
				
				} catch (SQLIntegrityConstraintViolationException sqli) {
					
					request.setAttribute("error", "El email ya ha sido ingresado!");
					request.getRequestDispatcher("/views/pages/register.jsp").forward(request, response);
					
				} catch (DateTimeException e) {
					
					request.setAttribute("error", "La fecha ingresada es inválida");
					request.getRequestDispatcher("/views/pages/register.jsp").forward(request, response);
					
				} catch (Exception e) {
					
					request.setAttribute("error", "Ha ocurrido un error, inténtelo más tarde");
					request.getRequestDispatcher("/views/pages/register.jsp").forward(request, response);
					
				}
				
				
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
			
		} catch (Exception e) {
			
			
		}
	
	
	}

}
