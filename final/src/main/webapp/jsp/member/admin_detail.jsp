<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<style>

#detail_menu >input{
	 
	background-color : #555555;
	color: white;
	border :  2px solid white;
	/* padding:10px; */
	border-radius:1em;
	width: 130px;
	height:50px;
	text-align:center ! important;
	/* margin-left:1100px; */
	margin-bottom: auto ! important;
	margin-left: auto !important;
	margin-right: auto !important;
	
}

#detail_menu{
	text-align:center;
}

	
	#memberlist{
	width:60%;
	text-align:center;
	margin-top: 200px;
	margin-bottom: auto ! important;
	margin-left: auto !important;
	margin-right: auto !important;
	}
	
	table{
		/* margin-left:700px;
		padding-top: 200px; */
	}
	
	h2{
		/* padding-left:700px;
		padding-top: 200px; */
		
	}
	
	
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div id = "memberlist">	
	<table border=1 class="table">
		<h2>회원목록</h2>
		<thead>
			<tr>
				<td>아이디 </td>	<td>이름</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${totallist}">
				<tr>
					<td><a href="member_info.nhn?id=${m.id}">${m.id}</a></td>
					<td>${m.name}</td>
				</tr>
				
			</c:forEach>
		</tbody>
	
		</table>
	</div>
	<div id="detail_menu">
          <input type="reset" value="뒤로 가기" class="input_button" onclick="history.go(-1)">
      </div>
</body>
</html>