package action;

import javax.servlet.http.*;
import vo.ActionForward;

// ���� ��ɿ��� ���Ǵ� ������ ������ ������ �޼ҵ�� ó���ϰ� �ϱ� ���� �������̽�
public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
