<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./resources/css/infomobile.css" type="text/css" media="( max-width: 1024px )">
<link rel="stylesheet" href="./resources/css/infomobile.css" type="text/css" media="( min-width: 1024px )">
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
         <table id="infotable" border="1">
            <tr>
               <th>서류명</th>
               <td>
                  <input name="INFO_DOC_SUB" id="INFO_DOC_SUB" size="40" class="input_box">
                  <label for="upfile"><img alt="파일열기" src="resources/images/upload.jpg" style="width:30px; height:30px;"></label>
               	<input type="file" id="upfile" name="uploadfile">
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