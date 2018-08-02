<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="resources/css/bbs.css" rel="stylesheet">
<style>
	td {width:1000px}
	th {width:400px}
	table {border-collapse:collapse}
</style>
</head>
<body>
<div id="infoEtccont_wrap" style="width:600px">
<h2 class="infoEtccont_title" style="width:370px">

<input type="button" value="필요서류" onclick="location='infoDoc_list.nhn?page=1'">
<input type="button" value="정책" onclick="location='infoPolicy_list.nhn?page=1'">
<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'">
	    		
		<br>
		<hr>
		
게시물 내용보기</h2>

<table id="infoEtccont_t" border="1">
<tr>
	<th>제목</th>
	<td>${infoEtc.INFO_ETC_SUB}</td>
<tr>
<tr>
	<th>내용</th>
	<td>
		${infoEtc.INFO_ETC_CONT}
	</td>
</tr>
	<c:if test="${!empty infoEtc.INFO_ETC_FILE }">
	<tr>
		<th>첨부파일</th>
		<td>
		<a href="./infoEtc_download.file?path=${infoEtc.INFO_ETC_FILE}&original=${infoEtc.INFO_ETC_ORIGINAL}">
		${infoEtc.INFO_ETC_ORIGINAL}</a>
		</td>
	</tr>
	</c:if>
<tr>
	<th>조회수</th>

	<td>
		${infoEtc.INFO_ETC_VISIT}
	</td>
</table>

<br>
<br>
	
	<div id="infoEtccont_menu" style="margin-left:200px">
		<input type="button" value="수정" class="input_button"
		onclick="location='infoEtc_cont.nhn?infoEtc_num=${infoEtc.INFO_ETC_NUM}&state=edit'">
		
		<input type="button" value="삭제" class="input_button"
		onclick="location='infoEtc_cont.nhn?infoEtc_num=${infoEtc.INFO_ETC_NUM}&state=del'">
		
		<input type="button" value="목록" class="input_button"
		onclick="location='infoEtc_list.nhn?page=1'">
	</div>
</div>

<br>
<hr>
<br>

<table border="1">
	<tr>
		<th>▲이전글</th>
		<c:if test="${! empty RnumPrev.INFO_ETC_SUB}">
		<td>
			<a href="./infoEtc_cont.nhn?infoEtc_num=${RnumPrev.INFO_ETC_NUM}&state=cont">${RnumPrev.INFO_ETC_SUB}</a>
		</td>
		</c:if>
		<c:if test="${empty RnumPrev.INFO_ETC_SUB}">
		<td>
			이전글이 없습니다.
		</td>
		</c:if>
	</tr>
	<tr>
		<th>현재글</th>
		<td>
			${infoEtc.INFO_ETC_SUB}
		</td>
	</tr>
	<tr>
		<th>▼다음글</th>
		<c:if test="${! empty RnumNext.INFO_ETC_SUB}">
		<td>
			<a href="./infoEtc_cont.nhn?infoEtc_num=${RnumNext.INFO_ETC_NUM}&state=cont">${RnumNext.INFO_ETC_SUB}</a>
		</td>
		</c:if>
		<c:if test="${empty RnumNext.INFO_ETC_SUB}">
		<td>
			다음글이 없습니다.
		</td>
		</c:if>
	</tr>
</table>
</body>
</html>