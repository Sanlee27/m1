<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "util.DBUtil" %>
<%@ page import = "dao.SubjectDao" %>
<%@ page import = "vo.*" %>
<%
	request.setCharacterEncoding("UTF-8");		

	// 요청값 유효성검사
	if(request.getParameter("subjectName") == null || request.getParameter("subjectName").equals("")
		|| request.getParameter("subjectTime") == null || request.getParameter("subjectTime").equals("")){
		System.out.println("요청값 오류");
		response.sendRedirect(request.getContextPath()+"/subject/insertSubjectForm.jsp");
		return;
	}
	
	// 요청값 변수저장
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	System.out.println("insertSubAct subjectName : " + subjectName);
	System.out.println("insertSubAct subjectTime : " + subjectTime);
	
	// 메소드 클래스 객체 생성
	SubjectDao dao = new SubjectDao();
	
	// subject객체 생성 > 요청값 저장
	Subject subject = new Subject();
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	
	// 실행
	int row = dao.insertSubject(subject);
	
	if(row == 1){
		System.out.println("추가성공");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
	} else {
		System.out.println("추가실패");
		response.sendRedirect(request.getContextPath()+"/subject/insertSubjectForm.jsp");
	}
%>