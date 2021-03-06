<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./resources/css/infomobile.css" type="text/css" media="( max-width: 1024px )">
<link rel="stylesheet" href="./resources/css/infomobile.css" type="text/css" media="( min-width: 1024px )">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div class="infowrap">
		<h2>정보 게시판</h2>
		<form>
			<input type="button" value="필요서류" onclick="location='infoDoc_list.nhn?page=1'" style="border:none">
			<input type="button" value="정책" onclick="location='infoPolicy_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
			<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="border:none">
	    		
			<br>
		
		</form> 
	
		<div id="ohr">
			<hr id="inhr">
		</div>
		
		<h4>게시물 수정</h4>
   		<div id = "infoPolicyedit_wrap">
      		<form method = "post" action = "infoPolicy_edit_ok.nhn" enctype="multipart/form-data" onsubmit="return check()">
      			<input type= "hidden" name = "INFO_POLICY_NUM" value = "${infoPolicy.INFO_POLICY_NUM}"> <!-- name을 Bean 변수명과 일치시켜야 한다 -->
      			<input type= "hidden" name = "page" value = "${page}">
      
      			<div id="infoPolicyedit" style="padding-top: 10%;">
      				<table id = "infotable" border="1">
            			<tr>
               				<th>제목</th>
               				<td>
                  				<input name="INFO_POLICY_SUB" style="width:100%" id="infoPolicy_subject"
                     				size="40" value="${infoPolicy.INFO_POLICY_SUB}">
               				</td>
            			</tr>
         				<tr>
            				<th>내용</th>
            				<td>
               					<textarea name = "INFO_POLICY_CONT" id = "infoPolicy_content" rows="8"  cols="50">${infoPolicy.INFO_POLICY_CONT}</textarea>   
            				</td>
         				</tr>
         				<tr>
               				<th>파일첨부</th>
               				<td>
               					<label for="upfile"><img alt="파일열기" src="resources/images/upload.jpg" style="width:30px; height:30px;"></label>
               					<input type="file" id="upfile" name="uploadfile">
               					<span id="filevalue">${infoPolicy.INFO_POLICY_ORIGINAL}</span>&nbsp;
               					<span id="close"><img src="resources/images/cancel.png" style="width:30px; height:30px;"></span>
               				</td>
         				</tr>
      				</table>
      			</div>
      
      			<div id = "infoedit_menu" style="text-align:center; padding-top: 5%;">
         			<input type = "submit" value = "수정" style="background-color:white; border:1.5px solid #008CBA;" class = "input_button">
         			<input type = "reset" value = "취소" style="background-color:white; border:1.5px solid #008CBA;" class = "input_button" onclick= "$('#infoPolicy_subject').focus();">
         			<input type = "button" value = "목록" style="background-color:white; border:1.5px solid #008CBA;" class = "intput_button"
            			onclick = "location='infoPolicy_list.nhn?page=${page}'">         
      			</div>      
      		</form>
   		</div>
	</div>
</body>
</html>