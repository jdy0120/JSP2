package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class FreeFormSvc {
	public FreeInfo getArticleUp(int idx,String mem, String uid, String pwd) {
	// 수정할 글에 대한 권한이 있을 경우 해당 데이터를 가져와 리턴하는 메소드
		FreeInfo article = null;
		Connection conn = getConnection();
		FreeDao freeDao = FreeDao.getInstance();
		freeDao.setConnection(conn);
		
		article = freeDao.getArticleUp(idx, mem, uid, pwd);	// 보여줄 게시글 받기
		// 수정글에 대한 권한 여부를 받아옴
		
		close(conn);
		return article;
	}
}
