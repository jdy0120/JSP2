<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String user_id = (String)session.getAttribute("uid");
if (user_id != null) {
	out.println("<script>");
	out.println("history.back();");
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
<h2>회원가입 폼</h2>
<form name="frmJoin" action="joinProc.jsp" method="post">
<table cellpadding="5">
<tr><th>아이디</th><td><input type="text" name="id" /></td></tr>
<tr><th>암호</th><td><input type="password" name="pwd" /></td></tr>
<tr><th>암호 확인</th><td><input type="password" name="pwd2" /></td></tr>
<tr><th>이름</th><td><input type="text" name="name" /></td></tr>
<tr>
<th>성별</th>
<td>
	<input type="radio" name="gender" value="M" checked="checked" />남
	<input type="radio" name="gender" value="F" />여
</td>
</tr>
<tr><th>생일</th><td><input type="text" name="birth" />(yyyymmdd)</td></tr>
<tr>
<th>전화번호</th>
<td>
	<select name="p1">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="019">019</option>
	</select> -
	<input type="text" name="p2" size="4" maxlength="4" /> -
	<input type="text" name="p3" size="4" maxlength="4" />
</td>
</tr>
<tr>
<th>이메일</th>
<td>
	<input type="text" name="e1" /> @
	<select name="e2">
		<option value="">도메인 선택</option>
		<option value="naver.com">네이버</option>
		<option value="gmail.com">지메일</option>
		<option value="direct">직접입력</option>
	</select>
</td>
</tr>
<tr><th colspan="2">
	<input type="submit" value="회원 가입" />
</th></tr>
</table>
</form>
</body>
</html>
