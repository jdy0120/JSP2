<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>application 테스트</h2>
<table border="1">
<tr>
<th>JSP 버전</th>
<td>
	<%=application.getMajorVersion() %>.
	<%=application.getMinorVersion() %>
</td>
</tr>
<tr>
<th>웹서버 정보</th>
<td><%=application.getServerInfo() %></td>
</tr>
<tr>
<th>실제 경로</th>
<td><%=application.getRealPath("/") %></td>
<!-- "/"는 웹사이트의 루트 디렉토리를 의미 -->
</tr>
</table>
</body>
</html>
