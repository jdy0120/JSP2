<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
FreeInfo article = (FreeInfo)request.getAttribute("article");
if (article == null) {
	out.println("<script>");
	out.println("alert('잘못된 경로로 들어오셨습니다.');");
	out.println("history.back();");
	out.println("</script>");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>자유 게시판 글보기 화면</h2>
<table cellpadding="5">
<tr>
<th>작성자</th><td><%=article.getFl_writer() %></td>
<th>조회수</th><td><%=article.getFl_read() %></td>
</tr>
<tr>
<th>작성일</th><td><%=article.getFl_date() %></td>
<th>좋아/싫어</th><td><%=article.getFl_good() + " / " + article.getFl_bad() %></td>
</tr>
<tr><th>제목</th><td colspan="3"><%=article.getFl_title() %></td></tr>
<tr><th>내용</th>
<td colspan="3"><%=article.getFl_content().replace("\r\n", "<br />") %></td></tr>
<tr><td colspan="4" align="center">
	<input type="button" value="목록으로" 
		onclick="location.href='';" />
</td></tr>
</table>
</body>
</html>
