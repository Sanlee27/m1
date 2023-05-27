<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	//인코딩 설정
	request.setCharacterEncoding("utf-8");

	// 유효성 검사_teacherNo
	if(request.getParameter("teacherNo") == null || request.getParameter("teacherNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}
	
	// 변수 저장_teacherNo
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	// 유효성 검사_값	
	if(request.getParameter("teacherId") == null || request.getParameter("teacherId").equals("")
		|| request.getParameter("teacherName") == null || request.getParameter("teacherName").equals("")
		|| request.getParameter("teacherHistory") == null ||  request.getParameter("teacherHistory").equals("")){
			System.out.println("값오류");
			response.sendRedirect(request.getContextPath()+"/teacher/updateTeacherForm.jsp?teacherNO="+teacherNo);
			return;
	}
	
	// 변수 저장_값
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	// 메소드 클래스 객체 생성
	TeacherDao dao = new TeacherDao();
	// System.out.println(dao);
	
	// Teacher 객체생성 요청값 저장	
	Teacher teacher = new Teacher();
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	teacher.setTeacherNo(teacherNo);
	
	// row
	int row = dao.updateTeacher(teacher);
	
	if(row == 1){
		System.out.println("수정성공");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
	} else {
		System.out.println("수정실패");
		response.sendRedirect(request.getContextPath()+"/teacher/updateTeacherForm.jsp?teacherNO="+teacherNo);
	}
 %>