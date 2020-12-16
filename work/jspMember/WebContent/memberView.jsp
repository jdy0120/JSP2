<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&";
url += "charcterEncoding=utf8&verifyServerCertificate=false&";
url += "useSSL=false&serverTimezone=UTC";
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "select * from t_member_list where ml_id = '" + id + "'";
String name = null, gender = null, birth = null, phone = null;
String email = null, date = null, last = null, status = null;

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if (rs.next()) {
		name = rs.getString("ml_name");
		gender = rs.getString("ml_gender");
		birth = rs.getString("ml_birth");
		phone = rs.getString("ml_phone");
		email = rs.getString("ml_email");
		date = rs.getString("ml_date");
		last = rs.getString("ml_last");
		status = rs.getString("ml_status");
		
		if (gender.equals("M"))	gender = "남자";
		else					gender = "여자";

	} else {	// 검색된 결과가 없을 경우
		out.println("<script>");
		out.println("alert('잘못된 경로로 들어오셨습니다.');");
		out.println("location.href='index.jsp';");
		out.println("</script>");
	}
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
<h2>회원정보 보기</h2>
<form name="frmView" action="memberProc.jsp" method="post">
<input type="hidden" name="id" value="<%=id %>" />
<table cellpadding="5">
<tr>
<th>아이디</th><td><%=id %></td><th>이름</th><td><%=name %></td>
</tr>
<tr>
<th>성별</th><td><%=gender %></td><th>생일</th><td><%=birth %></td>
</tr>
<tr>
<th>전화번호</th><td><%=phone %></td><th>이메일</th><td><%=email %></td>
</tr>
<tr>
<th>가입일</th><td><%=date %></td><th>최종 로그인</th><td><%=last %></td>
</tr>
<tr>
<th>현상태</th>
<td colspan="3">
	<select name="status" 
		<% if (status.equals("c")) { %>disabled="disabled"<% } %>>
		<option value="a" <% if (status.equals("a")) { %>
			selected="selected"<% } %>>일반 회원</option>
		<option value="b" <% if (status.equals("b")) { %>
			selected="selected"<% } %>>휴면 계정</option>
		<option value="c" <% if (status.equals("c")) { %>
			selected="selected"<% } %>>탈퇴 회원</option>
	</select>
	<% if (!status.equals("c")) { %>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="상태 수정" />
	<% } %>
</td>
</tr>
</table>
</form>
</body>
</html>
