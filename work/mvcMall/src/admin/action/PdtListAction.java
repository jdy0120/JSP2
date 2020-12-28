package admin.action;

import javax.servlet.http.*;
import java.util.*;
import admin.svc.*;
import vo.*;

public class PdtListAction implements action.Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<PdtInfo> pdtList = new ArrayList<PdtInfo>();
		// ��ǰ ����� ������ ArrayList��ü�� PdtInfo�� �ν��Ͻ��� ������

		request.setCharacterEncoding("utf-8");
		int cpage = 1, pcnt, spage, epage, rcnt, bsize = 10, psize = 12;
		// ����¡�� �ʿ��� ������ ������ ���� ���� �� �ʱ�ȭ
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));
		if (request.getParameter("psize") != null)
			psize = Integer.parseInt(request.getParameter("psize"));

		// �˻����� ������Ʈ���� ����
		String isview, schtype, keyword, sdate, edate, bcata, scata, sprice, eprice, stock;
		isview	= request.getParameter("isview");	// �Խÿ���(y, n)
		schtype = request.getParameter("schtype");	// �˻��������� ��ǰ���̵�(id)�� ��ǰ��(name)
		keyword = request.getParameter("keyword");	// �˻���
		sdate	= request.getParameter("sdate");	// ��ϱⰣ �� �˻� ������
		edate	= request.getParameter("edate");	// ��ϱⰣ �� �˻� ������
		bcata	= request.getParameter("bcata");		// ��ǰ��
		scata	= request.getParameter("scata");		// ��ǰ�з�
		sprice	= request.getParameter("sprice");	// ���ݴ� �� ���� ���ݴ�
		eprice	= request.getParameter("eprice");	// ���ݴ� �� ���� ���ݴ�
		stock	= request.getParameter("stock");	// ���(�̻�)

		// �������� : ����price(��a��d), ��ǰ��name(��a), �����date(��a��d), �α�salecnt(��d), ����review(��d)
		String ord = request.getParameter("ord");

		String where = "", orderby = "";
		if (isview != null)		where += " and pl_view = '" + isview + "' ";
		if (sdate != null)		where += " and pl_date >= '" + sdate + "' ";
		if (edate != null)		where += " and pl_date <= '" + edate + " 23:59:59' ";
		if (bcata != null)		where += " and cs_idx like '" + bcata + "%' ";
		if (scata != null)		where += " and cs_idx = '" + scata + "' ";
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

		PdtListSvc pdtListSvc = new PdtListSvc();
		
		rcnt = pdtListSvc.getPdtCount(where); // �˻��� ��ǰ ��
		
		pdtList = pdtListSvc.getPdtList(where,orderby,cpage,psize);
		// �� ���������� ������ �˻��� ��ǰ ���
		// �˻�����, ��������, limit���� ����� ���� ���ϱ� ���� ������������ ������ũ�⸦ �μ��� ������
		
		pcnt = rcnt/psize;
		if (rcnt % psize > 0) pcnt++;
		spage = (cpage - 1) / psize * psize + 1;
		epage = spage + psize - 1;
		if (epage > pcnt) epage = pcnt;
		
		PdtPageInfo pageInfo = new PdtPageInfo();	// ����¡�� �ʿ��� ������ ���� �ν��Ͻ� ����
		pageInfo.setCpage(cpage);
		pageInfo.setCpage(cpage);
		pageInfo.setPcnt(pcnt);
		pageInfo.setSpage(spage);
		pageInfo.setEpage(epage);
		pageInfo.setRcnt(rcnt);
		pageInfo.setBsize(bsize);
		pageInfo.setPsize(psize);
		
		pageInfo.setIsview(isview);	//�Խÿ���(��ü�Խ�, �Խû�ǰ, �̰Խû�ǰ)
		pageInfo.setSchtype(schtype);	//�˻�����(��ǰ�ڵ�, ��ǰ��)
		pageInfo.setKeyword(keyword);// �˻���
		pageInfo.setSdate(sdate);// ����� �˻�������
		pageInfo.setEdate(edate);// ����� �˻� ������
		pageInfo.setBcata(bcata);// ��з�
		pageInfo.setScata(scata);// �Һз�
		pageInfo.setSprice(sprice); // ���ݴ� ���� ����
		pageInfo.setEprice(eprice); //���ݴ� ���۰���
		pageInfo.setStock(stock); // ���(�̻�)
		pageInfo.setOrd(orderby); // ��������
		
		PdtInFormSvc pdtInFormSvc = new PdtInFormSvc();
		// ��з�, �Һз�, �귣�� ����� �������� ���� SvcŬ����
		ArrayList<CataBigInfo> cataBigList = pdtInFormSvc.getCataBigList();			// ��з� ���
		ArrayList<CataSmallInfo> cataSmallList = pdtInFormSvc.getCataSmallList();
		
		request.setAttribute("pdtList",pdtList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("cataBigList", cataBigList);
		request.setAttribute("cataSmallList", cataSmallList);
		// ��ǰ��� ȭ��(pdt_list.jsp)���� ���(pdtList)�� ����¡ ����(pageInfo), �з����� request�� ��� ������
		
		ActionForward forward = new ActionForward();
		forward.setPath("/admin/product/pdt_list.jsp");
		return forward;
	}
}
