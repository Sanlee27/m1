package dao;

import java.sql.*;
import java.util.*;

import util.DBUtil;

public class TeacherDao {
	/*
	 * issue : 교과목 연결되지 않은 강사는 출력되지 않는다. inner join > outer join 변경
	 SELECT t.teacher_no, t.teacher_id, t.teacher_name, ts.subject_no, GROUP_CONCAT(s.subject_name)
	 FROM teacher t INNER JOIN teacher_subject ts
								ON t.teacher_no = ts.teacher_no
								INNER JOIN subject s
								ON ts.subject_no = s.subject_no
	 GROUP BY t.teacher_no, t.teacher_id, t.teacher_name
	 LIMIT 0,10;
	 */
	public ArrayList<HashMap<String, Object>> selectTeacherListByPage(int beginRow, int rowPerPage) throws Exception {
		ArrayList<HashMap<String, Object>> tList = new ArrayList<HashMap<String, Object>>();
		// DB메소드
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection();
		// pre
		// nvl > 널처리 함수. data 값이 null 값일때 임의설정값으로 처리해주기
		PreparedStatement stmt = conn.prepareStatement("SELECT t.teacher_no tNo, t.teacher_id tId, t.teacher_name tName, nvl(GROUP_CONCAT(s.subject_name), ' ') sName FROM teacher t LEFT OUTER JOIN teacher_subject ts ON t.teacher_no = ts.teacher_no LEFT OUTER JOIN subject s ON ts.subject_no = s.subject_no GROUP BY t.teacher_no, t.teacher_id, t.teacher_name LIMIT ?,?");
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		// rs.set
		ResultSet rs = stmt.executeQuery();
		// 데이터
		while(rs.next()) {
			HashMap<String, Object> t = new HashMap<String, Object>();
			t.put("tNo",rs.getInt("tNo"));
			t.put("tId",rs.getString("tId"));
			t.put("tName",rs.getString("tName"));
			t.put("sName",rs.getString("sName"));
			tList.add(t);
		}
		return tList;
	}
	
	// 선생전체 row
	public int selectTeacherCnt() throws Exception {
		int totalRow = 0;
		// DB메소드
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection();
		// pre
		PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM teacher ");
		// rs.set
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			totalRow = rs.getInt(1); // 1 = COUNT(*)
		}
		return totalRow;
	}	
}
