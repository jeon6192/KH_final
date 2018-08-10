<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>



	#join_wrap{
	padding-top: 200px; 
	margin: 0 auto; 
	text-align:center;
	width:100%;
	height:100%;
	}
	
	
	th{
		font-size:15pt;
		text-align:center;
	}
	
	th>td{
		margin:10em;
	}
	#join_t{
		width: 20%;
		text-align:center;	
		margin: 0 auto;
	
		margin-left: auto !important;
		margin-right: auto !important; 
		
	}
	
	
	 
	#join_menu{
	text-align:center;
	}
	
	#join_menu input[type=submit]{
	
	background-color : #555555;
	color: white;
	border :  2px solid white;
	padding:10px;
	border-radius:1em;
	width: 130px;
	
	
}

	 #join_menu input[type=reset] {
	 
	background-color : #555555;
	color: white;
	border :  2px solid white;
	padding:10px;
	border-radius:1em;
	width: 130px;
	
} 
	#f{
	
	width: 100%;
	margin: 0 auto;
	
	}
	th{
	width: 50%;
	}
	td{
	width: 50%; 
	
	}
	
@media(max-width:380px){
	
	#join_menu{
	text-align:center;
	margin:auto;
	
	}
	#join_t{
	width: 90%;
	text-align:center;
	margin:auto;
	}
	
	
}
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	function check(){
		
		
		
		if($.trim($("#Admin_id").val())==""){
	    	  alert("관리자 아이디를 입력하세요!");
	    	  $("#Admin_id").val("").focus();
	    	  return false;
	      }
		
		 if($.trim($("#Admin_pwd").val())==""){
	    	  alert("관리자 비밀번호를 입력하세요!");
	    	  $("#Admin_pwd").val("").focus();
	    	  return false;
	      }
	      if($.trim($("#Admin_name").val())==""){
	    	  alert("관리자 이름을 입력하세요!");
	    	  $("#Admin_name").val("").focus();
	    	  return false;
	      }
	      if($.trim($("#Admin_code").val())==""){
	    	  alert("보안코드를 입력하세요!");
	    	  $("#Admin_code").val("").focus();
	    	  return false;
	      }
	      
	      if($.trim($("#Admin_code").val())!=$.trim($("#code").val())){
	    	  //!=같지 않다 연산. 비번이 다를 경우
	    	  alert("보안코드가 다릅니다.");
	    	  
	    	  return false;
	      }
		
	}
</script>
</head>
<body>
	<input type="hidden" value="1234" id="code">
	<jsp:include page="../header.jsp"></jsp:include>
	<div id = "join_wrap">
		
     <form name="f" id = "f" method="post" action="admin_join_ok.nhn" onsubmit="return check()">
      <h2 class="join_title">회원가입</h2>
      <!-- 이진파일을 업로드 하려면 enctype 속성을 지정 -->
      <table id="join_t" class="table">
         <tr>
            <th>아이디</th>
            <td>
            <input name="Admin_id" id="Admin_id" size="14" class="input_box">
            </td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td>
            <input type="password" name="Admin_pwd" id="Admin_pwd" size="14" class="input_box">
            </td>
         </tr>
        
         <tr>
            <th>이름</th>
            <td>
            <input name="Admin_name" id="Admin_name" size="14" class="input_box">
            </td>
         </tr>
         
         <tr>
         	<th>보안코드</th>
         	<td>
         	<input name="Admin_code" id="Admin_code" size="14" class="input_box">
         	</td>
         </tr>
	</table>
	  <div id="join_menu">
         <input type="submit" value="회원가입" class="input_button" >
         <input type="reset" value="가입취소" class="input_button" onclick="history.go(-1)">
      </div>
      </form>
	</div>
</body>
</html>