<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name1 = "세션값 없음", name2 = "세션값 없음";
if (session.getAttribute("name1") != null)
	name1 = (String)session.getAttribute("name1");
if (session.getAttribute("name2") != null)
	name2 = (String)session.getAttribute("name2");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>세션 테스트</h2>
<input type="button" value="세션 속성값 저장" onclick="location.href='sessionSet.jsp';" />
<!-- name1, name2 라는 속성을 만들어 각각 '홍길동', '전우치' 라는 값을 저장 -->

<input type="button" value="세션 속성값 삭제" onclick="location.href='sessionDel.jsp';" />
<!-- name1이라는 속성만 삭제 -->

<input type="button" value="세션 속성값 초기화" onclick="location.href='sessionInvalid.jsp';" />
<!-- 모든 세션 속성을 삭제시킴 -->
<br /><br />
name1 : <%=name1 %><br />
name2 : <%=name2 %>
<!-- 세션속성 값 출력(없으면 '세션값 없음' 출력) -->
</body>
</html>
