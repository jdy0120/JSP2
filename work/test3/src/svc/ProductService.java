package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class ProductService {
	public ArrayList<ProductInfo> getProductList() {
		ArrayList<ProductInfo> pdtList = new ArrayList<ProductInfo>();
		// ��ǰ ����� ������ ArrayList��ü�� PdtInfo�� �ν��Ͻ��� ������
		Connection conn = getConnection();
		ProductDao productDao = ProductDao.getInstance();
		productDao.setConnection(conn);
		pdtList = productDao.getProductList();
		close(conn);

		return pdtList;
	}
}
