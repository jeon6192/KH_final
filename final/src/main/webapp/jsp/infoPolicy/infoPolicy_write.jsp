<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table {margin:0 auto; border-collapse:collapse}
td {height:15px}
</style>
<meta>
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/bbs.js"></script>
<link href="resources/css/bbs.css" rel="stylesheet">
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
   <div id="infoPolicywrite_wrap">
   		<h2 class="infoPolicywrite_title">정책정보 입력폼</h2>
      <form action="infoPolicy_write_ok.nhn" method="post" onsubmit="return check()" enctype="multipart/form-data">
         <table id="infoPolicy_write_t" border="1">
            <tr>
               <th>제목</th>
               <td>
                  <input name="INFO_POLICY_SUB" id="INFO_POLICY_SUB"
                     size="40" class="input_box">
               </td>
            </tr>
            <tr>
               <th>내용</th>
               <td>
                  <textarea name="INFO_POLICY_CONT" id="INFO_POLICY_CONT"
                     rows="8" cols="50" class="input_box"></textarea>
               </td>
            </tr>
            <tr>
               <th>파일첨부</th>
               <td>
               	<label for="upfile"><img alt="파일열기" src="resources/images/upload.jpg" style="width:30px; height:30px;"></label>
              	 <input type="file" id="upfile" name="uploadfile">
               	<span id="filevalue"></span>&nbsp;
               	<span id="close"><img src="resources/images/cancel.png" style="width:30px; height:30px;"></span>
               </td>
            </tr>
           </table>
            
         <div id="infoPolicywrite_menu">
            <input type="submit" value="등록" class="input_button">
            <input type="reset" value="취소" class="input_button"
                  onclick="$('#INFO_POLICY_SUB').focus();">
                  
         </div>
      </form>
   </div>
</body>
</html>