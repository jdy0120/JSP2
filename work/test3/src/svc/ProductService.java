package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class ProductService {
	public ArrayList<ProductInfo> getProductList() {
		ArrayList<ProductInfo> pdtList = new ArrayList<ProductInfo>();
		// 상품 목록을 저장할 ArrayList객체로 PdtInfo형 인스턴스만 저장함
		Connection conn = getConnection();
		ProductDao productDao = ProductDao.getInstance();
		productDao.setConnection(conn);
		pdtList = productDao.getProductList();
		close(conn);

		return pdtList;
	}
}
