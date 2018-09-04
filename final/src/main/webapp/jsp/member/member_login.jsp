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
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link href="./resources/fonts/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Custom Style -->
<link href="./resources/css/style.css" rel="stylesheet">



<title>Insert title here</title>
<style>
#passwordFindOk {
	text-align: center;
}

.page-header {
	padding-top: 192px;
	width: 25%;
	text-align: center;
}

#loginOk {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

.row {
	margin: 0 auto;
	width: 30%;
	margin-top: 200px;
	min-width: 300px;
	margin-left: auto !important;
	margin-right: auto !important;
}

.img-responsive {
	display: inline !important;
}

.form-group {
	width: 100%;
	margin-left: auto !important;
	margin-right: auto !important;
}

#form-group2 {
	text-align: center;
}

.modal-title {
	text-align: center;
}

@media ( max-width :800px) {
	body {
		padding-left: none;
	}
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	/*비번 찾기 팝업창*/
	function pwd_find() {
		window.open("pwd_find.nhn", "비번찾기", "width=400, height=300");
		//자바 스크립트에서 window 객체의 open("팝업창경로와 파일명","팝업창 이름", "팝업창속성")메서드로 새로운 팝업창을 만듬. 폭이 300, 높이가 300인 새로운 팝업창을 만듬. 단위는 픽셀
	}
</script>
<script>
	function check() {
		if ($.trim($("#username-email").val()) == "") {
			alert("로그인 아이디를 입력하세요!");
			$("#username-email").val("").focus();
			return false;
		}
		if ($.trim($("#password").val()) == "") {
			alert("비밀번호를 입력하세요!");
			$("#password").val("").focus();
			return false;
		}
	}

	/*비번찾기 팝업창*/
	function pwd_find() {
		window.open("pwd_find.nhn", "비번찾기", "width=400,height=300");
		//자바 스크립트에서 window객체의 open("팝업창경로와 파일명","팝업창이름","팝업창속성")
		//메서드로 새로운 팝업창을 만듬.폭이 300,높이가 300인 새로운 팝업창을 만듬.단위는 픽셀
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container" id="loginOk">

		<div class="row">
			<div class="col-md-12">
				<p>
					<img src="resources/image/house.png" class="img-responsive" alt="" />
				</p>
			</div>
			<div class="col-md-12">
				<div class="login-box well">
					<form method="post" action="member_login_ok.nhn"
						onsubmit="return check()">
						<legend>로그인</legend>
						<div class="form-group">
							<label for="username-email"> 아이디</label> <input name="id"
								id="username-email" placeholder=Username type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input name="password"
								id="password" placeholder="Password" type="password"
								class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="Login" />
						</div>

						<div class="form-group">
							<a href="join_check.nhn" class="btn btn-default btn-block m-t-md">
								회원가입</a>
						</div>

						<div class="content">
							<div data-toggle="modal" data-target="#modal"
								class="title m-b-md">비밀번호를 잊어버리셨나요?</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal HTML Markup -->
	<div id="modal" class="modal fade">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title">비밀번호 찾기</h1>
				</div>
				<div class="modal-body" id="modal-body">
					<form class="form-horizontal" role="form" method="POST"
						action="password_find_ok.nhn">

						<div class="form-group" id="form-group">
							<label for="email" class="control-label">아이디</label>
							<div>
								<input id="id" name="id" type="text" class="form-control"
									autofocus>
							</div>
						</div>

						<div class="form-group" id="form-group1">
							<label for="password" class="control-label">이름</label>
							<div>
								<input id="name" type="text" class="form-control" name="name">
							</div>
						</div>



						<div class="form-group" id="form-group2">
							<div id="findStart">
								<button type="submit" class="btn btn-primary"
									id="btn btn-primary">찾기</button>

							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"
		integrity="sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js"
		integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
		integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK"
		crossorigin="anonymous"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>

</body>
</html>