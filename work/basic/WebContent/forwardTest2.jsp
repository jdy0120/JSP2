<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String forwardPage = request.getParameter("forwardPage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="<%=forwardPage %>">
	<jsp:param name="phone" value="010-1234-5678" />
</jsp:forward>
<!-- forwardPage변수에 들어있는 위치로 바로 이동(포워딩) -->
<!-- 이동하면서 파라미터를 하나 추가함 -->
</body>
</html>
