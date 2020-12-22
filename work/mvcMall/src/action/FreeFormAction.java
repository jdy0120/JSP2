package action;

import javax.servlet.http.*;	// �޾� �� request�� response�� ���� import
import java.io.PrintWriter;
import svc.*;
import vo.*;

public class FreeFormAction implements Action {
// ���� �Խ��� �� ��� �� ���� �������� �̵��� ���� Ŭ����
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String wtype = request.getParameter("wtype");	// ���(in) / ����(up) ����
		ActionForward forward = new ActionForward();
		// �۾��� �̵��� �� �̵��ϴ� ���(redirect or dispatch)�� ���ؼ� �����ϴ� �ν��Ͻ�

		if (wtype.equals("up")) {
		// �� �����̸�(����� ��� ���� ������ �۾��� ����)
			HttpSession session = request.getSession();
			// JSP�� �ƴϹǷ� HttpSession �ν��Ͻ��� ���� ������ ��
			MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
			// ���� �α����� ȸ���� ������ MemberInfo�� �ν��Ͻ� loginMember�� ����
			String uid = null;
			if (loginMember != null)	uid = loginMember.getMlid();
			// ���� �α����� ȸ���� ���̵� uid�� ����

			int idx = Integer.parseInt(request.getParameter("idx"));
			// �۹�ȣ�� ������ ����ȯ�� ��Ŵ
			String pwd = request.getParameter("pwd");
			String ismember = request.getParameter("ismember");
			// �Խù��� ��ȸ�� ���� ��� �޾ƿ� �����͵�

			FreeFormSvc freeFormSvc = new FreeFormSvc();
			FreeInfo article = freeFormSvc.getArticleUp(idx, ismember, uid, pwd);
			if (article != null) {
			// �޾ƿ� �Խù��� ������(������ ������ ������)
				request.setAttribute("article", article);
				// ������ �Խñ��� �����͸� request��ü�� ����
				// dispatcher�� �̵��ϹǷ� request�� ���� �������� ������� �ѱ�Ƿ� request�� �Խù��� ��� ��
			} else {
			// �޾ƿ� �Խù��� ������(������ ������ ������)
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				// ���� ���¿��� ����(response)�� ����ٴ� �ǹ̷� �Ʒ��� �ִ� �ٸ� �ڵ带 �������� �ʰڴٴ� �ǹ�
				// ��, �Ʒ��� �ڵ忡 ������ ������ close()�� �������� �ʰ� ������ �߻��� ���� ����
			}
		}

		forward.setPath("/bbs/free_form.jsp");	// �̵��� URL ����
		return forward;
	}
}
