<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<link href="./resources/css/materialdesignicons.min.css" media="all" rel="stylesheet" type="text/css" />
		<style>
			.mdi:before, .mdi-set{
				font-size: 20px;
			}
    		.test-div{
    			width: 100px;
    			height: 100px;
    			box-sizing: border-box;
    			padding: 0.2em;
    		}
    		.dong-direction{
    			width: 100%;
    			height: 100%;
    		}
    		.dong-direction>li{
    			list-style: none;
    			width: 33%;
    			height: 33%;
    			display: inline;
    		}
    		.direction-t{
    			text-decoration: none;
    			color: black;
    		}
    		.activeArrow{
    			color: #47e088;
    			text-shadow: 1px 1px 5px #4a4a4a;
    		}
		</style>
		<script>
			$(document).ready(function(){
				$('.direction-t').click(function(){
					$('.direction-t').not(this).removeClass('activeArrow');
					$(this).toggleClass('activeArrow');
				});
			})
		</script>
	</head>
	<body>
		<div class="div-direction">
		
			<ul class="dong-direction">
				<li><a id="direction1" class="direction-t" href="#"><span class="mdi mdi-arrow-top-left"></span></a></li>
				<li><a id="direction2" class="direction-t" href="#"><span class="mdi mdi-arrow-up"></span></a></li>
				<li><a id="direction3" class="direction-t" href="#"><span class="mdi mdi-arrow-top-right"></span></a></li>
				<li><a id="direction4" class="direction-t" href="#"><span class="mdi mdi-arrow-left"></span></a></li>
				<li><a id="direction5" class="direction-t" href="#"><span class="mdi">&nbsp;&nbsp;&nbsp;&nbsp;</span></a></li>
				<li><a id="direction6" class="direction-t" href="#"><span class="mdi mdi-arrow-right"></span></a></li>
				<li><a id="direction7" class="direction-t" href="#"><span class="mdi mdi-arrow-bottom-left"></span></a></li>
				<li><a id="direction8" class="direction-t" href="#"><span class="mdi mdi-arrow-down"></span></a></li>
				<li><a id="direction9" class="direction-t" href="#"><span class="mdi mdi-arrow-bottom-right"></span></a></li>
			</ul>
		
		</div>
		
	</body>
</html>