<%@page import="vo.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "util.DBUtil" %>
<%@ page import = "dao.SubjectDao" %>
<%
	//인코딩 설정
	request.setCharacterEncoding("utf-8");
	
	System.out.println("updateSubForm reqSubNo : " + request.getParameter("subjectNo"));
	
	// 유효성검사
	if(request.getParameter("subjectNo") == null || request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
	
	// 과목번호 변수저장
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	System.out.println("upSubForm subjectNo : " + subjectNo);
	
	// 메소드 클래스 객체 생성
	SubjectDao dao = new SubjectDao();
	
	// 수정폼에 표시되는 subject정보 객체
	Subject one = dao.selectSubjectOne(subjectNo);
	// System.out.println(one.getSubjectNo());
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>update Subject</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1>과목 수정</h1>
	<br>
	<form action="<%=request.getContextPath()%>/subject/updateSubjectAction.jsp" method="post">
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<td>
					<input type="hidden" name="subjectNo" value="<%=one.getSubjectNo()%>">
					<%=one.getSubjectNo()%>
				</td>
			</tr>	
			<tr>
				<th>과목명</th>
				<td>
					<input type="text" name="subjectName" value="<%=one.getSubjectName()%>">
				</td>
			</tr>
			<tr>
				<th>시수</th>
				<td>
					<input type="text" name="subjectTime" value="<%=one.getSubjectTime()%>">
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=one.getCreatedate()%></td>
			</tr>
		</table>
		<div>
			<input type="submit" class="btn btn-outline-secondary" value="수정">
			<a type="button" class="btn btn-outline-secondary" href = "<%=request.getContextPath()%>/subject/subjectList.jsp">목록으로</a>
		</div>	
	</form>	
</body>
</html>