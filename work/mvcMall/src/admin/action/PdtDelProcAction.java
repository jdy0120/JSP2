package admin.action;

import javax.servlet.http.*;	// �޾� �� request�� response�� ���� import
import java.io.PrintWriter;
import java.util.*;
import java.io.*;
import admin.svc.*;
import vo.*;

public class PdtDelProcAction implements action.Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		PdtDelProcSvc pdtDelProcSvc = new PdtDelProcSvc();
		boolean isSuccess = pdtDelProcSvc.pdtDelete(id);
		if (!isSuccess) {	// ��ǰ��Ͽ� ����������
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��ǰ ����� �����߽��ϴ�.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		ActionForward forward = new ActionForward();
		forward.setPath("pdt_list.pdta");
		forward.setRedirect(true);	// �����Ĺ���� �ƴ� �����̷�Ʈ ������� ȭ���� �̵���Ŵ
		return forward;
	}
}
