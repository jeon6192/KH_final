<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>

<!-- font -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 부트스트랩  -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- 부트스트랩  -->

<!-- 참조하고 있는 css 파일 -->
<link rel="stylesheet" href="./resources/css/expertCss/expertBoard_list.css">

</head>
<body>
<jsp:include page="../header.jsp"/>
	<div class="all">

	<div class="top">
			<h1 class=subject>전문가 칼럼</h1>
	</div>

	<div class="list">
		<c:if test="${listcount == 0}">
			<table class="table">
			<thead>
			<tr>
				<th width=10%>번호</th>
				<th width=40%>제목</th>
				<th width=20%>출처</th>
				<th width=20%>등록일</th>
				<th width=10%>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="5" align="center">등록된 글이 없습니다.<br>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" style="text-align: right"><a
				href="./expertBoard_write.com">[글쓰기]</a></td>
			</tr>
		</tfoot>
			</table>
		</c:if>
	</div>
	
	
	<div class="list">
		<c:if test="${listcount !=0 }">
		<table class="table">
		<thead>
			<tr>
				<th width=10%>번호</th>
				<th width=40%>제목</th>
				<th width=20%>출처</th>
				<th width=20%>등록일</th>
				<th width=10%>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:set var="num" value="${listcount-(page-1)*limit}"></c:set>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>
					<c:out value="${num}"/>
					<c:set var="num" value="${num-1}"/>
				</td>
				<td>
					<a style="color : #2a6496" href="./expertBoard_cont.com?num=${list.eb_num}&page=${page}&state=cont">${list.eb_subject}</a>
				</td>
				<td>
					${list.eb_source}
				</td>
				<td>
					${list.eb_date}
				</td>
				<td>
					${list.eb_readcount}
				</td>	
			</tr>		
		</c:forEach>
		</tbody>
		<tfoot>
			<tr class="pageBtn" align="center">
				<td colspan="5">
					<c:if test="${page<=1}">
						이전&nbsp;
					</c:if>
					<c:if test="${page > 1 }">												<!-- 현재나는 2페이지다.  -->
						<a style="color: #2a6496;" href="./expertBoard_list.com?page=${page-1}">이전</a>&nbsp;					<!--  이전눌렀을 때 현재페이지 - 1 할 수 있게 정의 -->
					</c:if>
					
				<c:forEach var="a" begin="${startpage}" end="${endpage}">				<!--  1부터 10 a 의변수에넣고 -->
					<c:if test="${a==page }">
						${a}
					</c:if>
					<c:if test="${a!=page }">
						<a style="color : #2a6496" href="./expertBoard_list.com?page=${a}">${a}</a>&nbsp;			<!--  내가누른 그페이지로 이동하게 해준다. -->
					</c:if>
				</c:forEach>
					<c:if test="${page >= maxpage }">
					&nbsp;다음
				</c:if>
				<c:if test="${page < maxpage }">
					<a style="color : #2a6496" href="./expertBoard_list.com?page=${page+1 }">다음</a>&nbsp;
					</c:if>
				</td>
			</tr>
			
	        <%-- <c:if test="${!empty Admin_id}"> --%>
				<tr>
			<td colspan="5" style="text-align: right">
			<a style="color : #2a6496" href="./expertBoard_write.com">[글쓰기]</a></td>
			</tr>
			<%-- </c:if> --%>
		</tfoot>
		</table>
	</c:if>
	</div>
</div>

</body>
</html>