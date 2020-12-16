<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String pageFile = request.getParameter("page");
if (pageFile == null)	pageFile = "NewItem";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table { margin:auto; width:960px; color:gray; border:1px solid gray; }
</style>
</head>
<body>
<table>
<tr height="43"><td colspan="3">
	<jsp:include page="tmpTop.jsp"></jsp:include>
</td></tr>
<tr>
<td width="15%" align="right" valign="top"><br />
	<jsp:include page="tmpLeft.jsp"></jsp:include></td>
<td colspan="2" align="center">
	<jsp:include page='<%="tmp" + pageFile + ".jsp" %>'></jsp:include></td>
</tr>
<tr height="40"><td colspan="3">
	<jsp:include page="tmpBottom.jsp"></jsp:include>
</td></tr>
</table>
</body>
</html>
