<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!--  폰 화면 최적화 하기 위한 것 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>

<!-- 참조하는 js 파일  -->
<script src="./resources/js/search.js"></script>

<!-- font -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 참조하는 css 파일  -->
<link rel="stylesheet" href="./resources/css/search.css">
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<div class="bg-img">
		
	
	<div class="search">
	<p class="text">
	<img class="live" src="http://nimg1.kbstar.com/img/kbland/web/main/main_txt.png">
	</p>
	<form id="searchForm" class="searchList" action="aptsearch_list.com" method="GET">
		<select class="select1" name="select1" id="select1">
			<option value="-1">시/도</option>
			<option value="0">서울</option>
			<option value="1">경기</option>
			<option value="2">인천광역시</option>
			<option value="3">부산광역시</option>
			<option value="4">대전광역시</option>
			<option value="5">대구광역시</option>
			<option value="6">광주광역시</option>
			<option value="7">울산광역시</option>
			<option value="8">강원도</option>
			<option value="9">충청남도</option>
			<option value="10">충청북도</option>
			<option value="11">경상남도</option>
			<option value="12">경상북도</option>
			<option value="13">전라남도</option>
			<option value="14">전라북도</option>
			<option value="15">제주특별자치도</option>
			<option value="16">세종특별자치시</option>
		</select>
			<select class="select2" name="select2">
			<option value="-1">시/군/구</option>
		</select>
			<select class="select3" name="select3">
			<option value="-1">읍/면/동</option>
		</select>
		 <button type="submit" class="button"><i class="fa fa-search"></i></button>
		 
		 <input type="hidden" id="sel1" name="sel1" value="">
		 <input type="hidden" id="sel2" name="sel2" value="">
		 <input type="hidden" id="sel3" name="sel3" value="">
	</form>
	</div>
	</div>
	
	<div class="cookie">
		<div class="interest">
		
	<div class="name"> 
		<font style="font-size: 20px; color: #2490af; font-weight: bold;">새로 등록된 아파트</font>
		<div class="name">
			<a style="color: #31708f; font-size: 28px;" href="apart_contents.com?complex_id=${newapt.complex_id}">${newapt.complex_apartname}</a>		
		</div>
	</div>
		<div class="price">
			<div style="color : black; font-weight : bold">평수 : ${newapt.maxarea} ㎡</div>
			<div style="color : black; font-weight : bold"> 분양가 : ${newapt.minprice} 만원</div>
		</div>
		
		<div class="newAptImg">
			<img src="./resources/image/apartment2.png">
		</div>
		</div>

		
		
		
		<c:if test="${listcount == 0}">
			<div class="expert-column">
			<div class="border">
		<h2 style="color: #2490af; font-size : 20px; font-weight: bold;">전문가 칼럼</h2>
		<br>
				<a style="color : black; float: right;" href="expertBoard_list.com">글쓰기 ▶</a>
			</div>
				<div class="expertImg2">
			<img class="expertImg" src="./resources/image/meeting.png">
				</div>
		</div>
		</c:if>
			
		<c:if test="${listcount != 0}">
		
		
		
			<div class="expert-column">
			<div class="border">
		<h2 style="color: #2490af; font-size : 20px; font-weight: bold;">전문가 칼럼</h2>
		<br>
		<a style="color : black; float: right;" href="expertBoard_list.com">더보기 ▶</a>
			</div>		
			<a class= "subject" href="expertBoard_cont.com?num=${expert.eb_num}&page=1&state=cont"><p style="color : black;">${expert.eb_subject}</p></a>
			<div class="expertImg2">
			<img class="expertImg" src="./resources/image/meeting.png">
			</div>
		</div>
	</c:if>
	</div>
	
</body>
</html>