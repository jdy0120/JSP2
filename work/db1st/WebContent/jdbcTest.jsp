<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Connection conn = null;
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&";
url += "charcterEncoding=utf8&verifyServerCertificate=false&";
url += "useSSL=false&serverTimezone=UTC";

//커넥터 버전 5.x 이하일 경우
/*
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/DB명";
*/

boolean connect = false;

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	connect = true;
	conn.close();
} catch(Exception e) {
	connect = false;
	e.printStackTrace();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><% if (connect) { %>연결 성공!!<% } else { %>연결 실패<% } %>
</body>
</html>
