<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jQuery.com/jquery-latest.js"></script>
<jsp:include page="../header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./resources/css/optionPublic.css" rel="stylesheet">
<style> 
ul{ list-style:none;}
li{list-style: none;}
@font-face {
    font-family: 'test';
    src: url('./resources/fonts/NBG.ttf');
    font-weight: normal;
    font-style: normal;
}

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

#wrapper {
    width: 100%;
    height: 100%;
    overflow: hidden;
    box-sizing: border-box;
    font-family: 'test', sans-serif;
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
#fotter3 a{color:white; font-family: 'test' ; text-decoration:none}

.left-menu ul{padding:0px; margin-top:10px;}
.left-menu li a{font-family: 'test';text-decoration:none }

.optionContainer a{text-decoration:none}
.optionContainer{display:inline-block; overflow-y:scroll; font-family:'test';
	 height: 100%;
    overflow: auto;
    padding-top:30px}
   
  .left-menu li{ width:100%; height:40px; margin:auto; text-align:center; font-size:20px;font-family: 'test'; line-height: 40px;}
  
   .text1{color:white; background-color:#002060; }
    .left-menu a{color:white}
    .text3 a{color:lightgray}
	.Condiv{background-color:white; width :80%; text-align:center; border :1px solid lightgray; height:300px ; 
				margin:0 auto; font-size:20px;}
	.Condiv {margin-top:15px}
	.Condiv div:nth-child(2){padding:10px;}
	.Condiv_menu{margin:auto; background:#2e75b6 ; color:white; height:40px; line-height:40px; text-align:center}
	.Condiv li{border-bottom:1px dotted lightgrey;} 
	#gomypage{
	
	background-color: #555555;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 1em;
    width: 130px;
    text-align: center;
    margin-top:10px;
    margin-bottom: auto ! important;
    margin-left: auto !important;
    margin-right: auto !important;}

	#gomypage:hover{background-color:white; color:#2e75b6}
	#optmainname{font-size:25px; border-bottom:1px solid black; width:80%; margin:auto; text-align:left;}
	
	
</style>
</head>
<body>
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
	<div class="optionContainer">
	<div id="optmainname"> <img src="./resources/img/checkicon.png" width=35px height=35px;> 신청내역/ 당첨여부</div>
		<div id="showEventInList" class="Condiv">
		<div class="Condiv_menu">내가 신청한 아파트</div>
			<div>
				<c:if test="${eventIn_con==0 }">
					<div id="noWin">신청 한 아파트 정보가 없습니다</div>
				</c:if>

				<c:if test="${eventIn_con==1 }">
					<ul>
						<c:forEach var="item" items="${EventInList}">
							<li>
								<a href="./complex/${item.getComplex_id()}">${item.getComplex_apartname()}아파트</a>
							| 주소 : ${item.getComplex_address()}
							|분양 상태 : <c:if test="${item.complex_state==0}"> 분양 중 </c:if>
										<c:if test="${item.complex_state==1}"> 1차 분양 중 </c:if>
										<c:if test="${item.complex_state==2}"> 2차 분양 중 </c:if>
										<c:if test="${item.complex_state==3}">  
										종료 | <span id="ifwin"> 
												당첨 상태 : <c:if test="${item.getEvent_check()==0}"> 진행 중 </c:if>
														<c:if test="${item.getEvent_check()==1}"> 당첨 </c:if>
														<c:if test="${item.getEvent_check()==2}"> 불합격 </c:if>  
												</span>
										</c:if>
	
							</li>

						</c:forEach>
					</ul>
				</c:if>
			</div>
		</div>

		<div id="showWInList" class="Condiv">
			<div class="Condiv_menu">당첨된 내 아파트</div>
			<div>
				<c:if test="${event_con==0 }">
					<div id="noWin">당첨 정보가 없습니다</div>
				</c:if>

				<c:if test="${event_con==1 }">
					<ul>
						<c:forEach var="item" items="${winList}">
							<li>
								<a href="./complex/${item.getComplex_id()}">${item.getComplex_apartname()}아파트</a> 
								${item.getApart_dong()} 동 ${item.getApart_ho()}호 | 주소 :
								${item.getComplex_address()} | <a
								href="./option.op?apt_id=${item.getApart_id()}">옵션신청하기</a>
							</li>

						</c:forEach>
					</ul>
				</c:if>
			</div>
		</div>
		<input type="button" value="마이페이지" onClick="location.href='./mypage_main.nhn'" id="gomypage"> 
	</div>
	</div>
	<div id="fotter3">
		<ul>
			<li class="text2"><a href="./member_edit.nhn">정보 수정</a></li>
			<li class="text3"><a href="./optionView.op">아파트 신청내역</a> </li>
			<li class="text4"><a href="./member_qnalist.nhn?id="${sessionScope.id}>내가 쓴 QNA</a> </li>
		</ul>
	</div>
</body>
</html>