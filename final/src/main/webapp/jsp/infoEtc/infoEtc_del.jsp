<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div id="infoEtcdel_wrap">
		<h2 class="infoEtcdel_title">게시판 삭제</h2>
		<form method="post" action="infoEtc_del_ok.nhn" onsubmit="return del_check()">
			<input type="hidden" name="infoEtc_num" value="${infoEtc.INFO_ETC_NUM}">
			
			<div id="infoPolicydel_menu">
				<input type="submit" value="삭제"> 
				<input type="reset" value="취소" onclick="location='infoEtc_list.nhn?page=1'" />
			</div>
		</form>
	</div>
</body>
</html>