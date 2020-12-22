<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="loginProc.jsp" method="post">
	<table cellpadding='5'>
		<tr><th>아이디 : </th><td><input type="text" name="uid" /></td><td rowspan="2"><input type="submit" value="로그인" style="width:70px; height:70px;"></td></tr>
		<tr><th>암호 : </th><td><input type="password" name="pwd" /></td></tr>
	</table>
</form>
</body>
</html>