<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String title = request.getParameter("title");
String file1 = request.getParameter("file1");
String file2 = request.getParameter("file2");
String file1_old = request.getParameter("file1_old");
String file2_old = request.getParameter("file2_old");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>파일 업로드 결과</h3>
<table cellpadding="5">
<tr><td>업로더</td><td><%=name %></td></tr>
<tr><td>제목</td><td><%=title %></td></tr>
<tr>
<td>파일명1</td>
<td><a href="file_download.jsp?file=<%=file1%>"><%=file1_old%></a></td>
</tr>
<tr>
<td>파일명2</td>
<td><a href="file_download.jsp?file=<%=file2%>"><%=file2_old%></a></td>
</tr>
</table>
</body>
</html>
