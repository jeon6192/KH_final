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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	td {width:1000px}
	th {width:400px}
	#infoPolicycont_t {margin:0 auto}
	#policylist {float:right}
	#infoPolicycont_wrap {margin:0 auto}
	table {border-collapse:collapse}
	#wrap a:first-child{float:left}
	#wrap a:last-child{float:right}
</style>
<script>
	var level=0;//
	function listOpen(){
		if(level==1){
			$("#listOpenClose").show();
			$("#policylist").val("목록닫기");
			level=0;
		}
		else{
			$("#listOpenClose").hide();
			$("#policylist").val("목록열기");
			level=1;
		}
	}

</script>
</head>
<body>

<header>
<div id="infoPolicycont_wrap" style="width:600px">
<h2 class="infoPolicycont_title" style="width:370px">
<input type="button" value="필요서류" onclick="location='infoDoc_list.nhn?page=1'">
		<input type="button" value="정책" onclick="location='infoPolicy_list.nhn?page=1'">
		<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'">
	    		
		<br>
		<hr>
게시물 내용보기</h2>
<p>
<input type="button" value="목록닫기" id="policylist" onclick="listOpen()">
</p>
</header>

<footer>
<table border="1" id="listOpenClose">
	<tr>
		<th>글목록</th>
		<th>
			<font size=2>글 개수 : ${listcount}</font>
		</th>
	</tr>
	<tr>
		<th colspan="2">글제목</th>
	</tr>
	<c:if test="${listcount != 0 }">
	<c:set var = "infoPolicy_num" value = "${listcount-(listpage-1)*limit}"/>
    <c:forEach var = "p" items = "${infoPolicylist}">
	<tr>
		<td colspan="2">
			<div style="text-align:left">
             <a href = "infoPolicy_cont.nhn?infoPolicy_num=${p.INFO_POLICY_NUM}&page=${page}&state=cont&listpage=${listpage}">
                      ${p.INFO_POLICY_SUB}
             </a>
             </div>
		</td>
	</tr>
	</c:forEach>
	<tr class = "h30 lime center btn">
       <td colspan = 2>
       <a href = "./infoPolicy_cont.nhn?listpage=1&infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&state=cont">&lt;</a>
          <c:if test = "${listpage <= 1}">
             이전&nbsp;
          </c:if>
          <c:if test = "${listpage > 1}">
             <a href = "./infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&state=cont&listpage=${listpage - 1}">이전</a>&nbsp;   
          </c:if>
          
          <c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${a == listpage}">
                ${a}
             </c:if>
             <c:if test = "${a != listpage}">
                <a href = "./infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&state=cont&listpage=${a}">${a}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${listpage >= maxpage}">
             &nbsp;다음
          </c:if>
          <c:if test = "${listpage < maxpage}">
             <a href = "./infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&state=cont&listpage=${listpage+1 }">&nbsp;다음</a>
          </c:if>
          <a href = "./infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&state=cont&listpage=${endpage}">&gt;</a>
       </td>                  
    </tr>
    </c:if>
 

 <!-- 레코드가 없으면 -->
    <c:if test="${listcount == 0 }">
       <tr>
          <td style = "text-align:right" colspan="3">
             <font size = 2>등록된 글이 없습니다.</font>
          </td>   
       </tr>
    </c:if>
    </table>


<br>
<br>
<br>
<hr>

<div id="wrap">


<table id="infoPolicycont_t" border="1">
<c:set var = "infoPolicy_num" value = "${listcount-(listpage-1)*1}"/>
    
	<tr>
		<th>제목</th>
		<td>
             ${infoPolicy.INFO_POLICY_SUB}
		</td>
	</tr>
	<tr>
	<th>내용</th>
	<td>
		${infoPolicy.INFO_POLICY_CONT}
	</td>
	</tr>
	<c:if test="${!empty infoPolicy.INFO_POLICY_FILE }">
	<tr>
		<th>첨부파일</th>
		<td>
		<a href="./infoPolicy_download.file?path=${infoPolicy.INFO_POLICY_FILE}&original=${infoPolicy.INFO_POLICY_ORIGINAL}">
		${infoPolicy.INFO_POLICY_ORIGINAL}</a>
		</td>
	</tr>
	</c:if>
	<tr>
	<th>조회수</th>

	<td>
		${infoPolicy.INFO_POLICY_VISIT}
	</td>
	</tr>
</table>
</div>	
<br>
<br>
	<div id="infoPolicycont_menu" style="margin-left:200px">
		<input type="button" value="수정" class="input_button"
		onclick="location='infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&listpage=${listpage}&state=edit'">
		
		<input type="button" value="삭제" class="input_button"
		onclick="location='infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&listpage=${listpage}&state=del'">
		
		<input type="button" value="목록" class="input_button"
		onclick="location='infoPolicy_list.nhn?page=1'">
	</div>
</footer>
</div>
</body>
</html>