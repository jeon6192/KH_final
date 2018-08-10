<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="Keywords" content="게시판 목록" />
<meta name="Description" content="게시판 목록" />
<link rel="stylesheet" href="./resources/css/screen.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./resources/css/screen_min.css" type="text/css" media="screen" />
<title>${boardNm }</title>
<script type="text/javascript">
//<![CDATA[
 function goList(page) {
  var form = document.getElementById("listForm");
  form.curPage.value = page;
  form.submit();
 }
 
 function goWrite() {
  var form = document.getElementById("writeForm");
  form.submit();
 }
 
 function goView(articleNo) {
  var form = document.getElementById("viewForm");
  form.articleNo.value = articleNo;
  form.submit();
  
 }
//]]>

$(function(){
    
	$.ajax ({
		url : "hit_list.nhn",
		success : function(data){
			$("#hit_list").append(data);
		}
	})
	
	
	
})



</script> 
<script>
function print(printArea)
{
		win = window.open(); 
		self.focus(); 
		win.document.open();
		
		/*
			1. div 안의 모든 태그들을 innerHTML을 사용하여 매개변수로 받는다.
			2. window.open() 을 사용하여 새 팝업창을 띄운다.
			3. 열린 새 팝업창에 기본 <html><head><body>를 추가한다.
			4. <body> 안에 매개변수로 받은 printArea를 추가한다.
			5. window.print() 로 인쇄
			6. 인쇄 확인이 되면 팝업창은 자동으로 window.close()를 호출하여 닫힘
		*/
		win.document.write('<html><style>');
		win.document.write('body, td {font-falmily: Verdana; font-size: 10pt;}');
		win.document.write('</style></haed><body>');
		win.document.write(printArea);
 		win.document.write('</body></html>');
		win.document.close();
		win.print();
		win.close();
}
</script> 
</head>
<body>



 <div id="header">
  <%@ include file="../header.jsp" %>
 </div>
<div id="wrap">
<%--  <div id="main-menu">
  <%@ include file="../inc/main-menu.jsp" %>
 </div> --%>

<!--  <div id="container">
  <div id="content" style="min-height: 800px;">
   <div id="url-navi">BBS</div> -->

<!-- 본문 시작 -->   
<div id="text1">Q&A게시판</div>
<hr class="two">
<span class="qna_cont">분양과 관련하여</span> <span>궁금한 점을 자유롭게 문의바랍니다.</span>
<br>
<br>
<div style="float:right;"><a class="a_cont" href="./main.com">House</a>&nbsp;>&nbsp;<a class="a_cont" href="./list.nhn">Q&A게시판</a></div>
<br>
<br>
<img src="./resources/img/qnabox3.jpg" style="width:100%">
<br>
<br>
<h4 style=" font-weight:bold;">조회수 높은 글 BEST 5</h4>
<div id="hit_list">
</div>
<br>
<br>
<%-- <%@ include file="../inc/hit_list.jsp" %> --%>
<div id = "printArea">
<div id="bbs" class="table-responsive">
 <table class="table table-hover">
 <thead>
 <tr>
  <th style="width: 60px; color:#2e75b6;">NO</th>
  <th style="color:#2e75b6;">TITLE</th>
  <th style="width: 74px; color:#2e75b6;">WRITER</th>
  <th style="width: 63px; color:#2e75b6;">DATE</th>
  <th style="width: 30px; color:#2e75b6;">HIT</th>
 </tr>
 </thead>
 <tbody>
 <!--  반복 구간 시작 -->
 <c:forEach var="article" items="${list }" varStatus="status"> 
 <tr>
  <td style="text-align: center;">${no - status.index}</td>
  <td>
   <a href="javascript:goView('${article.articleNo }')">${article.title }</a>
   <c:if test="${article.attachFileNum > 0 }">
    <img src="./resources/img/attach.png" alt="첨부파일" />
   </c:if>
   <c:if test="${article.commentNum > 0 }">
    <span class="bbs-strong">[${article.commentNum }]</span>
   </c:if>
  </td>
  <td style="text-align: center;">${article.id}</td> 
  <td style="text-align: center;">${article.writeDate }</td>
  <td style="text-align: center;">${article.hit }</td>
 </tr>
 </c:forEach>
 <!--  반복 구간 끝 -->
 </tbody>
 </table>
 
 <!--paging-->
 <div id="paging" style="text-align: center;">
  
  <c:if test="${prevLink > 0 }">
   <a href="javascript:goList('${prevPage }')">[이전]</a>
  </c:if>

  <c:forEach var="i" items="${pageLinks }" varStatus="stat">
   <c:choose>
   <c:when test="${curPage == i}">
    <span class="bbs-strong">${i }</span>
   </c:when>
   <c:otherwise>
    <a href="javascript:goList('${i }')">${i }</a>
   </c:otherwise>
   </c:choose>
  </c:forEach>
  
  <c:if test="${nextLink > 0 }">
   <a href="javascript:goList('${nextPage }')">[다음]</a>
  </c:if>
  
 </div>
 
 <div id="list-menu" style="text-align:  right;">
    <c:if test="${sessionScope.id!='admin'}">
<input type="button" value="새글쓰기" onclick="goWrite()" class="btn"/>
</c:if>
  <input type = "button" value="인쇄하기" OnClick="print(document.getElementById('printArea').innerHTML)" class="btn" id="print"/>
 </div>
  <div id="search" style="text-align: center;">
  <form id="searchForm" action="./list.nhn" method="get" style="margin: 0;padding: 0;">
   <p style="margin: 0;padding: 0;">
    <input type="hidden" name="boardCd" value="${param.boardCd }" />
    <br>
    <input type="text" name="searchWord" size="15" maxlength="30"/>
    <input type="submit" value="검색" class="btn"/>
   </p> 
  </form>
 </div> 
 
</div>
<!--  본문 끝 -->

  </div><!-- content 끝 -->
  </div>
<%--  
 <div id="sidebar">
  <%@ include file="bbs-menu.jsp" %>
 </div>
  --%>
<%--  <div id="extra">
  <%@ include file="../inc/extra.jsp" %>
 </div> --%>

<%--  <div id="footer">
  <%@ include file="../inc/footer.jsp" %>
 </div> --%>


<div id="form-group" style="display: none;">
 <form id="listForm" action="./list.nhn" method="get">
  <p>
   <input type="hidden" name="boardCd" value="${boardCd }" />
   <input type="hidden" name="curPage" />
    <input type="hidden" name="searchWord" value="${param.searchWord }" />
  </p>
 </form>
 
 <form id="writeForm" action="./write.nhn" method="get">
 <p>
  <input type="hidden" name="boardCd" value="${boardCd }" />
  <input type="hidden" name="curPage" value="${curPage }" />
  <input type="hidden" name="searchWord" value="${param.searchWord }" />
 </p>
 </form>
 
 <form id="viewForm" action="./view.nhn" method="get">
 <p>
  <input type="hidden" name="articleNo" />
  <input type="hidden" name="boardCd" value="${boardCd }" />
  <input type="hidden" name="curPage" value="${curPage }" />
  <input type="hidden" name="searchWord" value="${param.searchWord }" />
 </p>
 </form>
</div>
<%-- param.curPage : ${param.curPage }, ${curPage } --%>
</body>
</html>