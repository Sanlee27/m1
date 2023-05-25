<%@page import="vo.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "util.DBUtil" %>
<%@ page import = "dao.SubjectDao" %>
<%
	SubjectDao dao = new SubjectDao();
	int deleteSubject = dao.deleteSubject();
%>