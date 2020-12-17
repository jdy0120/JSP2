package action;

import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

public class FreeListAction implements Action {
// �Խñ� ����� �޾ƿ� �����ϴ� Ŭ����
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		ArrayList<FreeInfo> articleList = new ArrayList<FreeInfo>();
		// �Խñ� ����� ������ ArrayList��ü�� FreeInfo�� �ν��Ͻ��� ������

		request.setCharacterEncoding("utf-8");
		int cpage = 1, limit = 10;
		// ���� ��������ȣ�� ������������ ������ �Խñ� ������ �����ϴ� ����
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));
		// cpage���� �޾� ������ ���������� ����ȯ�Ͽ� ���
		String schtype = request.getParameter("schtype");
		// �˻��������� �ۼ���, ����, ����, ����+����
		String keyword = request.getParameter("keyword");
		// �˻���
		String where = "";
		if (schtype != null && keyword != null && !keyword.equals("")) {
		// �˻����ǰ� �˻�� ������
			if (schtype.equals("tc")) {	// �˻� ������ '����+����' �̸�
				where = " and (fl_title like '%" + keyword + "%' " + 
					" or fl_content like '%" + keyword + "%') ";
			} else {	// �˻������� ���� �Ǵ� ���� �Ǵ� �ۼ��� �̸�
				where = " and fl_" + schtype + " like '%" + keyword + "%' ";
			}
		}

		FreeListSvc freeListSvc = new FreeListSvc();
		int rcnt = freeListSvc.getArticleCount(where);
		// �� ���ڵ� ������ �޾ƿ�(��ü ���������� ����ϱ� ����)

		articleList = freeListSvc.getArticleList(where, cpage, limit);
		// ���ȭ�鿡�� ������ �Խñ� ����� ArrayList������ �޾ƿ�
		
		int pcnt = rcnt / limit;
		if (rcnt % limit > 0)	pcnt++;
		// ��ü �������� ����
		int spage = (cpage - 1) / limit * limit + 1;
		// ��� ���������� ��ȣ
		int epage = spage + limit - 1;
		if (epage > pcnt)	epage = pcnt;
		// ��� ���������� ��ȣ
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setCpage(cpage);		// ���� ������ ��ȣ
		pageInfo.setRcnt(rcnt);			// ��ü �Խñ� ��
		pageInfo.setPcnt(pcnt);			// ��ü ������ ��
		pageInfo.setSpage(spage);		// ��� ���� ������ ��ȣ
		pageInfo.setEpage(epage);		// ��� ���� ������ ��ȣ
		pageInfo.setSchtype(schtype);	// �˻�����
		pageInfo.setKeyword(keyword);	// �˻���
		// ����¡ ���� ������� �˻������� PageInfo �ν��Ͻ��� ����
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		// free_list.jsp�� request�� ���� �������� ��ü ����

		ActionForward forward = new ActionForward();
		forward.setPath("/bbs/free_list.jsp");
		return forward;
	}
}
