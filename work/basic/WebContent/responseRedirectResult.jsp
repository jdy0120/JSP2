<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String test = request.getParameter("test");
// http://localhost:8082/basic/responseRedirect.jsp?test=1234
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>현재 페이지는 responseRedirect.jsp에 의해 리다이렉트된 
responseRedirectResult.jsp파일입니다.<%=test %></h3>
</body>
</html>
