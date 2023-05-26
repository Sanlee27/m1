package dao;

import java.sql.*;
import java.util.*;

import util.DBUtil;
import vo.Subject;

public class SubjectDao {
	// 1) 과목목록
	public ArrayList<Subject> selectSubjectListByPage(int beginRow, int rowPerPage ) throws Exception {
		ArrayList<Subject> list = new ArrayList<>();
		// DB메소드
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection();
		// prpare
		PreparedStatement stmt = conn.prepareStatement("SELECT subject_no, subject_name, subject_time, updatedate, createdate FROM subject ORDER BY createdate ASC LIMIT ?, ?");
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		// rs set
		ResultSet rs = stmt.executeQuery();
		//모델데이터
		while(rs.next()) {
			Subject s = new Subject();
			s.setSubjectNo(rs.getInt("subject_no"));
			s.setSubjectName(rs.getString("subject_name"));
			s.setSubjectTime(rs.getInt("subject_time"));
			s.setCreatedate(rs.getString("createdate"));
			s.setUpdatedate(rs.getString("updatedate"));
			list.add(s);
		}
	
		return list;
	}
	
	// 2) 과목추가
	public int insertSubject(Subject subject) throws Exception {
		int row = 0;
		// DB메소드
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection();
		//prpare
		PreparedStatement stmt = conn.prepareStatement("INSERT INTO subject(subject_name, subject_time,updatedate,createdate) VALUES (?, ?, NOW(), NOW())");
		stmt.setString(1, subject.getSubjectName());
		stmt.setInt(2, subject.getSubjectTime());
		
		row = stmt.executeUpdate();
		
		return row;
	}
	
	// 3) 과목삭제
	public int deleteSubject(int subjectNo) throws Exception {
		int row = 0;
		// DB메소드
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection();
		//prpare
		PreparedStatement stmt = conn.prepareStatement("DELETE FROM subject WHERE subject_no = ?");
		stmt.setInt(1, subjectNo);
		
		row = stmt.executeUpdate();
		
		return row;
	}
	
	// 4) 과목수정
	public int updateSubject(Subject subject) throws Exception {
		int row = 0;
		// DB메소드
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection();
		//prpare
		PreparedStatement stmt = conn.prepareStatement("UPDATE subject SET subject_name = ?, subject_time = ?, updatedate = NOW() WHERE subject_no = ?");
		stmt.setString(1, subject.getSubjectName());
		stmt.setInt(2, subject.getSubjectTime());
		stmt.setInt(3, subject.getSubjectNo());
		
		row = stmt.executeUpdate();
		
		return row;
	}
	
	
	// 5) 과목상세	
	public Subject selectSubjectOne(int subjectNo) throws Exception {
		Subject subject = null;
		// DB메소드
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection();
		//prpare
		PreparedStatement stmt = conn.prepareStatement("SELECT subject_no, subject_name, subject_time, updatedate, createdate FROM subject WHERE subject_no = ?");
		stmt.setInt(1, subjectNo);
		//rs set
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			subject = new Subject();
			subject.setSubjectNo(rs.getInt("subject_no"));
			subject.setSubjectName(rs.getString("subject_name"));
			subject.setSubjectTime(rs.getInt("subject_time"));
			subject.setCreatedate(rs.getString("createdate"));
			subject.setUpdatedate(rs.getString("updatedate"));
		}
		
		return subject;
	}
	
	// 6) 과목전체row
	public int selectSubjectCnt() throws Exception {
		int toalRow = 0;
		// DB메소드
		DBUtil dbUtil = new DBUtil(); 
		Connection conn = dbUtil.getConnection();
		
		PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM subject");
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			toalRow = rs.getInt(1);
		}
		return toalRow;
	}
}
