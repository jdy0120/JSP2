<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
// session객체안에 있는 모든 속성을 삭제함(주로 로그아웃용으로 많이 사용됨)
%>
<script>
	location.href="sessionTest1.jsp";
</script>
