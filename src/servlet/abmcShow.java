package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Show;
import logic.ShowController;

/**
 * Servlet implementation class ABMCShow
 */
@WebServlet({ "/ABMCShow", "/abmcShow", "/abmcshow", "/ABMCshow" })
public class abmcShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public abmcShow() {
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
		Show s=new Show();
		ShowController ctrlShow=new ShowController();
		try {
			switch((String)request.getParameter("action")) {
				case "new":
				break;
				case "delete":
					//Que viaja como parametro? deberia viajar el indice, la sala y la fecha y hora
				break;
			default:
				break;
			}
		}catch(Exception e){
			e.getMessage();}
	}

}




