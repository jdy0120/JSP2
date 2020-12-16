<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String user_id = (String)session.getAttribute("uid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if (user_id == null) { %>
<a href="loginForm.jsp">로그인</a>
<a href="joinForm.jsp">회원가입</a>
<% } else { %>
<a href="logout.jsp">로그아웃</a>
<a href="infoForm.jsp">정보수정</a><br />
<%=user_id %>님 환영합니다.
<% } %>
<br /><hr /><br />
<a href="memberList.jsp">회원 목록</a>
<br /><hr /><br />
<a href="free_list.jsp">자유 게시판</a>
<br /><hr /><br />
<a href="schedule.jsp">일정관리</a>
<br /><hr /><br />
</body>
</html>
