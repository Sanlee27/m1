<%@page import="vo.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "util.DBUtil" %>
<%@ page import = "dao.SubjectDao" %>
<%@ page import = "vo.*"%>
<%
	System.out.println("delSubNo : " + request.getParameter("subjectNo"));
	//유효성검사
	if(request.getParameter("subjectNo") == null || request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}	
	
	
	
	//과목번호 변수저장
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	System.out.println("delSubAct subjectNo : " + subjectNo);
	
	// 메소드 클래스 객체 생성
	SubjectDao dao = new SubjectDao();
	
	// 삭제 실행 객체
	int row = dao.deleteSubject(subjectNo);
	
	// 실행
	if(row == 1){
		System.out.println("삭제성공");
	} else {
		System.out.println("삭제실패");
	}
	response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
%>