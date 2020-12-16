import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
/**
 * Servlet implementation class PartUploadProc2
 */
@WebServlet("/partUploadProc1")
@MultipartConfig(fileSizeThreshold = 0,location="D:/jsp/work/uploadMail/WebContent/upload")
public class PartUploadProc2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PartUploadProc2() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String uploadFileNameList = "";
		for (Part part : request.getParts()) {
			if (!part.getName().equals("name")) {
				String contentDisposition = part.getHeader("content-disposition");
			
				String uploadFileName = getUploadFileName(contentDisposition);
				
				part.write(uploadFileName);
				uploadFileNameList += " " + uploadFileName;
			}
		}
		out.println("업로더" + name + "님이 " + uploadFileNameList + "파일을 업로드 하였습니다.");
	}
	
	private String getUploadFileName(String contentDisposition) {
		String uploadFileName = null;
		String [] contentSplitStr = contentDisposition.split(";");
		int lastPathSeparatorIndex = contentSplitStr[2].lastIndexOf("\\");
		int lastQutosIndex = contentSplitStr[2].lastIndexOf("\"");
		uploadFileName = contentSplitStr[2].substring(lastPathSeparatorIndex + 1, lastQutosIndex);
		
		return uploadFileName;
	}

}
