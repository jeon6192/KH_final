<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>

<style>
ul{ list-style:none;}
@media (min-width: 1024px){
    .left-menu{
        width: 160px;
    }
    .optionContainer{
        margin-left: 160px;
    }
    #fotter3{display:none;}
}

@media (max-width: 1024px){
    .left-menu{
       display:none;
    }
   .optionContainer{
        margin:0 auto;
        text-align:center;
        width:100%;
        font-size:17px;
    }
    #fotter3{display:block;}
}

body{margin:0}
#wrapper {
    width: 100%;
    height: 100%;
    overflow: hidden;
    box-sizing: border-box;
    font-family: 'test', sans-serif;
   background-color: #ebebeb;
    margin: 0;
    color: #4c5667;
    overflow-x: hidden !important;
    font-size: 14px;
    
}
.left-menu{
    height: 100%;
    position: fixed;
    background: #2e75b6;
    z-index: 2;
}

#fotter3{
	background: #2e75b6;
	margin:0 auto;
}

#fotter3 ul li{
	width:33%;
	margin:0 auto;
	font-size:15px;
	text-align:center;
	font-family: 'test';
}
#fotter3 a{color:white; font-family: 'test'; text-decoration:none;}

.left-menu ul{ margin-top:10px;}
.left-menu li a{font-family: 'test';}
 .left-menu li{ width:100%; height:40px; margin:auto; text-align:center; font-size:20px;font-family: 'test'}
 .text4 a{color:lightgray}

#qnalist{
	margin-top:100px;
	width:50%;
	text-align:center;
	margin-bottom: auto ! important;
	margin-left: auto !important;
	margin-right: auto !important;
}

#detail_menu>input {
	
	background-color : #555555;
	color: white;
	border :  2px solid white;
	padding:10px;
	border-radius:1em;
	width: 130px;
	text-align:center;
	margin-bottom: auto ! important;
	margin-left: auto !important;
	margin-right: auto !important;
}
#detail_menu{
	text-align:center;
}

#detail_menu:hover{background-color:white; color:#2e75b6}
</style>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="wrapper">
		<div class="left-menu">
		<ul class="ul left">
			<li  class="text1">마이페이지</li>
			<li class="text2">
				<a href="./member_edit.nhn">정보 수정</a>
			</li>
			<li class="text3">
				<a href="./optionView.op">아파트 신청내역</a>
			</li>
			<li class="text4">
				<a href="./member_qnalist.nhn?id="${sessionScope.id}>내가 쓴 QNA </a>
			</li>
			
			
		</ul>
	</div>
	
	<div class="qnalistContainer">
	<div id = "qnalist">	
	<table border=1 class="table">
		<h4>내가 쓴 Q&A </h4>
		<thead>
			<tr>
				<td>제목 </td>	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="q" items="${totallist}">
				<tr>
					<td><a href="./view.nhn?articleNo=${q.getArticleNo()}">${q.title}</a></td>
					
				</tr>
				
			</c:forEach>
		</tbody>
	
		</table>
	</div>
	<div id="detail_menu">
          <input type="reset" value="뒤로 가기" class="input_button" onclick="history.go(-1)">
      </div>
	</div>
	</div>
	<div id="fotter3">
		<ul>
			<li class="text2"><a href="./member_edit.nhn">정보 수정</a></li>
			<li class="text3"><a href="./optionView.op">아파트 신청내역</a> </li>
			<li class="text4"><a href="./member_qnalist.nhn?id="${sessionScope.id}>내가 쓴 QNA </a> </li>
		</ul>
	</div>
</body>
</html>