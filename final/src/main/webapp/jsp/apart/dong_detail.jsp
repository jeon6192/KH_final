<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	.div.interior{
	    width: 100%;
	    height: 250px;
	    padding: 15px 30px;
	}
	.w3-content{
	    width: 90%;
	    max-width: 300px !important;
	    height: 85% !important;
	    max-height: 200px;
	    margin: 0;
	    background-color: black;
	}
	.interior.text{
	    width: 100%;
	    height: 15%;
	}
	.span.interior{
		font-size: 17px;
	}
	.mySlides{
		height: 100%;
		width: auto;
	}
	
</style>


<div class="apt_info">
	
	
	<div class="apt_area">
		<img alt="면적" src="./resources/image/ruler.png">
		<br><br>
		<div class="div dong_detail">
		${apart.apart_area} m²
		</div>
	</div>
	<div class="apt_floor">
		<img alt="층" src="./resources/image/stairs.png">
		<br><br>
		<div class="div dong_detail">
		${apart.apart_floor} 층
		</div>
	</div>
	<div class="apt_room">
		<img alt="방" src="./resources/image/bed.png">
		<br><br>
		<div class="div dong_detail">
		${apart.apart_room} 개
		</div>
	</div>
	<div class="apt_toilet">
		<img alt="화장실" src="./resources/image/toilet.png"> 
		<br><br>
		<div class="div dong_detail">
		${apart.apart_toilet} 개
		</div>
	</div>
	<div class="apt_price">
		<img alt="가격" src="./resources/image/piggy-bank.png">
		<br><br>
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
	
	
