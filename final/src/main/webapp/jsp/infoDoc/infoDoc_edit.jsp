<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/infoDoc.js"></script>
<style>
	table {border-collapse:collapse}
</style>
</head>
<body>
      <h2 class = "infoDocedit_title">정보게시판 수정</h2>
      <form method = "post" action = "infoDoc_edit_ok.nhn" enctype="multipart/form-data" onsubmit="return check()">
      <div id="infoDocedit" style="width:600px">
      <input type= "hidden" name = "INFO_DOC_NUM" value = "${infoDoc.INFO_DOC_NUM}">
      <input type= "hidden" name = "page" value = "${page}">
      
      <table id = "infoDocedit_t" border="1">
            <tr>
               <th>서류명</th>
               <td>
                  <input name="INFO_DOC_SUB" id="INFO_DOC_SUB"
                     size="40" value="${infoDoc.INFO_DOC_SUB}">
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
      
      <div id = "infoDocedit_menu">
         <input type = "submit" value = "수정" class = "input_button">
         <input type = "reset" value = "취소" class = "input_button" onclick= "$('#INFO_DOC_SUB').focus();">
         <input type = "button" value = "목록" class = "intput_button"
            onclick = "location='infoDoc_list.nhn?page=${page}'">         
      </div>      
      </form>
   
   </div>
</body>
</html>