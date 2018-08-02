<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
div[id=header]{height:130px; height:80px;text-align:center;background-color:#5CD1E5;margin:0 auto;}
span{font-size:18px; font-weight: bold}
a{text-decoration: none}
</style>
<%
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");
%>
   <div id="header">
      <%-- <c:if test="${empty id }">         
      <script>
         location.href="login.net";
      </script>
      
   </c:if> --%>
   <c:if test="${!empty id}">
      <c:if test="${id=='admin' }">
         <span>관리자 ${id }님 환영합니다.</span>
         <a href="member_list.net">관리자모드 접속(회원 목록 보기)</a>
         <a href="bbs_list.nhn">(게시판)</a>
      </c:if>
      <c:if test="${id!='admin' }">
         <span>일반회원 ${id }님 환영합니다.</span>
      </c:if>
   </c:if>
   
<span>(<a href="member_update.net">정보수정</a>)
(<a href="logout.net">로그아웃</a>)</span>   

</div>