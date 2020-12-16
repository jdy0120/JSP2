<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String mail = request.getParameter("mail");
String addr = request.getParameter("addr");
String phone = request.getParameter("phone");

session.setAttribute("mail", mail);
session.setAttribute("addr", addr);
session.setAttribute("phone", phone);

String name = (String)application.getAttribute("name");
String id = (String)application.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><%=name %>(<%=id %>)님의 정보가 모두 저장되었습니다.</h3>
<a href="attTest4.jsp">정보 확인하러 가기</a>
</body>
</html>
