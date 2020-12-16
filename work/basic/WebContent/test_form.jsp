<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frmGet" action="test" method="get">
<input type="text" name="txtGet" /><br />
<input type="radio" name="gender" value="m" />남자
<input type="radio" name="gender" value="f" />여자<br />
<input type="submit" value="Get으로 전송" />
</form>
<hr />
<form name="frmForm" action="test" method="post">
<input type="text" name="txtPost" /><br />
<input type="radio" name="isSms" value="y" />SMS 수신
<input type="radio" name="isSms" value="n" />SMS 미수신<br />
<input type="submit" value="Form으로 전송" />
</form>
</body>
</html>
