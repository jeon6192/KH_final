<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="Keywords" content="게시판 목록" />
<meta name="Description" content="게시판 목록" />
<link rel="stylesheet" href="./resources/css/screen.css" type="text/css" media="screen" />
<table class="table table-hover" style=" border: 3px solid #04B4AE;">
 <tbody>
 <!--  반복 구간 시작 -->
 <c:forEach var="article" items="${hit_list}" varStatus="status"> 
 <tr>
  <td style="text-align: center;">${status.index + 1}</td>
  <td>
   <a href="javascript:goView('${article.articleNo }')">${article.title }</a>
   <c:if test="${article.attachFileNum > 0 }">
    <img src="./resources/img/attach.png" alt="첨부파일" />
   </c:if>
   <c:if test="${article.commentNum > 0 }">
    <span class="bbs-strong">[${article.commentNum }]</span>
   </c:if>
  </td>
 <%--  <td style="text-align: center;">${article.User_no }</td> --%>
  <td style="text-align: center;">${article.hit }</td>
 </tr>
 </c:forEach>
 <!--  반복 구간 끝 -->
 </tbody>
 </table>