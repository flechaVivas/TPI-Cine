package servlet;

import java.util.Base64;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import java.io.InputStream;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.*;

import entities.Movie;
import logic.MovieController;
import entities.Genre;
import entities.Restriction;
import logic.GenreController;
import logic.RestrictionController;

@MultipartConfig
@WebServlet({ "/src/servlet/abmcMovie", "/src/servlet/abmcMOVIE", "/src/servlet/ABMCMovie", "/src/servlet/ABMCmovie" })
public class abmcMovie extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static final String IMGUR_CLIENT_ID = "483f3e733f20833";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public abmcMovie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Movie m=new Movie();
		MovieController ctrlMovie= new MovieController();
		Restriction r= new Restriction();
		RestrictionController ctrlRest= new RestrictionController();
		Genre g=new Genre();
		GenreController ctrlGen= new GenreController();

		switch((String)request.getParameter("action")) {
			case "new":
				
				try {
					
					m.setTitle((String)request.getParameter("title"));
					
					String imageBase64 = obtenerImagenBase64(request.getPart("image"));
					String imageUrl = subirImagenAImgur(imageBase64);
					m.setImage(imageUrl);
					
					m.setSynopsis((String)request.getParameter("synopsis"));
					m.setReleaseDate(LocalDate.parse((String)request.getParameter("releaseDate")));
					m.setCast((String)request.getParameter("cast"));
					m.setDirector((String)request.getParameter("director"));
					m.setDuration(Integer.parseInt((String)request.getParameter("duration")));
					r.setIdRestriction(Integer.parseInt((String)request.getParameter("restriction")));
					m.setRestriction(ctrlRest.getOne(r));
					g.setIdGenre(Integer.parseInt((String)request.getParameter("genre")));
					m.setGenre(ctrlGen.getOne(g));
					ctrlMovie.addOne(m);
					break;
					
				} catch (Exception e) {
					
					request.setAttribute("error", e.getMessage());
					request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
					
				}
			
			case "delete":
				
				try {
					m.setIdMovie(Integer.parseInt((String)request.getParameter("idM")));
					ctrlMovie.logicDelete(m);
				} catch (Exception e) {
					request.setAttribute("error", e.getMessage());
					request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
				}
				
				
			break;
			case "update":
				
				try {
					m.setIdMovie(Integer.parseInt((String)request.getParameter("idM")));
					m.setTitle((String)request.getParameter("title"));					
					m.setImage((String)request.getParameter("image"));
					m.setSynopsis((String)request.getParameter("synopsis")); 
					m.setReleaseDate(LocalDate.parse((String)request.getParameter("releaseDate")));
					m.setCast((String)request.getParameter("cast"));
					m.setDirector((String)request.getParameter("director"));
					m.setDuration(Integer.parseInt((String)request.getParameter("duration")));
					r.setIdRestriction(Integer.parseInt((String)request.getParameter("restriction")));
					m.setRestriction(ctrlRest.getOne(r));
					g.setIdGenre(Integer.parseInt((String)request.getParameter("genre")));
					m.setGenre(ctrlGen.getOne(g));
					ctrlMovie.editOne(m);
					break;
					
				} catch (Exception e) {
					request.setAttribute("error", e.getMessage());
					request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
				}
				
			case "undelete":
				
				try {
					m.setIdMovie(Integer.parseInt((String)request.getParameter("idM")));
					ctrlMovie.logicUndelete(m);
					break;
					
				} catch (Exception e) {
					request.setAttribute("error", e.getMessage());
					request.getRequestDispatcher("/views/pages/error.jsp").forward(request, response);
				}
				
		default:
			break;
		}
		
			response.sendRedirect("/TPI-Cine/views/pages/abmcMovie.jsp");
		
	}
	
	
    private String obtenerImagenBase64(Part imagenPart) throws IOException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        try (InputStream inputStream = imagenPart.getInputStream()) {
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
        byte[] imageBytes = outputStream.toByteArray();
        return Base64.getEncoder().encodeToString(imageBytes);
    }
    
    private String subirImagenAImgur(String imageBase64) throws IOException, JSONException {
        URL url = new URL("https://api.imgur.com/3/image");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setDoOutput(true);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Client-ID " + IMGUR_CLIENT_ID);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        String data = URLEncoder.encode("image", "UTF-8") + "=" + URLEncoder.encode(imageBase64, "UTF-8");

        OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
        wr.write(data);
        wr.flush();

        BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();

        String json = sb.toString();
        JSONObject jsonObject = new JSONObject(json);
        String imageUrl = jsonObject.getJSONObject("data").getString("link");
        return imageUrl;
    }


	
	

}


