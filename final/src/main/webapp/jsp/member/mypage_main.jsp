<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<style>
	
	#mypages{
		padding-top: 300px;
		text-align:center;
	}
	
	#mypageSquare{
		display:inline-block;
		width: 300px; height: 300px; border: 3px solid silver; margin: 10px; 
		text-align: center;
		
	}
	#mypageCircle{
		display:inline-block;
		border: 3px solid silver;
		width:225px;
		height:225px;
		margin-top: 15px;
		-webkit-border-radius:112px;
		-moz-border-radius:112px;
		background-image:url("resources/image/avatar.png");
		background-repeat: no-repeat;
		background-size:100px;
		background-position: center center;
	}
	 p{
    	padding-top: 230px;
    	color:grey;
    	
	 }
	
	#apartResult{
		
		display:inline-block;
		width: 300px; height: 300px; border: 3px solid silver; margin: 10px; 
		text-align: center;
	}
	#apartCircle{
		margin-top: 15px;
		display:inline-block;
		border: 3px solid silver;
		width:225px;
		height:225px;
		margin-top: 15px;
		-webkit-border-radius:112px;
		-moz-border-radius:112px;
		background-image:url("resources/image/city.png");
		background-repeat: no-repeat;
		background-size:100px;
		background-position: center center;
	}
	
	#qnaList{
		
		display:inline-block;
		width: 300px; height: 300px; border: 3px solid silver; margin: 10px; 
		text-align: center;
	}
	#qnaCircle{
		margin-top: 15px;
		display:inline-block;
		border: 3px solid silver;
		width:225px;
		height:225px;
		margin-top: 15px;
		-webkit-border-radius:112px;
		-moz-border-radius:112px;
		background-image:url("resources/image/question.png");
		background-repeat: no-repeat;
		background-size:100px;
		background-position: center center;
	}
	@media ( max-width :380px) {
		#mypages{
		margin-top:-200px;
		}
	}
	</style>

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	
	<div id = "mypages">
		<span id = mypageSquare style = "cursor:pointer" onclick="window.location.href='member_edit.nhn'">
			<span id = mypageCircle>
				<p>마이페이지</p>
			</span>
		</span>
		
		<span id = apartResult style="cursor:pointer" onclick="window.location.href='optionView.op'">
			<span id = apartCircle>
				<p>아파트 신청내역/당첨여부</p>
			</span>
		</span>
		
		<span id = qnaList style = "cursor:pointer" onclick="window.location.href='member_qnalist.nhn?id=${id}'">
			<span id = qnaCircle>
				<p>Q & A</p>
			</span>
		</span>
	</div>
</body>
</html>