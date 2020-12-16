<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>포워드된 페이지(forwardTest3.jsp)</h2>
<table>
<tr><th>이름</th><td><%=request.getParameter("name") %></td></tr>
<tr><th>나이</th><td><%=request.getParameter("age") %></td></tr>
<tr><th>전화</th><td><%=request.getParameter("phone") %></td></tr>
<!-- 
name과 age는 Test1파일에서 보낸 값이지만 Test2에서 forward했기 때문에 
Test3에서 Test2의 request객체를 받아 사용할 수 있음
 -->
</table>
</body>
</html>
