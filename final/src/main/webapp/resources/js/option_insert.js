
	//붙박이장 
	//당첨된 내 아파트 평형에 따라 가격이 달라짐
	// 59/ 84/ 122
	/*
	바닥 마감재 : 4,000,000 / 5,000,000/ 7,000,000
	안방 슬라이딩 장: 3/3.4/3.8

	드레스룸 : x/ 1.4/ x
	쿡탑: 300,000/300,000/3,000,000
	주방 특화 선반 : 110,000/ 110,000/ 110,000
	빌트인 냉장고 : 4,4/ 4,4/4,4
	빌트인 김치 냉장고 : 1,3 /1,3/ 1,3 
	에어컨 : 2,4/2,3/3,6
	샤워부스 : 250,000
	*/


function checknull(){
	if($("#bedroom_closet").val()==null){
		alert("붙박이장을 선택해 주세요");
		return false;
	}
	if($("#kitchen_height").val()==null){
		alert("부엌 높이를 선택해 주세요");
		return false;
	}
	if($("#balcony").val()==null){
		alert("발코니 확장 여부를 선택해 주세요");
		return false;
	}
	if($("#interior_color").val()==null){
		alert("인테리어 컬러 타입을 선택해 주세요");
		return false;
	}
	if($("#floor_type").val()==null){
		alert("[유상옵션] 바닥 마감재를 선택해 주세요");
		return false;
	}
	if($("#main_room_slide").val()==null){
		alert("[유상옵션] 안방 슬라이딩 장을  선택해 주세요");
		return false;
	}
	if($("#dressroom").val()==null){
		alert("[유상옵션] 드레스 룸을 선택해 주세요");
		return false;
	}
	if($("#cooktop").val()==null){
		alert("[유상옵션] 쿡탑을 선택해 주세요");
		return false;
	}
	if($("#kitchen_shelf").val()==null){
		alert(" [유상옵션] 주방 선반 타입을 선택해 주세요");
		return false;
	}
	if($("#builtin_ref").val()==null){
		alert("[유상옵션] 빌트인 냉장고 타입을 선택해 주세요");
		return false;
	}
	if($("#builtin_kref").val()==null){
		alert("[유상옵션] 빌트인 김치 냉장고 타입을 선택해 주세요");
		return false;
	}
	if($("#showerbooth").val()==null){
		alert("[유상옵션] 샤워부스 유무를 선택해 주세요");
		return false;
	}
	if($("#sys_air").val()==null){
		alert("[유상옵션] 시스템 에어컨 갯수를 선택해 주세요");
		return false;
	}
	
	
}
