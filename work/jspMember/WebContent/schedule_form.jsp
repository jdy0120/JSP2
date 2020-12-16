<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
String uid = (String)session.getAttribute("uid");
if (uid == null) {
	out.println("<script>");
	out.println("alert('로그인 후에 사용하실 수 있습니다.');");
	out.println("location.href='loginForm.jsp';");
	out.println("</script>");
}

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&characterEncoding=utf8&verifyServerCertificate=false&useSSL=false&serverTimezone=UTC";

Connection conn = null;
Statement stmt = null;

request.setCharacterEncoding("utf-8");
String w = request.getParameter("w");	// 등록/수정 여부
int y = Integer.parseInt(request.getParameter("y"));	// 연
int m = Integer.parseInt(request.getParameter("m"));	// 월
int d = Integer.parseInt(request.getParameter("d"));	// 일

Calendar curTime = Calendar.getInstance();	// 현재 시간
int cYear = curTime.get(Calendar.YEAR);		// 올해 연도
int h = curTime.get(Calendar.HOUR_OF_DAY);	// 현재 시각(0~23)
int n = curTime.get(Calendar.MINUTE);		// 현재 분(0~59)
String content = "", msg = "";
int idx = 0;	// 일정번호를 저장할 변수로 수정일 경우에만 사용됨

if (w.equals("in")) {	// 일정 등록일 경우
	msg = "등록";

} else if (w.equals("up")) {	// 일정 수정일 경우
	idx = Integer.parseInt(request.getParameter("idx"));

	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "root", "1234");
		stmt = conn.createStatement();
	
	} catch(Exception e) {
		out.println(e.getMessage());
	} finally {
		try {
			stmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
} else {
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
<h2>일정 <%=msg %> 폼</h2>
<form name="frmSchedule" action="schedule_proc.jsp" method="post">
<input type="hidden" name="w" value="<%=w %>" />
<input type="hidden" name="idx" value="<%=idx %>" />
<table width="600" cellpadding="5">
<tr>
<th width="15%">일시</th>
<td>
	<select name="y">
<% for (int i = 1988 ; i <= (cYear + 1) ; i++) { %>
		<option value="<%=i %>" 
			<% if (y == i) { %>selected="selected"<% } %>><%=i %></option>
<% } %>
	</select> 년&nbsp;&nbsp;
	<select name="m">
<%
for (int i = 1 ; i <= 12 ; i++) {
	String sn = i + "";
	if (i < 10)	sn = "0" + sn;
%>
		<option value="<%=sn%>" 
			<% if (m == i) { %>selected="selected"<% } %>><%=sn%></option>
<% } %>
	</select> 월&nbsp;&nbsp;
	<select name="d">
<%
for (int i = 1 ; i <= 31 ; i++) {
	String sn = i + "";
	if (i < 10)	sn = "0" + sn;
%>
		<option value="<%=sn%>" 
			<% if (d == i) { %>selected="selected"<% } %>><%=sn%></option>
<% } %>
	</select> 일&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="h">
<%
for (int i = 0 ; i <= 23 ; i++) {
	String sn = i + "";
	if (i < 10)	sn = "0" + sn;
%>
		<option value="<%=sn%>" 
			<% if (h == i) { %>selected="selected"<% } %>><%=sn%></option>
<% } %>
	</select> 시&nbsp;&nbsp;
	<select name="n">
<%
for (int i = 0 ; i <= 59 ; i++) {
	String sn = i + "";
	if (i < 10)	sn = "0" + sn;
%>
		<option value="<%=sn%>" 
			<% if (n == i) { %>selected="selected"<% } %>><%=sn%></option>
<% } %>
	</select> 분
</td>
</tr>
<tr>
<th>일정 내용</th>
<td><textarea name="content" rows="5" cols="60"><%=content %></textarea></td>
</tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="일정 <%=msg %>" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="reset" value="다시 입력" />
</td></tr>
</table>
</form>
</body>
</html>
