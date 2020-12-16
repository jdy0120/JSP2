<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&characterEncoding=utf8&verifyServerCertificate=false&useSSL=false&serverTimezone=UTC";

Connection conn = null;
Statement stmt = null;
String sql = null;

int idx = Integer.parseInt(request.getParameter("idx"));	// 글번호
int cpage = Integer.parseInt(request.getParameter("cpage"));// 페이지번호
String args = "?idx=" + idx + "&cpage=" + cpage;

String schtype = request.getParameter("schtype");
String schval = request.getParameter("schval");
if (schval != null && !schval.equals("")) {
	args += "&schtype=" + schtype + 
		"&schval=" + URLEncoder.encode(schval, "UTF-8");
}

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	
	sql = "update t_free_list set fl_read = fl_read + 1 " +
		" where fl_status = 'a' and fl_idx = " + idx;
	int result = stmt.executeUpdate(sql);
	if (result == 1) {	// update로 변경된 레코드가 하나이면
		out.println("<script>location.replace('free_view.jsp" + args + "');</script>");
	} else {
		out.println("<script>location.replace('index.jsp');</script>");
	}

} catch(Exception e) {
	out.println(e.getMessage());
} finally {	// 생략가능하나 해주는 것이 좋은 습관
	try {
		stmt.close();
		conn.close();
	} catch(Exception e) {
		out.println(e.getMessage());
	}
}
%>
