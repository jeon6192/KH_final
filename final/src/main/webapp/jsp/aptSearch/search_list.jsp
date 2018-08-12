<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>


<!--  폰 화면 최적화 하기 위한 것 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- 지도 api  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e5f8108e51db54323c51d2a57a90ddb&libraries=services,clusterer,drawing"></script>
<!-- 지도 api  -->



<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>

<!-- 여기서쓰는 search.js 는 검색 할때 지역명을 가져와주기위해 참고한다 이페이지의 js 는 따로 searchList.js 가 있다.  -->
<script src="./resources/js/search.js"></script>


<!-- font css  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- 게시판 부트스트랩  -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- 참조하는 css 파일  -->
<link rel="stylesheet" href="./resources/css/searchList.css">




<script>

//map 에 들어갈 인포윈도우와, 마커의 찍어줄 위치 
var positions = [
	<c:forEach items="${mapList}" var="list">
{
	content :'<a style="color : black" href="apart_contents.com?complex_id=${list.complex_id}"<div>${list.complex_apartname}</div></a>',
    latlng : new daum.maps.LatLng(${list.complex_lat},${list.complex_lng}),
},
		</c:forEach>
];


</script>

<script src="./resources/js/searchList.js"></script>
<script src="./resources/js/searchListMap.js" ></script>


<script>
// 히든 타입으로 넘어온 주소의 텍스트값과 밸류값 받아온다.
		// 텍스트값
		var sel1 = "${param.sel1}";
		var sel2 = "${param.sel2}";
		var sel3 = "${param.sel3}";
		// 벨류값
		var select1 ="${param.select1}";
		var select2 ="${param.select2}";
		var select3 ="${param.select3}";
</script>

</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="all">
	<div class="search">
	<form id="listSearch" class="listSearch" action="aptsearch_list.com" method="GET">
		<select class="select1" name="select1" id="select1">
			<option value="-1">시/도</option>
			<option value="0">서울</option>
			<option value="1">경기</option>
			<option value="2">인천광역시</option>
			<option value="3">부산광역시</option>
			<option value="4">대전광역시</option>
			<option value="5">대구광역시</option>
			<option value="6">광주광역시</option>
			<option value="7">울산광역시</option>
			<option value="8">강원도</option>
			<option value="9">충청남도</option>
			<option value="10">충청북도</option>
			<option value="11">경상남도</option>
			<option value="12">경상북도</option>
			<option value="13">전라남도</option>
			<option value="14">전라북도</option>
			<option value="15">제주특별자치도</option>
			<option value="16">세종특별자치시</option>
		</select>
			<select class="select2" name="select2">
			<option value="-1">시/군/구</option>
		</select>
			<select class="select3" name="select3">
			<option value="-1">읍/면/동</option>
		</select>
		 <button type="submit" class="listbutton"><i class="fa fa-search"></i></button>
		 <input type="hidden" id="sel1" name="sel1" value="">
		 <input type="hidden" id="sel2" name="sel2" value="">
		 <input type="hidden" id="sel3" name="sel3" value=""> 
 	</form>
	</div>
	
	<br>
	<br>
	
	<div class="cookie">
<div id="map"></div>
	</div>



<div class="apart_name">
		<h3><span></span>매물</h3>
		
	<div class="order_by">
		<ul>
			<li>
				<button class="buttonsort desc" type="button" value="c.complex_pdate desc">분양시기  ▼  |</button>
				<button class="buttonsort asc" type="button" value="c.complex_pdate asc">분양시기  ▲  |</button>
			</li>
			<li>
				<button class="buttonsort desc" type="button" value="maxprice desc">가격  ▼  |</button>
				<button class="buttonsort asc" type="button" value="maxprice asc">가격  ▲  |</button>
			</li>
			<li>
				<button class="buttonsort desc" type="button" value="maxarea desc">면적  ▼  |</button>
				<button class="buttonsort asc" type="button" value="maxarea asc">면적  ▲  |</button>
			
			</li>
			<li>
				<button class="buttonsort desc" type="button" value="c.complex_subway desc">역세권  ▼ </button>
				<button class="buttonsort asc" type="button" value="c.complex_subway asc">역세권  ▲ </button>
			</li>
		</ul>
	</div>
</div>



<div class="list">
<c:if test="${listcount == 0 }">
<table class="table">
	<thead>
			<tr>
				<th>분양시기</th>
				<th>주소</th>
				<th>아파트명</th>
				<th>가격</th>
				<th>면적(㎡)</th>
				<th>역세권</th>
				<th>근처역/도보 소요시간</th>
				<th>분양상태</th>
			</tr>
		</thead>
		
		<tbody>
		<tr>
			<td colspan="7" align="center">검색된 매물이 없습니다.<br>
			다른 조건으로 검색하시기 바랍니다.</td>
		</tr>
		</tbody>
</table>
</c:if>
</div>

<div class="list">

	<c:if test="${listcount !=0}">
	
	<table class="table">
		<thead>
			<tr>
				<th>분양시기</th>
				<th>주소</th>
				<th>아파트명</th>
				<th>가격</th>
				<th>면적(㎡)</th>
				<th>역세권</th>
				<th>근처역/도보 소요시간</th>
				<th>분양상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "aptList" items="${aptList}">
			<tr>
				<td>${aptList.complex_pdate}</td>
				<td>${aptList.complex_address}</td>
				<td><a style="color: #2a6496;" href="apart_contents.com?complex_id=${aptList.complex_id}">${aptList.complex_apartname}</a></td>
				<c:choose>
				<c:when test="${aptList.minprice == aptList.maxprice}">
				<td>${aptList.maxprice}만원</td>
				</c:when>
				<c:otherwise>
				<td>${aptList.minprice}만원~${aptList.maxprice}만원</td>
				</c:otherwise>
				</c:choose>
				
				
				<c:choose>
				<c:when test="${aptList.minarea == aptList.maxarea}">
					<td>${aptList.maxarea}</td>
				</c:when>
				<c:otherwise>
				<td>${aptList.minarea}~${aptList.maxarea}</td>
				</c:otherwise>
				</c:choose>
				
								
		<c:choose>
			<c:when test="${aptList.complex_subway == 1}"> 
				<td>O</td>
				<td>${aptList.complex_station}/${aptList.complex_foot}분</td>
			</c:when>
			
			<c:otherwise>
					<td>X</td>
					<td></td>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
		
			<c:when test="${aptList.complex_state == 0}"> 
				<td>분양 진행중</td>
			</c:when>
			
			<c:when test="${aptList.complex_state == 1}">
				<td>분양 종료</td>
			</c:when>
			
		</c:choose>
			</tr>
</c:forEach>
		</tbody>
		
		<tfoot>
			<tr class="pageBtn" align="center">
				<td colspan="8">
					<c:if test="${page<=1}">
						이전&nbsp;
					</c:if>
					<c:if test="${page>1}">
						<a style="color : #2a6496" href="./aptsearch_list.com?page=${page-1}&select1=${param.select1}&select2=${param.select2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">이전</a>
					</c:if>
					
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==page}">
							${a}
						</c:if>
						<c:if test="${a != page }">
							<a style="color : #2a6496" href="./aptsearch_list.com?page=${a}&select1=${param.select1}&select2=${param.select2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">${a}</a>
						</c:if>
					</c:forEach>
					
					<c:if test="${page>=maxpage}">
						다음&nbsp;
					</c:if>
					<c:if test="${page<maxpage}">
							<a style="color : #2a6496" href="./aptsearch_list.com?page=${page+1}&select1=${param.select1}&select2=${param.select2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">다음</a>
					</c:if>
				</td>
			</tr>
		</tfoot>
	</table>
</c:if>

	</div>
</div>
</body>
</html>
