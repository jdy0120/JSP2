package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class FreeFormSvc {
	public FreeInfo getArticleUp(int idx, String ismember, String uid, String pwd) {
	// ������ �ۿ� ���� ������ ���� ��� �ش� �����͸� ������ ������ �޼ҵ�
		FreeInfo article = null;
		Connection conn = getConnection();
		FreeDao freeDao = FreeDao.getInstance();
		freeDao.setConnection(conn);

		article = freeDao.getArticleUp(idx, ismember, uid, pwd);
		// ������ �ۿ� ���� ������ ���� ��� �ش� �����͸� ������

		close(conn);
		return article;
	}
}
