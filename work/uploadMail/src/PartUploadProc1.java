import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class PartUploadProc1
 */
@WebServlet("/partUploadProc1")
@MultipartConfig(fileSizeThreshold = 0,location="D:/jsp/work/uploadMail/WebContent/upload")
public class PartUploadProc1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PartUploadProc1() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		Part part = request.getPart("file1");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String contentDisposition = part.getHeader("content-disposition");
		String uploadFileName = getUploadFileName(contentDisposition);
		
		part.write(uploadFileName);
		out.println("이름: " + name + "<br />업로드 : " + uploadFileName);
	}
	
	private String getUploadFileName(String contentDisposition) {
		String uploadFileName = null;
		String[] contentSplitStr = contentDisposition.split(";");
		int lastPathSeparatorIndex = contentSplitStr[2].indexOf("\"");
		int lastQutosIndex = contentSplitStr[2].lastIndexOf("\"");
		uploadFileName = contentSplitStr[2].substring(lastPathSeparatorIndex + 1, lastQutosIndex);
	
		return uploadFileName;
	}
}
