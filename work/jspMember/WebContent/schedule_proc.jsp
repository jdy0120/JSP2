<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
String w = request.getParameter("w");	// 등록/수정/삭제 여부

String y = null, m = null, d = null, h = null, n = null;
String content = null, stime = null;
if (w.equals("in") || w.equals("up")) {
// 일정에 대한 등록이나 수정일 경우 필요한 데이터들을 받아 옴
	y = request.getParameter("y");	// 연
	m = request.getParameter("m");	// 월
	d = request.getParameter("d");	// 일
	h = request.getParameter("h");	// 시
	n = request.getParameter("n");	// 분
	stime = y + "-" + m + "-" + d + " " + h + ":" + n;	// 일시
	content = request.getParameter("content").trim();	// 일정 내용
}

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	String sql = null;

	if (w.equals("in")) {	// 일정에 대한 등록일 경우
		sql = "insert into t_schedule_list " + 
		"(ml_id, sl_stime, sl_content) values " + 
		"('" + uid + "', '" + stime + "', '" + content + "')";
		System.out.println(sql);

	} else {	// 일정에 대한 수정이나 삭제일 경우
		int idx = Integer.parseInt(request.getParameter("idx"));// 번호
	}

	int result = stmt.executeUpdate(sql);
	out.println("<script>");
	if (result > 0) {
		out.println("location.href='schedule.jsp?y=" + y + "&m=" + m + "';");
	} else {
		out.println("오류가 발생했습니다.");
		out.println("location.href='schedule.jsp';");
	}
	out.println("</script>");

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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
