package admin.svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import admin.dao.*;
import vo.*;

public class PdtViewSvc {
	public PdtInfo getPdtInfo(String id) {
		PdtInfo pdtInfo = null;
		Connection conn = getConnection();
		PdtDao pdtDao = PdtDao.getInstance();
		pdtDao.setConnection(conn);
		
		pdtInfo = pdtDao.getPdtInfo(id);
		
		close(conn);
		return pdtInfo;
	}
}
