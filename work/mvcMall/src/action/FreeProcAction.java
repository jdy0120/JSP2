package action;

import java.io.PrintWriter;	// ��� ���н� �ڹٽ�ũ��Ʈ ����� ���� import
import javax.servlet.*;
import javax.servlet.http.*;
import svc.*;
import vo.*;

public class FreeProcAction implements Action {
// �Խñ� ��� ó�� Ŭ����
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println("FreeProcAction");
		ActionForward forward = null;
		request.setCharacterEncoding("utf-8");
		String wtype = request.getParameter("wtype");
		FreeInfo freeInfo = new FreeInfo();
		// ����ڰ� �Է��� �����͵��� ������ �ν��Ͻ�
		if (wtype.equals("in") || wtype.equals("up")) {
		// �۵���̳� ������ ��� �Խñ� �����͵��� �޾ƿ�
			freeInfo.setFl_writer(request.getParameter("writer"));
			freeInfo.setFl_pwd(request.getParameter("pwd"));
			freeInfo.setFl_title(request.getParameter("title"));
			freeInfo.setFl_content(request.getParameter("content"));
		}

		if (wtype.equals("del") || wtype.equals("up")) {
		// �ۻ����� ������ ��� �Խñ� ��ȣ�� �޾ƿ�
			int idx = Integer.parseInt(request.getParameter("idx"));
			freeInfo.setFl_idx(idx);
		}

		FreeProcSvc freeProcSvc = new FreeProcSvc();
		boolean isSuccess = false;
		String link = null;
		HttpSession session = request.getSession();
		MemberInfo loginMember = 
			(MemberInfo)session.getAttribute("loginMember");
		if (wtype.equals("in")) {
			freeInfo.setFl_ismember("n");
			if (loginMember != null) {	// ȸ�� �۵���� ���
				freeInfo.setFl_ismember("y");
				freeInfo.setFl_writer(loginMember.getMlid());
			}
			freeInfo.setFl_ip(request.getRemoteAddr());
			isSuccess = freeProcSvc.freeInsert(freeInfo);
			link = "brd_list.free";
		} else if (wtype.equals("up")) {
			link = "brd_view.free";
		} else {
			link = "brd_list.free";
		}

		if (isSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(link);
		}

		return forward;
	}
}
