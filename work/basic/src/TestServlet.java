import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test") // Ŭ�����̸��� ������ ��Ī���� URL���� ����
public class TestServlet extends HttpServlet {
// ������ ������ HttpServlet�� ��ӹ޾ƾ� ��
	private static final long serialVersionUID = 1L;
    
    public TestServlet() {
        super(); // ����Ŭ������ �����ڸ� ȣ��
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// throws ServletException, IOException : �� �޼ҵ� ����
	// ServletException�̳� IOException�� �߻��� ��� goGet()�޼ҵ带
	// ȣ���� ������ ����ó���� �ѱ�ڴٴ� �ǹ�
	// ������� ��û�� get������� �̷�� ���� �� �����ϴ� �޼ҵ�
		String txt = request.getParameter("txtGet");
		String gender = request.getParameter("gender");
		// ���� ���������� ���� get����� �����͵��� String���� ����
		
		response.setContentType("text/html; charset=utf-8");
		// response.setContentType() : ������� ��û�� ���� ������ ������
		// �����ϴ� �޼ҵ�� ���⼭�� html������ �����ڵ�� ������
		PrintWriter out = response.getWriter();
		// ����� �ν��Ͻ� out�� ����
		out.println("�̸�: "+txt);
		out.println("����: "+gender);
		// ����ڿ��� ������
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// ������� ��û�� post������� �̷�� ���� �� �����ϴ� �޼ҵ�
		// �̸� : XXX / SMS ���ſ��� : ������ or ���ž���
		request.setCharacterEncoding("utf-8");
		// request�ޱ� ���� ���ڵ��� ������
		String name = request.getParameter("txtPost");
		String sms = request.getParameter("isSms");
		String str = null;
		if (sms.equals("y")) {
			str = "������";
		} else {
			str = "���ž���";
		}
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("�̸� : "+name);
		out.println("SMS���ſ��� : " + str);
	}

}
