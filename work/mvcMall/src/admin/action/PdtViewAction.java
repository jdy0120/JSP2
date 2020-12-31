package admin.action;

import javax.servlet.http.*;
import java.util.*;
import admin.svc.*;
import vo.*;
import vo.ActionForward;

public class PdtViewAction implements action.Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		String id = request.getParameter("id");
		request.setCharacterEncoding("utf-8");
		
		PdtViewSvc pdtViewSvc = new PdtViewSvc();
		PdtInfo pdtInfo = pdtViewSvc.getPdtInfo(id);
		// 지정한 아이디에 해당하는 상품의 정보들을 PdtInfo형 인스턴스로 받아 옴
		
		request.setAttribute("pdtInfo", pdtInfo);
		forward.setPath("/admin/product/pdt_view.jsp");
		
		return forward;
	}
}
