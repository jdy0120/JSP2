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
CallableStatement cs = null;
String sql = "{call sp_ma_insert(?, ?, ?, ?, ?)}";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	cs = conn.prepareCall(sql);
	cs.setString(1, "test3");
	cs.setString(2, "12123");
	cs.setString(3, "부산시 동래구");
	cs.setString(4, "456-789");
	cs.setString(5, "y");
	cs.execute();
	out.println("주소가 추가되었습니다.");

} catch(Exception e) {
	out.println("주소 등록시 오류가 발생했습니다.");
	e.printStackTrace();
} finally {
	try {
		cs.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
}
%>
