<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mem" class="test.MemberInfo" />
<jsp:setProperty name="mem" property="*" />
<!-- 클라이언트가 전송하는 파라미터 값이 모두 같은 이름의 빈 객체의 속성값을 할당됨 -->
<!-- 
<jsp:setProperty name="mem" property="uid" param="uid" />
<jsp:setProperty name="mem" property="pwd" param="pwd" />
<jsp:setProperty name="mem" property="name" param="name" />
<jsp:setProperty name="mem" property="phone" param="phone" />
<jsp:setProperty name="mem" property="point" param="point" />
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr><th>아이디</th><td><%=mem.getUid() %>
(<jsp:getProperty property="uid" name="mem"/>)</td></tr>
<tr><th>암호</th><td><%=mem.getPwd() %>
(<jsp:getProperty property="pwd" name="mem"/>)</td></tr>
<tr><th>이름</th><td><%=mem.getName() %>
(<jsp:getProperty property="name" name="mem"/>)</td></tr>
<tr><th>전화</th><td><%=mem.getPhone() %>
(<jsp:getProperty property="phone" name="mem"/>)</td></tr>
<tr><th>포인트</th><td><%=mem.getPoint() %>
(<jsp:getProperty property="point" name="mem"/>)</td></tr>
</table>
</body>
</html>
