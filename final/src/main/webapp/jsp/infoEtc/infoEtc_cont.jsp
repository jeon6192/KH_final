<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
	@font-face{
  		font-family : 'NanumGothic';
  		src : url(./fonts/NanumGothic.ttf) format('truetype');
	}
	body{
		font-family: NanumGothic
	}
	td {width:1000px}
	th {width:400px}
	table {border-collapse:collapse}
	.infowrap{
    	padding-top: 12%; width:1000px; padding-bottom:5%;  margin: 0 auto;
	}
	#inhr{width:100%}
	#ohr{margin-top:20px}
	#ohr hr{background-color: #2e75b6;}
	#infocont_menu input[type=button] {background-color:white; border:1.5px solid #008CBA; }
	.prevnexttable {
		border-collapse:seperate;
		border-spacing: 0.5%;
		text-align: left;
		line-height: 1%;
		width:100%;
		border-top:1px solid #747474;
		margin : 20px 10px;
	}
	.prevnexttable th{
		width:20%;
		padding:10px;
		font-weight:bold;
		vertical-align:top;
		text-align:right;
		border-bottom: 1px solid #ccc;
	}
	.prevnexttable td{
		width: 80%;
		padding: 10px;
		vertical-align:top;
		border-bottom:1px solid #ccc;
	}
</style>
</head>
<body>
<div class="infowrap">
	<h2>정보 게시판</h2>
	<form>
		<input type="button" value="필요서류" onclick="location='infoDoc_list.nhn?page=1'" style="border:none">
		<input type="button" value="정책" onclick="location='infoPolicy_list.nhn?page=1'" style="border:none">
		<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
	    		
		<br>
		
	</form> 
	
	<div id="ohr">
		<hr id="inhr">
	</div>
	
	<h4>게시물 내용보기</h4>
	
<div id="infocontwrap" style="width:600px">

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
	
	<div id="infocont_menu" style="margin-left:200px">
		<c:if test="${!empty sessionScope.Admin_no}">
			<input type="button" value="수정" class="input_button"
			onclick="location='infoEtc_cont.nhn?infoEtc_num=${infoEtc.INFO_ETC_NUM}&state=edit'">
		
			<input type="button" value="삭제" class="input_button"
			onclick="location='infoEtc_cont.nhn?infoEtc_num=${infoEtc.INFO_ETC_NUM}&state=del'">
		</c:if>
		
		<input type="button" value="목록" class="input_button"
		onclick="location='infoEtc_list.nhn?page=1'">
	</div>
</div>

<br>
<br>

<table class="prevnexttable">
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
</div>
</body>
</html>