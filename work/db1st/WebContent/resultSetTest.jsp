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
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);

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
<table border="1" cellpadding="5">
<tr><th>번호</th><th>아이디</th><th>이름</th>
<th>성별</th><th>생일</th><th>상태</th></tr>
<%
if (rs.next()) {	// 결과가 있을 경우
	int n = 1;
	do {
%>
<tr align="center">
<td><%=n %></td>
<td><%=rs.getString("ml_id") %></td>
<td><%=rs.getString("ml_name") %></td>
<td><%=rs.getString("gender") %></td>
<td><%=rs.getString("ml_birth") %></td>
<td><%=rs.getString("stat") %></td>
</tr>
<%
		n++;
	} while (rs.next());
} else {	// 결과가 없을 경우
	out.println("<tr><th colspan='6'>검색 결과가 없습니다.</th></tr>");
}

try {
	rs.close();
	stmt.close();
	conn.close();
} catch(Exception e) {
	e.printStackTrace();
}
%>
</table>
</body>
</html>
