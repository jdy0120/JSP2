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
				// cataBIgList에 담을 CataBigInfo형 인스턴스 생성
				
				bigInfo.setCb_idx(rs.getInt("cb_idx"));
				bigInfo.setCb_name(rs.getString("cb_name"));
				bigInfo.setCb_date(rs.getString("cb_date"));
				
				cataBigList.add(bigInfo);
				// 리턴할 ArrayList에 생성한 CataBigInfo형 인스턴스 저장
			}
		} catch (Exception e) {
			System.out.println("getCataBigList() 오류");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}
		
		return cataBigList;
	}
	
	public ArrayList<CataSmallInfo> getCataSmallList(){
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
				// cataBIgList에 담을 CataBigInfo형 인스턴스 생성
				
				smallInfo.setCs_idx(rs.getInt("cs_idx"));
				smallInfo.setCb_idx(rs.getInt("cb_idx"));
				smallInfo.setCs_name(rs.getString("cs_name"));
				smallInfo.setCs_date(rs.getString("cs_date"));
				
				cataSmallList.add(smallInfo);
				// 리턴할 ArrayList에 생성한 CataSmallInfo형 인스턴스 저장
			}
		} catch (Exception e) {
			System.out.println("getCataSmallList() 오류");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}
		
		return cataSmallList;
	}
	
	public ArrayList<BrandInfo> getBrandList(){
		ArrayList<BrandInfo> brandList = new ArrayList<BrandInfo>();
		BrandInfo brnadInfo = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			sql = "select * from t_brand_list";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				brnadInfo = new BrandInfo();
				// cataBIgList에 담을 CataBigInfo형 인스턴스 생성
				
				brnadInfo.setBl_idx(rs.getInt("bl_idx"));
				brnadInfo.setBl_name(rs.getString("bl_name"));
				brnadInfo.setBl_date(rs.getString("bl_date"));
				
				brandList.add(brnadInfo);
				// 리턴할 ArrayList에 생성한 BrandInfo형 인스턴스 저장
			}
		} catch (Exception e) {
			System.out.println("getBrandList() 오류");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}
		
		return brandList;
	}
}
