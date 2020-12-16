<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");
String wtype = request.getParameter("wtype");
String mem = request.getParameter("mem");	// 비회원 글 여부
String uid = (String)session.getAttribute("uid");
String pwd = "";
String msg = null;
String writer = "", title = "", content = "";
int idx = 0;
int cpage = Integer.parseInt(request.getParameter("cpage"));// 페이지번호
String args = "?cpage=" + cpage;

String schtype = request.getParameter("schtype");
String schval = request.getParameter("schval");
if (schval != null && !schval.equals("")) {
	args += "&schtype=" + schtype + 
		"&schval=" + URLEncoder.encode(schval, "UTF-8");
}

if (wtype.equals("in")) {			// 글 등록일 경우
	msg = "등록";
	args = "?cpage=1";

} else if (wtype.equals("up")) {	// 글 수정일 경우
	msg = "수정";

	// 글 수정일 경우에만 DB에 연결하여 기존 데이터를 가져옴
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&characterEncoding=utf8&verifyServerCertificate=false&useSSL=false&serverTimezone=UTC";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	idx = Integer.parseInt(request.getParameter("idx"));
	String sql = "select * from t_free_list " + 
		" where fl_status = 'a' and fl_idx = " + idx;

	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "root", "1234");
		stmt = conn.createStatement();
	} catch(Exception e) {
		out.println("오류가 발생했습니다.");
		e.printStackTrace();
	}

	// 현재 글에 대한 수정권한이 있는 지 여부를 검사
	if (mem == null) {
	// 현재 글이 회원글이며, 로그인한 회원이 직접 작성한 글이면
		if (uid == null) {
		// 현재 로그인 상태가 아니면
			out.println("<script>");
			out.println("alert('로그인 후 사용하실수 있습니다.');");
			out.println("location.href='free_view.jsp" + args + "&idx=" + idx + "';");
			out.println("</script>");
		} else {
			sql += " and fl_ismember = 'y' and fl_writer = '" + uid + "'";
			try {
				rs = stmt.executeQuery(sql);
				if (rs.next()) {	// 사용자가 입력한 비밀번호가 맞았을 경우
					writer	= rs.getString("fl_writer");	// 작성자
					title	= rs.getString("fl_title");		// 제목
					content	= rs.getString("fl_content");	// 내용
				} else {	// 사용자가 입력한 비밀번호가 틀렸을 경우
					out.println("<script>");
					out.println("alert('사용권한이 없습니다.');");
					out.println("location.href='free_pwd.jsp" + args + 
						"&wtype=up&idx=" + idx + "';");
					out.println("</script>");
				}

			} catch(Exception e) {
				out.println("오류가 발생했습니다.");
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					stmt.close();
					conn.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	} else {
	// 현재 글이 비회원글이며, 이전 화면에서 비밀번호를 입력하고 들어온 상황
		pwd = request.getParameter("pwd");
		sql += " and fl_pwd = '" + pwd + "'";
		try {
			rs = stmt.executeQuery(sql);
			if (rs.next()) {	// 사용자가 입력한 비밀번호가 맞았을 경우
				writer	= rs.getString("fl_writer");	// 작성자
				title	= rs.getString("fl_title");		// 제목
				content	= rs.getString("fl_content");	// 내용
			} else {	// 사용자가 입력한 비밀번호가 틀렸을 경우
				out.println("<script>");
				out.println("alert('잘못된 비밀번호 입니다.');");
				out.println("location.href='free_pwd.jsp" + args + 
					"&wtype=up&idx=" + idx + "';");
				out.println("</script>");
			}

		} catch(Exception e) {
			out.println("오류가 발생했습니다.");
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

} else {
	out.println("<script>");
	out.println("alert('잘못된 경로로 들어오셨습니다.');");
	out.println("history.back();");
	out.println("</script>");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>자유 게시판 글<%=msg %> 폼</h2>
<form name="frmFree" action="free_proc.jsp<%=args %>" method="post">
<input type="hidden" name="wtype" value="<%=wtype %>" />
<% if (wtype.equals("up")) { %>
<input type="hidden" name="mem" value="<%=mem %>" />
<input type="hidden" name="pwd" value="<%=pwd %>" />
<input type="hidden" name="idx" value="<%=idx %>" />
<% } %>
<table cellpadding="5">
<%
if (wtype.equals("in")) {
// 글 등록상황이면
%>
<tr>
<%	if (uid == null) {	// 비회원일 경우 %>
<th>작성자</th><td><input type="text" name="writer" /></td>
<th>비밀번호</th><td><input type="password" name="pwd" /></td>
<%	} else {	// 로그인 한 회원일 경우 %>
<th>작성자</th><td><%=uid %></td>
<%	} %>
</tr>
<%
} else {
// 글 수정상황이면
	out.println("<tr><th>작성자</th><td>" + writer + "</td></tr>");
}
%>
<tr>
<th>제목</th>
<td colspan="3"><input type="text" name="title" size="60" value="<%=title %>" /></td>
</tr>
<tr>
<th>내용</th>
<td colspan="3"><textarea name="content" rows="10" cols="60"><%=content %></textarea></td>
</tr>
<tr><td colspan="4" align="center">
	<input type="submit" value="글<%=msg %>" />
	<input type="reset" value="다시 입력" />
</td></tr>
</table>
</form>
</body>
</html>
