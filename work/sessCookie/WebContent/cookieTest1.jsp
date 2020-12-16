<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Cookie cookie = new Cookie("name", "hong-gildong");
// 쿠키 생성(name이라는 이름에 'hong-gildong'이라는 값을 저장)
cookie.setMaxAge(600);	// 600초 동안 쿠키를 사용
response.addCookie(cookie);	// 클라이언트에 생성한 쿠키를 보냄
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><%=cookie.getName() %></h2>
<h2><%=cookie.getValue() %></h2>
<h2><%=cookie.getMaxAge() %></h2>
<a href="cookieTest2.jsp">쿠키값 불러오기</a>
</body>
</html>
