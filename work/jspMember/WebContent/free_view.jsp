<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");
String uid = (String)session.getAttribute("uid");
int idx = Integer.parseInt(request.getParameter("idx"));
// 글번호는 필수요소이며 정수형 데이터이므로 int형으로 형변환하여 사용해도 됨
// 인잭션 공격을 피하기 위한 가장 쉬운 해법
int cpage = Integer.parseInt(request.getParameter("cpage"));// 페이지번호
String args = "?cpage=" + cpage;

String schtype = request.getParameter("schtype");
String schval = request.getParameter("schval");
if (schval != null && !schval.equals("")) {
	args += "&schtype=" + schtype + 
		"&schval=" + URLEncoder.encode(schval, "UTF-8");
}

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&characterEncoding=utf8&verifyServerCertificate=false&useSSL=false&serverTimezone=UTC";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "select * from t_free_list " + 
	" where fl_status = 'a' and fl_idx = " + idx;

String ismember = null, writer = null, title = null; 
String content = null, date = null, ip = null;
int read = 0, good = 0, bad = 0;

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if (rs.next()) {
		ismember= rs.getString("fl_ismember");	// 회원여부
		writer	= rs.getString("fl_writer");	// 작성자
		title	= rs.getString("fl_title");		// 제목
		content	= rs.getString("fl_content").replace("\r\n", "<br />");
		date	= rs.getString("fl_date");		// 작성일
		ip		= rs.getString("fl_ip");		// ip주소
		read	= rs.getInt("fl_read");			// 조회수
		good	= rs.getInt("fl_good");			// 좋아요 수
		bad		= rs.getInt("fl_bad");			// 싫어요 수
	} else {	// 글이 존재하지 않으면
		out.println("<script>");
		out.println("alert('잘못된 경로로 들어오셨습니다.');");
		out.println("location.href='index.jsp';");
		out.println("</script>");
	}

} catch(Exception e) {
	out.println("오류가 발생했습니다.");
	e.printStackTrace();
} finally {
	try {
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>자유 게시판 글보기 화면</h2>
<table cellpadding="5">
<tr>
<th>작성자</th><td><%=writer %></td>
<th>조회수</th><td><%=read %></td>
</tr>
<tr>
<th>작성일</th><td><%=date %></td>
<th>좋아/싫어</th><td><%=good + " / " + bad %></td>
</tr>
<tr><th>제목</th><td colspan="3"><%=title %></td></tr>
<tr><th>내용</th><td colspan="3"><%=content %></td></tr>
<tr><td colspan="4" align="center">
	<input type="button" value="목록으로" 
		onclick="location.href='free_list.jsp<%=args %>';" />
<%
boolean isPms = false;	// 수정 및 삭제 권한이 있는지 여부를 저장할 변수
String link1 = null, link2 = null;
if (ismember.equals("n")) {		// 비회원이 입력한 글이면
	isPms = true;
	link1 = "location.href='free_pwd.jsp" + args + "&wtype=up&idx=" + idx + "';";
	link2 = "location.href='free_pwd.jsp" + args + "&wtype=del&idx=" + idx + "';";
} else if (uid != null && uid.equals(writer)) {
// 현재 로그인한 회원과 작성자가 같으면
	isPms = true;
	link1 = "location.href='free_form.jsp" + args + "&wtype=up&idx=" + idx + "';";
	link2 = "notCool(" + idx + ");";
}

if (isPms) {
	if (ismember.equals("y")) {
%>
<script>
function notCool(idx) {
	if (confirm("정말 삭제하시겠습니까?")) {
		location.href="free_proc.jsp?wtype=del&idx=" + idx;
	}
}
</script>
<%
	}
%>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="수정" onclick="<%=link1 %>" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="삭제" onclick="<%=link2 %>" />
<% } %>
</td></tr>
</table>
</body>
</html>
