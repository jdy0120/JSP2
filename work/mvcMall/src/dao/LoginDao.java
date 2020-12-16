package dao;

import static db.JdbcUtil.*;	// db��Ű�� ���� JdbcUtilŬ������ ���� �޼ҵ���� �����Ӱ� ����ϰڴٴ� �ǹ�
import java.sql.*;
import vo.*;

// �α��� ���� ������ ����� Ŭ����
public class LoginDao {
	private static LoginDao loginDao;
	private Connection conn;
	// Ŭ���� ��ü���� �����ϱ� ���� ��������� ����
	
	private LoginDao() {}
	// �ܺο��� ���������� �ν��Ͻ� �����ϴ� ���� ���� ���� private���� ����
	
	public static LoginDao getInstance() {
	// �ν��Ͻ��� �������ִ� �޼ҵ�� �ϳ��� �ν��Ͻ��� ������Ŵ(Singleton ���)
	// DB�۾��� ���� �ϴ� Ŭ���� Ư���� �������� �ν��Ͻ��� �����Ǹ� �׸�ŭ ���� ���� DB����(Connection)��
	//����Ƿ� ��ü������ �ӵ� ������ ����� �־� �̱��� ����� ���
		if (loginDao == null) {
		// ����� �����LoginDao�� �ν��Ͻ� loginDao�� null�̸�
		// ��, �ν��Ͻ��� �������� �ʾ�����
			loginDao = new LoginDao();
			// LoginDao�� �ν��Ͻ� loginDao����
			// ���� Ŭ�����̹Ƿ� private���� ����� �����ڸ� ȣ���� �� ����
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
			if (rs.next()) { // �α��� ������
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
				// MemberInfoŬ������ �ν��Ͻ� loginMember�� ȸ�������� ����
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
