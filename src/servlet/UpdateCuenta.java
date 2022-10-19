package servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.User;
import logic.UserController;

/**
 * Servlet implementation class UpdateCuenta
 */
@WebServlet("/src/servlet/UpdateCuenta")
public class UpdateCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCuenta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		User usesion = (User)request.getSession(false).getAttribute("usuario");
		
		
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
			
			if (request.getParameter("password").equals(request.getParameter("repeatPassword"))) { //poner que la copntraseña no sea null
				
				u.setPassword(request.getParameter("password"));
				u.setIdUser(usesion.getIdUser());
				
				ctrlUser.update(u);
				
				response.getWriter().append(u.getName()+u.getSurname());
				
				request.getSession(false).invalidate();
				request.getRequestDispatcher("/views/pages/login.jsp").forward(request, response);
				
				
			} else {
				request.setAttribute("action", "errorPasswd");
				
				request.getRequestDispatcher("/views/pages/MiCuenta.jsp").forward(request, response);
			}
			
			
		}catch(Exception ex){
			
		}
		
	}

}
