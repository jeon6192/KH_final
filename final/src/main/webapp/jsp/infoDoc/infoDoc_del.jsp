<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/css/infoDoc.css" rel="stylesheet">
</head>
<body>
	<div id="infoDocdel_wrap">
		<h2 class="infoDocdel_title">게시판 삭제</h2>
		<form method="post" action="infoDoc_del_ok.nhn" onsubmit="return del_check()">
			<input type="hidden" name="infoDoc_num" value="${infoDoc.INFO_DOC_NUM}">
			<input type="hidden" name="page" value="${page}">
			
			<div id="infoDocdel_menu">
				<input type="submit" value="삭제"> 
				<input type="reset" value="취소" onclick="location='infoDoc_list.nhn?page=1'" />
			</div>
		</form>
	</div>
</body>
</html>