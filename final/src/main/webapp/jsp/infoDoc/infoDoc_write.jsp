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
<script src="resources/js/infoDoc.js"></script>
<link href="resources/css/infoDoc.css" rel="stylesheet">
</head>
<body>
	<h2>정보 게시판</h2>
	<form>
		<input type="button" value="필요서류" onclick="location='infoDoc_list.nhn'">
		<input type="button" value="정책" onclick="location='infoPolicy_list.nhn'">
		<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn'">
	    		
		<br>
		<hr>
	</form>
   <div id="infoDocwrite_wrap">
      <form action="infoDoc_write_ok.nhn" method="post" onsubmit="return check()" enctype="multipart/form-data">
         <table id="infoDocwrite_t" border="1">
            <tr>
               <th>서류명</th>
               <td>
                  <input name="INFO_DOC_SUB" id="INFO_DOC_SUB" size="40" class="input_box">
                  <label for="upfile"><img alt="파일열기" src="resources/images/upload.jpg" style="width:30px; height:30px;"></label>
               	<input type="file" id="upfile" name="uploadfile">
               	<span id="filevalue"></span>&nbsp;
               </td>
            </tr>
           </table>
            
         <div id="infoDocwrite_menu">
            <input type="submit" value="등록" class="input_button">
            <input type="reset" value="취소" class="input_button"
                  onclick="$('#INFO_DOC_SUB').focus();">
                  
         </div>
      </form>
   </div>
</body>
</html>