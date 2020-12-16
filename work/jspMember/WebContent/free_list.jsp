<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&characterEncoding=utf8&verifyServerCertificate=false&useSSL=false&serverTimezone=UTC";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = null;

request.setCharacterEncoding("utf-8");
String curPage = request.getParameter("cpage");	// 페이지 번호
int cpage = 1;	// 실제로 페이지 번호로 사용할 변수이며 기본값으로 1페이지를 지정
if (curPage != null)	cpage = Integer.parseInt(curPage);
// 페이지 번호를 받아 왔다면 정수로 형변환하여 cpage에 넣음
int psize = 3;	// 한 페이지에서 보여줄 글의 개수
int bsize = 10;	// 한 블럭에서 보여줄 페이지의 개수
int rcnt = 0;	// 총 글 개수
int snum = (cpage - 1) * psize;	// limit 명령에서 데이터를 가져올 시작 인덱스 번호

String schtype = request.getParameter("schtype");
String schval = request.getParameter("schval");
String where = "", args = "", schargs = "";
args = "&cpage=" + cpage;	// 페이징을 제외한 모든 링크에서 가지고 다녀야 할 값

if (schval != null) {
	URLEncoder.encode(schval, "UTF-8");
	// 검색어가 한글일 경우 IE에서 간혹 문제가 생기므로 유니코드로 변환시킴
	schargs = "&schtype=" + schtype + "&schval=" + schval;
	args += schargs;

	if (schtype.equals("tc")) {	// 검색 조건이 '제목+내용' 이면
		where = " and (fl_title like '%" + schval + "%' " + 
			" or fl_content like '%" + schval + "%') ";
	} else {	// 검색조건이 제목 또는 내용 또는 작성자 이면
		where = " and fl_" + schtype + " like '%" + schval + "%' ";
	}
} else {
	schtype = "";	schval = "";
	// 검색을 하지 않았을 경우 schtype으로 equals()메소드를 사용할 때 
	// 오류가 발생하지 않도록 빈 문자열을 넣어줌
}

sql = "select fl_idx, fl_writer, fl_title, fl_reply, fl_date, fl_read " + 
	" from t_free_list where fl_status = 'a' " + where + 
	" order by fl_idx desc limit " + snum + ", " + psize;

String cntSql = "select count(*) from t_free_list " + 
	" where fl_status = 'a' " + where;

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery(cntSql);
	if (rs.next())	rcnt = rs.getInt(1);
	// 글의 총 개수를 rcnt변수에 저장

	rs.close();

} catch(Exception e) {
	out.println(e.getMessage());
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#brdList tr { height:40px; }
#brdList td, #brdList th { border-bottom:1px black solid; }
a:link { color:#4f4f4f; text-decoration:none; }
a:visited { color:#4f4f4f; text-decoration:none; }
a:hover { color:pink; text-decoration:underline; font-weight:bold; }
a:active { color:#f00; text-decoration:none; }	
a:focus { color:#f00; text-decoration:underline; }
</style>
</head>
<body>
<h2>자유 게시판 목록 화면</h2>
<form name="frmSch" method="get">
<table width="700" cellpadding="5">
<tr><td align="right">
	<select name="schtype">
		<option value="title" <% if (schtype.equals("title")) { %>
			selected="selected"<% } %>>제목</option>
		<option value="content" <% if (schtype.equals("content")) { %>
			selected="selected"<% } %>>내용</option>
		<option value="tc" <% if (schtype.equals("tc")) { %>
			selected="selected"<% } %>>제목+내용</option>
		<option value="writer" <% if (schtype.equals("writer")) { %>
			selected="selected"<% } %>>작성자</option>
	</select>
	<input type="text" name="schval" value="<%=schval %>" />
	<input type="submit" value="검색" />
</td></tr>
</table>
</form>
<table width="700" cellpadding="5" cellspacing="0" id="brdList">
<tr>
<th width="8%">번호</th><th width="*">제목</th><th width="15%">작성자</th>
<th width="15%">작성일</th><th width="8%">조회</th>
</tr>
<%
if (rcnt > 0) {	// 게시글이 있으면
	rs = stmt.executeQuery(sql);	// 보여줄 게시글들을 받아 옴
	int seq = rcnt - (psize * (cpage - 1));
	// 현재 페이지의 첫번호 = 전체게시글수 - (페이지크기 * (현재페이지 - 1))
	String title = "", reply = "", lnk = "";
	while (rs.next()) {
		title = rs.getString("fl_title");
		lnk = "<a href='free_preview.jsp?idx=" + rs.getInt("fl_idx") + 
			args + "' title='" + title + "'>";
		if (title.length() > 26)
			title = title.substring(0, 24) + "...";

		reply = "";
		if (rs.getInt("fl_reply") > 0)
			reply = " [" + rs.getInt("fl_reply") + "]";
%>
<tr align="center">
<td><%=seq-- %></td>
<td align="left"><%=lnk + title + "</a>" + reply %></td>
<td><%=rs.getString("fl_writer") %></td>
<td><%=rs.getString("fl_date").substring(2, 10).replace("-", "/") %></td>
<td><%=rs.getString("fl_read") %></td>
</tr>
<%
	}
} else {	// 게시글이 없으면
	out.println("<tr align='center'><td colspan='5'>");
	out.println("검색 결과가 없습니다.</td></tr>");
}
%>
</table>
<br />
<table width="700" cellpadding="5">
<tr>
<td width="*">
<%
int pcnt = 0;	// 전체 페이지 수
if (rcnt > 0) {
	pcnt = rcnt / psize;
	if (rcnt % psize > 0)	pcnt++;
	// 전체 페이지수 = 전체게시물수 / 페이지크기 -> 나머지가 있으면 1증가

	if (cpage == 1) {
		out.println("[<<]&nbsp;&nbsp;[<]&nbsp;&nbsp;");
	} else {
		out.print("<a href='free_list.jsp?cpage=1" + schargs + "'>");
		out.println("[<<]</a>&nbsp;&nbsp;");
		out.print("<a href='free_list.jsp?cpage=" + (cpage - 1) + schargs + "'>");
		out.println("[<]</a>&nbsp;&nbsp;");
	}

	int spage = (cpage - 1) / bsize * bsize + 1;
	// 각 페이지 블록별 시작 페이지 번호 구하기
	for (int i = 1, j = spage ; i <= bsize && j <= pcnt ; i++, j++) {
		if (cpage == j) {
			out.println("&nbsp;<strong>" + j + "</strong>&nbsp;");
		} else {
			out.print("&nbsp;<a href='free_list.jsp?cpage=" + j + schargs + "'>");
			out.println(j + "</a>&nbsp;");
		}
	}

	if (cpage == pcnt) {
		out.println("&nbsp;&nbsp;[>]&nbsp;&nbsp;[>>]");
	} else {
		out.print("&nbsp;&nbsp;<a href='free_list.jsp?cpage=" + (cpage + 1) + schargs + "'>");
		out.println("[>]</a>");
		out.print("&nbsp;&nbsp;<a href='free_list.jsp?cpage=" + pcnt + schargs + "'>");
		out.println("[>>]</a>");
	}
}
%>
</td>
<td width="10%">
	<input type="button" value="글 등록" 
	onclick="location.href='free_form.jsp?wtype=in';" />
</td>
</tr>
</table>
</body>
</html>
