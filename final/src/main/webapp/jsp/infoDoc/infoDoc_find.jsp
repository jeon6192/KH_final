<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/infomobile.css">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>정보 게시판</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<style>
	@font-face{
  		font-family : 'NanumGothic';
  		src : url(../fonts/NanumGothic.ttf) format('truetype');
	}
	body{
		font-family: NanumGothic
	}
	table {border-collapse:collapse; margin:0 auto; width:60%}
	table td:first-child{width:20%}
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
	<form>
		<input type="button" value="필요서류" id="infomenu" onclick="location='infoDoc_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
		<input type="button" value="정책" id="infomenu"  onclick="location='infoPolicy_list.nhn?page=1'" style="border:none">
		<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="border:none">
	    		
		<br>
		
		<div id="ohr">
			<hr id="inhr">
		</div>
	
		<h4>검색결과</h4>
	</form>
	
	
	<br>
	 글 개수 : ${listcount}
    <!-- 게시판 리스트 -->
    <table border="1">
    <!-- 레코드가 있으면 -->
    <tr>
       <th colspan = "2">정보게시판 - 서류검색결과</th>
    </tr>
    
    <tr>
       <th width = "20%"><div>번호</div></th>
       <th width = "80%"><div>서류명</div></th>
    </tr>
    <c:set var = "infoDoc_num" value = "${listcount-(page-1)*5}"/>
    <c:forEach var = "d" items = "${infoDoclist}">
    <tr>
       <td>
       		<a href = "infoDoc_cont.nhn?infoDoc_num=${d.INFO_DOC_NUM}&page=${page}&state=cont">
          <c:out value = "${infoDoc_num}"/><%--num 출력 --%></a>
          <c:set var = "infoDoc_num" value = "${infoDoc_num-1}"/><%-- num = num-1 --%>
       </td>
       <td>
          <div style="text-align:left">
             
             <!-- 제목 출력 부분 -->
             <a href="./infoDoc_download.file?path=${d.INFO_DOC_FILE}&original=${d.INFO_DOC_ORIGINAL}">
                      ${d.INFO_DOC_SUB}
             </a>
          </div>
       </td>
    </tr>
    </c:forEach>
    
    <tr>
       <td colspan = 2>
          <c:if test = "${page <= 1}">
             이전&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "infoDoc_find_ok.nhn?page=${page-1}&find_name=${find_name}&find_field=${find_field}">이전</a>&nbsp;   
          </c:if>
          
          <c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${a == page}">
                ${a}
             </c:if>
             <c:if test = "${a != page}">
                <a href = "infoDoc_find_ok.nhn?page=${a}&find_name=${find_name}&find_field=${find_field}">${a}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;다음
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "./infoDoc_list.nhn?page=${page+1 }">&nbsp;다음</a>
          </c:if>
       </td>                  
    </tr>
    
    <!-- 레코드가 없으면 -->
    <c:if test="${listcount == 0 }">
       <tr>
          <td>정보 게시판 - 서류검색결과</td>
       </tr>
       <tr>
          <td>
             	등록된 글이 없습니다.
          </td>   
       </tr>
    </c:if>
    </table>
    
    <br>
    
    <div style="margin-left:20%; margin-right:20%">
    	<input type="button" value="목록" style="background-color:white; text-align:center; border:1.5px solid #008CBA;" onclick="location='infoDoc_list.nhn?page=1'">
    </div>
</div>

</body>
</html>