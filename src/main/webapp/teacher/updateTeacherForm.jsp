<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	//인코딩 설정
	request.setCharacterEncoding("utf-8");
	
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
	<h1>강사 수정</h1>
	<br>
	<form action="<%=request.getContextPath()%>/teacher/updateTeacherAction.jsp" method="post">
		<table class="table table-hover">
			<tr>
				<th>강사ID</th>
				<td>
					<input type="hidden" name="teacherNo" value="<%=one.getTeacherNo()%>">
					<input type="text" name="teacherId" value="<%=one.getTeacherId()%>">
				</td>
			</tr>
			<tr>
				<th>강사명</th>
				<td>
					<input type="text" name="teacherName" value="<%=one.getTeacherName()%>">
				</td>
			</tr>
			<tr>
				<th>히스토리</th>
				<td>
					<input type="text" name="teacherHistory" value="<%=one.getTeacherHistory()%>">
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" class="btn btn-outline-secondary" value="수정">
			<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp">목록으로</a>
		</div>
	</form>
</body>
</html>