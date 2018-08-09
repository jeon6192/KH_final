<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<style>
	@font-face{
  		font-family : 'NanumGothic';
  		src : url(../fonts/NanumGothic.ttf) format('truetype');
	}
	body{
		font-family: NanumGothic
	}
	table {margin:0 auto; border-collapse:collapse}
	td {height:15px}
	.infowrap{
    	padding-top: 12%; width:1000px; padding-bottom:5%;  margin: 0 auto;
	}
	#inhr{width:100%}
	#ohr{margin-top:20px}
	#ohr hr{background-color: #2e75b6;}
</style>
<meta>
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/bbs.js"></script>
<link href="resources/css/bbs.css" rel="stylesheet">
</head>
<body>
<div class="infowrap">
	<h2>정보 게시판</h2>
	<form>
		<input type="button" value="필요서류" onclick="location='infoDoc_list.nhn?page=1'" style="border:none">
		<input type="button" value="정책" onclick="location='infoPolicy_list.nhn?page=1'" style="border:none">
		<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
	    		
		<br>
		
	</form> 
	
	<div id="ohr">
		<hr id="inhr">
	</div>
	
	<h4>게시물 작성</h4>
	
   <div id="infoEtcwrite_wrap">
      <form action="infoEtc_write_ok.nhn" method="post" onsubmit="return check()" enctype="multipart/form-data">
         <table id="infoEtc_write_t" border="1">
            <tr>
               <th>제목</th>
               <td>
                  <input name="INFO_ETC_SUB" id="INFO_ETC_SUB"
                     size="40" class="input_box" style="width:100%">
               </td>
            </tr>
            <tr>
               <th>내용</th>
               <td>
                  <textarea name="INFO_ETC_CONT" id="INFO_ETC_CONT"
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
            
         <div id="infoEtcwrite_menu" style="text-align:center; padding-top: 5%;">
            <input type="submit" value="등록" style="background-color:white; border:1.5px solid #008CBA;" class="input_button">
            <input type="reset" value="취소" style="background-color:white; border:1.5px solid #008CBA;" class="input_button"
                  onclick="$('#INFO_ETC_SUB').focus();">
                  
         </div>
      </form>
   </div>
</div>
</body>
</html>