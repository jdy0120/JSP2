package svc;

import static db.JdbcUtil.*;
import java.sql.*;
import dao.*;
import vo.*;

public class FreeProcSvc {
// �Խñۿ� ���� ���� �۾��� ó���ϴ� Ŭ����
	public boolean freeInsert(FreeInfo freeInfo) throws Exception {
	// �Խñ� ����� ���� �޼ҵ�
		boolean isSuccess = false;
		Connection conn = getConnection();
		FreeDao freeDao = FreeDao.getInstance();
		freeDao.setConnection(conn);

		int result = freeDao.freeInsert(freeInfo);
		if (result > 0) {
		// �۵���ϴ� ������ �������� �� ��ϵ� ���ڵ尡 ������
			commit(conn);	// ������ ������ �����Ŵ
			isSuccess = true;
		} else {
		// �۵���ϴ� ������ �������� �� ��ϵ� ���ڵ尡 ������
			rollback(conn);	// �����ߴ� ��� ������ ��ȿȭ ��Ŵ
		}

		close(conn);
		return isSuccess;
	}
	public boolean freeUpdate(FreeInfo freeInfo) throws Exception {
	// �Խñ� ������ ���� �޼ҵ�
		boolean isSuccess = false;
		Connection conn = getConnection();
		FreeDao freeDao = FreeDao.getInstance();
		freeDao.setConnection(conn);

		int result = freeDao.freeUpdate(freeInfo);
		if (result > 0) {
			commit(conn);
			isSuccess = true;
		} else {
			rollback(conn);
		}

		close(conn);
		return isSuccess;
	}
	public boolean freeDelete(FreeInfo freeInfo) throws Exception {
	// �Խñ� ������ ���� �޼ҵ�
		boolean isSuccess = false;
		Connection conn = getConnection();
		FreeDao freeDao = FreeDao.getInstance();
		freeDao.setConnection(conn);

		int result = freeDao.freeDelete(freeInfo);
		if (result > 0) {
			commit(conn);
			isSuccess = true;
		} else {
			rollback(conn);
		}

		close(conn);
		return isSuccess;
	}
}
