<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");
String uid = request.getParameter("uid");
String pwd = request.getParameter("pwd");

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&";
url += "charcterEncoding=utf8&verifyServerCertificate=false&";
url += "useSSL=false&serverTimezone=UTC";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "select id from member where id = '" + uid + "' and pwd = '" + pwd + "';";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	
	if (rs.next()) {
		session.setAttribute("uid", uid);
		out.println("<script>");
		out.println("location.href='index.jsp';");
		out.println("</script>");
	} else {
		sql = "select id from member where id = '" + uid + "';";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			out.println("<script>");
			out.println("alert('비밀번호가 잘못 되었습니다.');");
			out.println("location.href='login_form.jsp';");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('아이디가 잘못 되었습니다.');");
			out.println("location.href='login_form.jsp';");
			out.println("</script>");
		}
	}
} catch(Exception e) {
	out.println("오류가 발생했습니다.");
	e.printStackTrace();
} finally {
	try {
		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
}
%>