package admin.dao;

import static db.JdbcUtil.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.sql.*;
import java.util.*;
import vo.*;

public class PdtDao {
	private static PdtDao pdtDao;
	private Connection conn;

	private PdtDao() {}
	
	public static PdtDao getInstance() {
		if (pdtDao == null) {
			pdtDao = new PdtDao();
		}
		return pdtDao;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	public ArrayList<CataBigInfo> getCataBigList() {
	// DB���� ��з� ����� �޾� �����ϴ� �޼ҵ�
		ArrayList<CataBigInfo> cataBigList = new ArrayList<CataBigInfo>();
		CataBigInfo bigInfo = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			sql = "select * from t_cata_big";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				bigInfo = new CataBigInfo();
				// cataBigList�� ���� CataBigInfo�� �ν��Ͻ� ����

				bigInfo.setCb_idx(rs.getInt("cb_idx"));
				bigInfo.setCb_name(rs.getString("cb_name"));
				bigInfo.setCb_date(rs.getString("cb_date"));

				cataBigList.add(bigInfo);
				// ������ ArrayList�� ������ CataBigInfo�� �ν��Ͻ� ����
			}
		} catch(Exception e) {
			System.out.println("getCataBigList() ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return cataBigList;
	}

	public ArrayList<CataSmallInfo> getCataSmallList() {
	// DB���� �Һз� ����� �޾� �����ϴ� �޼ҵ�
		ArrayList<CataSmallInfo> cataSmallList = new ArrayList<CataSmallInfo>();
		CataSmallInfo smallInfo = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			sql = "select * from t_cata_small order by cb_idx, cs_idx";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				smallInfo = new CataSmallInfo();
				// cataBigList�� ���� CataBigInfo�� �ν��Ͻ� ����

				smallInfo.setCs_idx(rs.getInt("cs_idx"));
				smallInfo.setCb_idx(rs.getInt("cb_idx"));
				smallInfo.setCs_name(rs.getString("cs_name"));
				smallInfo.setCs_date(rs.getString("cs_date"));

				cataSmallList.add(smallInfo);
				// ������ ArrayList�� ������ CataSmallInfo�� �ν��Ͻ� ����
			}
		} catch(Exception e) {
			System.out.println("getCataSmallList() ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return cataSmallList;
	}

	public ArrayList<BrandInfo> getBrandList() {
	// DB���� ��з� ����� �޾� �����ϴ� �޼ҵ�
		ArrayList<BrandInfo> brandList = new ArrayList<BrandInfo>();
		BrandInfo brandInfo = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			sql = "select * from t_brand_list";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				brandInfo = new BrandInfo();
				// brandInfoList�� ���� BrandInfo�� �ν��Ͻ� ����

				brandInfo.setBl_idx(rs.getInt("bl_idx"));
				brandInfo.setBl_name(rs.getString("bl_name"));
				brandInfo.setBl_date(rs.getString("bl_date"));

				brandList.add(brandInfo);
				// ������ ArrayList�� ������ BrandInfo�� �ν��Ͻ� ����
			}
		} catch(Exception e) {
			System.out.println("getBrandList() ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return brandList;
	}

	public int pdtInsert(PdtInfo pdt) {
	// ��ǰ ��� ó���� ���� �޼ҵ�
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null, plid = pdt.getCs_idx() + "pdt001";

		try {
			sql = "select max(right(pl_id, 3)) from t_product_list where cs_idx = " + pdt.getCs_idx();
			// �ش� �Һз����� ���� ū ���� ���� ��ǰ���̵� ������ ���ڸ��� �߶��
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int n = Integer.parseInt(rs.getString(1)) + 1;
				if (n < 10)			plid = pdt.getCs_idx() + "pdt00" + n;
				else if (n < 100)	plid = pdt.getCs_idx() + "pdt0" + n;
				else				plid = pdt.getCs_idx() + "pdt" + n;
			}

			sql = "insert into t_product_list (pl_id, cs_idx, bl_idx, pl_orig, pl_name, pl_price, " + 
			"pl_cost, pl_discount, pl_opt, pl_img1, pl_img2, pl_img3, pl_desc, pl_deli, pl_stock, " + 
			"pl_view, al_idx) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, plid);
			pstmt.setInt(2, pdt.getCs_idx());
			pstmt.setInt(3, pdt.getBl_idx());
			pstmt.setString(4, pdt.getPl_orig());
			pstmt.setString(5, pdt.getPl_name());
			pstmt.setInt(6, pdt.getPl_price());
			pstmt.setInt(7, pdt.getPl_cost());
			pstmt.setInt(8, pdt.getPl_discount());
			pstmt.setString(9, pdt.getPl_opt());
			pstmt.setString(10, pdt.getPl_img1());
			pstmt.setString(11, pdt.getPl_img2());
			pstmt.setString(12, pdt.getPl_img3());
			pstmt.setString(13, pdt.getPl_desc());
			pstmt.setString(14, "");
			pstmt.setInt(15, pdt.getPl_stock());
			pstmt.setString(16, pdt.getPl_view());
			result = pstmt.executeUpdate();

		} catch(Exception e) {
			System.out.println("pdtInsert() ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(pstmt);
		}

		return result;
	}
}