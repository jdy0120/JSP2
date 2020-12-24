package admin.action;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import admin.svc.*;
import vo.*;

public class PdtInProcAction implements action.Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		PdtInProcSvc pdtInProcSvc = new PdtInProcSvc();
		request.setCharacterEncoding("utf-8");

		String uploadPath = "D:/zoom/jsp/work/mvcMall/WebContent/product/pdt_img";
		// ������ ������ ���� ��ġ�� ����
		int maxSize = 5 * 1024 * 1024;		// ���ε� �ִ� �뷮���� 5MB�� ����
		String sCata = "", brand = "", orig = "", name = "", opt = "", view = "";
		String img1 = "", img2 = "", img3 = "", desc = "";
		String price = "0", cost = "0", discount = "0", stock = "0";

		MultipartRequest multi = new MultipartRequest(
			request, 	// request��ü�� multi�� �����͵��� �ޱ� ����
			uploadPath, // ������ ������ ������ ����� ��ġ ����
			maxSize, 	// �� ���� ���ε��� �� �ִ� �ִ�ũ��(byte����)
			"utf-8", 	// ������ ���ڵ� ���(utf-8, euc-kr, ksc-5601 ��)
			new DefaultFileRenamePolicy());	// ���� �̸��� �ߺ� ó��
		
		sCata = multi.getParameter("sCata");	brand = multi.getParameter("brand");
		orig = multi.getParameter("orig");		name = multi.getParameter("name");
		opt = multi.getParameter("opt");		view = multi.getParameter("view");
		price = multi.getParameter("price");	cost = multi.getParameter("cost");
		stock = multi.getParameter("stock");	discount = multi.getParameter("discount");
		// ����� ��ǰ�� ���� �޾� ��

		Enumeration files = multi.getFileNames();	// ���ε��� ���� �̸����� Enumeration������ �޾� ��
		while (files.hasMoreElements()) {
			String f = (String)files.nextElement();
			switch (f) {
				case "img1" : img1 = multi.getFilesystemName(f);	break;
				case "img2" : img2 = multi.getFilesystemName(f);	break;
				case "img3" : img3 = multi.getFilesystemName(f);	break;
				case "desc" : desc = multi.getFilesystemName(f);	break;
			}
		}

		PdtInfo pdt = new PdtInfo();
		pdt.setCs_idx(Integer.parseInt(sCata));		pdt.setBl_idx(Integer.parseInt(brand));
		pdt.setPl_price(Integer.parseInt(price));	pdt.setPl_cost(Integer.parseInt(cost));
		pdt.setPl_stock(Integer.parseInt(stock));	pdt.setPl_discount(Integer.parseInt(discount));
		pdt.setPl_orig(orig);	pdt.setPl_name(name);	pdt.setPl_opt(opt);		pdt.setPl_view(view);
		pdt.setPl_img1(img1);	pdt.setPl_img2(img2);	pdt.setPl_img3(img3);	pdt.setPl_desc(desc);
		// ����� ��ǰ������ PdtInfo�� �ν��Ͻ� pdt�� ����
		
		boolean isSuccess = pdtInProcSvc.pdtInsert(pdt);
		if (!isSuccess) {	// ��ǰ��Ͽ� ����������
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��ǰ ����� �����߽��ϴ�.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		forward.setPath("pdt_list.pdta");
		return forward;
	}
}
