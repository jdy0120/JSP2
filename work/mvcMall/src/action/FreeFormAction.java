package action;

import javax.servlet.http.*; // �޾ƿ� request�� response�� ���� import
import svc.*;
import vo.*;

public class FreeFormAction implements Action{
// ���� �Խ��� �� ��� �� ���� �������� �̵��� ���� Ŭ����
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String wtype = request.getParameter("wtype");
		ActionForward forward = new ActionForward();
/*		
		if (wtype.equals("up")) { //�� �����̸�
			int idx = Integer.parseInt(request.getParameter("idx"));
			// �۹�ȣ�� ������ ����ȯ�� ��Ŵ
			FreeFormSvc freeFormSvc = new FreeFormSvc();
			FreeInfo article = freeFormSvc.getArticle(idx);
			// Ư�� �Խù��� �����͵��� FreeInfo �ν��Ͻ��� ����
			request.setAttribute("article", article);
			// �޾ƿ� �Խù� ��ü�� request��ü�� �߰�
		}*/
		forward.setPath("/bbs/free_form.jsp");
		// �̵��� URL ����
		
		return forward;
	}
}
