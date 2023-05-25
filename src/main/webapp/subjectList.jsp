<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>   
<%@ page import = "util.DBUtil" %>
<%@ page import = "dao.SubjectDao" %>
<%@ page import = "vo.Subject" %>
<%
	SubjectDao dao = new SubjectDao();
	ArrayList<Subject> list = dao.selectSubjectListByPage(0, 10);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>subject list</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1>과목 리스트</h1>
	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>과목명</th>
			<th>시수</th>
			<th>등록일</th>
			<th>수정일</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
			for(Subject s : list){
		%>
				<tr>
					<td><%=s.getSubjectNo()%></td>
					<td><%=s.getSubjectName()%></td>
					<td><%=s.getSubjectTime()%></td>
					<td><%=s.getCreatedate()%></td>
					<td><%=s.getUpdatedate()%></td>
					<td><a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/updateSubjectForm.jsp?subjectNo=<%=s.getSubjectNo()%>">수정</a></td>
					<td><a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/deleteSubjectForm.jsp?subjectNo=<%=s.getSubjectNo()%>">삭제</a></td>
				</tr>
		<%
			}
		%>
	</table>
</body>
</html>