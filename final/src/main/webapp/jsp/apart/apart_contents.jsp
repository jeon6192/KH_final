<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		
		<!-- Daum Map -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d8e47b00c2f9c5701d6a158cfe8df08&libraries=services,clusterer,drawing"></script>
		
		<script src="./resources/js/apart_contents.js"></script>
		<link rel="stylesheet" href="./resources/css/apart_contents.css">
		
		<!-- Image Silder -->
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	</head>
	<body>
	
		<c:set var="cpx" value="${apartMap.aptComplexBean}"/>
		<c:set var="aptList" value="${apartMap.apartmentBeanList}"/>
		<div id="wrapper">
			<div class="left_menu">
			
				<div class="left_menu text">
					<ul class="ul left">
						<li class="li text cpx">
							<a href="#" onclick="showCpx(); return false;">
								단지 정보
							</a>
						</li>
						<li class="li text apt">
							<a href="#" id="aptText">
								아파트 정보
							</a>
							
							<ul class="ul apt text">
								<c:forEach var="dong" items="${dongList}" varStatus="i">
									<li>
										<a href="#" onclick="showApt(${dong}); return false;">
											${dong}동
										</a>
									</li>
								</c:forEach>
								
							</ul>
						</li>
					</ul>
				</div>
				
				<div class="left_menu icon">
					<ul class="ul left">
						<li class="li icon cpx">
							<a href="#" onclick="showCpx(); return false;">
								<img class="img_cpx" alt="단지 정보" src="./resources/image/apt_complex_s.png">
								<img class="img_cpx2" alt="단지 정보" src="./resources/image/apt_complex.png">
							</a>
						</li>
						<li class="li icon apt">
							<a href="#" id="aptIcon">
								<img class="img_apart" alt="아파트 정보" src="./resources/image/apart_s.png">
								<img class="img_apart2" alt="아파트 정보" src="./resources/image/apart.png">
							</a>
							
							<ul class="ul apt icon">
								<li class="li apt icon">
									아파트 정보
								</li>
								<c:forEach var="dong" items="${dongList}" varStatus="i">
									<li>
										<a href="#" onclick="showApt(${dong}); return false;">
											${dong}동
										</a>
									</li>
								</c:forEach>
								
							</ul>
						</li>
					</ul>
				</div>
				
			</div> 
			<!-- div.left_menu -->
			
			
			
			
			<div class="contents">
				<div class="detail cpx">
					<input type="hidden" id="cpx_lat" value="${cpx.complex_lat}">
					<input type="hidden" id="cpx_lng" value="${cpx.complex_lng}">
					<input type="hidden" id="cpx_id" value="${cpx.complex_id}">
					
					<div id="cpx_map" style="width: 80%; height: 300px; margin: 0 auto;">
					</div>
				</div>
				
				
				<div class="detail apt">
				
				
					
				</div>
					
				
				
			</div>
			
			
		</div>
		
		
		<div class="footer">
			<div class="ul bottom">
				<div class="li bottom cpx">
					<a href="#" onclick="showCpx(); return false;">
						단지 정보
					</a>
				</div>
				<div class="li bottom apt">
					아파트 정보
				</div>
				<c:forEach var="dong" items="${dongList}" varStatus="i">
					<div>
						<a href="#" onclick="showApt(${dong}); return false;">
							${dong}동
						</a>
					</div>
				</c:forEach>
				<div class="actFoot">
					Test~~
				</div>
			</div>
		</div>
		
	</body>
</html>