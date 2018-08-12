<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
		<!-- Custom JS -->
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
		
		<link href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet">
	</head>
	<body>
		<div class="topnav" id="myTopnav">
	        
			<a href="./main.com" class="active">House</a>
			
			<c:if test="${empty sessionScope.id}">
				<a href="join_check.nhn" class="page-scroll">회원가입</a>
				<a href="member_login.nhn" class="page-scroll">로그인</a>
	        </c:if>
			
			<c:if test="${!empty sessionScope.id}">
			
				<a href="member_logout.nhn" class="page-scroll">로그아웃</a>
				
				<c:if test="${empty sessionScope.Admin_no}">
					<a href="mypage_main.nhn" class="page-scroll">마이페이지</a>
				</c:if>
				
				<c:if test="${!empty sessionScope.Admin_no}">
					<a href="apart_insertform.com" class="page-scroll">매물 등록</a>
					<a href="total_eventlist.ev" class="page-scroll">분양 관리</a>
					<a href="admin_detail.nhn" class="page-scroll">회원 관리</a>
				</c:if>
				
				
			</c:if>
			
			
	        
	        <a href="./list.nhn">Q&A</a>
	        <a href="./infoDoc_list.nhn">정보</a>
	        <a href="./aptSearch.com">아파트 분양</a>
	        
			<a href="javascript:void(0);" class="icon" onclick="myFunction()">
				<i class="fa fa-bars"></i>
			</a>
		</div>
		
		<script>
			function myFunction() {
			    var x = document.getElementById("myTopnav");
			    if (x.className === "topnav" || x.className === "topnav nav-down" || x.className === "topnav nav-up") {
			        x.className += " responsive";
			    } else {
			        x.className = "topnav";
			    }
			}
		</script>
	
	</body>
</html>