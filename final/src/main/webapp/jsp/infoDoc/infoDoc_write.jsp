<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/infomobile.css">
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
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta>
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/infoDoc.js"></script>
</head>
<body>

<div class="infowrap">
	<h2>정보 게시판</h2>
	<form>
		<input type="button" value="필요서류" id="infomenu" onclick="location='infoDoc_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
		<input type="button" value="정책" id="infomenu"  onclick="location='infoPolicy_list.nhn?page=1'" style="border:none">
		<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="border:none">
	    		
		<br>
		
		<div id="ohr">
			<hr id="inhr">
		</div>
	
		<h4>게시물 작성</h4>
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
            
         <div id="infoDocwrite_menu" style="text-align:center; padding-top: 5%;">
            <input type="submit" value="등록" style="background-color:white; border:1.5px solid #008CBA;" class="input_button">
            <input type="reset" value="취소" style="background-color:white; border:1.5px solid #008CBA;" class="input_button"
                  onclick="$('#INFO_DOC_SUB').focus();">
                  
         </div>
      </form>
   </div>
</div>

</body>
</html>