package controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import svc.*; // �ٸ� Ŭ������ ȣ���ϱ� ���� import��
import vo.*; // �޼ҵ��� �������� �ν��Ͻ��� �ޱ� ���� import��

@WebServlet("/login") // URL���� Ŭ������ ��� ����� ���ν�Ų ��Ī
public class LoginCtrl extends HttpServlet {
// �α��� â���� �Է��� ���̵�� ��й�ȣ�� �޾� �α��� �۾��� �����ϴ� ����
	private static final long serialVersionUID = 1L;
       
    public LoginCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// ������� ��û���� ������ �����͵��� ���ڵ� ����� �����ڵ�� ����
		
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		// ����ڰ� �Է��� ���� ����ִ� ��Ʈ��(uid,pwd)�� ���� ���� uid�� pwd�� ����
		// �α��ο� �ʿ��� ���̵�� ��й�ȣ�� ���ڿ��� �޾� ��
		
		LoginSvc loginSvc = new LoginSvc();
		// LoginSvc �� �ν��Ͻ� loginSvc�� ���� �� ����
		// �α��ο� �ʿ��� �۾��� ���� �α��� ����� �޼ҵ带 ���� �ν��Ͻ� ����
		
		MemberInfo loginMember = loginSvc.getLoginMember(uid,pwd);
		// ����ڿ��� ���� ���̵�� ��й�ȣ�� �μ��� �ϴ� loginSvc �ν��Ͻ���
		// getLoginMember() �޼ҵ带 �����ϰ� �� ����� memberInfo�� ����
		// memberInfo���� �α��ο� ������ ȸ���� �����Ͱ� ��� ����
		// ��, �α��� ���н� null���� ����
		
		if (loginMember != null) { // �α��� ������
			// JSP�� �ٸ��� ���������� ������ ����ϱ� ���� ���� ���� �ν��Ͻ��� �����ؾ� ��
			HttpSession session = request.getSession();
			session.setAttribute("loginMember",loginMember);
			// �α��� ���¸� �����ϱ� ���� ���� �Ӽ����� ����
			response.sendRedirect("index.jsp");
			// �������� index.jsp�� ������ ����
		}else { // �α��� ���н�
			response.setContentType("text/html;charset=utf-8");
			// �����ϴ� �������� Ÿ���� text�� html�� ���� - �����ڵ�
			
			PrintWriter out = response.getWriter();
			// PrintWriter �� �ν��Ͻ�out�� ����(����ڿ��� �����ϴ� ��ü)
			
			out.println("<script>");
			out.println("alert('�α��ο� �����߽��ϴ�.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}

}
