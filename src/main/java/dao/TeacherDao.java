package dao;

import java.sql.*;
import java.util.*;

import util.DBUtil;
import vo.Teacher;

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
	// 강사목록
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
	
	// 강사전체 row
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
	
	// 강사 1명 상세보기
	public Teacher selectTeacherOne(int teacherNo) throws Exception {
		Teacher teacher = null;
		// DB메소드
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection();
		// prpare
		PreparedStatement stmt = conn.prepareStatement("SELECT teacher_no tNo, teacher_id tId, teacher_name tName, teacher_history tHistory, updatedate,createdate FROM teacher WHERE teacher_no = ?");
		stmt.setInt(1, teacherNo);
		// rs.set
		ResultSet rs = stmt.executeQuery();
		// 데이터
		if(rs.next()) {
			Teacher tBoard = new Teacher();
			tBoard.setTeacherNo(rs.getInt("tNo"));
			tBoard.setTeacherId(rs.getString("tId"));
			tBoard.setTeacherName(rs.getString("tName"));
			tBoard.setTeacherHistory(rs.getString("tHistory"));
			tBoard.setCreatedate(rs.getString("createdate"));
			tBoard.setUpdatedate(rs.getString("updatedate"));
		}
		
		return teacher;
	}
	
	// 강사 수정
	public int updateTeacher(Teacher teacher) throws Exception {
		int row = 0;
		// DB메소드
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection();
		// prpare
		PreparedStatement stmt = conn.prepareStatement("UPDATE teacher SET teacher_id=?, teacher_name=?, teacher_history=?, updatedate=NOW() WHERE teacher_no = ?");
		stmt.setString(1, teacher.getTeacherId());
		stmt.setString(2, teacher.getTeacherName());
		stmt.setString(3, teacher.getTeacherHistory());
		stmt.setInt(4, teacher.getTeacherNo());
		// excute
		row = stmt.executeUpdate();
		
		return row;
	}
	
	// 강사 삭제
	public int deleteTeacher(int teacherNo) throws Exception {
		int row = 0;
		// DB메소드
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection();
		// prpare
		PreparedStatement stmt = conn.prepareStatement("DELETE FROM teacher WHERE teacher_no = ?");
		stmt.setInt(1, teacherNo);
		// excute
		row = stmt.executeUpdate();
		
		return row;
	}
}
