package action;

import java.io.PrintWriter;	// ��� ���н� �ڹٽ�ũ��Ʈ ����� ���� import
import javax.servlet.*;
import javax.servlet.http.*;
import java.net.*;
import svc.*;
import vo.*;

public class FreeProcAction implements Action {
// �Խñ� ��� ó�� Ŭ����
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		request.setCharacterEncoding("utf-8");
		String wtype = request.getParameter("wtype");
		FreeInfo freeInfo = new FreeInfo();
		// ����ڰ� �Է��� ������(�Խñ�)���� ������ �ν��Ͻ�

		freeInfo.setFl_ismember(request.getParameter("ismember"));
		if (wtype.equals("in") || wtype.equals("up")) {
		// �۵���̳� ������ ��� �Խñ� �����͵��� �޾ƿ�
			freeInfo.setFl_writer(request.getParameter("writer"));
			freeInfo.setFl_pwd(request.getParameter("pwd"));
			freeInfo.setFl_title(request.getParameter("title"));
			freeInfo.setFl_content(request.getParameter("content"));
			// �޾� �� �����͵��� �ϳ��� �Խù��� �����ϴ� freeInfo �ν��Ͻ��� setter�� �̿��Ͽ� ����
		}

		if (wtype.equals("del") || wtype.equals("up")) {
		// �ۻ����� ������ ��� �Խñ� ��ȣ�� �޾ƿ�
			int idx = Integer.parseInt(request.getParameter("idx"));
			freeInfo.setFl_idx(idx);
		}

		FreeProcSvc freeProcSvc = new FreeProcSvc();
		// ����Ͻ� ������ ó���� ���� Ŭ������ �ν��Ͻ� ����
		boolean isSuccess = false;	// ����(���, ����, ����) �������θ� ������ ����
		String link = null;			// �۾�(���, ����, ����) �� �̵��� URL�� ������ ����
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
		// ��Ͻ� �ۼ���, ����/���� �� ���� üũ������ �α��� ������ ����

		if (wtype.equals("in")) {
			freeInfo.setFl_ismember("n");	// �ϴ� ��ȸ�� �۷� ����
			if (loginMember != null) {	// ȸ�� �۵���� ���
				freeInfo.setFl_ismember("y");	// �α��� �� ��� ȸ���۷� ����
				freeInfo.setFl_writer(loginMember.getMlid());	// �α����� ���̵� �ۼ��ڷ� ����
			}
			freeInfo.setFl_ip(request.getRemoteAddr());	// ����� IP�ּ� ����
			isSuccess = freeProcSvc.freeInsert(freeInfo);
			link = "brd_list.free";

		} else if (wtype.equals("up")) {
			isSuccess = freeProcSvc.freeUpdate(freeInfo);
			int cpage = Integer.parseInt(request.getParameter("cpage"));
			String args = "?cpage=" + cpage;
			String schtype = request.getParameter("schtype");
			String keyword = request.getParameter("keyword");
			if (keyword != null && !keyword.equals("")) {
				args += "&schtype=" + schtype + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
			}
			link = "brd_view.free" + args + "&idx=" + freeInfo.getFl_idx();

		} else {
			String pwd = request.getParameter("pwd");
			freeInfo.setFl_pwd(pwd);
			// ����ڰ� �Է��� ��ȣ�� ������ �������� Ȱ��(��, ��ȸ�� �ۿ��� ����)
			if (loginMember != null && freeInfo.getFl_ismember().equals("y")) {
			// �α��� ���� ȸ���̸鼭 ȸ���� �Է��� ���� ���
				freeInfo.setFl_writer(loginMember.getMlid());
				// freeInfo �ν��Ͻ��� writer ���� ���� �α����� ȸ���� ���̵�� ����
			}
			isSuccess = freeProcSvc.freeDelete(freeInfo);
			if (!isSuccess) {	// ���� ���н�
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				if (freeInfo.getFl_ismember().equals("y")) {
					out.println("alert('�߸��� ��η� �����̽��ϴ�.');");
				} else {
					out.println("alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.');");
				}
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			link = "brd_list.free";
		}

		if (isSuccess) {	// ������
			forward = new ActionForward();
			forward.setRedirect(true);	// �̵������ redirect�� �ϰڴٴ� �ǹ�
			forward.setPath(link);
		}

		return forward;
	}
}
