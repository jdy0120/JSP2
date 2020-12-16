<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
Calendar c = Calendar.getInstance();
int h = c.get(Calendar.HOUR_OF_DAY);
int m = c.get(Calendar.MINUTE);
int s = c.get(Calendar.SECOND);

// http://localhost:8082/basic/scriptlet.jsp?start=1&end=100
int a = 1, b = 100;
if (request.getParameter("start") != null)
	a = Integer.parseInt(request.getParameter("start"));
if (request.getParameter("end") != null)
	b = Integer.parseInt(request.getParameter("end"));
// 받아 온 값은 무조건 문자열이므로 정수형으로 형변환해야 함
%>
<%!
public int sum(int a, int b) {
	int total = 0;
	for (int i = a ; i <= b ; i++) {
		total += i;
	}
	return total;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>현재 시간은 <%=h %>시 <%=m %>분 <%=s %>초 입니다.</h1>
<h2><%=a %>부터 <%=b %>까지의 합은 <%=sum(a, b) %>입니다.</h2>
</body>
</html>
