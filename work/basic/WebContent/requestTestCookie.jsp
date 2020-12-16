<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Request Cookie, URL/URI, 요청방식에 관한 정보</h2>
<table border="1">
<tr>
<th>쿠키 정보</th>
<%
Cookie[] cookie = request.getCookies();
// 쿠키배열을 생성
if (cookie == null) {
	out.println("<td>쿠키가 없습니다.</td>");
} else {
	for (int i = 0 ; i < cookie.length ; i++) {
		out.println("<td>" + cookie[i].getName());
		out.println("(" + cookie[i].getValue() + ")");
	}
}
%>
<tr><th>서버 도메인명</th><td><%=request.getServerName() %></td></tr>
<tr><th>서버 포트번호</th><td><%=request.getServerPort() %></td></tr>
<tr><th>요청 URL</th><td><%=request.getRequestURL() %></td></tr>
<tr><th>요청 URI</th><td><%=request.getRequestURI() %></td></tr>
<tr><th>요청 쿼리</th><td><%=request.getQueryString() %></td></tr>
<tr><th>클라이언트 호스트</th><td><%=request.getRemoteHost() %></td></tr>
<tr><th>클라이언트 IP</th><td><%=request.getRemoteAddr() %></td></tr>
<tr><th>프로토콜</th><td><%=request.getProtocol() %></td></tr>
<tr><th>요청 방식</th><td><%=request.getMethod() %></td></tr>
<tr><th>컨텍스트 경로</th><td><%=request.getContextPath() %></td></tr>
</table>
</body>
</html>
