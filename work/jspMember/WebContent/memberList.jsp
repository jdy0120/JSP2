<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<%
request.setCharacterEncoding("utf-8");
String fld = request.getParameter("fld");
String ord = request.getParameter("ord");
if (fld == null)	fld = "id";
if (ord == null)	ord = "asc";

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&";
url += "charcterEncoding=utf8&verifyServerCertificate=false&";
url += "useSSL=false&serverTimezone=UTC";
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "select ml_id, ml_name, ml_phone, ml_last, ml_birth, " +
"if(ml_status = 'a', '일반', if(ml_status = 'b', '휴면', '탈퇴')) stat, " +
"if(ml_gender = 'F', '여', '남') gender from t_member_list " + 
"order by ml_" + fld + " " + ord;

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
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
<h2>관리자 모드 - 회원 목록</h2>
<table border="1" cellpadding="5">
<tr>
<th>번호</th>
<th>아이디 <a href="memberList.jsp?fld=id&ord=asc">▲</a> 
	<a href="memberList.jsp?fld=id&ord=desc">▼</a></th>
<th>이름(성별) <a href="memberList.jsp?fld=name&ord=asc">▲</a> 
	<a href="memberList.jsp?fld=name&ord=desc">▼</a></th>
<th>전화번호</th><th>생일(나이)</th><th>최종로그인</th><th>상태</th>
</tr>
<%
try {
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if (rs.next()) {	// 검색된 데이터가 있으면(회원 목록이 있으면)
		Calendar today = Calendar.getInstance();
		int num = 1, age = 0, cYear = today.get(Calendar.YEAR);
		do {
			String year = rs.getString("ml_birth").substring(0, 4);
			age = cYear - Integer.parseInt(year);
%>
<tr align="center">
<td><%=num %></td>
<td><a href="memberView.jsp?id=<%=rs.getString("ml_id") %>">
	<%=rs.getString("ml_id") %></a></td>
<td><%=rs.getString("ml_name") + "(" + rs.getString("gender") + ")" %></td>
<td><%=rs.getString("ml_phone") %></td>
<td><%=rs.getString("ml_birth") + "(" + age + "세)" %></td>
<td><%=rs.getString("ml_last") %></td>
<td><%=rs.getString("stat") %></td>
</tr>
<%
			num++;
		} while(rs.next());
	} else {
		out.println("<tr><td colspan='7' align='center'>");
		out.println("검색 결과가 없습니다.</td></tr>");
	}
} catch(Exception e) {
	out.println("오류가 발생했습니다.");
	e.printStackTrace();
}
%>
</table>
</body>
</html>
<%
try {
	rs.close();
	stmt.close();
	conn.close();
} catch(Exception e) {
	e.printStackTrace();
}
%>
