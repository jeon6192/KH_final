///// map
    var cpxLat = $('#cpx_lat').val();
    var cpxLng = $('#cpx_lng').val();

	var container = document.getElementById('cpx_map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(cpxLat, cpxLng), //지도의 중심좌표.
		level: 5 //지도의 레벨(확대, 축소 정도)
	};

    var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
    
    var markerPosition  = new daum.maps.LatLng(cpxLat, cpxLng); 

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
    var aptName = $('#apt_name').val();

    var iwContent = '<div style="padding:5px; width:150px;text-align:center;">'+aptName+'</div>', 
    iwPosition = new daum.maps.LatLng(cpxLat, cpxLng); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 
    