package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import action.Action;
import action.FreeFormAction;
import action.FreeListAction;
import action.FreeProcAction;
import action.FreePwdAction;
import action.FreeViewAction;
import admin.action.*;
import vo.*;

@WebServlet("*.pdta")
public class ProductCtrl extends HttpServlet {
	// ���� ��ǰ���� ����ɿ� ���� ��û�� ó���ϴ� ��Ʈ�ѷ� ���� Ŭ����
	private static final long serialVersionUID = 1L;
       
    public ProductCtrl() {
        super();
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// ������� ��û�� get�̵� post�̵� ��� ó���ϴ� �޼ҵ�
		request.setCharacterEncoding("utf-8");
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestUri.substring(contextPath.length());

		ActionForward forward = null;
		Action action = null;
		
		switch (command) {
		case "/pdt_in_form.pdta" :
			action = new PdtInFormAction();
			break;
		}
		
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = 
					request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
