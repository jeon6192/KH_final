<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./resources/css/infomobile.css" type="text/css" media="( max-width: 1024px )">
<link rel="stylesheet" href="./resources/css/infomobile.css" type="text/css" media="( min-width: 1024px )">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/infomobile.css"> -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보게시판</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="infowrap">
	<h2>정보 게시판</h2>
	<form>
		<input type="button" value="필요서류" id="infomenu" onclick="location='infoDoc_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
		<input type="button" value="정책" id="infomenu"  onclick="location='infoPolicy_list.nhn?page=1'" style="border:none">
		<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="border:none">
	</form>
	    		
	<br>
	<div id="ohr">
		<hr id="inhr">
	</div>
	
	<h4>게시물 내용보기</h4>

	<div id="infocontwrap" style="padding-top: 60px;">
		<table id="infotable" border="1">
			<tr>
				<th>제목</th>
				<td>${infoDoc.INFO_DOC_SUB}</td>
			</tr>

			<c:if test="${!empty infoDoc.INFO_DOC_FILE }">
				<tr>
					<th>첨부파일</th>
					<td>
						<a href="./infoDoc_download.file?path=${infoDoc.INFO_DOC_FILE}&original=${infoDoc.INFO_DOC_ORIGINAL}">
						${infoDoc.INFO_DOC_ORIGINAL}</a>
					</td>
				</tr>
			</c:if>
			<tr>
		</table>	
		<div id="info_menu" style="text-align:center; padding-top: 60px;">
			<c:if test="${!empty sessionScope.Admin_no}">
			<input type="button" value="수정" class="input_button"
			onclick="location='infoDoc_cont.nhn?infoDoc_num=${infoDoc.INFO_DOC_NUM}&page=${page}&state=edit'">
		
			<input type="button" value="삭제" class="input_button"
			onclick="location='infoDoc_cont.nhn?infoDoc_num=${infoDoc.INFO_DOC_NUM}&page=${page}&state=del'">
			</c:if>
		
			<input type="button" value="목록" class="input_button"
			onclick="location='infoDoc_list.nhn?page=${page}'">
		</div>
	</div>
</div>
</body>
</html>