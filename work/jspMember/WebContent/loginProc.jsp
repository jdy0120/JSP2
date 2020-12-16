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
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&";
url += "charcterEncoding=utf8&verifyServerCertificate=false&";
url += "useSSL=false&serverTimezone=UTC";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "select ml_id from t_member_list where ml_id = '" + uid + "' ";
sql += " and ml_pwd = '" + pwd + "' and ml_status <> 'c'";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);

	if (rs.next()) {	// rs에 데이터가 있으면(로그인이 되었으면)
		session.setAttribute("uid", uid);
		// 세션 속성으로 로그인한 아이디를 저장(다른 페이지에서 로그인 여부를 알기 위해)
		out.println("<script>");
		out.println("location.href='index.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('로그인 정보가 잘못되었습니다.');");
		out.println("location.href='loginForm.jsp';");
		out.println("</script>");
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
