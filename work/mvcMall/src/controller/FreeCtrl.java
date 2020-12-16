package controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import action.*;
import vo.*;

@WebServlet("*.free")
// url�� ���� ������ �ټ����ڰ� ".free"�� url�� �޾� ��
public class FreeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FreeCtrl() {
        super();
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// ������� ��û�� get�̵� post�̵� ��� ó���ϴ� �޼ҵ�
    	request.setCharacterEncoding("utf-8");
    	String requestUri = request.getRequestURI();
    	// URI�� �޾ƿ�(�����ΰ� ������Ʈ���� �� �ּ� ���ڿ�) : /mvcMall/brd_list.free
    	String contextPath = request.getContextPath();
    	// URI���� ���ϸ� �κ��� ������ ���ڿ� : /mvcMall
    	String command = requestUri.substring(contextPath.length());
    	// requestUri���� contextPath�� �� ���ڿ� : /brd_list.free
    	
    	ActionForward forward = null;
    	Action action = null;
    	
    	switch(command) {
    		case "/brd_list.free": // �Խ��� ��� ����
    			action = new FreeListAction();
    			try {
    				forward = action.execute(request, response);
    			} catch(Exception e) {
    				e.printStackTrace();
    			}
    			break;
    		case "/brd_form.free": // �Խ��� ���/���� ��
    			action = new FreeFormAction();
    			try {
    				forward = action.execute(request, response);
    			} catch(Exception e) {
    				e.printStackTrace();
    			}
    			break;
    			
    		case "/brd_view.free": // �Խñ� ����
    			break;
    		case "/brd_proc.free": // �Խñ� ó��
    			action = new FreeProcAction();
    			try {
    				forward = action.execute(request, response);
    			} catch(Exception e) {
    				e.printStackTrace();
    			}
    			break;
    	}
    	
    	if (forward != null) {
    		if (forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		} else {
    			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request, response);
    		}
    	}
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}
}
