<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="beantest" class="test.BeanTest" scope="page" />
<!-- 
test패키지의 BeanTest클래스를 beantest라는 인스턴스로 생성하여 page내에서 사용하겠다는 의미
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>변경 전 : <%=beantest.getName() %></h3>
<!-- beantest인스턴스의 getName()메소드를 실행시킴 -->
<hr />
<jsp:setProperty name="beantest" property="name" value="홍길동" />
<h3>변경 후 : <%=beantest.getName() %></h3>
</body>
</html>
