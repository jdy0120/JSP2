<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = "", value = "", cookie = request.getHeader("Cookie");
// 헤더중 Cookie에 해당하는 값을 cookie에 담음

if (cookie != null) {	// 쿠키가 있으면(세션쿠키도 포함됨)
	Cookie[] cookies = request.getCookies();
	// request객체의 쿠키배열을 cookies배열에 담음
	for (int i = 0 ; i < cookies.length ; i++) {
	// 모든 쿠키를 접근하여 검사함
		if (cookies[i].getName().equals("name")) {
		// 쿠키의 이름이 "name"이면
			name = cookies[i].getName();	// 쿠키의 이름 저장
			value = cookies[i].getValue();	// 쿠키의 값 저장
		}
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>쿠키 이름 : <%=name %></h2>
<h2>쿠키 값 : <%=value %></h2>
</body>
</html>
