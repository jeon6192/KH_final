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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
 #doctable {width:500px; height:600px; margin:0 auto}
 #line {float:right}
 #edit {float:right}
 body {backgroud:gray}
 p {font-size:10pt; text-align:center}
table {border-collapse:collapse}
#writebt {position:relative; right:30px}
#findtable {position:relative; clear:left;float:right; right:30px}
#viewcount {position:relative; bottom:20px}
</style>
<title>정보 게시판</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/infoDoclist_line.js"></script>
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
	<div id="infoDoc_find">
       	<script>
       		function find_check(){
       			if($.trim("#find_name").val()==""){
       				alert("검색어를 입력하세요!");
       				$("#find_name").val("").focus();
       				return false;
       			}
       		}
       	</script>
       	<div>
       	<form method="get" action="infoDoc_find_ok.nhn" id="findtable" onsubmit="return find_check()">
       		<table>
       			<tr>
       			<th>
       				<select name="find_field" >
       					<option value="INFO_DOC_SUB">서류명</option>
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
       	</div>
       	
       			<select id="viewcount">
				  	<option value="5" selected>5줄 보기</option>
			  		<option value="10">10줄 보기</option>
				    <option value="20">20줄 보기</option>
	  		 	</select>
       		</div>
    <!-- 게시판 리스트 -->
    <div id="infoDoclist_wrap">
    <form>
    <table border="1" id="doctable" style="margin-bottom:20px;">
    <!-- 레코드가 있으면 -->
    <p>※서류명을 클릭하면 서류양식파일을 다운받을 수 있습니다.</p>
    <tr>
       <th colspan = "2">서류정보 - list</th>
    </tr>
    
    <tr>
       <th width = "20%"><div>번호</div></th>
       <th width = "80%"><div>서류명</div></th>
    </tr>
    
    <c:set var = "infoDoc_num" value = "${listcount-(page-1)*limit}"/>
    <c:forEach var = "b" items = "${infoDoclist}">
    <tr>
       <td>
			<a href = "infoDoc_cont.nhn?infoDoc_num=${b.INFO_DOC_NUM}&page=${page}&state=cont">
          <c:out value = "${infoDoc_num}"/><%--num 출력 --%></a>
          <c:set var = "infoDoc_num" value = "${infoDoc_num-1}"/><%-- num = num-1 --%>
       </td>
       
        <td>
        	<div style="text-align:left">
             <a href="./infoDoc_download.file?path=${b.INFO_DOC_FILE}&original=${b.INFO_DOC_ORIGINAL}">
             		${b.INFO_DOC_SUB}
             </a>
            </div>
       </td>
       
    </tr>
    
    </c:forEach>
    <tr class = "h30 lime center btn">
       <td colspan = 2>
       		<a href = "./infoDoc_list.nhn?page=1">&lt;</a>
          <c:if test = "${page <= 1}">
             이전&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "./infoDoc_list.nhn?page=${page-1}">이전</a>&nbsp;   
          </c:if>
          
          <c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${a == page}">
                ${a}
             </c:if>
             <c:if test = "${a != page}">
                <a href = "./infoDoc_list.nhn?page=${a}">${a}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;다음
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "./infoDoc_list.nhn?page=${page+1 }">&nbsp;다음</a>
          </c:if>
          <a href = "./infoDoc_list.nhn?page=${endpage}">&gt;</a>
       </td>                  
    </tr>
    
  		
    
    <!-- 레코드가 없으면 -->
    <c:if test="${listcount == 0 }">
       <tr>
          <td colspan="2">정보게시판- 서류list</td>
          <td style = "text-align:right">
             <font size = 2>등록된 글이 없습니다.</font>
          </td>   
       </tr>
    	
    </c:if>
    </table>
    	
    	
    	<span id="edit">
    		<input type="button" id="writebt" value="글쓰기" onclick="location='infoDoc_write.nhn'">
    	</span>
    </form>
    </div>
</body>
</html>