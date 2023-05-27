<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	// System.out.println("reqNo : " + request.getParameter("teacherNo"));

	// 유효성 검사
	if(request.getParameter("teacherNo") == null || request.getParameter("teacherNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}

	// 변수 저장
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	// 메소드 클래스 객체 생성
	TeacherDao dao = new TeacherDao();
	// System.out.println(dao);
	
	// 상세정보
	Teacher one = dao.selectTeacherOne(teacherNo);
	// System.out.println(one);
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>teacher One</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1>강사 상세정보</h1>
	<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp">목록으로</a>
	<br>
	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<td><%=one.getTeacherNo()%></td>
		</tr>
		<tr>
			<th>강사ID</th>
			<td><%=one.getTeacherId()%></td>
		</tr>
		<tr>
			<th>강사명</th>
			<td><%=one.getTeacherName()%></td>
		</tr>
		<tr>
			<th>히스토리</th>
			<td><%=one.getTeacherHistory()%></td>
		</tr>
		<tr>
			<th>등록일자</th>
			<td><%=one.getCreatedate()%></td>
		</tr>
		<tr>
			<th>수정일자</th>
			<td><%=one.getUpdatedate()%></td>
		</tr>
	</table>
	<div>
		<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/updateTeacherForm.jsp?teacherNo=<%=one.getTeacherNo()%>">수정</a>
		<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/deleteTeacherAction.jsp?teacherNo=<%=one.getTeacherNo()%>">삭제</a>
	</div>
</body>
</html>