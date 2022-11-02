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
import logic.UserController;

/**
 * Servlet implementation class Register
 */
@WebServlet("/src/servlet/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		
		request.setAttribute("action", "");
		
		try {
			UserController ctrlUser = new UserController();
			User u = new User();
			
			u.setName(request.getParameter("name"));
			u.setSurname(request.getParameter("surname"));
			u.setEmail(request.getParameter("email"));
			u.setBirthDate(LocalDate.parse(request.getParameter("birthDate")));
			u.setAdress(request.getParameter("adress"));
			u.setPhoneNumber(request.getParameter("phoneNumber"));
			Role r = new Role();
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
		} catch (Exception e) {
			
			
		}
		
		
		
		
		
		
		
		
	}

}
