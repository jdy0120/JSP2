<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String id = request.getParameter("id");

if (name != null && id != null) {
	application.setAttribute("name", name);
	application.setAttribute("id", id);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>영역과 속성 테스트</h2>
<h3><%=name %>님 환영합니다.<br /><%=name %>님의 아이디는 <%=id %>입니다.</h3>
<form action="attrTest3.jsp" method="post">
<table border="1" cellpadding="5">
<tr><th colspan="2">Session 영역에 저장할 내용들</th></tr>
<tr><th>메일</th><td><input type="text" name="mail" /></td></tr>
<tr><th>주소</th><td><input type="text" name="addr" /></td></tr>
<tr><th>전화</th><td><input type="text" name="phone" /></td></tr>
<tr><th colspan="2"><input type="submit" value="전송" /></th></tr>
</table>
</form>
</body>
</html>
