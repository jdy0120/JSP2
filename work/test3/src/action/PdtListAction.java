package action;

import svc.*;
import javax.servlet.http.*;
import java.util.*;
import vo.*;

public class PdtListAction implements action.Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<ProductInfo> pdtList = new ArrayList<ProductInfo>();
		request.setCharacterEncoding("utf-8");
		
		ProductService productService = new ProductService();
		
		pdtList = productService.getProductList();
		
		request.setAttribute("pdtList", pdtList);
		ActionForward forward = new ActionForward();
		forward.setPath("/productList.jsp");
		return forward;
	}
}
