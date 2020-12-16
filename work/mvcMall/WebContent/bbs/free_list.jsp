<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
ArrayList<FreeInfo> articleList = (ArrayList<FreeInfo>)request.getAttribute("articleList");
// 화면에서 보여줄 게시글들의 목록

PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
// 페이징에 필요한 각종 데이터들을 담은 인스턴스

String schtype = pageInfo.getSchtype(); // 검색조건
String keyword = pageInfo.getKeyword(); // 검색어
if (schtype == null || keyword == null) {
	schtype = ""; keyword = "";
}
int cpage = pageInfo.getCpage(); // 현재 페이지 번호
int pcnt = pageInfo.getPcnt(); // 전체 페이지 수
int spage = pageInfo.getSpage(); // 블록 시작 페이지 번호
int epage = pageInfo.getEpage(); // 블록 종료 페이지 번호
int rcnt = pageInfo.getRcnt(); // 검색된 게시물 개수
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#brdList tr { height:40px; }
#brdList td, #brdList th { border-bottom:1px black solid; }
a:link { color:#4f4f4f; text-decoration:none; }
a:visited { color:#4f4f4f; text-decoration:none; }
a:hover { color:pink; text-decoration:underline; font-weight:bold; }
a:active { color:#f00; text-decoration:none; }	
a:focus { color:#f00; text-decoration:underline; }
</style>
<body>
<h2>자유 게시판 목록 화면</h2>
<table width="700" cellpadding="5" cellspacing="0" id="brdList">
<tr>
<th width="8%">번호</th><th width="*">제목</th><th width="15%">작성자</th>
<th width="15%">작성일</th><th width="8%">조회</th>
</tr>
<%
if (articleList != null) {
	int seq = rcnt - (10 * (cpage-1));
	String title = "", reply = "", lnk = "";
	for (int i = 0; i < articleList.size() ; i++) {
		title = articleList.get(i).getFl_title();
		lnk = "<a href='free_preview.jsp?idx=" + articleList.get(i).getFl_idx() + 
			"' title='" + title + "'>";
		if (title.length() > 28)
			title = title.substring(0, 24) + "...";

		reply = "";
		if (articleList.get(i).getFl_reply() > 0)
			reply = " [" + articleList.get(i).getFl_reply() + "]";
%>
<tr align="center">
<td><%=seq-- %></td>
<td align="left"><%=lnk + title + "</a>" + reply %></td>
<td><%=articleList.get(i).getFl_writer() %></td>
<td><%=articleList.get(i).getFl_date().substring(2, 10) %></td>
<td><%=articleList.get(i).getFl_read() %></td>
</tr>
<%
	}
} else {
	out.println("<tr align='center'><td colspan='5'");
	out.println("검색 결과가 없습니다.</td></tr>");
}
%>
</body>
</html>