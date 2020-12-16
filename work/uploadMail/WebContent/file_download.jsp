<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.*" %>
<%
request.setCharacterEncoding("utf-8");
String fileName = request.getParameter("file");
String savePath = "upload";	// 파일이 저장된 위치

ServletContext context = getServletContext();
String downPath = context.getRealPath(savePath);
String filePath = downPath + "\\" + fileName;

byte[] b = new byte[4096];	// 한 번에 다운될 크기로 4KB
FileInputStream in = new FileInputStream(filePath);
String mimeType = getServletContext().getMimeType(filePath);

System.out.println("Mime Type >>> " + mimeType);

if (mimeType == null)	mimeType = "application/octet-stream";

response.setContentType(mimeType);
String agent = request.getHeader("User-Agent");
boolean ie = (agent.indexOf("MSIE") > -1) 
	|| (agent.indexOf("Trident") > -1);
// 현재 브라우저가 IE인지 여부를 저장하는 변수(한글이나 띄어쓰기가 깨지지 않게 하기 위해)

if (ie) {
	fileName = URLEncoder.encode(fileName, "utf-8")
		.replaceAll("\\+", "%20");
	// 파일명에 띄어쓰기가 있을 경우 IE는 '+'로 변경하나, 파일 다운로드시 '+'를 사용할 순
	// 없으므로 다시 띄어쓰기로 변환하는 작업
} else {
	fileName = new String(fileName.getBytes("utf-8"), "iso-8859-1");
}

response.setHeader("Content-Disposition", 
		"attachment; filename=" + fileName);

ServletOutputStream out2 = response.getOutputStream();
int numRead;
while ((numRead = in.read(b, 0, b.length)) != -1) {
// 배열에 데이터가 들어 있으면
	out2.write(b, 0, numRead);
	// 읽어들인 데이터를 out2를 통해 사용자에게 다운로드 시킴
}
out2.flush();	// out2에 남아 있는 데이터가 있으면 모두 다운로드 시키라는 의미
out2.close();	// out2를 닫음
in.close();		// in을 닫음
%>
