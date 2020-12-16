import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test") // 클래스이름과 매핑할 별칭으로 URL에서 사용됨
public class TestServlet extends HttpServlet {
// 서블릿은 무조건 HttpServlet을 상속받아야 함
	private static final long serialVersionUID = 1L;
    
    public TestServlet() {
        super(); // 상위클래스의 생성자를 호출
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// throws ServletException, IOException : 현 메소드 사용시
	// ServletException이나 IOException이 발생할 경우 goGet()메소드를
	// 호출한 곳으로 예외처리를 넘기겠다는 의미
	// 사용자의 요청이 get방식으로 이루어 졌을 때 동작하는 메소드
		String txt = request.getParameter("txtGet");
		String gender = request.getParameter("gender");
		// 이전 페이지에서 보낸 get방식의 데이터들을 String으로 받음
		
		response.setContentType("text/html; charset=utf-8");
		// response.setContentType() : 사용자의 요청에 대한 응답의 형식을
		// 지정하는 메소드로 여기서는 html형식의 유니코드로 지정함
		PrintWriter out = response.getWriter();
		// 응답용 인스턴스 out을 생성
		out.println("이름: "+txt);
		out.println("성별: "+gender);
		// 사용자에게 응답함
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 사용자의 요청이 post방식으로 이루어 졌을 때 동작하는 메소드
		// 이름 : XXX / SMS 수신여부 : 수신함 or 수신안함
		request.setCharacterEncoding("utf-8");
		// request받기 전에 인코딩을 지정함
		String name = request.getParameter("txtPost");
		String sms = request.getParameter("isSms");
		String str = null;
		if (sms.equals("y")) {
			str = "수신함";
		} else {
			str = "수신안함";
		}
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("이름 : "+name);
		out.println("SMS수신여부 : " + str);
	}

}
