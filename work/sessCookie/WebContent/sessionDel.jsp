<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("name1");
//session객체 안의 name1이라는 속성(attribute)을 삭제
%>
<script>
	location.href="sessionTest1.jsp";
</script>
