<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="apt-dong">
	${apart.apart_dong} 동
</div>
<div class="apt-info">
	<div class="apt-area">
		<div class="apt-info-img">
			<img alt="면적" src="./resources/image/blueprint.png">
		</div>
		<div class="apt info text">면적</div>
		<div class="div dong_detail">
			${apart.apart_area} m²
		</div>
	</div>
	<div class="apt-floor">
		<div class="apt-info-img">
			<img alt="층" src="./resources/image/stairs.png">
		</div>
		<div class="apt info text">층</div>
		<div class="div dong_detail">
			${apart.apart_floor} 층
		</div>
	</div>
	<div class="apt-room">
		<div class="apt-info-img">
			<img alt="방" src="./resources/image/bed.png">
		</div>
		<div class="apt info text">방 개수</div>
		<div class="div dong_detail">
			${apart.apart_room} 개
		</div>
	</div>
	<div class="apt-toilet">
		<div class="apt-info-img">
			<img alt="화장실" src="./resources/image/shower.png"> 
		</div>
		<div class="apt info text">화장실 개수</div>
		<div class="div dong_detail">
			${apart.apart_toilet} 개
		</div>
	</div>
	<div class="apt-price">
		<div class="apt-info-img">
			<img alt="가격" src="./resources/image/piggy-bank.png">
		</div>
		<div class="apt info text">가격</div>
		<div class="div dong_detail">
		<c:choose>
			<c:when test="${apart.minprice == apart.maxprice}">
				${apart.minprice} 만원
			</c:when>
			<c:otherwise>
				${apart.minprice} ~ ${apart.maxprice} 만원
			</c:otherwise>
		</c:choose>
		</div>
	</div>
	<div class="apt-compass">
		<div class="apt-info-img">
			<img alt="방향" src="./resources/image/compass.png"> 
		</div>
		<div class="apt info text">집 방향</div>
		<div class="div dong_detail">
			${apart.apart_direction}
		</div>
	</div>
	
	
</div>

<div class="div interior">
	<div class="interior text">
		<span class="span interior">인테리어 사진</span>
	</div>
	
	<!-- 이미지 URL을 split 메서드를 통해 잘라서 보여줌 -->
	<c:set var="interior_array" value="${fn:split(apart.apart_interior,' ')}"/>
	<c:if test="${fn:length(apart.apart_interior) > 0}">
		<div class="w3-content w3-display-container">
			<c:forEach var="interior" items="${interior_array}">
				<img class="mySlides" src="${interior}" style="width:100%">
			</c:forEach>
			<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
			<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
		</div>
		<script>
			var slideIndex = 1;
			showDivs(slideIndex);
			
			function plusDivs(n) {
			  showDivs(slideIndex += n);
			}
			
			function showDivs(n) {
			  var i;
			  var x = document.getElementsByClassName("mySlides");
			  if (n > x.length) {slideIndex = 1}    
			  if (n < 1) {slideIndex = x.length}
			  for (i = 0; i < x.length; i++) {
			     x[i].style.display = "none";  
			  }
			  x[slideIndex-1].style.display = "block";  
			}
		</script>
	</c:if>
	<c:if test="${fn:length(apart.apart_interior) <= 0}">
		<b>등록된 사진이 없습니다.</b>
	</c:if>
	
</div>
	
	
