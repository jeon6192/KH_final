<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="./resources/css/expertBoardWhite.css" rel="stylesheet" type="text/css">

<!-- 파일 api  -->
<script charset="utf-8" src="//ucarecdn.com/libs/widget/3.3.0/uploadcare.full.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- 파일 api  -->


<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- 부트스트랩  -->

<script src="./resources/js/expertBoardWhite.js"></script>
<style>
@font-face {
   font-family: 'test';
   src: url('./resources/fonts/MALGUN.TTF');
   font-weight: normal;
   font-style: normal;
}
	*{ font-family: test;}
</style>


</head>
<body>

		<div class="board">
	<c:set var="bcont" value="${bcont}"/>
	<form action="./expertBoard_edit_ok.com" method="post">
	<input type="hidden" name="eb_num" value="${bcont.eb_num }">
	<input type="hidden" name="page" value="${page}">
				<table class="table">
					<tr>
						<th>제목</th>
						<td><input type="text" name="eb_subject" class="eb_subject" value="${bcont.eb_subject}">
						</td>
					</tr>
					<tr>
						<th>출처</th>
						<td>
						<input type="text" name="eb_source" class="eb_source" value="${bcont.eb_source}">
						</td>
					</tr>
					
					<tr>
						<th>파일첨부</th>
						<td class="file">
							<input type="hidden" role="uploadcare-uploader" data-images-only="true" data-multiple="false" name="eb_file" value="${bcont.eb_file}">
						</td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td><textarea rows="30" cols="50" class="textarea" name="eb_content" >"${bcont.eb_content}"
						</textarea></td>
					</tr>		
				</table>	
						<div class ="btn">
							<input type="submit" value="등록" class="submit_btn">
							<input type="reset" value="취소" class="backbtn"
								onclick="history.back();">
						</div>		
			</form>		
		</div>
</body>
</html>