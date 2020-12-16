<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Cookie cookie = new Cookie("language", request.getParameter("language"));
// language라는 이름에 이전 페이지에서 받아온 language컨트롤의 값을 넣어 쿠키를 생성
cookie.setMaxAge(60 * 60 * 24);
// 생성된 쿠키는 하루 24시간의 생존시간을 가짐(초단위)
response.addCookie(cookie);
// 생성한 쿠키(cookie)를 사용자 PC에 저장
%>
<script>
	location.href = "cookieTest3.jsp";
</script>
