<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import = "util.DBUtil" %>
<%
	// System.out.println("reqDelNo : " + request.getParameter("teacherNo"));

	// 유효성 검사
	if(request.getParameter("teacherNo") == null || request.getParameter("teacherNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}

	// 변수 저장
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	System.out.println("delTeaAct teacherNo : " + teacherNo);
	
	// 메소드 클래스 객체 생성
	TeacherDao dao = new TeacherDao();
	// System.out.println(dao);
	
	// 삭제__
	int row = dao.deleteTeacher(teacherNo);
	// System.out.println(row);
	
	if(row == 1){
		System.out.println("삭제성공");
	} else {
		System.out.println("삭제실패");
	}
	response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
%>