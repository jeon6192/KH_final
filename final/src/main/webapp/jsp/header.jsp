<%-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" href="resources/img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="resources/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="resources/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="resources/img/apple-touch-icon-114x114.png">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"  href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome/css/font-awesome.css">


<!-- Stylesheet ================================================== -->
<link rel="stylesheet" type="text/css"  href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/css/nivo-lightbox/nivo-lightbox.css">
<link rel="stylesheet" type="text/css" href="resources/css/nivo-lightbox/default.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<!-- Custom JS -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<body>
<nav id="menu" class="navbar navbar-default navbar-fixed-top">
  <div class="container"> 
   
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand page-scroll" href="./main.com">House</a> </div>
    
  
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./aptSearch.com" class="page-scroll">아파트 분양</a></li>
        <li><a href="./infoDoc_list.nhn" class="page-scroll">정보</a></li>
        <li><a href="./list.nhn" class="page-scroll">Q&A</a></li>
        <c:if test="${!empty sessionScope.id}">
	        <c:if test="${!empty sessionScope.Admin_no}">
		        <li><a href="admin_detail.nhn" class="page-scroll">회원 관리</a></li>
		        <li><a href="total_eventlist.ev" class="page-scroll">분양 관리</a></li>
		        <li><a href="apart_insertform.com" class="page-scroll">매물 등록</a></li>
	        </c:if>
	         <c:if test="${empty sessionScope.Admin_no}">
	        <li><a href="mypage_main.nhn" class="page-scroll">마이페이지</a></li>
	        </c:if>
	        <li><a href="member_logout.nhn" class="page-scroll">로그아웃</a></li>
        </c:if>
        <c:if test="${empty sessionScope.id}">
	        <li><a href="member_login.nhn" class="page-scroll">로그인</a></li>
	        <li><a href="join_check.nhn" class="page-scroll">회원가입</a></li>
        </c:if>
        
      </ul>
    </div>
   
  </div>
</nav>

</body> --%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet">
		
		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header2.css">
		<!-- Custom JS -->
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/header2.js"></script>
	</head>
	<body>
		<nav id="menu" class="navbar navbar-default navbar-fixed-top">
			<div class="container"> 
			   
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
					<a class="navbar-brand page-scroll" href="./main.com">House</a> 
				</div>
				    
				  
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="./aptSearch.com" class="page-scroll">아파트 분양</a></li>
						<li><a href="./infoDoc_list.nhn" class="page-scroll">정보</a></li>
						<li><a href="./list.nhn" class="page-scroll">Q&A</a></li>
						
						<c:if test="${!empty sessionScope.id}">
							<c:if test="${!empty sessionScope.Admin_no}">
								<li><a href="admin_detail.nhn" class="page-scroll">회원 관리</a></li>
								<li><a href="total_eventlist.ev" class="page-scroll">분양 관리</a></li>
								<li><a href="apart_insertform.com" class="page-scroll">매물 등록</a></li>
							</c:if>
							<c:if test="${empty sessionScope.Admin_no}">
								<li><a href="mypage_main.nhn" class="page-scroll">마이페이지</a></li>
							</c:if>
							
							<li><a href="member_logout.nhn" class="page-scroll">로그아웃</a></li>
						</c:if>
						
						<c:if test="${empty sessionScope.id}">
							<li><a href="member_login.nhn" class="page-scroll">로그인</a></li>
							<li><a href="join_check.nhn" class="page-scroll">회원가입</a></li>
						</c:if>
					        
					</ul>
				</div>
			 
			</div>
		</nav>
	
	</body>
</html>