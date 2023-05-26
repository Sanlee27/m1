<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "util.DBUtil" %>
<%@ page import = "dao.SubjectDao" %>
<%@ page import = "vo.*"%>
<%
	//인코딩 설정
	request.setCharacterEncoding("utf-8");

	System.out.println("upSubAct reqSubName : " + request.getParameter("subjectName"));
	System.out.println("upSubAct reqSubTime : " + request.getParameter("subjectTime"));
	
	//유효성검사
	if(request.getParameter("subjectNo") == null || request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
	
	// 과목번호 변수저장
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	System.out.println("upSubAct subjectNo : " + subjectNo);
	
	// 요청값 유효성검사
	if(request.getParameter("subjectName") == null || request.getParameter("subjectName").equals("")
		|| request.getParameter("subjectTime") == null || request.getParameter("subjectTime").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/updateSubjectForm.jsp?subjectNo="+subjectNo);
		return;
	}
	
	// 요청값 변수저장
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	System.out.println("upSubAct subjectName : " + subjectName);
	System.out.println("upSubAct subjectTime : " + subjectTime);
	
	// 메소드 클래스 객체 생성
	SubjectDao dao = new SubjectDao();
	
	// Subject객체생성 요청값 저장	
	Subject subject = new Subject();
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	subject.setSubjectNo(subjectNo);
	
	// 수정 실행 객체
	int row = dao.updateSubject(subject);

	// 실행
	if(row == 1){
		System.out.println("수정성공");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
	} else {
		System.out.println("수정실패");
		response.sendRedirect(request.getContextPath()+"/subject/updateSubjectForm.jsp?subjectNo="+subjectNo);
	}

%>