<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<style>
 #etctable {margin:0 auto}
 #line {float:right}
 #find {border-left-width: 10px:300px}
 #edit {float:right}
 #date_find {float:right}
 body {backgroud:gray}
 tr {height:15pt}
 p {font-size:10pt; text-align:center}
 table {border-collapse:collapse}
 #find {float:right}
 #writebt {position:relative; right:30px}
</style>
<title>정보 게시판</title>
<!-- <link href="resources/css/sort_option.css" rel="stylesheet"> -->
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/infoEtcclist_line.js"></script>
<script>
	$(function(){
		$("#viewcount").val('${limit}');
	})
</script>

</head>
<body>
	<h2>정보 게시판</h2>
	<form>
		<input type="button" value="필요서류" onclick="location='infoDoc_list.nhn?page=1'">
		<input type="button" value="정책" onclick="location='infoPolicy_list.nhn?page=1'">
		<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'">
	    		
		<br>
		<hr>
		
	</form> 
	
	<div id="infoEtc_find">
       	<script>
       		function find_check(){
       			if($.trim("#find_name").val()==""){
       				alert("검색어를 입력하세요!");
       				$("#find_name").val("").focus();
       				return false;
       			}
       		}
       	</script>
       	</div>
       	<form method="get" action="infoEtc_find_ok.nhn" onsubmit="return find_check()">
       		<table>
       			<tr id="find">
       			<th>
       				<select name="find_field" >
       					<option value="INFO_ETC_SUB" id="find">제목</option>
       					<option value="INFO_ETC_SubCont" id="find">제목+내용</option>
       					<option value="INFO_ETC_CONT" id="find">내용</option>
       				</select>
       			</th>
       			<td>
       				<input name="find_name" id="find_name" size="18"
       					class="input_box">
       				<input type="submit" value="검색" class="input_button">
       			</td>
       			</tr>
       		</table>
  			</form>
  			
       		<br>
       		<div>
       			<select id="viewcount">
				  	<option value="5" selected>5줄 보기</option>
			  		<option value="10">10줄 보기</option>
				    <option value="20">20줄 보기</option>
	  		 	</select>
       		</div>
    <!-- 게시판 리스트 -->
    <form>
    <table border="1" id="etctable">
    <!-- 레코드가 있으면 -->
    <tr>
       <th colspan = "2">기타정보- list</th>
       <th colspan = "2">
          <font size = 2>글 개수 : ${listcount}</font>
       </th>
    </tr>
    <c:if test="${listcount != 0 }">
    
    <tr>
       <th width = "10%"><div>번호</div></th>
       <th width = "50%"><div>제목</div></th>
       <th width = "30%"><div>등록일</div></th>
       <th width = "10%"><div>조회수</div></th>
    </tr>
    
    <c:set var = "infoEtc_num" value = "${listcount-(page-1)*limit}"/>
    <c:forEach var = "e" items = "${infoEtclist}">
    <tr>
       <td>
          <c:out value = "${infoEtc_num}"/><%--num 출력 --%>
          <c:set var = "infoEtc_num" value = "${infoEtc_num-1}"/><%-- num = num-1 --%>
       </td>
       
       <td>
          <div style="text-align:left">
             <!-- 제목 출력 부분 -->
             <a href = "infoEtc_cont.nhn?infoEtc_num=${e.INFO_ETC_NUM}&state=cont">
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
       	<a href = "./infoEtc_list.nhn?page=1">&lt;</a>
          <c:if test = "${page <= 1}">
             이전&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "./infoEtc_list.nhn?page=${page-1}">이전</a>&nbsp;   
          </c:if>
          
          <c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${a == page}">
                ${a}
             </c:if>
             <c:if test = "${a != page}">
                <a href = "./infoEtc_list.nhn?page=${a}">${a}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;다음
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "./infoEtc_list.nhn?page=${page+1 }">&nbsp;다음</a>
          </c:if>
          <a href = "./infoEtc_list.nhn?page=${endpage}">&gt;</a>
       </td>                  
    </tr>
    </c:if>
  		
    
    <!-- 레코드가 없으면 -->
    <c:if test="${listcount == 0 }">
       <tr>
          <td colspan="4">정보게시판- 정책list</td>
          <td style = "text-align:right">
             <font size = 2>등록된 글이 없습니다.</font>
          </td>   
       </tr>
    	
    </c:if>
    </table>
    
    	<span id="edit">
    		<input type="button" id="writebt" value="글쓰기" onclick="location='infoEtc_write.nhn'">
    	</span>
    </form>
    
       
</body>
</html>