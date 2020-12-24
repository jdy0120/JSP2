package admin.svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import admin.dao.*;
import vo.*;

public class PdtInFormSvc {
	public ArrayList<CataBigInfo> getCataBigList() {
	// ��з� ����� ArrayList �� �ν��Ͻ��� �����ϴ� �޼ҵ�
		ArrayList<CataBigInfo> cataBigList = null;
		Connection conn = getConnection();
		PdtDao pdtDao = PdtDao.getInstance();
		pdtDao.setConnection(conn);
		cataBigList = pdtDao.getCataBigList();
		close(conn);
		return cataBigList;
	}
	public ArrayList<CataSmallInfo> getCataSmallList() {
	// �Һз� ����� ArrayList �� �ν��Ͻ��� �����ϴ� �޼ҵ�
		ArrayList<CataSmallInfo> cataSmallList = null;
		Connection conn = getConnection();
		PdtDao pdtDao = PdtDao.getInstance();
		pdtDao.setConnection(conn);
		cataSmallList = pdtDao.getCataSmallList();
		close(conn);
		return cataSmallList;
	}
	public ArrayList<BrandInfo> getBrandList() {
	// �귣�� ����� ArrayList �� �ν��Ͻ��� �����ϴ� �޼ҵ�
		ArrayList<BrandInfo> brandList = null;
		Connection conn = getConnection();
		PdtDao pdtDao = PdtDao.getInstance();
		pdtDao.setConnection(conn);
		brandList = pdtDao.getBrandList();
		close(conn);
		return brandList;
	}
}