import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/multi")
public class MultiArgs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MultiArgs() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String marry = request.getParameter("marry");
		String[] hobby = request.getParameterValues("hobby");
		// 사용자가 입력한 컨트롤의 값을 배열로 받을 수 있음
		// 단, 컨트롤들의 종류에 상관없이 이름이 동일해야 배열로 받을 수 있음
		String str = "no";
		if (marry.equals("y")) {
			str = "yes";
		}
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("이름 : "+name + " /");
		out.println("결혼여부 : " + str + " /");
		out.println("취미 : ");
		for (int i = 0 ; i < hobby.length ; i++) {
			if (i == hobby.length - 1) {
				out.println(hobby[i]);
			} else {
				out.println(hobby[i] + ",");
			}
		}
		out.println("입니다.");
	}
}
