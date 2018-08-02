<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>free login form -bootstrap</title>
 
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Style -->
    <link href="css/style.css" rel="stylesheet">
 
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></scri.row>.containerpt>
    <![endif]-->

<title>Insert title here</title>
<style>
.page-header{
padding-top: 192px;
width:25%;
text-align: center;
}

body{
padding-left: 900px;

}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel = "stylesheet" type = "text/css" href="./resources/css/admin.css"/>

<script>
	/*비번 찾기 팝업창*/
	function pwd_find(){
		window.open("pwd_find.nhn","비번찾기","width=400, height=300");
		//자바 스크립트에서 window 객체의 open("팝업창경로와 파일명","팝업창 이름", "팝업창속성")메서드로 새로운 팝업창을 만듬. 폭이 300, 높이가 300인 새로운 팝업창을 만듬. 단위는 픽셀
	}
</script>
<script>
function check(){
    if($.trim($("#username-email").val())==""){
       alert("로그인 아이디를 입력하세요!");
       $("#username-email").val("").focus();
       return false;
    }
    if($.trim($("#password").val())==""){
       alert("비밀번호를 입력하세요!");
       $("#password").val("").focus();
       return false;
    }
 }
 
 /*비번찾기 팝업창*/
 function pwd_find(){
    window.open("pwd_find.nhn","비번찾기","width=400,height=300");
    //자바 스크립트에서 window객체의 open("팝업창경로와 파일명","팝업창이름","팝업창속성")
    //메서드로 새로운 팝업창을 만듬.폭이 300,높이가 300인 새로운 팝업창을 만듬.단위는 픽셀
 }

</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
      <div class="row">
        <div class="page-header">
          <h2>집사자</h2>
        </div>
        <div class="col-md-3">
          <div class="login-box well">
        <form method="post" action="member_login_ok.nhn" onsubmit="return check()">
            <legend>로그인</legend>
            <div class="form-group">
                <label for="username-email"> 아이디</label>
                <input name="id"  id="username-email" placeholder=Username type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input name="pwd" id="password"  placeholder="Password" type="password" class="form-control" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="Login" />
            </div>
            
            <div class="form-group">
                <a href="join_check.nhn" class="btn btn-default btn-block m-t-md"> 회원가입</a>
            </div>
        </form>
          </div>
        </div>
      </div>
    </div>
 
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<%-- 
	
	<div id = "login_wrap">
		<h2 class= "login_title">로그인</h2>
		<form method ="post" action="member_login_ok.nhn" onsubmit="return check()">
			<table id = "login_t">
				<tr>
					<th>아이디</th>
					<td><input name = "id" id="id" size = "20" class="input_box"
						<c:if test="${!empty saveid}"> 
						value="${saveid}"
				</c:if>
				></tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input type = "password" name = "pwd" id="pwd" size = "20" class="input_box"></td>
				</tr>
				<tr>
					<th>아이디기억하기</th>
					<td><input type="checkbox" name="saveid" id="saveid"
					<c:if test="${!empty saveid}">
					checked
					</c:if>
					></td>
				</tr>
			
			</table>
			
			
			<div id = "login_menu">
				<input type = "submit" value= "로그인" class="input_button">
				<input type = "reset" value= "취소" class="input_buttonon" onclick="$('#id').focus();">
				<input type = "button" value = "회원가입" class="input_button" onclick="location='join_check.nhn'">
				<input type = "button" value="비번찾기" class="input_button" onclick="pwd_find()">
			</div>
		</form>	
	</div>
 --%>
</body>
</html>