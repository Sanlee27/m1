<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import ="util.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>insert Teacher</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1>강사 추가</h1>
	<br>
	<form action="<%=request.getContextPath()%>/teacher/insertTeacherAction.jsp" method="post">
		<table class="table table-hover">
			<tr>
				<th>강사ID</th>
				<td>
					<input type="text" name="teacherId">
				</td>
			</tr>
			<tr>
				<th>강사명</th>
				<td>
					<input type="text" name="teacherName">
				</td>
			</tr>
			<tr>
				<th>히스토리</th>
				<td>
					<textarea rows="2" cols="80" name="teacherHistory"></textarea>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" class="btn btn-outline-secondary" value="추가">
			<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp">목록으로</a>
		</div>
	</form>
</body>
</html>