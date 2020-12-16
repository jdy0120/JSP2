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

String id		= request.getParameter("id").toLowerCase().trim();
String pwd		= request.getParameter("pwd").trim();
String name		= request.getParameter("name").trim();
String gender	= request.getParameter("gender");
String b		= request.getParameter("birth");
String p1		= request.getParameter("p1");
String p2		= request.getParameter("p2");
String p3		= request.getParameter("p3");
String e1		= request.getParameter("e1");
String e2		= request.getParameter("e2");

String phone = p1 + "-" + p2 + "-" + p3;
String email = e1 + "@" + e2;

StringBuilder sb = new StringBuilder(b);
sb.insert(4, "-");	sb.insert(7, "-");
String birth = new String(sb);

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	sql = "insert into t_member_list (ml_id, ml_pwd, ml_name, " + 
		"ml_gender, ml_birth, ml_phone, ml_email, ml_point) values " +
		"('" + id + "', '" + pwd + "', '" + name + "', '" + gender + 
		"', '" + birth + "', '" + phone + "', '" + email + "', 1000)";
	int result = stmt.executeUpdate(sql);
	if (result != 0) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('회원가입이 실패하였습니다.\n다시 시도하세요.');");
		out.println("location.href='joinForm.jsp';");
		out.println("</script>");
	}

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
