package action;

import javax.servlet.http.*; // 받아온 request와 response를 위해 import
import svc.*;
import vo.*;

public class FreeFormAction implements Action{
// 자유 게시판 글 등록 및 수정 폼으로의 이동을 위한 클래스
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String wtype = request.getParameter("wtype");
		ActionForward forward = new ActionForward();
/*		
		if (wtype.equals("up")) { //글 수정이면
			int idx = Integer.parseInt(request.getParameter("idx"));
			// 글번호로 정수로 형변환을 시킴
			FreeFormSvc freeFormSvc = new FreeFormSvc();
			FreeInfo article = freeFormSvc.getArticle(idx);
			// 특정 게시물의 데이터들을 FreeInfo 인스턴스에 저장
			request.setAttribute("article", article);
			// 받아온 게시물 객체를 request객체에 추가
		}*/
		forward.setPath("/bbs/free_form.jsp");
		// 이동할 URL 지정
		
		return forward;
	}
}
