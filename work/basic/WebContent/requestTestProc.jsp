<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
// 받아오는 값들의 인코딩을 유니코드로 변환(한글 깨짐현상을 없애기 위해)
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String[] arrHobby = request.getParameterValues("hobby");

if (gender.equals("male"))	gender = "남자";
else						gender = "여자";

String hobby = "취미가 없습니다.";
if (arrHobby != null) {	// 선택한 취미가 있을 경우
	hobby = "";
	for (int i = 0 ; i < arrHobby.length ; i++) {
		hobby += ", " + arrHobby[i];
	}
	hobby = hobby.substring(2);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Request 결과</h1>
<table>
<tr><td>이름</td><td><%=name %></td></tr>
<tr><td>성별</td><td><%=gender %></td></tr>
<tr><td>취미</td><td><%=hobby %></td></tr>
<tr><td colspan="2" align="center">
	<input type="button" value="뒤로 가기" onclick="history.back();" />
</td></tr>
</table>
</body>
</html>
