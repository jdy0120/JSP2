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

String user_id = (String)session.getAttribute("uid");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "select * from t_member_list where ml_id = '" + user_id + "'";
// 현재 로그인 한 회원의 정보들을 추출할 쿼리

String name = null, gender = null, birth = null;
String p1 = null, p2 = null, p3 = null, e1 = null, e2 = null;
// 사용자에게 보여줄 데이터들을 저장할 변수

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if (rs.next()) {
		name = rs.getString("ml_name");
		gender = rs.getString("ml_gender");
		birth = rs.getString("ml_birth");
		String[] phone = rs.getString("ml_phone").split("-");
		p1 = phone[0];	p2 = phone[1];	p3 = phone[2];
		String[] email = rs.getString("ml_email").split("@");
		e1 = email[0];	e2 = email[1];
	} else {	// 검색된 결과가 없을 경우
		out.println("<script>");
		out.println("alert('잘못된 경로로 들어오셨습니다.');");
		out.println("location.href='index.jsp';");
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원정보 수정 폼</h2>
<form name="frmInfo" action="infoProc.jsp" method="post">
<table cellpadding="5">
<tr><th>아이디</th><td><%=user_id %></td></tr>
<tr><th>이름</th><td><%=name %></td></tr>
<tr><th>암호</th><td><input type="password" name="pwd" /></td></tr>
<tr>
<th>성별</th>
<td>
	<input type="radio" name="gender" value="M" 
	<% if (gender.equals("M")) { %>checked="checked"<% } %> />남
	<input type="radio" name="gender" value="F" 
	<% if (gender.equals("F")) { %>checked="checked"<% } %> />여
</td>
</tr>
<tr><th>생일</th><td><%=birth %></td></tr>
<tr>
<th>전화번호</th>
<td>
	<select name="p1">
		<option value="010" 
		<% if(p1.equals("010")) { %>selected="selected"<% } %>>010</option>
		<option value="011" 
		<% if(p1.equals("011")) { %>selected="selected"<% } %>>011</option>
		<option value="016" 
		<% if(p1.equals("016")) { %>selected="selected"<% } %>>016</option>
		<option value="019" 
		<% if(p1.equals("019")) { %>selected="selected"<% } %>>019</option>
	</select> -
	<input type="text" name="p2" size="4" maxlength="4" value="<%=p2 %>" /> -
	<input type="text" name="p3" size="4" maxlength="4" value="<%=p3 %>" />
</td>
</tr>
<tr>
<th>이메일</th>
<td>
	<input type="text" name="e1" value="<%=e1 %>" /> @
	<select name="e2">
		<option value="" 
		<% if(e2.equals("")) { %>selected="selected"<% } %>>도메인 선택</option>
		<option value="naver.com" 
		<% if(e2.equals("naver.com")) { %>selected="selected"<% } %>>네이버</option>
		<option value="gmail.com" 
		<% if(e2.equals("gmail.com")) { %>selected="selected"<% } %>>지메일</option>
		<option value="direct" 
		<% if(e2.equals("direct")) { %>selected="selected"<% } %>>직접입력</option>
	</select>
</td>
</tr>
<tr><th colspan="2">
	<input type="submit" value="정보 수정" />
</th></tr>
</table>
</form>
</body>
</html>
