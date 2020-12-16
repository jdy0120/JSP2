<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>좋아하는 취미</h2>
<form action="multi" method="post">
이름 : <input type="text" name="name" /><br />
결혼여부 : 
<input type="radio" name="isMarry" value="y" checked="checked" />기혼
<input type="radio" name="isMarry" value="n" />미혼<br />
취미 : 
<input type="checkbox" name="hobby" value="영화" />영화
<input type="checkbox" name="hobby" value="독서" />독서
<input type="checkbox" name="hobby" value="음악" />음악
<input type="checkbox" name="hobby" value="자전거" />자전거
<input type="checkbox" name="hobby" value="게임" />게임
<input type="checkbox" name="hobby" value="헬스" />헬스<br />
<input type="submit" value="전송" />
</form>
</body>
</html>
