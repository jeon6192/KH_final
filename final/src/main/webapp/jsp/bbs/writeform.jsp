<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="게시판 새글쓰기" />
<meta name="Description" content="게시판 새글쓰기" />
<link rel="stylesheet" href="./resources/css/screen.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./resources/css/screen_min.css" type="text/css" media="screen" />
<title>${boardNm }</title>
<script type="text/javascript">
//<![CDATA[
    function check() {
        var form = document.getElementById("writeForm");
        //유효성 검사로직 추가
        return true;
    }
   
    function goList() {
        var form = document.getElementById("listForm");
        form.submit();
    }
 
//]]>
</script>
</head>
<body>
 
    <div id="header">
        <%@ include file="../header.jsp" %>
    </div>
<div id="wrap"> 
<%--     <div id="main-menu">
        <%@ include file="../inc/main-menu.jsp" %>
    </div> --%>
 
<!--     <div id="container">
        <div id="content" style="min-height: 800px;">
            <div id="url-navi">BBS</div> -->
 
<!-- 본문 시작 -->
<div id="text1">Q&A게시판</div>
<h3>글쓰기</h3>
<hr class="two">
<div style="float:right;"><a class="a_cont" href="./main.com">House</a>&nbsp;>&nbsp;<a class="a_cont" href="./list.nhn">Q&A게시판</a></div>
<div id="bbs" class="table-responsive">
<form id="writeForm" action="write" method="post" enctype="multipart/form-data" onsubmit="return check()">
<p style="margin: 0;padding: 0;">
<input type="hidden" name="boardCd" value="${param.boardCd }" />
</p>
<table id="write-form">
<tr>
    <td>제목</td>
    <td><input type="text" name="title" size="50" /></td>
</tr>
<tr>
    <td colspan="2">
        <textarea name="content" rows="17" cols="69"></textarea>
    </td>
</tr>
<tr>
 <td>파일첨부</td>
 <td><input type="file" name="upload" multiple /></td>
</tr>
</table>
<div style="text-align: center;padding-bottom: 15px;">
    <input type="submit" value="전송" class="btn"/>
    <input type="button" value="목록" onclick="goList()" class="btn"/>
</div>
</form>
</div><!-- bbs 끝 -->
<!--  본문 끝 -->
 
  <!--       </div>content 끝
    </div> container 끝 -->
   
<%--     <div id="sidebar">
        <%@ include file="bbs-menu.jsp" %>
    </div> --%>
   
<%--     <div id="extra">
        <%@ include file="../inc/extra.jsp" %>
    </div> --%>
 
<%--     <div id="footer">
        <%@ include file="../inc/footer.jsp" %>
    </div> --%>
 
</div>
 
<div id="form-group" style="display: none;">
    <form id="listForm" action="list.nhn" method="get">
        <p>
        <input type="hidden" name="boardCd" value="${param.boardCd }" />
        </p>
    </form>
</div>
 
</body>
</html>