package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Genre;
import logic.GenreController;

/**
 * Servlet implementation class ABMCGenre
 */
@WebServlet("/src/servlet/ABMCGenre")
public class ABMCGenre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCGenre() {
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
		
		GenreController ctrGen = new GenreController();
		Genre g = new Genre();

		
		try {
			
			switch ((String)request.getParameter("action")) {
			
			case "new":
			
				g.setDescription((String)request.getParameter("description"));
				ctrGen.addOne(g);
				
				break;
			
			case "update":
				
				g.setIdGenre(Integer.parseInt(((String)request.getParameter("idGenre"))));
				g.setDescription((String)request.getParameter("description"));
				
				ctrGen.update(g);
				
				break;
				
			case "delete":
				
				g.setIdGenre(Integer.parseInt((String)request.getParameter("idGenre")));
				
				ctrGen.deleteOne(g);
				
				break;

			default:
				break;
			}
			
			request.getRequestDispatcher("/views/pages/ui-genre/listGenres.jsp").forward(request, response);
			
		} catch (Exception e) {
			
			
			
			
		}
		
		
		
		
		
		
		
		
	}

}
