package admin.action;

import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

public class PdtListAction implements action.Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<PdtInfo> articleList = new ArrayList<PdtInfo>();
		// 상품 목록을 저장할 ArrayList객체로 PdtInfo형 인스턴스만 저장함

		request.setCharacterEncoding("utf-8");
		int cpage = 1, pcnt, spage, epage, rcnt, bsize = 10, psize = 12;
		// 페이징에 필요한 값들을 저장할 변수 선언 및 초기화
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));
		if (request.getParameter("psize") != null)
			psize = Integer.parseInt(request.getParameter("psize"));

		// 검색조건 쿼리스트링을 받음
		String isview, schtype, keyword, sdate, edate, cata, sprice, eprice, stock;
		isview	= request.getParameter("isview");	// 게시여부(y, n)
		schtype = request.getParameter("schtype");	// 검색조건으로 상품아이디(id)와 상품명(name)
		keyword = request.getParameter("keyword");	// 검색어
		sdate	= request.getParameter("sdate");	// 등록기간 중 검색 시작일
		edate	= request.getParameter("edate");	// 등록기간 중 검색 종료일
		cata	= request.getParameter("cata");		// 상품분류
		sprice	= request.getParameter("sprice");	// 가격대 중 시작 가격대
		eprice	= request.getParameter("eprice");	// 가격대 중 종료 가격대
		stock	= request.getParameter("stock");	// 재고량(이상)

		// 정렬조건 : 가격price(오a내d), 상품명name(오a), 등록일date(오a내d), 인기salecnt(내d), 리뷰review(내d)
		String ord = request.getParameter("ord");

		String where = "", orderby = "";
		if (isview != null)		where += " and pl_view = '" + isview + "' ";
		if (sdate != null)		where += " and pl_date >= '" + sdate + "' ";
		if (edate != null)		where += " and pl_date <= '" + edate + " 23:59:59' ";
		if (cata != null)		where += " and cs_idx = '" + cata + "' ";
		if (sprice != null)		where += " and pl_price >= '" + sprice + "' ";
		if (eprice != null)		where += " and pl_price <= '" + eprice + "' ";
		if (stock != null)		where += " and pl_stock >= '" + stock + "' ";
		if (keyword != null && !keyword.equals(""))
			where += " and pl_" + schtype + " like '%" + keyword + "%' ";
		// 검색조건용 where절 생성

		if (ord != null)
			orderby = " order by pl_" + ord.substring(0, ord.length() - 1) + 
			(ord.substring(ord.length() - 1).equals("d") ? " desc" : " asc");
		// 정렬값 : pricea, priced, namea, datea, dated, salecntd, reviewd

		ActionForward forward = new ActionForward();
		forward.setPath("/admin/product/pdt_list.jsp");
		return forward;
	}
}
