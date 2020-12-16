<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str = "body string";
%>
<%!
String str2 = "member variable";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="inc_header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>inc_body.jsp 파일입니다.<%=str + i + str2 + str3 %></h1>
<%@ include file="inc_footer.jsp" %>
</body>
</html>
