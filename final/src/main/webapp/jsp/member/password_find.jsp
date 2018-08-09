<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>비밀번호 찾기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	  rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script>
	function check() {
		if ($.trim($("#id").val()) == "") {
			alert("아이디를 입력하세요");
			$("#id").val("").focus();
			return false;
		}
		if ($.trim($("#name").val()) == "") {
			alert("회원이름을 입력하세요");
			$("#name").val("").focus();
			return false;
		}
	}
	
	function login_go(){
		
		location.href="member_login.nhn";
	}
</script>
<style>
.progress-bar {
	color: #333;
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	outline: none;
}

.form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	@
	include
	box-sizing(border-box);
	&:
	focus
	{
	z-index
	:
	2;
}

}
.login-form {
	margin-top: 60px;
}

form[role=login] {
	color: #5d5d5d;
	background: #f2f2f2;
	padding: 26px;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
}

form[role=login] img {
	display: block;
	margin: 0 auto;
	margin-bottom: 35px;
}

form[role=login] input, form[role=login] button {
	font-size: 18px;
	margin: 16px 0;
}

form[role=login]>div {
	text-align: center;
}

.form-links {
	text-align: center;
	margin-top: 1em;
	margin-bottom: 50px;
}

.form-links a {
	color: #fff;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
		<c:if test="${empty passwordok}">
			<div class="row" id="pwd-container">
				<div class="col-md-4" id="findpassword">
					<section class="login-form">
					<h2 class="pwd_title">비밀번호찾기</h2>
					<form method="post" action="password_find_ok.nhn" role="login">
	
						<input type="text" id="id" name="id" placeholder="아이디" required class="form-control input-lg" /> 
						<input type="text" class="form-control input-lg" id="name" name="name" placeholder="이름" required="" />
	
						<div class="pwstrength_viewport_progress"></div>
	
	
						<button type="submit" name="go"
							class="btn btn-lg btn-primary btn-block">찾기</button>
						<div>
							<a href="member_join.nhn">회원가입하러 가기</a>
						</div>
	
					</form>
					</section>
	
				</div>
				</div>
		</c:if>
	
	<c:if test="${!empty passwordok}">
		<h2 class="pwd_title2">비밀번호찾기 결과</h2>
		<table id="pwd_t2">
			<tr>
				<th>검색한 비번</th>
				<td>${passwordok}</td>
			</tr>
		</table>
		<div id="pwd_close2">
			<input type="button" value="로그인하러 가기" class="input_button"
				onclick="login_go();">
		</div>
	</c:if>
</body>
</html>