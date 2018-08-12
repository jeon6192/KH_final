<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/infomobile.css" type="text/css" media="( max-width: 1024px )">
<link rel="stylesheet" href="./resources/css/infomobile.css" type="text/css" media="( min-width: 1024px )">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>정보게시판</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="infowrap">
	<h2>정보 게시판</h2>
		<form>
			<input type="button" value="필요서류" id="infomenu" onclick="location='infoDoc_list.nhn?page=1'" style="border:none">
			<input type="button" value="정책" id="infomenu" onclick="location='infoPolicy_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
			<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="border:none">
		</form> 
		
		<br>
	
		<div id="ohr">
			<hr id="inhr">
		</div>
		
		<h4>게시물 삭제</h4>
		<div id="infotable_wrap">
			<form method="post" action="infoPolicy_del_ok.nhn" onsubmit="return del_check()">
				<input type="hidden" name="infoPolicy_num" value="${infoPolicy.INFO_POLICY_NUM}">
				<input type="hidden" name="page" value="${page}">
			
				<div id="infodel_menu" >
					<input type="submit" id="delete" value="삭제"> 
					<input type="reset" id="delreset" value="취소"  onclick="location='infoPolicy_list.nhn?page=1'" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>