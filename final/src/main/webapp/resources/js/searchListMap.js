function map(){		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);
	
	//마커를 표시할 위치와 내용을 가지고있는 객체 배열
	
	
/*var positions = [
    		<c:forEach items="${mapList}" var="list">
    	{
    		content :'<a style="color : black" href="apart_contents.com?complex_id=${list.complex_id}"<div>${list.complex_apartname}</div></a>',
	        latlng : new daum.maps.LatLng(${list.complex_lat},${list.complex_lng}),
    },
    			</c:forEach>
];*/
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
//"http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"
	
  var iwRemoveable = true;
	
for (var i = 0; i < positions.length; i ++) {"http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    //마커 이미지의 이미지 크기 입니다.
    var imageSize = new daum.maps.Size(30, 40); 
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
    
    //마커에 클릭이벤트 등록합니다.
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