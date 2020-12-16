package dao;

import static db.JdbcUtil.*;	// db패키지 내의 JdbcUtil클래스가 가진 메소드들을 자유롭게 사용하겠다는 의미
import java.sql.*;
import vo.*;

// 로그인 관련 쿼리를 만드는 클래스
public class LoginDao {
	private static LoginDao loginDao;
	private Connection conn;
	// 클래스 전체에서 공유하기 위해 멤버변수로 선언
	
	private LoginDao() {}
	// 외부에서 직접적으로 인스턴스 생성하는 것을 막기 위해 private으로 선언
	
	public static LoginDao getInstance() {
	// 인스턴스를 생성해주는 메소드로 하나의 인스턴스만 생성시킴(Singleton 방식)
	// DB작업을 많이 하는 클래스 특성상 여러개의 인스턴스가 생성되면 그만큼 많은 수의 DB연결(Connection)이
	//생기므로 전체적으로 속도 저하의 우려가 있어 싱글톤 방식을 사용
		if (loginDao == null) {
		// 멤버로 선언된LoginDao형 인스턴스 loginDao가 null이면
		// 즉, 인스턴스가 생성되지 않았으면
			loginDao = new LoginDao();
			// LoginDao형 인스턴스 loginDao생성
			// 같은 클래스이므로 private으로 선언된 생성자를 호출할 수 있음
		}
		return loginDao;
	}
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	public MemberInfo getLoginMember(String uid, String pwd) {
		MemberInfo loginMember = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			String sql = "select * from t_member_list where ml_status = 'a' and ml_id = '" + uid + "' and ml_pwd = '" + pwd + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) { // 로그인 성공시
				loginMember = new MemberInfo();
				loginMember.setMlid(rs.getString("ml_id"));
				loginMember.setMlpwd(rs.getString("ml_pwd"));
				loginMember.setMlname(rs.getString("ml_name"));
				loginMember.setMlgender(rs.getString("ml_gender"));
				loginMember.setMlbirth(rs.getString("ml_birth"));
				loginMember.setMlphone(rs.getString("ml_phone"));
				loginMember.setMlemail(rs.getString("ml_email"));
				loginMember.setMldate(rs.getString("ml_date"));
				loginMember.setMllast(rs.getString("ml_last"));
				loginMember.setMlstatus(rs.getString("ml_status"));
				loginMember.setMlpoint(rs.getInt("ml_point"));
				// MemberInfo클래스의 인스턴스 loginMember에 회원정보를 저장
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				close(rs); close(stmt);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return loginMember;
	}
}
