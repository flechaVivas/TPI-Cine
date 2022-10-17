package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.User;
import logic.UserController;

/*
 * Servlet implementation class Login
 */
@WebServlet({ "/src/servlet/login"})
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /*
     * Default constructor.
     */
    public login() {
        // TODO Auto-generated constructor stub
    }

    /*
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

    /*
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        User u=new User();
        UserController uc=new UserController();

        try {
            if(request.getParameter("email") != null && request.getParameter("password") != null) {
                u.setEmail(request.getParameter("email"));
                u.setPassword(request.getParameter("password"));

                u=uc.validate(u);
            }

            if(u==null) {
            	
            	request.setAttribute("action","error");
            	request.getRequestDispatcher("/views/pages/login.jsp").forward(request, response);
            	
            }
            else {
                response.setStatus(200);
                HttpSession session=request.getSession(true);
                session.setAttribute("usuario", u);
                request.getRequestDispatcher("/views/pages/index.jsp").forward(request, response);
            }


        }catch(Exception e) {
            e.getMessage();//Ver que carajo esto
        }

    }
}