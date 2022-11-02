package servlet;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/FileUploaderServlet2")
public class FileUploaderServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String pathFiles="D:\\Facultad\\Java\\Programas\\TPI-Cine\\WebContent\\assets\\img\\";
	private File uploads = new File(pathFiles);
	private String[] extens = {".png",".jpg",".jpeg"};
	
	private void service(HttpServletRequest request, HttpServletResponse response) throws IOException{
	try {
		String photo="";
		Part part=request.getPart("image");
		if (part==null) {return;}
		if(isExtension(part.getSubmittedFileName(), extens)) {
			photo=saveFile(part,uploads);}	//Asignamos la ruta absoluta a la variable photo	
	} catch (Exception e) {
		e.printStackTrace();
	}	response.sendRedirect("");	
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
