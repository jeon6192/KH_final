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
	<div id="infoPolicydel_wrap">
		<h2 class="infoPolicydel_title">게시판 삭제</h2>
		<form method="post" action="infoPolicy_del_ok.nhn" onsubmit="return del_check()">
			<input type="hidden" name="infoPolicy_num" value="${infoPolicy.INFO_POLICY_NUM}">
			<input type="hidden" name="page" value="${page}">
			
			<div id="infoPolicydel_menu">
				<input type="submit" value="삭제"> 
				<input type="reset" value="취소" onclick="location='infoPolicy_list.nhn?page=1'" />
			</div>
		</form>
	</div>
</body>
</html>