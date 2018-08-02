<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/css/infoDoc.css" rel="stylesheet">
<style>
	table {border-collapse:collapse}
</style>
</head>
<body>

<input type="button" value="필요서류" onclick="location='infoDoc_list.nhn?page=1'">
		<input type="button" value="정책" onclick="location='infoPolicy_list.nhn?page=1'">
		<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'">
	    		
		<br>
		<hr>

<h2 style="width:370px">게시물 내용보기</h2>

<div id="infoDoccont" style="width:600px">
<table id="infoDoccont_t" border="1">
<tr>
	<th>제목</th>
	<td>${infoDoc.INFO_DOC_SUB}</td>
<tr>

	<c:if test="${!empty infoDoc.INFO_DOC_FILE }">
	<tr>
		<th>첨부파일명</th>
		<td>
		<a href="./infoDoc_download.file?path=${infoDoc.INFO_DOC_FILE}&original=${infoDoc.INFO_DOC_ORIGINAL}">
		${infoDoc.INFO_DOC_ORIGINAL}</a>
		</td>
	</tr>
	</c:if>
<tr>
	</table>	
	<div id="infoDoccont_menu" style="margin-left:200px">
		<input type="button" value="수정" class="input_button"
		onclick="location='infoDoc_cont.nhn?infoDoc_num=${infoDoc.INFO_DOC_NUM}&page=${page}&state=edit'">
		
		<input type="button" value="삭제" class="input_button"
		onclick="location='infoDoc_cont.nhn?infoDoc_num=${infoDoc.INFO_DOC_NUM}&page=${page}&state=del'">
		
		<input type="button" value="목록" class="input_button"
		onclick="location='infoDoc_list.nhn?page=${page}'">
	</div>
</div>
</body>
</html>