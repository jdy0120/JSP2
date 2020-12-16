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
Statement stmt = null;
ResultSet rs = null;
String sql = "select ml_id, ml_name, ml_birth, ";
sql += " if(ml_gender = 'M', '남자', '여자') gender, ";
sql += " if(ml_status = 'a', '일반', '탈퇴') stat ";
sql += " from t_member_list";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
			ResultSet.CONCUR_READ_ONLY);
	rs = stmt.executeQuery(sql);

	rs.last();		// rs의 마지막 레코드로 커서 이동
	out.print("마지막 레코드 : " + rs.getString("ml_id") + ", ");
	out.println(rs.getString("ml_name") + ", " + rs.getString("gender"));
	out.println("<br />");

	rs.first();		// rs의 첫 레코드로 커서 이동
	out.print("첫 레코드 : " + rs.getString("ml_id") + ", ");
	out.println(rs.getString("ml_name") + ", " + rs.getString("gender"));
	out.println("<br />");

	rs.absolute(3);	// rs의 3번째 레코드로 커서 이동
	out.print("3번째 레코드 : " + rs.getString("ml_id") + ", ");
	out.println(rs.getString("ml_name") + ", " + rs.getString("gender"));

} catch(Exception e) {
	out.println("오류가 발생했습니다.");
	e.printStackTrace();
}
%>
