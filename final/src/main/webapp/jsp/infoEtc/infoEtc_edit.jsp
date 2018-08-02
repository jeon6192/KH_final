<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<!-- <script src="resources/js/bbs.js"></script> -->
<!-- <link href="resources/css/bbs.css" rel="stylesheet"> -->
<style>
	td {width:400px}
	table {border-collapse:collapse}
</style>
</head>
<body>
   <div id = "infoEtcedit_wrap">
      <h2 class = "infoEtcedit_title">기타정보글 수정</h2>
      <form method = "post" action = "infoEtc_edit_ok.nhn" enctype="multipart/form-data" onsubmit="return check()">
      <input type= "hidden" name = "INFO_ETC_NUM" value = "${infoEtc.INFO_ETC_NUM}">
      <input type= "hidden" name = "page" value = "${page}">
      
      <table id = "infoEtcwrite_t" border="1">
         
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
      
      <div id = "infoEtcwrite_menu">
         <input type = "submit" value = "수정" class = "input_button">
         <input type = "reset" value = "취소" class = "input_button" onclick= "$('#infoEtc_subject').focus();">
         <input type = "button" value = "목록" class = "intput_button"
            onclick = "location='infoEtc_list.nhn?page=1'">         
      </div>      
      </form>
   
   </div>
</body>
</html>