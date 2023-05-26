<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%	
	// 메소드 클래스 객체 생성
	TeacherDao dao = new TeacherDao();

	// ============페이징==============
	// 현재 페이지
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	// 페이지 당 행 개수
	int rowPerPage  = 10;
	
	// 전체 페이지
	int totalRow = dao.selectTeacherCnt();
	
	// 시작행 = ((현재 페이지 - 1) x 페이지당 개수 10개) ex) 1페이지 > 0~9번 행
	int beginRow = (currentPage-1) * rowPerPage;
	
	// 마지막행 = 시작행 + (페이지당 개수 10개 - 1 = 9);
	int endRow = beginRow + (rowPerPage - 1);
	if(endRow > totalRow){
		endRow = totalRow;
	}
	
	// 마지막 페이지
	int lastPage = totalRow / rowPerPage; 
	if(totalRow % rowPerPage != 0){ // 페이지가 떨어지지않아 잔여 행이 있다면 
		lastPage = lastPage + 1; // 1 추가, 잔여 행을 lastPage에 배치
	}
	// 각 페이지 선택 버튼 몇개 표시?
	int pagePerPage = 10;

	// 최소페이지 >> 1~10 / 11~20 에서 1 / 11 / 21 ,,,
	int minPage = ((currentPage-1) / pagePerPage * pagePerPage) + 1;
	
	// 최대페이지 >> 1~10 / 11~20 에서 10 / 20 / 30 ,,,
	int maxPage = minPage + (pagePerPage - 1);
	if(maxPage > lastPage){ // ex) lastPage는 27, maxPage가 30(21~30) 일 경우
		maxPage = lastPage;  // maxPage를 lastPage == 27로 한다. 
	}
	
	// ==============================
	// 리스트
	ArrayList<HashMap<String, Object>> tList = dao.selectTeacherListByPage(beginRow, rowPerPage);
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
	<div class="p-4 bg-dark text-white text-center">
		<h1>강사 목록</h1>
		<p>메소드 클래스 객체 연습</p> 
	</div>
	<br>
	<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/subject/subjectList.jsp">과목 목록으로</a>
	<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/">추가</a>
	<br>
	<table class="table table-hover">
		<tr>
			<th>강사ID</th>
			<th>강사명</th>
			<th>과목명</th>
		</tr>
		<%
			for(HashMap<String, Object> t : tList){
		%>
				<tr>
					<td>
						<a href = "<%=request.getContextPath()%>/">
							<%=(String)t.get("tId")%>
						</a>
					</td>
					<td><%=(String)t.get("tName")%></td>
					<td><%=(String)t.get("sName")%></td>
				</tr>
		<%
			}
		%>
	</table>
	
	<!-- ================ 페이지 ================ -->
	<div class="container mt-3">
		<ul class="pagination justify-content-center">
		<!-- 첫 페이지 버튼 항상 표시 -->
			<li>
				<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=1">첫페이지</a>&nbsp;
			</li>
	<%
		// 첫페이지가 아닐 경우 이전 버튼 표시 == 첫 페이지에선 표시 x 
		// 다음 pagePerPage의 첫행으로 넘기기 ex) pagePerPage=10(1~10) 중 4 페이지 에서 다음 버튼 누르면 11페이지 첫행으로 
		if(minPage > 1){
	%>		
			<li>
				<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=minPage-rowPerPage%>">이전</a>&nbsp;
			</li>
	<%	
		}
		
		// 첫페이지부터 마지막 페이지까지 버튼 표시
		// 현재 페이지 일 경우 숫자만 표시 / 나머지 페이지는 링크로 표시
		for(int i = minPage; i<=maxPage; i++){
			if(i == currentPage){
	%>
				<li>
					<a class="btn btn-secondary"><%=i%></a>
				</li>
	<%	
			} else {
	%>			
				<li>
					<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=i%>"><%=i%></a>&nbsp;
				</li>
	<%			
			}
		}
		
		// 각 페이지 표시버튼이 마지막이 아닌 경우 다음 버튼 표시 == 마지막 페이지에선 표시x
		// 이전 pagePerPage의 첫행으로 넘기기 ex) pagePerPage=10(31~40) 중 37 페이지 에서 이전 버튼 누르면 21페이지 첫행으로
		if(maxPage != lastPage){
	%>	
			<li>
				<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=minPage+rowPerPage%>">다음</a>&nbsp;
			</li>
	<%
		}
	%>
		<!-- 마지막 페이지 버튼 -->	
	<%
		// 게시물이 없어 활성화된 페이지가 없으면 현재 페이지(1p) 고정
		if(lastPage == 0){
	%>
			<li>
				<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=1">마지막페이지</a>&nbsp;
			</li>
	<%
		} else {
	%>	
			<li>
				<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=lastPage%>">마지막페이지</a>&nbsp;
			</li>
	<%
		}
	%>		
		</ul>
	</div>
</body>
</html>