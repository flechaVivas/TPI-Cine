package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import entities.Movie;
import logic.MovieController;
import entities.Genre;
import entities.Restriction;
import logic.GenreController;
import logic.RestrictionController;

@MultipartConfig
@WebServlet({ "/src/servlet/abmcMovie", "/src/servlet/abmcMOVIE", "/src/servlet/ABMCMovie", "/src/servlet/ABMCmovie" })
public class abmcMovie extends HttpServlet {
	private String pathFiles="D:\\Facultad\\Java\\Programas\\TPI-Cine\\WebContent\\assets\\img";
	private File uploads = new File(pathFiles);
	private String[] extens = {".png",".jpg",".jpeg"};		//Variables para manejo de imagen
	private static final long serialVersionUID = 1L;
       
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
		System.out.println("Bienvenido a servlet");
		//try {
			switch((String)request.getParameter("action")) {
				case "new":
					
					try {
						
						m.setTitle((String)request.getParameter("title"));
						validarImagen(request,response,m);
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
						System.out.println("Titulo: "+m.getTitle());
						System.out.println("Ruta de imagen: "+m.getImage());
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
		
			request.getRequestDispatcher("/views/pages/abmcMovie.jsp").forward(request, response);	

	}
	
	private void validarImagen(HttpServletRequest request, HttpServletResponse response, Movie m) throws IOException{
	try {
		String photo="";
		Part part=request.getPart("image");
		if (part!=null) {
		if(isExtension(part.getSubmittedFileName(), extens)) {
			photo=saveFile(part,uploads);}//Asignamos la ruta absoluta a la variable photo	
			}
		m.setImage(photo);
		} catch (Exception e) {
		e.printStackTrace();
		}		
	}
	
	
	private String saveFile(Part part, File pathUploads) {
		String pathAbsolute="";
		try {
			Path path=Paths.get(part.getSubmittedFileName());
			String fileName=path.getFileName().toString();		//nombre de archivo
			InputStream input=part.getInputStream();			//archivo
			
			if(input!=null) {
				File file=new File(pathUploads, fileName);
				pathAbsolute=file.getAbsolutePath();
				Files.copy(input, file.toPath());		//Se guarda el archivo en la carpeta de archivos
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pathAbsolute;		//Retorna la ruta Absoluta
	}
	
	
	private boolean isExtension(String fileName,String[] extensions) {	//Validacion formato de archivo
		for (String et : extensions) {
			if(fileName.toLowerCase().endsWith(et)) {return true;}
		}return false;
	}

}


