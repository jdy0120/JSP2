package dao;

import static db.JdbcUtil.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.sql.*;
import java.util.*;
import vo.*;

public class ProductDao {
	private static ProductDao pdtDao;
	private Connection conn;

	private ProductDao() {}
	
	public static ProductDao getInstance() {
		if (pdtDao == null) {
			pdtDao = new ProductDao();
		}
		return pdtDao;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public ArrayList<ProductInfo> getProductList() {
			ArrayList<ProductInfo> productList = new ArrayList<ProductInfo>();
			ProductInfo pdtInfo = null;
			Statement stmt = null;
			ResultSet rs = null;
			String sql = null;
			
			try {
				sql = "select * from TBL_PRODUCT;";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					pdtInfo = new ProductInfo();
					pdtInfo.setTp_id(rs.getInt("tp_id"));
					pdtInfo.setTp_img(rs.getString("tp_img"));
					pdtInfo.setTp_name(rs.getString("tp_name"));
					pdtInfo.setTp_price(rs.getInt("tp_price"));

					productList.add(pdtInfo);
				}
			} catch(Exception e) {
				System.out.println("getProductList() ¿À·ù");
				e.printStackTrace();
			} finally {
				close(rs);	close(stmt);
			}
			
			return productList;
		}
}
