<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&";
url += "charcterEncoding=utf8&verifyServerCertificate=false&";
url += "useSSL=false&serverTimezone=UTC";

Connection conn = null;
PreparedStatement pstmt = null;
String sql = "insert into t_member_list (ml_id, ml_pwd, ml_name, ";
sql += "ml_gender, ml_birth, ml_phone, ml_email) ";
sql += " values (?, ?, ?, ?, ?, ?, ?) ";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, "test7");
	pstmt.setString(2, "1234");
	pstmt.setString(3, "김그린");
	pstmt.setString(4, "F");
	pstmt.setString(5, "2001-02-02");
	pstmt.setString(6, "010-9876-5432");
	pstmt.setString(7, "kim@test.com");
	int result = pstmt.executeUpdate();
	if (result > 0) {
		out.println("정상적으로 등록되었습니다.");
	} else {
		out.println("회원 등록에 실패했습니다.");
	}

} catch(Exception e) {
	out.println("회원 등록시 오류가 발생했습니다.");
	e.printStackTrace();
} finally {
	try {
		pstmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
