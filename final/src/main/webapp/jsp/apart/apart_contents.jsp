<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		
		<title>Insert title here</title>
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		
		<!-- Daum Map -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d8e47b00c2f9c5701d6a158cfe8df08&libraries=services,clusterer,drawing"></script>
		
		<script src="${pageContext.request.contextPath}/resources/js/apart_contents.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/apart_contents.css">
		
		<!-- Image Silder -->
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
	</head>
	<body>
		<jsp:include page="../header.jsp"/>
		<c:set var="cpx" value="${apartMap.aptComplexBean}"/>
		<c:set var="aptList" value="${apartMap.apartmentBeanList}"/>
		<div id="wrapper">
			<div class="left_menu">
			
				<div class="left_menu text">
					<ul class="ul left">
						<li class="li text cpx">
							<a href="#" class="active" onclick="showCpx(); return false;">
								단지 정보
							</a>
						</li>
						<li class="li text apt">
							<a href="#" id="aptText">
								아파트 정보
							</a>
							
							<ul class="ul apt text">
								<c:forEach var="dong" items="${dongList}" varStatus="i">
									<li class="li apt">
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
							<a href="#" class="active" onclick="showCpx(); return false;">
								<img class="img_cpx" alt="단지 정보" src="./resources/image/apt_complex_s.png">
								<img class="img_cpx2" alt="단지 정보" src="./resources/image/apt_complex.png">
							</a>
						</li>
						<li class="li icon apt">
							<a href="#" id="aptIcon">
								<img class="img_apart" alt="아파트 정보" src="./resources/image/apart_s.png">
								<img class="img_apart2" alt="아파트 정보" src="./resources/image/apart.png">
							</a>
							
							<ul class="ul icon apt">
								<li class="li icon apt">
									아파트 정보
								</li>
								<c:forEach var="dong" items="${dongList}" varStatus="i">
									<li class="li icon apt">
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
					<input type="hidden" id="apt_name" value="${cpx.complex_apartname}">
					<input type="hidden" id="cpx_edate" value="${cpx.complex_edate}">
					
					<div class="div cpx_aptname">
						<div class="div apticon">
							<img alt="아파트~" src="./resources/image/apartment.png">
						</div>
						<div class="div aptname">
							${cpx.complex_apartname}
						</div>
						<div class="div timer-btn">
							<span class="span timer-name">
								신청 종료 : -  
							</span>
							<span class="span timer">
							</span>
							<div class="button-4">
								<div class="eff-4"></div>
								<a href="#" onclick="sellInLots();"> 분양 신청 </a>
							</div>
						</div>
					</div>
					
					
					<div class="cpx_text loc">
						<span class="span cpx">위치</span>
					</div>
					<div class="map_wrap">
						<div id="cpx_map" style="width: 95%; height: 330px; margin: 0 auto;">
						</div>
						
						<button class="searchCpx-button" onclick="searchCpx();">주변 아파트 검색</button> 
						<%-- <button onclick="panTo()">${cpx.complex_apartname}로 이동</button> --%>
						
						<ul id="category">
					        <li id="BK9" data-order="0"> 
					            <span class="category_bg bank"></span>
					            은행
					        </li>       
					        <li id="MT1" data-order="1"> 
					            <span class="category_bg mart"></span>
					            마트
					        </li>  
					        <li id="PM9" data-order="2"> 
					            <span class="category_bg pharmacy"></span>
					            약국
					        </li>  
					        <li id="OL7" data-order="3"> 
					            <span class="category_bg oil"></span>
					            주유소
					        </li>  
					        <li id="CE7" data-order="4"> 
					            <span class="category_bg cafe"></span>
					            카페
					        </li>  
					        <li id="CS2" data-order="5"> 
					            <span class="category_bg store"></span>
					            편의점
					        </li>      
					    </ul>
					    <script src="${pageContext.request.contextPath}/resources/js/apart_contents_map.js"></script>
					</div>
					
					
					
					
					<div class="cpx info">
						<div class="div addr">
							<div class="cpx_text">
								<span class="span cpx">주소</span>
							</div>
							<div class="cpx addr">
								${cpx.complex_address}
							</div>
						</div>
						
						<div class="div household">
							<div class="cpx_text">
								<span class="span cpx">총 세대수</span>
							</div>
							<div class="cpx household">
								${fn:length(aptList)} 세대 
							</div>
						</div>
						
						
						<div class="div subway">
							<div class="cpx_text">
								<span class="span cpx">주변역</span>
							</div>
							<div class="cpx subway">
								<c:if test="${cpx.complex_subway != 0}">
									${cpx.complex_station} &nbsp;&nbsp; <b>${cpx.complex_foot} 분</b>
								</c:if>
							</div>
						</div>
						
						<div class="div date">
							<div class="cpx_text">
								<span class="span cpx">분양시기</span>
							</div>
							<div class="cpx pdate">
								<fmt:parseDate var="parsedDate" value="${cpx.complex_pdate}" pattern="yyyy-MM-dd" />
								<fmt:formatDate var="pdate" value="${parsedDate}" pattern="yyyy-MM-dd" />
								${pdate}
							</div>
						</div>
						
						<div class="div info">
							<div class="cpx_text">
								<span class="span cpx">아파트 소개</span>
							</div>
							<div class="cpx aptinfo">
								${cpx.complex_info}
							</div>
						</div>
						
						
					</div>
					
						
				</div>
				
				<!-- Compare Modal Contents -->
				<div id="id01" class="w3-modal">
					<div class="w3-modal-content">
						<div class="w3-container">
							<div class="compare-label">
								<span class="compare-text">비교하기</span>
							</div>
							<span class="w3-button w3-display-topright">&times;</span>
							
							<div id="compare-contents-div">
								<table class="compare-table">
									<tr>
										<th style="width:40%">아파트 이름</th>
										<td style="width:30%">${cpx.complex_apartname}</td>
										<td style="width:30%" class="compare-aptname"></td>
									</tr>
									<tr>
										<td>주소</td>
										<td>${cpx.complex_address}</td>
										<td class="compare-addr"></td>
									</tr>
									<tr>
										<td>분양시기</td>
										<td>${cpx.complex_pdate}</td>
										<td class="compare-pdate"></td>
									</tr>
									<tr>
										<td>역세권</td>
										<td>
											<c:if test="${cpx.complex_subway!=1}">
												<i class="fa fa-remove"></i>
											</c:if>
											<c:if test="${cpx.complex_subway==1}">
												${cpx.complex_station} &nbsp; ${cpx.complex_foot}분
											</c:if>
										</td>
										<td class="compare-subway"></td>
									</tr>
									<tr>
										<td>가격</td>
										<td>${cpx.minprice} ~ ${cpx.maxprice} 만원</td>
										<td class="compare-price"></td>
									</tr>
									<tr>
										<td>면적</td>
										<td>${cpx.minarea} ~ ${cpx.maxarea} ㎡</td>
										<td class="compare-area"></td>
									</tr>
									<tr>
										<th>총 세대수</th>
										<td>${fn:length(aptList)} 세대</td>
										<td class="compare-cnt"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="detail apt">
				
					
				</div>
					
				
				
			</div>
			
			
		</div>
		
		<div class="footer">
			<div class="div bottom">
				<a href="#" class="active" onclick="showCpx(); return false;">
					단지 정보
				</a>
				<span class="footer-span">
					아파트 정보
				</span>
				<c:forEach var="dong" items="${dongList}" varStatus="i">
					<a href="#" onclick="showApt(${dong}); return false;">
						${dong}동
					</a>
				</c:forEach>
				
			</div>
		</div>
		
		
		
	</body>
</html>