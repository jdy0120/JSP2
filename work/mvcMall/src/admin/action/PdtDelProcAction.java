package admin.action;

import javax.servlet.http.*;	// 받아 온 request와 response를 위해 import
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
		if (!isSuccess) {	// 상품등록에 실패했으면
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 등록이 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		ActionForward forward = new ActionForward();
		forward.setPath("pdt_list.pdta");
		forward.setRedirect(true);	// 디스패쳐방식이 아닌 리다이렉트 방식으로 화면을 이동시킴
		return forward;
	}
}
