<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&";
url += "charcterEncoding=utf8&verifyServerCertificate=false&";
url += "useSSL=false&serverTimezone=UTC";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = null;

String id = request.getParameter("id");
String status = request.getParameter("status");
try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	sql = "update t_member_list set " +
		"ml_status = '" + status + "' where ml_id = '" + id + "'";
	int result = stmt.executeUpdate(sql);
	out.println("<script>");
	if (result != 0) {
		out.println("alert('정상적으로 수정되었습니다.');");
	} else {
		out.println("alert('상태 수정에 실패하였습니다.\n다시 시도하세요.');");
	}
	out.println("location.href='memberView.jsp?id=" + id + "';");
	out.println("</script>");

} catch(Exception e) {
	out.println("오류가 발생했습니다.");
	e.printStackTrace();
} finally {
	try {
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
}
%>
