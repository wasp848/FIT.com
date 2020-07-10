package Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
 

public class FileUploadHandler extends HttpServlet {
    private final String UPLOAD_DIRECTORY = "X:/User/Documents/College/2nd Year/Sem 2/Assignments/OOAE2 Individual/FIT/web/Assets/Images";
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        //process only if its multipart content
        if(ServletFileUpload.isMultipartContent(request))
        {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
               
                for(FileItem item : multiparts)
                {
                    if(!item.isFormField())
                    {
                        String name = new File(item.getName()).getName();
                        item.write( new File(UPLOAD_DIRECTORY + "/" + name));
                        request.setAttribute("filepath","Assets/Images/" + name);
                    }
                }
               //File uploaded successfully
               request.setAttribute("message", "File Uploaded");
            } catch (Exception ex) {
               ex.getMessage();
            }
        }
        else
        {
            request.setAttribute("message", "Sorry this Servlet only handles file upload request");
        }
        request.getRequestDispatcher("/addproducts.jsp").include(request, response);
    }
}