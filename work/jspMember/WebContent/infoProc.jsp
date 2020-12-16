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

String user_id	= (String)session.getAttribute("uid");
if (user_id == null) {	// 현재 로그인된 상태가 아닐 경우
	out.println("<script>");
	out.println("alert('다시 로그인 후 시도하십시오.');");
	out.println("location.href='loginForm.jsp';");
	out.println("</script>");
}

String pwd		= request.getParameter("pwd").trim();
String gender	= request.getParameter("gender");
String p1		= request.getParameter("p1");
String p2		= request.getParameter("p2");
String p3		= request.getParameter("p3");
String e1		= request.getParameter("e1");
String e2		= request.getParameter("e2");

String phone = p1 + "-" + p2 + "-" + p3;
String email = e1 + "@" + e2;

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	sql = "update t_member_list set ";
	if (!pwd.equals(""))	sql += "ml_pwd = '" + pwd + "', ";
	// 새 비밀번호를 입력했으면 변경해줌
	sql += "ml_gender = '"	+ gender + "', ";
	sql += "ml_phone = '"	+ phone	 + "', ";
	sql += "ml_email = '"	+ email	 + "' ";
	sql += "where ml_id = '" + user_id + "' ";

	int result = stmt.executeUpdate(sql);
	out.println("<script>");
	if (result != 0) {
		out.println("alert('정상적으로 수정되었습니다.');");
	} else {
		out.println("alert('정보수정에 실패하였습니다.\n다시 시도하세요.');");
	}
	out.println("location.href='infoForm.jsp';");
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
