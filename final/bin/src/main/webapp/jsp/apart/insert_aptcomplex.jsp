<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<!-- Daum Map -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d8e47b00c2f9c5701d6a158cfe8df08&libraries=services,clusterer,drawing"></script>
		
		
		<script src="./resources/js/insert_apart.js"></script>
		<link href="./resources/css/insert_apart.css" rel="stylesheet" type="text/css">
		
		<!-- Image API -->
		<script charset="utf-8" src="//ucarecdn.com/libs/widget/3.3.0/uploadcare.full.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		
		
		
		<!-- DatePicker -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<link rel="stylesheet" href="./resources/css/datepicker.css" />
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
		<script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
		<script type="text/javascript" src="./resources/js/datepicker.js"></script>
		
		
	</head>
	
	<body>
	
		<form action="./apart_insert.com" method="post" id="insert_apt" onsubmit="return insert();">	
		<ul class="ul_insert">
		
			<li class="li_map">
				<div id="div_map">
				</div>
				<input type="hidden" name="complex_address" id="complex_address" value="">
				<input type="hidden" name="complex_lat" id="complex_lat" value="">
				<input type="hidden" name="complex_lng" id="complex_lng" value="">
			</li>
			<li class="li_info1">
			
				<div class="div_apart_info1">
					
					<div class="div_aptname">
						<div class="div_aptname_span">
							<span class="span_info">
								아파트명
							</span>
						</div>
						<div class="div_aptname_input">
							<input type="text" name="complex_apartname" class="input_cpx_apartname">
						</div>
					</div>
					
					<div class="div_cpx_count">
					
						<div class="div_cpx_count_top">
							<div class="div_cpx_count_span">
								<span class="span_info">
									단지 내 아파트 개수
								</span>
							</div>
							<div class="div_cpx_input">
								<select class="select_cpx_count">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
								</select>
								<input type="text" class="input_cpx_count" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)">
								&nbsp; <b>동</b>
							</div>
						</div>
						
						<div class="div_cpx_btn">
							<button type="button" class="btn_cpx_count">입력</button>
						</div>
					</div>
				</div>
				
				<div class="div_cpx_info">
					<div class="div_cpx_info_span">
						<span class="span_info">
							아파트 소개
						</span>
					</div>
					<div class="div_cpx_info_text">
						<textarea cols="10" class="textarea_cpx_info" name="complex_info" onkeyup="chkword(this,1000)" placeholder="내용은 1000자까지 입력가능합니다."></textarea>
						<span id="counter">0/1000</span>
					</div>
				</div>
				
			</li>
			
			<li class="li_info2">
				<div class="div_apart_info">
					<div class="div_apart_info_detail">
						<div class="div_detail_left"></div>
						<div class="div_detail_right"></div>
					</div>
				</div>
				
				
			</li>
			
			<li class="li_info3">
				<div class="div_apart_pdate">
					<div class="div_apart_pdate_span">
						<span class="span_info">
							분양 시기
						</span>
					</div>
					<div class="div_apart_pdate_cal">
						<input id="date" type="text" name="complex_pdate">
					</div>
				</div>
				
				
				
				<div class="div_apart_subway">
					<div class="div_apart_subway_span">
						<span class="span_info">
							역세권
						</span>
					</div>
					<div class="div_apart_subway_detail">
						<ul class="ul_subway_detail">
							 
							<li class="li_subway_top">
								<div class="div_subway_top">
									<input type="checkbox" class="chk_subway" name="chk_subway">
								</div>
							</li>
							<li class="li_subway_bottom">
								<div class="div_subway_bottom">
								
									<input class="input_subway" name="complex_station">
									<input type="text" class="input_foot" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" name="complex_foot">
									&nbsp; <b>분</b>
								 
									<div class="div_subway_mask"></div>
								</div>
							</li>
							
						</ul>
					</div>
				</div>
			</li>
			
			<li class="li_last">
				<div class="div_last">
					<button type="submit" class="btn_submit">등록</button>
				</div>
			</li>
			
		</ul>
		</form>
	</body>
</html>