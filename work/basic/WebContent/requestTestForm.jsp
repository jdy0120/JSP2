<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Request 예제</h1>
<form action="requestTestProc.jsp" method="post">
<table>
<tr>
<td><label for="name">이름</label></td>
<td><input type="text" name="name" id="name" /></td>
</tr>
<tr>
<td>성별</td>
<td>
	<input type="radio" name="gender" value="male" id="male" checked="checked" />
	<label for="male">남자</label>
	<input type="radio" name="gender" value="female" id="female" />
	<label for="female">여자</label>
</td>
</tr>
<tr>
<td>취미</td>
<td>
	<input type="checkbox" name="hobby" value="독서" id="reading" />
	<label for="reading">독서</label>
	<input type="checkbox" name="hobby" value="게임" id="game" />
	<label for="game">게임</label>
	<input type="checkbox" name="hobby" value="축구" id="soccer" />
	<label for="soccer">축구</label>
	<input type="checkbox" name="hobby" value="기타" id="etc" />
	<label for="etc">기타</label>
</td>
</tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="데이터 전송" />
</td></tr>
</table>
</form>
</body>
</html>
