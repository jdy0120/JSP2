<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String loginid = (String)session.getAttribute("loginid");
if (loginid != null) {	// 로그인 상태이면
	out.println("<script>");
	out.println("alert('이미 로그인된 상태입니다.');");
	out.println("location.replace('main.jsp');");
	out.println("</script>");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 폼</h2>
<form action="loginProc.jsp" method="post">
<table cellpadding="5">
<tr><th>아이디</th><td><input type="text" name="uid" /></td></tr>
<tr><th>비밀번호</th><td><input type="password" name="pwd" /></td></tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="로그인" />
	<input type="reset" value="다시 입력" />
</td></tr>
</table>
</form>
</body>
</html>
