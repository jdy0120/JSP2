<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testmall?useUnicode=true&";
url += "charcterEncoding=utf8&verifyServerCertificate=false&";
url += "useSSL=false&serverTimezone=UTC";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql = "insert into t_member_point (ml_id, mp_point, mp_detail, ";
sql += "mp_order) values ('test6', 1000, '가입축하금', '가입축하금')";
String sql2 = "select * from t_member_point where ml_id = 'test6'";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");

	conn.setAutoCommit(false);
	// 쿼리 실행시 자동으로 commit시키는 것을 사용하지 않겠다는 의미(false)

	stmt = conn.createStatement();
	stmt.executeUpdate(sql);

	rs = stmt.executeQuery(sql2);
	if (!rs.next()) {
	// rs가 비어 있으면(위의 쿼리sql이 정상적으로 동작하지 않았다는 의미)
		conn.rollback();
		// conn.setAutoCommit(false) 이후로 실행한 모든 쿼리를 적용시키지 않겠다는 의미
		// 실행된 쿼리들도 적용시키지 않고 쿼리 실행전으로 되돌린다는 의미
		out.println("<h3>데이터 삽입에 문제가 발생하여 롤백했습니다.</h3>");
	} else {
		conn.commit();
		// conn.setAutoCommit(false) 이후로 실행한 모든 쿼리를 적용시키겠다는 의미
		// 트랜잭션을 시작하면 commit()하기 전까지는 쿼리를 실행해도 적용은 되지 않음
		out.println("<h3>데이터 삽입을 완료하였습니다.</h3>");
	}

	conn.setAutoCommit(true);

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
