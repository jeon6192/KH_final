<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE>
<html>
<head>
<meta>
<title>Insert title here</title>
</head>
<script>
	function login(){
		location.href="./member_login.nhn";
	}
	

</script>
<style>
	#totalscore{
		padding-top: 200px; padding-left: 700px;  margin: 0 auto; 
	}
	input[type=button] {
		background-color : #555555;
		color: white;
		border :  2px solid white;
		padding:10px;
		border-radius:1em;
		width: 130px;
		margin-left: 200px;
	
}
</style>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id = totalscore>
		<h3>회원가입을 축하드립니다~</h3>
		<h2>"${member.getName()}"님의 총점수는 "${member.getScore()}"점 입니다. </h2>
		<input type="button" value="로그인하러 가기" onclick="javascript:location.href='./member_login.nhn'">
	</div>
</body>
</html>