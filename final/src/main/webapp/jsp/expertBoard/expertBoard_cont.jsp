<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>


<link href="./resources/css/expertCss/expertBoard_cont.css" rel="stylesheet" type="text/css">
	

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<style>

</style>
</head>
<body>
	
<div class="all">
	<div class="top">
			<h1 class="h12">전문가 칼럼</h1>
	</div>
	<div class=view>
		<c:set var="bcont" value="${bcont}"/>
		<div class="head">
			<dl>
				<dt>
					<strong>${bcont.eb_subject}</strong>
				</dt>
				<dd>
					<span>
					 등록일 : ${bcont.eb_date}
					</span>
					<span>
					 조회수 : ${bcont.eb_readcount}
					</span>
				</dd>
			</dl>
		</div>
		
		<div class="body">
				<span>
					${bcont.eb_content}
				</span>
		</div>
		
		<div class="foot">
				<span>
					<img src="${bcont.eb_file}" class="file">
				</span>
		</div>
	</div>
	
	
	
	<div class="btnList">
	        <%-- <c:if test="${!empty Admin_id}"> --%>
	<input type="button" value="수정" class="input_button" 
onclick="location.href='expertBoard_cont.com?num=${bcont.eb_num}&page=${page}&state=edit'">

	<input type="button" value="삭제" class="input_button" 
onclick="location.href='expertBoard_del.com?num=${bcont.eb_num}&page=${page}'">
				        <%-- </c:if> --%>
	<input type="button" value="목록" class="input_button" 
onclick="location.href='expertBoard_list.com?&page=${page}'">
	</div>
	
	
</div>

</body>
</html>