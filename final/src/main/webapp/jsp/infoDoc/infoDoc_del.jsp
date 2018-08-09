<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/infomobile.css">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	@font-face{
  		font-family : 'NanumGothic';
  		src : url(../fonts/NanumGothic.ttf) format('truetype');
	}
	body{
		font-family: NanumGothic
	}
	.infowrap{
    	padding-top: 12%; width:1000px; padding-bottom:5%;  margin: 0 auto;
	}
	#inhr{width:100%}
	#ohr{margin-top:20px}
	#ohr hr{background-color: #2e75b6;}
</style>
</head>
<body>
<div class="infowrap">
	<h2>정보 게시판</h2>
	<input type="button" value="필요서류" id="infomenu" onclick="location='infoDoc_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
	<input type="button" value="정책" id="infomenu"  onclick="location='infoPolicy_list.nhn?page=1'" style="border:none">
	<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="border:none">
	
	<br>
	<div id="ohr">
		<hr id="inhr">
	</div>
	
	<h4>게시물 삭제</h4>
	<div id="infoDocdel_wrap">
		<form method="post" action="infoDoc_del_ok.nhn" onsubmit="return del_check()">
			<input type="hidden" name="infoDoc_num" value="${infoDoc.INFO_DOC_NUM}">
			<input type="hidden" name="page" value="${page}">
			
			<div id="infoDocdel_menu" style="text-align:center; padding-top: 60px;" style="width:40%">
				<input type="submit" value="삭제" style="background-color:#2e75b6; color:white;border:none; border-radius:3px; width:10%; height:10%; border:1.5px solid #008CBA; "> 
				<input type="reset" value="취소" style="background-color:#ffffff; color:#828282;border:none; border-radius:3px; width:10%; height:10%; border:1.5px solid #008CBA; " onclick="location='infoDoc_list.nhn?page=1'" />
			</div>
		</form>
	</div>
</div>
</body>
</html>