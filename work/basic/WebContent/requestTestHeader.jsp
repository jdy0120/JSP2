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
<h1>Request 헤더정보</h1>
<table>
<tr><th>헤더이름</th><th>헤더값</th></tr>
<%
Enumeration e = request.getHeaderNames();
while (e.hasMoreElements()) {
// e.hasMoreElements() : e에 다음 요소가 존재하면
	String headerName = (String)e.nextElement();
	// nextElement()메소드로 다음 요소의 데이터(Object형)를 추출하여 문자열로 형변환
%>
<tr>
<td><%=headerName %></td>
<td><%=request.getHeader(headerName) %></td>
</tr>
<%
}
%>
</table>
</body>
</html>
