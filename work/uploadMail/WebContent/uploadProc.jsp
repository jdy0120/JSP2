<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
String uploadPath = request.getRealPath("/upload");
// 파일을 저장할 실제 위치를 구함
int maxSize = 10 * 1024 * 1024;
// 업로드 최대 용량으로 10MB로 지정
String name = "", title = "";	// 사용자가 입력한 데이터 저장용 변수
String file1 = "", file2 = "";
// 업로드한 파일명을 저장할 변수(업로드시 이름이 바뀔 수도 있음)
String file1_old = "", file2_old = "";	// 업로드한 실제 파일명을 저장할 변수

try {
	MultipartRequest multi = new MultipartRequest(
		request, 	// request객체로 multi로 데이터들을 받기 위함
		uploadPath, // 서버에 실제로 파일이 저장될 위치 지정
		maxSize, 	// 한 번에 업로드할 수 있는 최대크기(byte단위)
		"utf-8", 	// 파일의 인코딩 방식(utf-8, euc-kr, ksc-5601 등)
		new DefaultFileRenamePolicy());	// 파일 이름의 중복 처리

	name = multi.getParameter("name");
	title = multi.getParameter("title");
	// enctype을 'multipart/form-data'로 지정하면 request객체로는 데이터를 받을 수
	// 없고 반드시 업로드 객체로 받아야 함

	Enumeration files = multi.getFileNames();
	// 업로드할 파일 이름들을 Enumeration형으로 받아 옴
	
	String f1 = (String)files.nextElement();
	file1 = multi.getFilesystemName(f1);
	// 현재 업로드된 파일이 저장될 때 사용한 이름
	file1_old = multi.getOriginalFileName(f1);
	// 현재 업로드된 파일의 원래 이름(중복된 이름이 아닐 경우 file1과 동일)
	
	String f2 = (String)files.nextElement();
	file2 = multi.getFilesystemName(f2);
	file2_old = multi.getOriginalFileName(f2);

} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frmFile" action="uploadCheck.jsp" method="post">
<input type="hidden" name="name" value="<%=name %>" />
<input type="hidden" name="title" value="<%=title %>" />
<input type="hidden" name="file1" value="<%=file1 %>" />
<input type="hidden" name="file2" value="<%=file2 %>" />
<input type="hidden" name="file1_old" value="<%=file1_old %>" />
<input type="hidden" name="file2_old" value="<%=file2_old %>" />
</form>
<a href="javascript:document.frmFile.submit();">업로드 확인 및 다운로드 페이지로 이동</a>
</body>
</html>
