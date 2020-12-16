<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String uid = request.getParameter("uid");
String pwd = request.getParameter("pwd");

if (uid.equals("test") && pwd.equals("1234")) {	// 로그인 성공시
	session.setAttribute("loginid", uid);
	out.println("<script>");
	out.println("location.replace('main.jsp');");
	out.println("</script>");
} else {	// 로그인 실패시
	out.println("<script>");
	out.println("alert('로그인에 실패했습니다.');");
	out.println("history.back();");
	out.println("</script>");
}
%>
