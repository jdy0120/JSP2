<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>자바메일 보내기</h2>
<form name="frm" action="mailSend" method="post">
<table cellpadding="5">
<tr>
<td>보내는 사람 메일 : </td>
<td><input type="text" name="sender" /></td>
</tr>
<tr>
<td>받는 사람 메일 : </td>
<td><input type="text" name="receiver" /></td>
</tr>
<tr>
<td>메일 제목 : </td>
<td><input type="text" name="title" /></td>
</tr>
<tr>
<td>메일 내용 : </td>
<td><textarea name="content" cols="40" rows="10"></textarea></td>
</tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="메일 보내기" />
</td></tr>
</table>
</form>
</body>
</html>
