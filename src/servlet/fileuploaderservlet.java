package servlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "FileUploadServlet", urlPatterns = { "/src/servlet/fileuploadservlet" })
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class fileuploaderservlet extends HttpServlet {

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    Part filePart = request.getPart("file");
    String fileName = filePart.getSubmittedFileName();
    
    for (Part part : request.getParts()) {
      part.write("D:\\Facultad\\Java\\Programas\\TPI-Cine\\WebContent\\assets\\img\\" + fileName);
    }
    response.sendRedirect("/TPI-Cine/views/pages/uploaderPrueba.jsp");
  }
  
}
