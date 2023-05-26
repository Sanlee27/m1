<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "util.DBUtil" %>
<%@ page import = "dao.SubjectDao" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert Subject</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1>과목 추가</h1>
	<br>
	<form action="<%=request.getContextPath()%>/subject/insertSubjectAction.jsp" method="post">
		<table class="table table-hover">
			<tr>
				<th>과목명</th>
				<td>
					<input type="text" name="subjectName">
				</td>
			</tr>
			<tr>
				<th>시수</th>
				<td>
					<input type="number" name="subjectTime">
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" class="btn btn-outline-secondary" value="추가">
			<a type="button" class="btn btn-outline-secondary" href = "<%=request.getContextPath()%>/subject/subjectList.jsp">목록으로</a>
		</div>
	</form>
</body>
</html>