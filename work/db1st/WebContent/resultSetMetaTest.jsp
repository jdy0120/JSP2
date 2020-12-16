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
ResultSetMetaData rsmd = null;
String sql = "select ml_id, ml_name, ml_point, ml_date, ";
sql += " if(ml_gender = 'M', '남자', '여자') gender, ";
sql += " if(ml_status = 'a', '일반', '탈퇴') stat ";
sql += " from t_member_list";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	rsmd = rs.getMetaData();
	// rs의 메타데이터를 rsmd에 저장

} catch(Exception e) {
	out.println("오류가 발생했습니다.");
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
컬럼 수 : <%=rsmd.getColumnCount() %>개<br />
<%
for (int i = 1 ; i <= rsmd.getColumnCount() ; i++) {
	out.print(i + "번째 컬럼의 이름 : " + rsmd.getColumnName(i));
	out.print(" / 레이블 : " + rsmd.getColumnLabel(i));
	out.println(" / 데이터 타입 : " + rsmd.getColumnTypeName(i) + "<br />");
}
%>
</body>
</html>
