package action;

import javax.servlet.http.*;
import vo.ActionForward;

public class FreePwdAction implements Action {
// ��ȸ�� �� �����̳� ������ ��й�ȣ�� �޴� ������ �̵���Ű�� Ŭ����
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// �Խñ� ��ȣ �Է� ������ �̵��ϴ� ��ü ���� �� �����ϴ� �޼ҵ�
		ActionForward forward = new ActionForward();
		forward.setPath("/bbs/free_pwd.jsp");
		// ��ȣ �Է� ������ �̵��ϱ⸸ �ϸ� �ǹǷ� ~Svc Ŭ������ ȣ���� �ʿ䰡 ����
		return forward;
	}
}
