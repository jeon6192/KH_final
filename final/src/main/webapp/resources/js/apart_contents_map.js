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


// 카테고리 검색
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 


// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === daum.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');
    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                daum.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'onn') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'onn';
    } 
} 

//중심으로 이동
function panTo() {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new daum.maps.LatLng(cpxLat, cpxLng);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);            
}

//주변 아파트 검색
let positions = [];
let selectedMarker = null;
let ajaxData = {};
const imageSrc = "https://i.pinimg.com/originals/dd/be/1f/ddbe1f911d676f198bdfc9b2346ac1e4.gif"; 
const imageSize = new daum.maps.Size(35, 43); 
const clickedImageSize = new daum.maps.Size(45, 55);

function searchCpx() {
    // 지도의 현재 영역을 얻어온다
    const bounds = map.getBounds();

    const swLatLng = bounds.getSouthWest(); 
    const neLatLng = bounds.getNorthEast(); 
    const complex_id = $('#cpx_id').val();

    // 지도의 꼭지점 좌표와 현재 보고있는 아파트단지의 id를 json 타입으로 변환 
    const searchLocation = {'swLat' : swLatLng.getLat(), 'swLng' : swLatLng.getLng(), 
                    'neLat' : neLatLng.getLat(), 'neLng' : neLatLng.getLng(), 'complex_id' : complex_id};
    
    $.ajax({
        type : 'POST', 
        dataType : 'json', 
        data : searchLocation,
        url : "./search_cpx.net",
        beforeSend : function() {
           // ajax 실행 전 지도에 있는 마커들을 삭제함
            removeMarkers();
        },
        success : function(data) {
           // ajax의 결과 값을 json 타입의 변수에 넣어줌
            ajaxData = data;
            
            markers = [];

            // 결과 개수만큼 마커를 찍어주기 위해 배열로 저장
            for (let i = 0; i < data.length; i++) {
                positions.push({title : data[i].complex_apartname, 
                    latlng : new daum.maps.LatLng(data[i].complex_lat, data[i].complex_lng)});
            }

            for (let i = 0; i < positions.length; i ++) {
                
                const markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
                
                markers.push(new daum.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: positions[i].latlng, // 마커를 표시할 위치
                    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됨
                    image : markerImage, // 마커 이미지 
                    clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정
                }));

                addMarkerClickEvent(markers[i],data[i]);
                
            }
        },
        error : function() {
            console.log('error');
        }
    });
}

function addMarkerClickEvent(marker, data) {
    // marker에 click event 추가
    daum.maps.event.addListener(marker, 'click', function() {
        // 클릭된 마커가 없고, 새로운 마커를 클릭하면 마커의 이미지를 클릭 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {

            // 클릭된 마커 객체가 null이 아니면 클릭된 마커의 이미지를 기본 이미지로 변경
            !!selectedMarker && selectedMarker.setImage(new daum.maps.MarkerImage(imageSrc, imageSize));

            // 현재 클릭된 마커의 이미지는 이미지 크기를 늘려줌
            marker.setImage(new daum.maps.MarkerImage(imageSrc, clickedImageSize));
        }

        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
        selectedMarker = marker;

        // 마커 클릭 시 보여줄 인포윈도우창 설정
        new daum.maps.InfoWindow({
            content : '<div style="width: 150px; height: 100%; text-align: center;" class="div-compare">'
                + '<button type="button" class="w3-button w3-black compare-btn"'
                + 'onclick="compareCpx('+data.complex_id+')">'+data.complex_apartname+'</button></div>', 
            removable : true
        }).open(map, marker);
    });
}

function removeMarkers() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }

    positions = [];
    markers = [];
    selectedMarker = null;
}

function compareCpx(complex_id) {
   // 지도에 가져온 데이터중에서 같은 complex_id를 가진 데이터를 선택하여 findCpx에 넣어줌
    var findCpx = ajaxData.find((item, index) => {
        return item.complex_id === complex_id;
    });

    $('.compare-aptname').empty().append(findCpx.complex_apartname);
    $('.compare-addr').empty().append(findCpx.complex_address);
    $('.compare-pdate').empty().append(findCpx.complex_pdate);
    
    if (findCpx.complex_subway != 1) {
        $('.compare-subway').html('<i class="fa fa-remove"></i>');
    } else {
        $('.compare-subway').empty().append(findCpx.complex_station + ' ' + findCpx.complex_foot + '분');
    }
    
    $('.compare-price').empty().append(findCpx.minprice + ' ~ ' + findCpx.maxprice + '만원');
    $('.compare-area').empty().append(findCpx.minarea + ' ~ ' + findCpx.maxarea + '㎡');
    $('.compare-cnt').empty().append(findCpx.cnt + ' 세대');
    
}

// Compare Button (Modal)
$(document).on('click', '.w3-button.w3-black.compare-btn', function(){
    $('#id01').show();
});
$(document).on('click', '.w3-button.w3-display-topright', function(){
    $('#id01').hide();
});