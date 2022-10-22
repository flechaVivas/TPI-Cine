package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Genre;
import entities.RoomType;
import logic.GenreController;
import logic.RoomTypeController;

/**
 * Servlet implementation class ABMCGenre
 */
@WebServlet("/src/servlet/ABMCRoomType")
public class ABMCRoomType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCRoomType() {
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
		
		RoomTypeController ctrRT = new RoomTypeController();
		RoomType r = new RoomType();

		
		try {
			
			switch ((String)request.getParameter("action")) {
			
			case "new":
			
				r.setDescription((String)request.getParameter("description"));
				r.setSizeRow(Integer.parseInt((String)request.getParameter("row")));
				r.setSizeCol(Integer.parseInt((String)request.getParameter("col")));
				
				ctrRT.addOne(r);
				
				break;
			
			case "update":
				
				r.setIdRoomType(Integer.parseInt(((String)request.getParameter("idRoomType"))));
				r.setDescription((String)request.getParameter("description"));
				r.setSizeRow(Integer.parseInt(((String)request.getParameter("row"))));
				r.setSizeCol(Integer.parseInt(((String)request.getParameter("col"))));
				
				ctrRT.update(r);
				
				break;
				
			case "delete":
				
				r.setIdRoomType(Integer.parseInt((String)request.getParameter("idRoomType")));
				
				ctrRT.deleteOne(r);
				
				break;

			default:
				break;
			}
			
			request.getRequestDispatcher("/views/pages/ui-roomType/listRoomTypes.jsp").forward(request, response);
			
		} catch (Exception e) {
			
			
		}
		
		
		
		
		
		
		
		
	}

}
