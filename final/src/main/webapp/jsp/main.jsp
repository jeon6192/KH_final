<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
			.main_div1{
				margin: 0 auto;
				width: 1300px;
				height: 800px;
				background-color: skyblue;
			}
			.main_div2{
				width: 50%;
				height: 100%;
				background-color: brown;
				float: right;
				position: relative;
			}
			.main_div3{
				width: 100%;
				height: 50%;
				background-color: gray;
				position: absolute;
				bottom: 0px;
			}
			.main_div4{
				width: 50%;
				height: 100%;
				float: right;
				background-color: yellow;
			}
			.main_div5{
				width: 50%;
				height: 50%;
				background-color: black;
				position: absolute;
				bottom: 0px;
			}
			.main_div6{
				width: 50%;
				height: 100%;
				float: right;
				background-color: green;
			}
		</style>
	</head>
	<body>
		<div class="main_div1">
			<div class="main_div2">
				<div class="main_div3">
					<div class="main_div4">
						<div class="main_div5">
							<div class="main_div6">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>