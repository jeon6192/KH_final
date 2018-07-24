<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="./resources/js/search.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

.button{
    width: 7%;
    height: 50px;
    border: 0;
}
.button:hover{
	background-color : white;
	background-color : #A6A6A6;
}

@font-face {
   font-family: 'test';
   src: url('./resources/fonts/MALGUN.TTF');
   font-weight: normal;
   font-style: normal;
}
	*{ font-family: test;}
	.searchList{
		width : 100%;
	height : 50px;
	}
	.search{
		margin : 0 auto;
		width : 50%;
		padding-top: 7%;
		}


	
	
	
	.bg-img{
		background-image : url("./resources/image/city.jpg");
		min-height : 500px;
	}
	
	.select1,.select2,.select3{
	width: 30%;
	height : 100%;
	float : left;
	font-size: 19px;
    font-weight: bold;
   	border: none;
    border-left: 1px solid #b1b1b1;
	}
	
	.cookie{
	background-color : #E7E7E7;
	min-height : 300px;
	}
	.interest{
	min-height : 250px;
	width : 40%;
	margin-left : 10%;
	}
	
	.expert-column{
	min-height : 250px;
	width : 40%;
	margin-right : 10%;
	}
	
	.interest, .expert-column{
	    float: left;
	}
	
	
	
</style>
</head>
<body>
	<div class="bg-img">
		
	
	<div class="search">
	<p class="text">
	<img src="http://nimg1.kbstar.com/img/kbland/web/main/main_txt.png">
	</p>
	<form class="searchList" action="aptsearch_list.com" method="GET">
		<select class="select1" name="select1">
			<option value="-1">시/도</option>
			<option value="0">서울특별시</option>
			<option value="1">경기도</option>
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
		<h2>최근 본 단지</h2>
		<div class="name">
			<strong>아파트 이름</strong>		
		</div>
		</div>
		
			<div class="expert-column">
		<h2>전문가 칼럼</h2>
			<p>칼럼 제목 들어갈곳</p>		
		</div>
	</div>
</body>
</html>