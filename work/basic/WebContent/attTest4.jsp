<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>영역과 속성 테스트</h2>
<table border="1" cellpadding="5">
<tr><th colspan="2">Application 영역에 저장된 내용들</th></tr>
<tr><th>이름</th><td><%=application.getAttribute("name") %></td></tr>
<tr><th>아이디</th><td><%=application.getAttribute("id") %></td></tr>
</table>
<br />
<table border="1" cellpadding="5">
<tr><th colspan="2">Session 영역에 저장된 내용들</th></tr>
<%
Enumeration ses = session.getAttributeNames();
while (ses.hasMoreElements()) {
	String name = (String)ses.nextElement();
	String value = (String)session.getAttribute(name);

	out.println("<tr><th>" + name + "</th><td>" + value + "</td></tr>");
}
%>
</table>
</body>
</html>
