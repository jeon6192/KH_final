<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ include file="../header.jsp"%>
<%-- <%@ include file="../header.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/infomobile.css" type="text/css" media="( max-width: 1024px )">
<link rel="stylesheet" href="./resources/css/infomobile.css" type="text/css" media="( min-width: 1024px )">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/infomobile.css"> -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>정보 게시판</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/infoDoclist_line.js"></script>
<script>
$(function(){
	$("#viewcount").val('${limit}');
})
</script>
<!-- $("#infomenu").onmousedown(function(){
	$("#infomenu").style.background='blue';
	$("#infomenu").style.color='white';
})
</script> --> -->
</head>
<body>
	<%-- <jsp:include page="../header.jsp"/> --%>
	<div class="infowrap">
		<h2>정보 게시판</h2>
		<form>
			<input type="button" value="필요서류" id="infomenu" onclick="location='infoDoc_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
			<input type="button" value="정책" id="infomenu"  onclick="location='infoPolicy_list.nhn?page=1'" style="border:none">
			<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="border:none">
	    		
			<br>
		</form>
	
		<div id="ohr">
			<hr id="inhr">
		</div>
	
    	<script>
        	function find_check(){
       			if($.trim("#find_name").val()==""){
       				alert("검색어를 입력하세요!");
       				$("#find_name").val("").focus();
       				return false;
       			}
       		}
    	</script>
       	
    	<div id="findline" style="padding-bottom: 40px;">
			
       		<form method="get" action="infoDoc_find_ok.nhn" id="findtable" onsubmit="return find_check()">
       			<table>
       				<tr id="find">
       					<th>
       						<select name="find_field" id="find_field">
       							<option value="INFO_DOC_SUB">서류명</option>
       						</select>
       					</th>
       					
       					<td>
       						<input name="find_name" id="find_name" class="input_box">
       						<input type="submit" value="검색" class="input_button" style="background-color:#2e75b6; color:white; border:1px solid black;">
       					</td>
       				</tr>
       			</table>
       		</form>
       		
       		<select id="viewcount">
				<option value="5" selected>5줄 보기</option>
				<option value="10">10줄 보기</option>
				<option value="20">20줄 보기</option>
			</select>
		</div>
       		
    <!-- 게시판 리스트 -->
    <div id="contentdown">
    	<p>※서류명을 클릭하면 서류양식파일을 다운받을 수 있습니다.</p>
    </div>
    <div id="infotable_wrap">
    	<form>
    			<table border="1" id="infotable" style="margin-bottom:20px;">
    				<!-- 레코드가 있으면 -->
    				<tr>
      					<th>서류정보 - list</th>
      					<th>글 개수 : ${listcount}</th>
    				</tr>
    				<c:if test="${listcount != 0 }">
    				<tr>
       					<th width = "20%"><div>번호</div></th>
       					<th width = "80%"><div>서류명</div></th>
    				</tr>
    
    				<c:set var = "infoDoc_num" value = "${listcount-(page-1)*limit}"/>
   					<c:forEach var = "b" items = "${infoDoclist}">
   		 			<tr>
       					<td>
       						<c:if test="${!empty sessionScope.Admin_no}">
								<a href = "infoDoc_cont.nhn?infoDoc_num=${b.INFO_DOC_NUM}&page=${page}&state=cont">
          						<c:out value = "${infoDoc_num}"/><%--num 출력 --%></a>
          					</c:if>
          					<c:if test="${empty sessionScope.Admin_no}">
          						<c:out value = "${infoDoc_num}"/>
          					</c:if>
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
   					<tr>
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
    			</c:if>
    
    			<!-- 레코드가 없으면 -->
    			<c:if test="${listcount == 0 }">
      				<tr>
          				<td colspan="2" style = "text-align:center">
             					등록된 글이 없습니다.
          				</td>  
       				</tr>
    			</c:if>
    		</table>
    	<c:if test="${!empty sessionScope.Admin_no}">
        	<div id="write">
          		<input type="button" id="writebt" value="글쓰기" onclick="location='infoDoc_write.nhn'" style="background-color:white; border:1.5px solid #008CBA;">
        	</div>
      	</c:if>
    		
    	</form>
    	</div>
    	</table>
	</div>
</body>
</html>