package dao;

import static db.JdbcUtil.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.sql.*;
import java.util.*;
import vo.*;

public class FreeDao {
	private static FreeDao freeDao;
	// �ν��Ͻ��� �ϳ��� ����� ���� static���� ����
	private Connection conn;

	private FreeDao() {}
	// �⺻�����ڷ� �ܺο��� �Ժη� �������� ���ϰ� private���� ����
	
	public static FreeDao getInstance() {
		// FreeDao�� �ν��Ͻ��� �������� �����ϴ� �޼ҵ�� �ν��Ͻ� ���� �ܺο��� ������ �� �ֵ��� static���� �����
		if (freeDao == null) { // ���� ������ �ν��Ͻ��� ������
			freeDao = new FreeDao(); // ���Ӱ� �ν��Ͻ� ����
		}
		return freeDao;
	}
	
	public void setConnection(Connection conn) {
	// ��Ŭ������ DB�۾��� ���� Connection��ü�� �޾ƿ��� �޼ҵ�
		this.conn = conn;
	}

	public int getArticleCount(String where) {
	// �˻��� �Խñ��� �� ������ �����ϴ� �޼ҵ�
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		int result = 0;
		
		try {
			sql = "select count(*) from t_free_list " + 
				" where fl_status = 'a' " + where;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())	result = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("getArticleCount() ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}
		
		return result;
	}

	public ArrayList<FreeInfo> getArticleList(String where, int cpage, int limit) {
	// �˻��� �Խñ� ����� ArrayList���·� �����ϴ� �޼ҵ�
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<FreeInfo> articleList = new ArrayList<FreeInfo>();
		// �˻� ����� ������ ArrayList��ü
		FreeInfo freeInfo = null;
		// articleList�� ���� ���ڵ带 ������ �ν��Ͻ�
		int snum = (cpage - 1) * limit;
		// ������ limit ��ɿ��� �����͸� ������ ���� �ε��� ��ȣ

		try {
			sql ="select * from t_free_list where fl_status = 'a' " + 
			where + " order by fl_idx desc limit " + snum + ", " + limit;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
			// rs�� ����� ��� �׳� �� ���·� �����ϱ� ���� if�� ������� �ʰ� �ٷ� while�� ���
				freeInfo = new FreeInfo();
				// �ϳ��� ���ڵ�(�Խñ�)�� ������ �ν��Ͻ� ����

				freeInfo.setFl_idx(rs.getInt("fl_idx"));
				freeInfo.setFl_reply(rs.getInt("fl_reply"));
				freeInfo.setFl_read(rs.getInt("fl_read"));
				freeInfo.setFl_good(rs.getInt("fl_good"));
				freeInfo.setFl_bad(rs.getInt("fl_bad"));
				freeInfo.setFl_ismember(rs.getString("fl_ismember"));
				freeInfo.setFl_writer(rs.getString("fl_writer"));
				freeInfo.setFl_pwd(rs.getString("fl_pwd"));
				freeInfo.setFl_title(rs.getString("fl_title"));
				freeInfo.setFl_content(rs.getString("fl_content"));
				freeInfo.setFl_date(rs.getString("fl_date"));
				freeInfo.setFl_status(rs.getString("fl_status"));
				freeInfo.setFl_ip(rs.getString("fl_ip"));
				// �޾ƿ� ���ڵ��� freeInto �ν��Ͻ��� ������� ������ ����

				articleList.add(freeInfo);
				// ������ FreeInfo�� �ν��Ͻ��� articleList �ϳ��� ����
			}
		} catch(Exception e) {
			System.out.println("getArticleList() ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return articleList;
	}
	
	public int setCountUp(int idx) {
	// �Խñ� ��ȸ�� ���� �޼ҵ�
		Statement stmt = null;
		String sql = null;
		int result = 0;
		
		try {
			sql = "update t_free_list set fl_read = fl_read + 1 " + 
				" where fl_idx = " + idx;
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch(Exception e) {
			System.out.println("setCountUp() ����");
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}

	public FreeInfo getArticle(int idx) {
	// ������ �Խù��� �����͸� FreeInfo�� �ν��Ͻ��� �����ϴ� �޼ҵ�
		FreeInfo article = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			sql = "select * from t_free_list " + 
				" where fl_status = 'a' and fl_idx = " + idx;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				article = new FreeInfo();
				article.setFl_idx(rs.getInt("fl_idx"));
				article.setFl_reply(rs.getInt("fl_reply"));
				article.setFl_read(rs.getInt("fl_read"));
				article.setFl_good(rs.getInt("fl_good"));
				article.setFl_bad(rs.getInt("fl_bad"));
				article.setFl_ismember(rs.getString("fl_ismember"));
				article.setFl_writer(rs.getString("fl_writer"));
				article.setFl_pwd(rs.getString("fl_pwd"));
				article.setFl_title(rs.getString("fl_title"));
				article.setFl_content(rs.getString("fl_content"));
				article.setFl_date(rs.getString("fl_date"));
				article.setFl_status(rs.getString("fl_status"));
				article.setFl_ip(rs.getString("fl_ip"));
				// �޾ƿ� ���ڵ��� article �ν��Ͻ��� ���� ���� ����
			}
		} catch(Exception e) {
			System.out.println("getArticle() ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return article;
	}

	public int freeInsert(FreeInfo freeInfo) {
	// �Խñ� ��� �޼ҵ�
		PreparedStatement pstmt = null;
		ResultSet rs = null;	// ����� �Խñ��� ��ȣ�� ��� ���� ResultSet
		int idx = 1, result = 0;	// ���ο� �۹�ȣ�� ���� ���� ��� ������ ������ ����
		String sql = null;

		try {
			sql = "select max(fl_idx) + 1 from t_free_list";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())	idx = rs.getInt(1);
			// ����� �Խñ��� ���ο� �۹�ȣ ����
			
			sql = "insert into t_free_list (fl_idx, fl_ismember, " + 
				"fl_writer, fl_pwd, fl_title, fl_content, fl_ip) " + 
				"values (?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, freeInfo.getFl_ismember());
			pstmt.setString(3, freeInfo.getFl_writer());
			pstmt.setString(4, freeInfo.getFl_pwd());
			pstmt.setString(5, freeInfo.getFl_title());
			pstmt.setString(6, freeInfo.getFl_content());
			pstmt.setString(7, freeInfo.getFl_ip());

			result = pstmt.executeUpdate();
			// ���ο� �Խñ� ���

		} catch(Exception e) {
			System.out.println("freeInsert() ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(pstmt);
		}

		return result;
	}
	
	public FreeInfo getArticleUp(int idx,String mem, String uid, String pwd) {
	//�����ۿ� ���� ������ üũ�ϴ� �޼ҵ�
		FreeInfo article = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			String where = " and fl_ismember = ";
			if (mem.equals("n")){
				where += "'n' and fl_pwd = '" + pwd + "'";
			} else {
				where += "'y' and fl_writer = '" + uid + "'";
			}
			
			sql = "select * from t_free_list where fl_status = 'a'" + " and fl_idx = " + idx + where;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				article = new FreeInfo();
				article.setFl_idx(rs.getInt("fl_idx"));
				article.setFl_reply(rs.getInt("fl_reply"));
				article.setFl_read(rs.getInt("fl_read"));
				article.setFl_good(rs.getInt("fl_good"));
				article.setFl_bad(rs.getInt("fl_bad"));
				article.setFl_ismember(rs.getString("fl_ismember"));
				article.setFl_writer(rs.getString("fl_writer"));
				article.setFl_pwd(rs.getString("fl_pwd"));
				article.setFl_title(rs.getString("fl_title"));
				article.setFl_content(rs.getString("fl_content"));
				article.setFl_date(rs.getString("fl_date"));
				article.setFl_status(rs.getString("fl_status"));
				article.setFl_ip(rs.getString("fl_ip"));
				// �޾ƿ� ���ڵ��� article �ν��Ͻ��� �������� ����
			}
		}  catch(Exception e) {
			System.out.println("getArticleup() ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}
		return article;
	}
}
