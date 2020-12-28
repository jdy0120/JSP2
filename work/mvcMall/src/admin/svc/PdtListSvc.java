package admin.svc;

import static db.JdbcUtil.*;
import java.util.*;
import admin.dao.*;
import java.sql.*;
import vo.*;

public class PdtListSvc {
	public int getPdtCount(String where) {
		int rcnt = 0;
		Connection conn = getConnection();
		PdtDao pdtDao = PdtDao.getInstance();
		pdtDao.setConnection(conn);
		rcnt = pdtDao.getPdtCount(where);
		close(conn);
		
		return rcnt;
	}
	
	public ArrayList<PdtInfo> getPdtList(String where, String orderby, int cpage, int psize) {
		ArrayList<PdtInfo> pdtList = new ArrayList<PdtInfo>();
		
		Connection conn = getConnection();
		PdtDao pdtDao = PdtDao.getInstance();
		pdtDao.setConnection(conn);
		pdtList = pdtDao.getPdtList(where, orderby, cpage, psize);
		close(conn);
		
		return pdtList;
	}
}
