package admin.action;

import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

public class PdtListAction implements action.Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<PdtInfo> articleList = new ArrayList<PdtInfo>();
		// ��ǰ ����� ������ ArrayList��ü�� PdtInfo�� �ν��Ͻ��� ������

		request.setCharacterEncoding("utf-8");
		int cpage = 1, pcnt, spage, epage, rcnt, bsize = 10, psize = 12;
		// ����¡�� �ʿ��� ������ ������ ���� ���� �� �ʱ�ȭ
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));
		if (request.getParameter("psize") != null)
			psize = Integer.parseInt(request.getParameter("psize"));

		// �˻����� ������Ʈ���� ����
		String isview, schtype, keyword, sdate, edate, cata, sprice, eprice, stock;
		isview	= request.getParameter("isview");	// �Խÿ���(y, n)
		schtype = request.getParameter("schtype");	// �˻��������� ��ǰ���̵�(id)�� ��ǰ��(name)
		keyword = request.getParameter("keyword");	// �˻���
		sdate	= request.getParameter("sdate");	// ��ϱⰣ �� �˻� ������
		edate	= request.getParameter("edate");	// ��ϱⰣ �� �˻� ������
		cata	= request.getParameter("cata");		// ��ǰ�з�
		sprice	= request.getParameter("sprice");	// ���ݴ� �� ���� ���ݴ�
		eprice	= request.getParameter("eprice");	// ���ݴ� �� ���� ���ݴ�
		stock	= request.getParameter("stock");	// ���(�̻�)

		// �������� : ����price(��a��d), ��ǰ��name(��a), �����date(��a��d), �α�salecnt(��d), ����review(��d)
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
		// �˻����ǿ� where�� ����

		if (ord != null)
			orderby = " order by pl_" + ord.substring(0, ord.length() - 1) + 
			(ord.substring(ord.length() - 1).equals("d") ? " desc" : " asc");
		// ���İ� : pricea, priced, namea, datea, dated, salecntd, reviewd

		ActionForward forward = new ActionForward();
		forward.setPath("/admin/product/pdt_list.jsp");
		return forward;
	}
}
