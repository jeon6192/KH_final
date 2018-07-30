<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>

<!-- 파일 api  -->
<script charset="utf-8" src="//ucarecdn.com/libs/widget/3.3.0/uploadcare.full.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- 파일 api  -->


<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- 부트스트랩  -->

<script>
//Image API
UPLOADCARE_LOCALE = "ko";
UPLOADCARE_TABS = "file url";
UPLOADCARE_PUBLIC_KEY = "c45d0fc9bcc9538a677e";
UPLOADCARE_LOCALE_TRANSLATIONS = {
   buttons: {
      cancel: 'Cancel',
      remove: 'Remove',
      choose: {
         images: {
         one: '파일 첨부',
         other: '파일 첨부'
         }
      }
   }
};
</script>

<style>
	.board{
	    border: 1px solid #ddd;
	    width: 60%;
    	margin: 0 auto;
	    margin-top: 5%;
	    margin-bottom: 5%;
	}
	th{
	    width: 20%;
	}
	.table{
	margin : 0 auto;
	width : 90%;
	}
	form{
	    padding: 5%;
	}

@font-face {
   font-family: 'test';
   src: url('./resources/fonts/MALGUN.TTF');
   font-weight: normal;
   font-style: normal;
}
	*{ font-family: test;}
	
	.eb_subject{
		width : 90%;
	}
	.eb_source{
		width : 50%;
	}
	
	.textarea{
	width : 90%;
	resize: none;
	}

	.btn{
	width: 100%;
	text-align: center;
	}


</style>
</head>
<body>
		<div class="board">
			<form action="./expertBoard_write_ok.com" method="post">
				<table class="table">
					<tr>
						<th>제목</th>
						<td><input type="text" name="eb_subject" class="eb_subject">
						</td>
					</tr>
					<tr>
						<th>출처</th>
						<td>
						<input type="text" name="eb_source" class="eb_source">
						</td>
					</tr>
					
					<tr>
						<th>파일첨부</th>
						<td class="file">
							<input type="hidden" role="uploadcare-uploader" data-images-only="true" data-multiple="false" name="eb_file" >
						</td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td><textarea rows="30" cols="50" class="textarea" name="eb_content">
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