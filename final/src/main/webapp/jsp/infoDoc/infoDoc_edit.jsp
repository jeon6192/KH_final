<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/infomobile.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보게시판</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/infoDoc.js"></script>
<style>
	@font-face{
  		font-family : 'NanumGothic';
  		src : url(./fonts/NanumGothic.ttf) format('truetype');
	}
	body{
		font-family: NanumGothic
	}
	table {border-collapse:collapse; margin:0 auto; width:70%}
	.infowrap{
    	padding-top: 12%; width:1000px; padding-bottom:5%;  margin: 0 auto;
	}
	#inhr{width:100%}
	#ohr{margin-top:20px}
	#ohr hr{background-color: #2e75b6;}
</style>
</head>
<body>
<div class="infowrap">
	<h2>정보 게시판</h2>
	<form>
		<input type="button" value="필요서류" id="infomenu" onclick="location='infoDoc_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
		<input type="button" value="정책" id="infomenu"  onclick="location='infoPolicy_list.nhn?page=1'" style="border:none">
		<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="border:none">
	</form>
	
	<br>
	
	<div id="ohr">
		<hr id="inhr">
	</div>
	
	<h4>게시물 수정</h4>
      <form method = "post" action = "infoDoc_edit_ok.nhn" enctype="multipart/form-data" onsubmit="return check()">
      
      <input type= "hidden" name = "INFO_DOC_NUM" value = "${infoDoc.INFO_DOC_NUM}">
      <input type= "hidden" name = "page" value = "${page}">
      <div id="infoDocedit" style="padding-top: 10%;">
      	<table id = "infoedit_t" border="1">
            <tr>
               	<th>서류명</th>
               	<td>
                  	<input name="INFO_DOC_SUB" id="INFO_DOC_SUB"
                    	 size="40" style="width:100%" value="${infoDoc.INFO_DOC_SUB}">
               	</td>
            </tr>
         
         	<tr>
               <th>파일첨부</th>
               <td>
               	<label for="upfile"><img alt="파일열기" src="resources/images/upload.png" style="width:20px; height:20px;"></label>
               	<input type="file" id="upfile" name="uploadfile">
               	<span id="filevalue">${infoDoc.INFO_DOC_ORIGINAL}</span>&nbsp;
               	<span id="close"><img src="resources/images/cancel.png" style="width:20px; height:20px;"></span>
               </td>
         	</tr>
      	</table>
      </div>
      
      <div id = "infoedit_menu" style="text-align:center; padding-top: 5%;">
         <input type = "submit" value = "수정" style="background-color:white; border:1.5px solid #008CBA;" class = "input_button">
         <input type = "reset" value = "취소" style="background-color:white; border:1.5px solid #008CBA;" class = "input_button" onclick= "$('#INFO_DOC_SUB').focus();">
         <input type = "button" value = "목록" style="background-color:white; border:1.5px solid #008CBA;" class = "intput_button"
            onclick = "location='infoDoc_list.nhn?page=${page}'">         
      </div>      
      </form>
   
   </div>
</body>
</html>