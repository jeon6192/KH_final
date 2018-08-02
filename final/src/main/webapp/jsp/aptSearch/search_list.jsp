<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<!-- 지도 api  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e5f8108e51db54323c51d2a57a90ddb&libraries=services,clusterer,drawing"></script>



<!-- 지도 api  -->
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="./resources/js/search.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>

.all{
    margin-top: 5%;
    margin-bottom: 5%;
}

.cookie
{
	background-color : #E7E7E7;
	min-height : 300px;
}

#map
{
	margin: 0 auto;
    width: 60%;
    height: 30em;

}


.asc{
    display: inline-block;
}
.desc{
    display: inline-block;
}

li{
    display: inline-block;
}

.order_by{
    display: inline-block;
    float: right;
    margin-right: 13%;
    margin-top: 3%;
}

.apart_name{
	margin-left : 10%;
}

h3{
display: inline-block;
}



.buttonsort.desc, .buttonsort.asc
{
   border: 0 none;
    background-color: transparent;
    cursor: pointer;
}
.listbutton{
    width: 7%;
    height: 50px;
    border : none;
}
.listbutton:hover{
	background-color : white;
	background-color : #A6A6A6;
}

@font-face {
   font-family: 'test';
   src: url('./resources/fonts/MALGUN.TTF');
   font-weight: normal;
   font-style: normal;
}
	*{ font-family: test;}
	.listSearch{
	width : 100%;
	height : 50px;
	}
	.search{
		margin : 0 auto;
		width : 50%;
		padding-top: 7%;
		}


	

	.select1,.select2,.select3{
	width: 30%;
	height : 100%;
	float : left;
	font-size: 19px;
    font-weight: bold;
    border-left: 1px solid #b1b1b1;
	}
	
	


	.table{
	margin : 0 auto;
	width : 80%;
	}

span{
color : #3a72d8 !important;
}
</style>
<script>
	var addr;
	$(function(){
		//map★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		
// 히든 타입으로 넘어온 주소의 텍스트값과 밸류값 받아온다.

		// 텍스트값
		var sel1 = "${param.sel1}";
		var sel2 = "${param.sel2}";
		var sel3 = "${param.sel3}";
		// 벨류값
		var select1 ="${param.select1}";
		var select2 ="${param.select2}";
		var select3 ="${param.select3}";
		
		
	
		
		if(sel2 != ""){
			sel2 = " " + sel2;
		}
		if(sel3 != ""){
			sel3 = " " + sel3;			
		}
		addr = sel1 + sel2 + sel3;
		
		map();

		
		
		/////////////////////
		
		
		
		
		$('.apart_name span').text(sel1+" "+ sel2+" "+sel3);
		
		
		//select1 에 값들을 반복해서 실행해주고
		$('.select1 option').each(function(){
			
			//thisVal 에 현재 선택된 밸류 값을 넣어준다. 하나씩 비교하기위해
			 var thisVal = $(this).val();
			
			//현재선택된 밸류 값과 넘어온 밸류값과 비교
			if(thisVal == select1){
				
				//같다면 현재 옵션값을 선택여부를 true 로 바꿔준다.
				$(this).prop('selected', true);
				
				//select2 와 select3 에 값을 넣어주기위해 search.js 에서 했던것을 또해준다.
				var inner = "";
				var inner2 = "";

				inner += "<option value="+-1+">";
				inner += "시/군/구";
				inner += "</option>";

				inner2 += "<option value="+-1+">";
				inner2 += "읍/면/동";
				inner2 += "</option>";

				
				for (var i = 0; i < sigungu[thisVal].length; i++) {
					inner += "<option value=" + i + ">";
					inner += sigungu[thisVal][i];
					inner += "</option>";

				} 
				$('.select2 option').remove();
				$('.select2').append(inner);
				$('.select3 option').remove();
				$('.select3').append(inner2);
			}
		});
		
		//위와마찬가지
		$('.select2 option').each(function(){
			var selectVal1 = $('.select1').val();
			var thisVal = $(this).val();
			if(thisVal == select2){
				$(this).prop('selected', true);
				
				var inner3 = "";
				inner3 += "<option value="+-1+">";
				inner3 += "읍/면/동";
				inner3 += "</option>";
				
				if($('.select2').val() != -1){
				 for (var i = 0; i < donghap[selectVal1][thisVal].length; i++) {
					inner3 += "<option value=" + i + ">";
					inner3 += donghap[selectVal1][thisVal][i];
					inner3 += "</option>"
					} 
				}
				
				$('.select3 option').remove();
				$('.select3').append(inner3);
			}
			});
		
		$('.select3 option').each(function(){
			var thisVal = $(this).val();
			if(thisVal == select3){
				$(this).prop('selected', true)
			}
		})
		
		
		
		//======== ajax 정렬된 값 받아오기================================
			//처음 화면에서 desc 를 보여주기위해 display none 설정
		$('.buttonsort.asc').css('display', 'none');
		
		
		// select1 값 을 다시보내주는이유는 ajax 로 넘어올때 벨류와 주소를 보내주고 검색결과를 받아오기 위해서다
		$('.buttonsort').click(function () {
			var select1 = $('.select1').val();
			var select2 = $('.select2').val();
			var select3 = $('.select3').val();
			
			// order by 에 필요한값을 버튼에 value 에 넣어놨다. sort 에 담아준다.
			var sort = $(this).val();
			

			//현재 셀렉트 옵션에 담겨있는값도 보내준다 
		 	var sido = $('.select1 option:selected').text();
			var gu = $('.select2 option:selected').text();
			var dong = $('.select3 option:selected').text();
			
			//검색 조건에 맞춰 값을 보낸다.
			if(gu == "시/군/구"){
				gu = "";
			}
			if(dong == "읍/면/동"){
				dong = "";
			}
			
			//확인
			console.log("시도 값은 : " + sido + gu + dong);
			
			
			// 현재 눌린객체가 none 이라면  형제 객체의 disaply 를 none 으로 설정
				// 자기자신은 다시 블록으로 설정
			if ($(this).siblings().css('display') == 'none') {
				$(this).css('display', 'none');
				$(this).siblings().css('display', 'block');
			}
			
			
			
			// 값들을 ajax 로보내준다.
			//state 값이 null 이 아니면 list2로 값을 보내고 list2 값을 list1 에 prepend 해준다 
			$.ajax({
				type : "GET",
				url : "aptsearch_list.com",
				data : {
						"sort" : sort, "sel1" : sido, "sel2" : gu,
						"sel3" : dong, "state" : "ajax",
						"select1" : select1, "select2" : select2,
						"select3" : select3,
				},
				success : function(result){
					$('table:first').empty().prepend(result);
				},
				error : function(){
					alert("에러");
				}
			});
			return false;
		});
		
		//========================================================
		
			
			//list 화면에서 검색 할 시
			$('.listSearch').submit(function(){
				var select1 = $('.select1').val();
				var select2 = $('.select2').val();
				var select3 = $('.select3').val();
				
				//여기서도 search 에서 값 보내준것처럼 select 박스에 있는 값의 text 부분을 hidden 으로 보내준다.
				var sel1 = $('.select1 option:selected').text();
				var sel2 = $('.select2 option:selected').text();
				var sel3 = $('.select3 option:selected').text();
				
				/// 보낼 값들을 정리해주고
				if(sel2 == "시/군/구"){
					sel2 = "";
				}
				if(sel3 == "읍/면/동"){
					sel3 = "";
				}
				
				addr = sel1 + sel2 + sel3;
				
				map();
				//여기서 보낼값들도 아파트 검색한 네임span 에 넣어준다.
				$('.apart_name span').text(sel1+" "+ sel2+" "+sel3);
				
				//ajax 로보낼땐 주소값이 변경되지않기때문에 새로고침할시에 처음검색한 데이터로 이동한다.
				//그걸방지하기위해 history.pushState() 을 사용하여 ajax 로 보내지만 주소값 이 변경되게 만든다.
				var url = "http://localhost:8088/house/aptsearch_list.com?select1="+select1+"&select2="+select2+"&select3="+select3+"&sel1="+sel1+"&sel2="+sel2+"&sel3="+sel3
				history.pushState(null,null,url);
				$.ajax({
					type : "GET",
					url : "aptsearch_list.com",
					data : {
					"sel1" : sel1, "sel2" : sel2,
					"sel3" : sel3, "state" : "ajax",
					"select1" : select1, "select2" : select2,
					"select3" : select3,
			},
			success : function(result){
				$('table:first').empty().prepend(result);
			},
			error : function(){
				
				alert("에러");
			}
		});
				return false;
	})
})



function map(){		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);
	
	//마커를 표시할 위치와 내용을 가지고있는 객체 배열
	
	
var positions = [
    		<c:forEach items="${mapList}" var="list">
    	{
    		content :'<a href="apart_contents.com?complex_id=${list.complex_id}"<div>${list.complex_apartname}</div></a>',
	        latlng : new daum.maps.LatLng(${list.complex_lat},${list.complex_lng}),
	     
    },
  
    			</c:forEach>
];
var imageSrc = "./resources/image/mansion.png";
//"http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"
	
  var iwRemoveable = true;
	
for (var i = 0; i < positions.length; i ++) {
    //마커 이미지의 이미지 크기 입니다.
    var imageSize = new daum.maps.Size(20, 30); 
    //마커이미지를 생성합니다.
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
    
    
    
    // 마커를 생성합니다
     var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커의 위치
        image : markerImage, // 마커 이미지
        clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
    });
    var iwRemoveable = true;
    //마커에 표시할 인포윈도우 생성합니다.
    var infowindow = new daum.maps.InfoWindow({
        content: positions[i].content,
        removable : iwRemoveable
    });
    
    daum.maps.event.addListener(marker, 'click', showInfoListener(map, marker, infowindow));
    
}//end for


	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } // end if
	}); // end geocoder
}//end function map()

function showInfoListener(map, marker, infowindow){
    // 마커 위에 인포윈도우를 표시합니다
    return function(){
    	infowindow.open(map, marker);  
    }
}



</script>
</head>
<body>
<div class="all">
	<div class="search">
	<form class="listSearch" action="aptsearch_list.com" method="GET">
		<select class="select1" name="select1">
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
				<td><a href="apart_contents.com?complex_id=${aptList.complex_id}">${aptList.complex_apartname}</a></td>
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
				<td>분양 대기</td>
			</c:when>
			
			<c:when test="${aptList.complex_state == 1}">
			<td>분양 진행중</td>
			</c:when>
			
			
			<c:when test="${aptList.complex_state == 2}">
			<td>분양 완료</td>
			</c:when>
		</c:choose>
			</tr>
</c:forEach>
		</tbody>
		
		<tfoot>
			<tr class="pageBtn" align="center">
				<td colspan="5">
					<c:if test="${page<=1}">
						이전&nbsp;
					</c:if>
					<c:if test="${page>1}">
						<a href="./aptsearch_list.com?page=${page-1}&select1=${param.select1}&select2=${param.select2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">이전</a>
					</c:if>
					
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==page}">
							${a}
						</c:if>
						<c:if test="${a != page }">
							<a href="./aptsearch_list.com?page=${a}&select1=${param.select1}&select2=${param.select2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">${a}</a>
						</c:if>
					</c:forEach>
					
					<c:if test="${page>=maxpage }">
						다음&nbsp;
					</c:if>
					<c:if test="${page<maxpage}">
							<a href="./aptsearch_list.com?page=${page+1}&select1=${param.select1}&select2=${param.select2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">다음</a>
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