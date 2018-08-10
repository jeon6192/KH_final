<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>집사자_옵션추가</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
@font-face {
	font-family: 'test';
	src: url('./resources/fonts/MALGUN.TTF');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: test, sans-serif;
}

input[type='text'] {
	border-style: none;
}


</style>
<script src="http://code.jQuery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/js/option_insert.js">
	
</script>
<script>


function showMoney(){
	var cost=Number($("#nf_cost").val());
	$("#nf_cost_show").val(cost.toLocaleString());
}


	$(document).ready(
			function() {
				var a = "${area}";

				var cooktop_cost = 300000;
				var builtin_ref_cost = 4400000;
				var builtin_kref_cost = 1300000;
				var showerbooth_cost = 250000;
				var kitchen_shelf_cost = 110000;

				if (a == 59) { //평수마다 가격이 다른것들
					var floor_type_cost = 4000000;
					var main_room_slide_cost = 3000000;
					var dressroom_cost = 1100000;

				} else if (a == 84) {
					var floor_type_cost = 5000000;
					var main_room_slide_cost = 3400000;
					var dressroom_cost = 1400000;
				} else if (a == 122) {
					var floor_type_cost = 7000000;
					var main_room_slide_cost = 3800000;
					var dressroom_cost = 1700000;

				}
				//초기화
				$("#reset").click(function() {
					var result = confirm("초기화 하시겠습니까 ?");
					if (result == false)
						return false;
				})

				var ccooktop = 0;
				//클릭 시 가격 보여줌
				$(".cooktop").change(function() {
							var pastcook = ccooktop;
							ccooktop = $(this).val();

							if ($(this).val() == 0) {
								$("#cooktop_cost").val(0);
								$("#nf_cost").val(Number($("#nf_cost").val())- cooktop_cost);
							} else {
								if (pastcook == 0) {
									$("#cooktop_cost").val(cooktop_cost.toLocaleString());
									$("#nf_cost").val(Number($("#nf_cost").val())+ cooktop_cost);
								}
							}
							
							showMoney();
						})

				var cbuiltin_ref = 0;

				$(".builtin_ref").change(
						function() {
							var pastbr = cbuiltin_ref;
							cbuiltin_ref = $(this).val();
							if ($(this).val() == 0) {
								$("#builtin_ref_cost").val(0);
								$("#nf_cost").val(Number($("#nf_cost").val())- builtin_ref_cost);
							} else {

								if (pastbr == 0) {
									$("#builtin_ref_cost").val(builtin_ref_cost.toLocaleString());
									$("#nf_cost").val(Number($("#nf_cost").val())+ builtin_ref_cost);
								}
							}
							showMoney();
						})

				var cbuiltin_kref = 0;
				$(".builtin_kref").change(
						function() {
							var pastkref = cbuiltin_kref;
							cbuiltin_kref = $(this).val();

							if ($(this).val() == 0) {
								$("#builtin_kref_cost").val(0);
								$("#nf_cost").val(Number($("#nf_cost").val())- builtin_kref_cost);
							} else {
								if (pastkref == 0) {
									$("#builtin_kref_cost").val(builtin_kref_cost.toLocaleString());
									$("#nf_cost").val(Number($("#nf_cost").val())+ builtin_kref_cost);
								}
							}
							showMoney();
						})

				var cshowrbooth = 0;
				$(".showerbooth").change(
						function() {
							var pastshower = cshowrbooth;
							cshowrbooth = $(this).val();
							if ($(this).val() == 0) {
								$("#showerbooth_cost").val(0);
								$("#nf_cost").val(Number($("#nf_cost").val())- showerbooth_cost);
							} else {
								if (pastshower == 0) {
									$("#showerbooth_cost").val(showerbooth_cost.toLocaleString());
									$("#nf_cost").val(Number($("#nf_cost").val())+ showerbooth_cost);
								}
							}
							
							showMoney();
						})

				var ckitchen = 0;
				$(".kitchen_shelf").change(
						function() {
							var pastkitchen = ckitchen;
							ckitchen = $(this).val();
							if ($(this).val() == 0) {
								$("#kitchen_shelf_cost").val(0);
								$("#nf_cost").val(
										Number($("#nf_cost").val())- kitchen_shelf_cost);
							} else {
								if (pastkitchen == 0) {
									$("#kitchen_shelf_cost").val(kitchen_shelf_cost.toLocaleString());
									$("#nf_cost").val(Number($("#nf_cost").val())+ kitchen_shelf_cost);
								}
							}
							showMoney();
						})

				var cfloortype = 0;
				$(".floor_type").change(
						function() {
							var pastfloor = cfloortype;
							cfloortype = $(this).val();
							if ($(this).val() == 0) {
								$("#floor_type_cost").val(0);
								$("#nf_cost").val(Number($("#nf_cost").val())- floor_type_cost);
							} else {
								if (pastfloor == 0) {
									$("#floor_type_cost").val(floor_type_cost.toLocaleString());
									$("#nf_cost").val(Number($("#nf_cost").val())+ floor_type_cost);
								}
							}
							showMoney();
						})

				var cmainroom = 0;
				$(".main_room_slide").change(
						function() {
							var pastcmain = cmainroom;
							cmainroom = $(this).val();
							if ($(this).val() == 0) {
								$("#main_room_slide_cost").val(0);
								$("#nf_cost").val(Number($("#nf_cost").val())- main_room_slide_cost);
							} else {
								if (pastcmain == 0) {
									$("#main_room_slide_cost").val(	main_room_slide_cost.toLocaleString());
									$("#nf_cost").val(Number($("#nf_cost").val())+ main_room_slide_cost);
								}
							}
							showMoney();
						})

				var cdress = 0;
				$(".dressroom").change(
						function() {

							var pastdress = cdress;
							cdress = $(this).val();
							if ($(this).val() == 0) {
								$("#dressroom_cost").val(0);
								$("#nf_cost").val(Number($("#nf_cost").val())- dressroom_cost);
							} else {
								if (pastdress == 0) {
									$("#dressroom_cost").val(dressroom_cost.toLocaleString());
									$("#nf_cost").val(Number($("#nf_cost").val())+ dressroom_cost);
								}
							}
							showMoney();
						})

				var air = 0;
				var cost = 0;

				$(".sys_air").change(function() {
					var pair = air; //예전 값 저장
					var pcost = cost;
					//현재값
					air = Number($(this).val());
					cost = 700000 * air;

					var calcost = Number(cost - pcost);
 
					var nf_cost = $("#nf_cost").val();

					$("#sys_air_cost").val(cost.toLocaleString());

					var recost = Number(nf_cost) + Number(calcost);
					$("#nf_cost").val(recost);
					showMoney();
				})

			})
</script>
<jsp:include page="../header.jsp" />
<link href="./resources/css/optionPublic.css" rel="stylesheet">
</head>
<body>
	<div class="optionContainer">
		<form action="options_insert.op" onsubmit="return checknull()"
			method="post">
			<!-- onsubmit="" -->

			<c:if test="${event_con==0 }">
 당첨 정보가 없습니다
 </c:if>
			<div id="optionAptInfo">
				내 아파트 : ${apartXinfo.getComplex_apartname()}
				${apartinfo.getApart_dong()}동 ${apartinfo.getApart_ho()} 호 주소 :
				${apartXinfo.getComplex_address()} [${area} m²] <input type="hidden"
					name="apart_id" value="${apartinfo.getApart_id()}" />
			</div>
			<div class="table-responsive">
			<table class="table" id="optiontable">
				<tr>
					<td>구분</td>
					<td>옵션 명</td>
					<td>선택</td>
					<td>가격</td>
				</tr>
				<tr>
					<td rowspan="4">무상 옵션</td>
					<td>붙박이장</td>
					<td><label class="radio-inline" class="radio-inline"><input
							type="radio" class="bedroom_closet" name="bedroom_closet"
							id="bedroom_closet" value="1">있음</label> <label
						class="radio-inline" class="radio-inline"><input
							type="radio" class="bedroom_closet" name="bedroom_closet"
							id="bedroom_closet" value="0">없음</label></td>
					<td></td>
				</tr>
				<tr>
					<td>부엌 높이</td>
					<td><label class="radio-inline" class="radio-inline"><input
							type="radio" name="kitchen_height" id="kitchen_height" value="1">기본형
							(85cm)</label> <label class="radio-inline" class="radio-inline"><input
							type="radio" name="kitchen_height" id="kitchen_height" value="2">높은형
							(90cm)</label></td>
					<td></td>
				</tr>
				<tr>
					<td>거실 발코니 확장</td>
					<td><label class="radio-inline" class="radio-inline"><input
							type="radio" name="balcony" id="balcony" value="1">확 장</label> <label
						class="radio-inline" class="radio-inline"><input
							type="radio" name="balcony" id="balcony" value="0">비 확 장</label>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>인테리어 색상</td>
					<td><label class="radio-inline" class="radio-inline"><input
							type="radio" name="interior_color" id="interior_color" value="1">
							A 타입 </label> <label class="radio-inline" class="radio-inline"><input
							type="radio" name="interior_color" id="interior_color" value="2">
							B 타입 </label></td>
					<td></td>
				</tr>
				<tr>
					<td rowspan="9">유상 옵션</td>
					<td>바닥 마감재</td>
					<td><label class="radio-inline" class="radio-inline"><input
							type="radio" name="floor_type" id="floor_type" class="floor_type"
							value="1"> 원목 마루 </label> <label class="radio-inline"
						class="radio-inline"><input type="radio" name="floor_type"
							id="floor_type" class="floor_type" value="2"> 유광 원목마루 </label> <label
						class="radio-inline" class="radio-inline"><input
							type="radio" name="floor_type" id="floor_type" class="floor_type"
							value="0" checked> 선택없음 </label></td>
					<td><input type="text" class="priceSection" name="floor_type_cost"
						id="floor_type_cost" value="0" Readonly></td>
				</tr>
				<tr>
					<td>안방 슬라이딩 장</td>
					<td><label class="radio-inline" class="radio-inline"><input
							type="radio" name="main_room_slide" class="main_room_slide"
							id="main_room_slide" value="1"> 수납 강화형 </label> <label
						class="radio-inline" class="radio-inline"><input
							type="radio" name="main_room_slide" class="main_room_slide"
							id="main_room_slide" value="2"> TV 장형 </label> <label
						class="radio-inline" class="radio-inline"><input
							type="radio" name="main_room_slide" class="main_room_slide"
							id="main_room_slide" value="0" checked> 선택 없음 </label></td>
					<td><input type="text" class="priceSection"
						name="main_room_slide_cost" id="main_room_slide_cost" value="0"
						Readonly></td>
				</tr>
				<tr>
					<td>드레스 룸</td>
					<td><label class="radio-inline" class="radio-inline"><input
							type="radio" name="dressroom" id="dressroom" class="dressroom"
							value="1"> 쇼룸형 </label> <label class="radio-inline"
						class="radio-inline"><input type="radio" name="dressroom"
							id="dressroom" class="dressroom" value="0" checked> 선택 없음</label>
					</td>
					<td><input class="priceSection" type="text" class="priceSection"
						name="dressroom_cost" id="dressroom_cost" value="0" Readonly>
					</td>
				</tr>
				<tr>
					<td>쿡탑</td>
					<td><label class="radio-inline" class="radio-inline"><input
							type="radio" name="cooktop" class="cooktop" id="cooktop"
							value="1"> 기본 형 </label> <label class="radio-inline"
						class="radio-inline"><input type="radio" name="cooktop"
							class="cooktop" id="cooktop" value="2"> 하이브리드 쿡탑 </label> <label
						class="radio-inline" class="radio-inline"><input
							type="radio" name="cooktop" class="cooktop" id="cooktop"
							value="0" checked> 선택 없음 </label></td>
					<td><input type="text" class="priceSection" name="cooktop_cost"
						id="cooktop_cost" value="0" Readonly></td>
				</tr>
				<tr>
					<td>주방 선반</td>
					<td><label class="radio-inline" class="radio-inline"><input
							type="radio" name="kitchen_shelf" class="kitchen_shelf"
							id="kitchen_shelf" value="1"> 캐슬미드웨이 선반 </label> <label
						class="radio-inline"><input type="radio"
							name="kitchen_shelf" class="kitchen_shelf" id="kitchen_shelf"
							value="2"> 기본 형 </label> <label class="radio-inline"><input
							type="radio" name="kitchen_shelf" class="kitchen_shelf"
							id="kitchen_shelf" value="0" checked> 선택 없음 </label></td>
					<td><input type="text" class="priceSection"
						name="kitchen_shelf_cost" id="kitchen_shelf_cost" value="0"
						Readonly></td>
				</tr>
				<tr>
					<td>빌트인 냉장고</td>
					<td><label class="radio-inline"><input type="radio"
							name="builtin_ref" class="builtin_ref" id="builtin_ref" value="1">
							일반형 </label> <label class="radio-inline"><input type="radio"
							name="builtin_ref" class="builtin_ref" id="builtin_ref" value="2">
							판넬부착형 </label> <label class="radio-inline"><input type="radio"
							name="builtin_ref" class="builtin_ref" id="builtin_ref" value="0"
							checked> 선택 없음 </label></td>
					<td><input type="text" class="priceSection"
						name="builtin_ref_cost" id="builtin_ref_cost" value="0" Readonly>
					</td>
				</tr>
				<tr>
					<td>김치 냉장고</td>
					<td><label class="radio-inline"><input type="radio"
							name="builtin_kref" class="builtin_kref" id="builtin_kref"
							value="1"> O </label> <label class="radio-inline"><input
							type="radio" name="builtin_kref" class="builtin_kref"
							id="builtin_kref" value="0" checked> 선택 없음 </label></td>
					<td><input type="text" class="priceSection"
						name="builtin_kref_cost" id="builtin_kref_cost" value="0" Readonly>
					</td>
				</tr>
				<tr>
					<td>샤워부스</td>
					<td><label class="radio-inline"><input type="radio"
							name="showerbooth" class="showerbooth" id="showerbooth" value="1">
							O (욕조 대체)</label> <label class="radio-inline"><input type="radio"
							name="showerbooth" class="showerbooth" id="showerbooth" value="0"
							checked> 선택 없음 </label></td>
					<td><input type="text" class="priceSection"
						name="showerbooth_cost" id="showerbooth_cost" value="0" Readonly>
					</td>
				</tr>
				<tr>
					<td>시스템 에어컨 (기본 1대)</td>
					<td><label class="radio-inline"><input type="radio"
							name="sys_air" class="sys_air" id="sys_air" value="1"> 1대
							추가 </label> <label class="radio-inline"><input type="radio"
							name="sys_air" class="sys_air" id="sys_air" value="2"> 2대
							추가 </label> <label class="radio-inline"><input type="radio"
							name="sys_air" class="sys_air" id="sys_air" value="3"> 3대
							추가 </label> <label class="radio-inline"><input type="radio"
							name="sys_air" class="sys_air" id="sys_air" value="0" checked>
							추가 안함 </label></td>
					<td><input type="text" class="priceSection" name="sys_air_cost"
						id="sys_air_cost" value="0" Readonly></td>
				</tr>
				<tr>
					<td>총 가격</td>
					<td colspan="3"><input type="hidden" class="priceSection"
						name="nf_cost" id="nf_cost" value="" Readonly>
						<input type="text"
						id="nf_cost_show" value="" class="priceSection" Readonly>
						원 청구될 예정입니다.
					</td>
				</tr>
			</table>
</div>
			<div id="Opcaution">
				<ul id="lists">
					<li>상기 금액은 부가세(10%)가 포함되어 있습니다.</li>
					<li>계약 시 상기 금액의 10%를 계약금, 입주시 90%를 잔금으로 납부해주셔야 하며, 계약 해지시 계약금은
						반환되지 않습니다.</li>
					<li>신청 기간까지 미 신청 시 기본값으로 제공됩니다.</li>
					<li>궁금하신 점이나 자세한 사항은 본사 ARS로 문의주시기 바랍니다.</li>
				</ul>
			</div>
			<div class="Optionbtns">
				<input class="opbtn" type="reset" value="초기화" id="reset">
				<input class="opbtn" type="submit" value="신청하기 ">
			</div>
		</form>
	</div>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>