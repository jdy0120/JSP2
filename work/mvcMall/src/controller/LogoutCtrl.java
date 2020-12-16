package controller;

import java.io.IOException;
// �������� ����ڿ��� ������ �� ��� java.io.PrintWriter Ŭ������ import�ؾ� ��
// ���� : �ڹٽ�ũ��Ʈ�� html ���� ����ϴ� ��
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
// Session ��ü�� ����� ��� http��Ű���� �ִ� SessionŬ������ import�ؾ� ��

/**
 * Servlet implementation class LogoutCtrl
 */
@WebServlet("/logout")
public class LogoutCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogoutCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		// ���ǿ� �ִ� ��� �Ӽ�(attribute)�� ����
		// �α���/�ƿ��� ������� ���� �Ӽ��� ���� ��� removeAttribute()�� Ư�� �Ӽ��� �����ϸ� ��
		response.sendRedirect("index.jsp");
	}
}
