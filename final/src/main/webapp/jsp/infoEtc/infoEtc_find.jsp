<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>정보 게시판</title>
<link href="resources/css/bbs.css" rel="stylesheet">
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<style>
	table {border-collapse:collapse}
</style>
</head>
<body>
	<form>
		<input type="button" value="필요서류" onclick="location='infoDoc_list.nhn?page=1'">
		<input type="button" value="정책" onclick="location='infoPolicy_list.nhn?page=1'">
		<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'">
	    		
		<br>
		<hr>
		
	</form>
	
	<br>
	글 개수 : ${listcount}
    <!-- 게시판 리스트 -->
    <table border="1">
    <!-- 레코드가 있으면 -->
    <tr>
       <th colspan = "4">정보게시판-기타정보검색결과</th>
    </tr>
    
    <tr>
       <th width = "10%"><div>번호</div></th>
       <th width = "50%"><div>제목</div></th>
       <th width = "30%"><div>등록일</div></th>
       <th width = "10%"><div>조회수</div></th>
    </tr>
    <c:set var = "infoEtc_num" value = "${listcount-(page-1)*5}"/>
    <c:forEach var = "e" items = "${infoEtclist}">
    <tr>
       <td>
          <c:out value = "${infoEtc_num}"/><%--num 출력 --%>
          <c:set var = "infoEtc_num" value = "${infoEtc_num-1}"/><%-- num = num-1 --%>
       </td>
       <td>
          <div style="text-align:left">
             
             <!-- 제목 출력 부분 -->
             <a href = "infoEtc_cont.nhn?infoEtc_num=${e.INFO_ETC_NUM}&page=${page}&state=cont">
                      ${e.INFO_ETC_SUB}
             </a>
          </div>
       </td>
       
       <td>
          <div>${e.INFO_ETC_DATE}</div>
       </td>
       <td>
          <div>${e.INFO_ETC_VISIT}</div>
       </td>
    </tr>
    
    </c:forEach>
    <tr class = "h30 lime center btn">
       <td colspan = 4>
          <c:if test = "${page <= 1}">
             이전&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "infoEtc_find_ok.nhn?page=${page-1}&find_name=${find_name}&find_field=${find_field}">이전</a>&nbsp;   
          </c:if>
          
          <c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${a == page}">
                ${a}
             </c:if>
             <c:if test = "${a != page}">
                <a href = "infoEtc_find_ok.nhn?page=${a}&find_name=${find_name}&find_field=${find_field}">${a}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;다음
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "./infoEtc_list.nhn?page=${page+1 }">&nbsp;다음</a>
          </c:if>
       </td>                  
    </tr>
    
    <!-- 레코드가 없으면 -->
    <c:if test="${listcount == 0 }">
       <tr>
          <td colspan="4">정보게시판-기타정보검색결과</td>
          <td style = "text-align:right">
             <font size = 2>등록된 글이 없습니다.</font>
          </td>   
       </tr>
    </c:if>
    </table>
    
    <br>
    <input type="button" value="목록" onclick="location='infoEtc_list.nhn?page=1'">
</body>
</html>