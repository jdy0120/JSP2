<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");
String uid = (String)session.getAttribute("uid");
String wtype = request.getParameter("wtype");
String mem = request.getParameter("mem");	// 비회원 글 여부
String writer = request.getParameter("writer");
String pwd = request.getParameter("pwd");
String title = request.getParameter("title");
String content = request.getParameter("content");
int cpage = Integer.parseInt(request.getParameter("cpage"));// 페이지번호
String args = "?cpage=" + cpage;

String schtype = request.getParameter("schtype");
String schval = request.getParameter("schval");
if (schval != null && !schval.equals("")) {
	args += "&schtype=" + schtype + 
		"&schval=" + URLEncoder.encode(schval, "UTF-8");
}

if (uid == null && wtype.equals("in")) {	// 비회원일 경우
	writer = writer.trim();
	pwd = pwd.trim();
}

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&characterEncoding=utf8&verifyServerCertificate=false&useSSL=false&serverTimezone=UTC";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = null;
String link = null, msg = null;

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();

	if (wtype.equals("in")) {			// 글 등록시
		int idx = 1;
		sql = "select max(fl_idx) + 1 from t_free_list";
		// 글번호 생성을 위한 쿼리
		rs = stmt.executeQuery(sql);
		if (rs.next())	idx = rs.getInt(1);
		char ismember = 'n';
		String ip = request.getRemoteAddr();
		if (uid != null) {
			ismember = 'y';
			writer = uid;
			pwd = "";
		}
		sql = "insert into t_free_list (fl_idx, fl_ismember, " + 
			"fl_writer, fl_pwd, fl_title, fl_content, fl_ip) values " + 
			"('" + idx + "', '" + ismember + "', '" + writer + "', '" + 
			pwd + "', '" + title + "', '" + content + "', '" + ip + "')";

		int result = stmt.executeUpdate(sql);
		if (result != 0) {
			link = "free_view.jsp" + args + "&idx=" + idx;
		} else {
			link = "free_form.jsp" + args + "&wtype=in";
			msg = "글 등록시 문제가 발생했습니다.";
		}

	} else if (wtype.equals("up")) {	// 글 수정시
		int idx = Integer.parseInt(request.getParameter("idx"));

		if (mem == null) {	// 회원이 입력한 글이면
			sql = "select 'y' from t_free_list where fl_ismember = 'y' " + 
			"and fl_idx = " + idx + " and fl_writer = '" + uid + "'";
			// 글입력자와 현재 로그인한 회원이 같은지 검사하는 쿼리
			rs = stmt.executeQuery(sql);
			if (!rs.next()) {	// 삭제권한이 없을 경우
				out.println("<script>");
				out.println("alert('삭제 권한이 없습니다.');");
				out.println("location.href='free_list.jsp';");
				out.println("</script>");
			}
		} else {	// 비회원이 입력한 글이면
			sql = "select 'y' from t_free_list " + 
			"where fl_idx = " + idx + " and fl_pwd = '" + pwd + "'";
			// 비밀번호 검사용 쿼리
			rs = stmt.executeQuery(sql);
			if (!rs.next()) {	// 비밀번호가 틀릴 경우
				out.println("<script>");
				out.println("alert('잘못된 비밀번호 입니다.');");
				out.println("location.href='index.jsp';");
				out.println("</script>");
			}
		}

		sql = "update t_free_list set fl_title = '" + title + "', " +
			" fl_content = '" + content + "' where fl_idx = " + idx;
		int result = stmt.executeUpdate(sql);
		link = "free_view.jsp" + args + "&idx=" + idx;

	} else if (wtype.equals("del")) {	// 글 삭제시
		int idx = Integer.parseInt(request.getParameter("idx"));

		if (mem == null) {	// 회원이 입력한 글이면
			sql = "select 'y' from t_free_list where fl_ismember = 'y' " + 
			"and fl_idx = " + idx + " and fl_writer = '" + uid + "'";
			// 글입력자와 현재 로그인한 회원이 같은지 검사하는 쿼리
			rs = stmt.executeQuery(sql);
			if (!rs.next()) {	// 비밀번호가 틀릴 경우
				out.println("<script>");
				out.println("alert('삭제 권한이 없습니다.');");
				out.println("location.href='free_list.jsp';");
				out.println("</script>");
			}
		} else {	// 비회원이 입력한 글이면
			sql = "select 'y' from t_free_list " + 
			"where fl_idx = " + idx + " and fl_pwd = '" + pwd + "'";
			// 비밀번호 검사용 쿼리
			rs = stmt.executeQuery(sql);
			if (!rs.next()) {	// 비밀번호가 틀릴 경우
				out.println("<script>");
				out.println("alert('잘못된 비밀번호 입니다.');");
				out.println("location.href='" + 
					"free_pwd.jsp" + args + "&wtype=del&idx=" + idx + "';");
				out.println("</script>");
			}
		}

		sql = "update t_free_list set fl_status = 'b' " +
			" where fl_idx = " + idx;
		int result = stmt.executeUpdate(sql);
		if (result != 0) {
			link = "free_list.jsp";
		} else {
			link = "free_view.jsp" + args + "&idx=" + idx;
			msg = "글 삭제시 문제가 발생했습니다.";
		}
	}

	out.println("<script>");
	if (msg != null)	out.println("alert('" + msg + "');");
	out.println("location.href='" + link + "';");
	out.println("</script>");

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
