<%@page import="vo.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "util.DBUtil" %>
<%@ page import = "dao.SubjectDao" %>
<%
	SubjectDao dao = new SubjectDao();
	Subject selectSubjectOne = dao.selectSubjectOne(request.getParameter());
	int updateSubject = dao.updateSubject();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update Subject</title>
</head>
<body>
	<h1>과목 수정</h1>
	<table>
		<tr>
			<th>번호</th>
			<td></td>
		</tr>	
		<tr>
			<th>과목명</th>
			<td></td>
		</tr>
		<tr>
			<th>시수</th>
			<td></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td></td>
		</tr>
		<tr>
			<th>수정일</th>
			<td></td>
		</tr>
	</table>
</body>
</html>