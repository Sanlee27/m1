<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import ="util.DBUtil" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	// System.out.println("insertTAction reqID : " + request.getParameter("teacherId"));
	// System.out.println("insertTAction reqName : " + request.getParameter("teacherName"));
	// System.out.println("insertTAction reqHistory : " + request.getParameter("teacherHistory"));
	
	// 유효성 검사
	if(request.getParameter("teacherId") == null || request.getParameter("teacherId").equals("")
		|| request.getParameter("teacherName") == null || request.getParameter("teacherName").equals("")
		|| request.getParameter("teacherHistory") == null || request.getParameter("teacherHistory").equals("")){
			System.out.println("값오류");
			response.sendRedirect(request.getContextPath()+"/teacher/insertTeacherForm.jsp");
			return;
	}
	
	// 값 변수저장
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	// 메소드 클래스 객체 생성
	TeacherDao dao = new TeacherDao();
	
	// teacher객체생성 , 값저장
	Teacher teacher = new Teacher();
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	
	// 추가 메소드
	int row = dao.insertTeacher(teacher);
	
	if(row == 1){
		System.out.println("추가성공");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
	} else {
		System.out.println("추가실패");
		response.sendRedirect(request.getContextPath()+"/teacher/insertTeacherForm.jsp");
	}
%>