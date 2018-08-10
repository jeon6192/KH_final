<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>정보게시판</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
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
	#infoedit_t tr{width:30%}
	#infoedit_t td{width:70%}
</style>
</head>
<body>
	<div class="infowrap">
		<h2>정보 게시판</h2>
		<form>
			<input type="button" value="필요서류" onclick="location='infoDoc_list.nhn?page=1'" style="border:none">
			<input type="button" value="정책" onclick="location='infoPolicy_list.nhn?page=1'" style="border:none">
			<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
		</form> 
	
		<div id="ohr">
			<hr id="inhr">
		</div>
		
		<h4>게시물 수정</h4>
   		<div id = "infoEtcedit_wrap">
      		<form method = "post" action = "infoEtc_edit_ok.nhn" enctype="multipart/form-data" onsubmit="return check()">
      			<input type= "hidden" name = "INFO_ETC_NUM" value = "${infoEtc.INFO_ETC_NUM}">
      			<input type= "hidden" name = "page" value = "${page}">
      
      			<div id="infoEtcedit" style="padding-top: 10%;">
      				<table id = "infoedit_t" border="1">
            			<tr>
               				<th>제목</th>
               				<td>
                 			 	<input name="INFO_ETC_SUB" id="infoEtc_subject"
                     				size="40" value="${infoEtc.INFO_ETC_SUB}">
               				</td>
            			</tr>
         				<tr>
            				<th>내용</th>
            				<td>
               					<textarea name = "INFO_ETC_CONT" id = "infoEtc_content" rows="8"  cols="50">${infoEtc.INFO_ETC_CONT}</textarea>   
            				</td><!-- name을 테이블명과 일치시켜야 한다  -->
         				</tr>
         				<tr>
               				<th>파일첨부</th>
               				<td>
               					<label for="upfile"><img alt="파일열기" src="resources/images/upload.jpg" style="width:30px; height:30px;"></label>
               					<input type="file" id="upfile" name="uploadfile">
               					<span id="filevalue">${infoEtc.INFO_ETC_ORIGINAL}</span>&nbsp;
               					<span id="close"><img src="resources/images/cancel.png" style="width:20px; height:20px;"></span>
               				</td>
         				</tr>
      				</table>
      			</div>
      
      			<div id = "infoedit_menu" style="text-align:center; padding-top: 5%;">
         			<input type = "submit" value = "수정" style="background-color:white; border:1.5px solid #008CBA;" class = "input_button">
         			<input type = "reset" value = "취소" style="background-color:white; border:1.5px solid #008CBA;" class = "input_button" onclick= "$('#infoEtc_subject').focus();">
         			<input type = "button" value = "목록" style="background-color:white; border:1.5px solid #008CBA;" class = "intput_button"
           			 	onclick = "location='infoEtc_list.nhn?page=1'">         
      			</div>      
      		</form>
   		</div>
	</div>
</body>
</html>