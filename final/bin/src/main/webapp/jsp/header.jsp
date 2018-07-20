<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<!-- <link href="./resources/css/header.css" rel="stylesheet" type="text/css">
		
		<script src="./resources/js/header.js"></script> -->
		<script>
			function login() {
				window
						.open(
								"./login.net",
								"login",
								"width=500, height=470, top=250, left=750, fullscreen=no, resizable=no, scrollbar=no");
			}
			function join() {
				location.href = "./join.net"
			}
		</script>
		<style>
		@font-face {
			font-family: "nanums";
			src: url('fonts/NanumSquareR.ttf')
		}
		
		@font-face {
			font-family: "lemon";
			src: url('fonts/LemonMilkitalic.otf')
		}
		
		@font-face {
			font-family: "lemonl";
			src: url('fonts/LemonMilklight.otf')
		}
		
		@font-face {
			font-family: "nanumsB";
			src: url('fonts/NanumSquareR.ttf')
		}
		
		* {
			font-family: nanums
		}
		
		#homebtn {
			float: left
		}
		
		#homebtn:hover {
			src: "./Client/login.png";
		}
		
		#join {
			width: 100px;
			height: 34px;
			margin: 8px 28px 8px 8px;
			border-radius: 5px;
			background-color: white;
			color: black;
			border: 2px solid #008CBA;
		}
		
		#join:hover {
			background-color: #008CBA;
			color: white;
		}
		
		.dropbtn {
			background-color: white;
			color: black;
			padding: 16px;
			font-size: 16px;
			height: 50px;
			border: none;
		}
		
		.dropdown {
			position: relative;
			top: -17px;
			display: inline-block;
		}
		
		.dropdown-content {
			display: none;
			position: absolute;
			background-color: #f1f1f1;
			min-width: 160px;
			box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
			z-index: 1;
		}
		
		.dropdown-content a {
			color: black;
			padding: 12px 16px;
			text-decoration: none;
			display: block;
		}
		
		.dropdown-content a:hover {
			background-color: #ddd
		}
		
		.dropdown:hover .dropdown-content {
			display: block;
		}
		
		.dropdown:hover .dropbtn {
			box-shadow: 1px 1px 10px 0px gray
		}
		
		.homeimg {
			display: inline-block;
		}
		
		.id {
			display: inline-block;
			float: right;
		}
		
		.id span:nth-child(1) {
			font-size: 22px;
		}
		
		.id span:nth-child(2) {
			text-align: center
		}
		
		.full {
			box-sizing: border-box;
			background-color: white;
			padding: 0px;
			margin: 0px;
			height: 53px;
		}
		</style>
	</head>
	
	<body>
		<div class="full">
	
			<div class="homeimg"></div>
			<c:if test="${empty user_id }">
				<div class="dropdown">
					<button class="dropbtn">분양중인 아파트</button>
					<div class="dropdown-content"></div>
				</div>
	
				<div class="dropdown">
					<button class="dropbtn">정보</button>
					<div class="dropdown-content"></div>
				</div>
	
				<div class="dropdown">
					<button class="dropbtn">QNA</button>
					<div class="dropdown-content"></div>
				</div>
	
				<div class="dropdown">
					<button class="dropbtn">회원가입</button>
					<div class="dropdown-content"></div>
				</div>
	
	
	
			</c:if>
	
			<c:if test="${!empty user_id }">
	
				<c:if test="${user_id!='admin'}">
					<div class="dropdown">
						<button class="dropbtn">분양중인 아파트</button>
						<div class="dropdown-content"></div>
					</div>
	
					<div class="dropdown">
						<button class="dropbtn">정보</button>
						<div class="dropdown-content"></div>
					</div>
	
					<div class="dropdown">
						<button class="dropbtn">QNA</button>
						<div class="dropdown-content"></div>
					</div>
	
					<div class="dropdown">
						<button class="dropbtn">마이 페이지</button>
						<div class="dropdown-content"></div>
					</div>
				</c:if>
	
				<c:if test="${user_id=='admin' }">
	
	
				</c:if>
			</c:if>
	
			<div class="id">
				<c:if test="${empty user_id }">
					<a href="#" id="login"><img src="login.png" id="homebtn"
						height=50px onclick="login()"></a>&nbsp;
	      <input type="button" id="join" value="회원가입" onclick="join()">
				</c:if>
				<c:if test="${!empty user_id }">
					<c:if test="${user_id=='admin' }">
						<span>관리자 ${user_id} 님</span>
						<br>
						<span>(<a href="logout.net">로그아웃</a>)
						</span>
					</c:if>
					<c:if test="${user_id!='admin'}">
						<span>일반회원 ${user_id } 님 </span>
						<br>
						<span>(<a href="logout.net">로그아웃</a>)
						</span>
					</c:if>
				</c:if>
			</div>
		</div>
	
	</body>
</html>