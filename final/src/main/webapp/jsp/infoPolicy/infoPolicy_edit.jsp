<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<!-- <script src="resources/js/bbs.js"></script>
<link href="resources/css/bbs.css" rel="stylesheet"> -->
<style>
	table {border-collapse:collapse}
</style>
</head>
<body>
   <div id = "infoPolicyedit_wrap">
      <h2 class = "infoPolicyedit_title">게시판 수정폼</h2>
      <form method = "post" action = "infoPolicy_edit_ok.nhn" enctype="multipart/form-data" onsubmit="return check()">
      <input type= "hidden" name = "INFO_POLICY_NUM" value = "${infoPolicy.INFO_POLICY_NUM}"> <!-- name을 Bean 변수명과 일치시켜야 한다 -->
      <input type= "hidden" name = "page" value = "${page}">
      
      <table id = "infoPolicywrite_t" border="1">
        
            <tr>
               <th>제목</th>
               <td>
                  <input name="INFO_POLICY_SUB" id="infoPolicy_subject"
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
      
      <div id = "infoPolicywrite_menu">
         <input type = "submit" value = "수정" class = "input_button">
         <input type = "reset" value = "취소" class = "input_button" onclick= "$('#infoPolicy_subject').focus();">
         <input type = "button" value = "목록" class = "intput_button"
            onclick = "location='infoPolicy_list.nhn?page=${page}'">         
      </div>      
      </form>
   
   </div>
</body>
</html>