package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class FreeFormSvc {
	public FreeInfo getArticleUp(int idx,String mem, String uid, String pwd) {
	// ������ �ۿ� ���� ������ ���� ��� �ش� �����͸� ������ �����ϴ� �޼ҵ�
		FreeInfo article = null;
		Connection conn = getConnection();
		FreeDao freeDao = FreeDao.getInstance();
		freeDao.setConnection(conn);
		
		article = freeDao.getArticleUp(idx, mem, uid, pwd);	// ������ �Խñ� �ޱ�
		// �����ۿ� ���� ���� ���θ� �޾ƿ�
		
		close(conn);
		return article;
	}
}
