<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="./resources/js/search.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<style>

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




.buttonsort
{
   border: 0 none;
    background-color: transparent;
    cursor: pointer;
}
.button{
    width: 7%;
    height: 50px;
    border : none;
}
.button:hover{
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
	.searchList{
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
	$(function(){
		
		
		 var sel1 = "${param.sel1}";
		var sel2 = "${param.sel2}";
		var sel3 = "${param.sel3}";
		var select1 ="${param.select1}";
		var select2 ="${param.select2}";
		var select3 ="${param.select3}";
		
		$('.apart_name span').text(sel1+" "+ sel2+" "+sel3);
		
		$('.select1 option').each(function(){
			 var thisVal = $(this).val();
			if(thisVal == select1){
				$(this).prop('selected', true);
				
				var inner = "";
				var inner2 = "";

				inner += "<option value=''>";
				inner += "시/군/구";
				inner += "</option>";

				inner2 += "<option value=''>";
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
		
		$('.select2 option').each(function(){
			var selectVal1 = $('.select1').val();
			var thisVal = $(this).val();
			if(thisVal == select2){
				$(this).prop('selected', true);
				
				var inner3 = "";
				inner3 += "<option value=''>";
				inner3 += "읍/면/동";
				inner3 += "</option>";
				for (var i = 0; i < donghap[selectVal1][thisVal].length; i++) {
					inner3 += "<option value=" + i + ">";
					inner3 += donghap[selectVal1][thisVal][i];
					inner3 += "</option>"
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
		
		
		
	});
	

</script>
</head>
<body>


	
	
	<div class="search">
	<form class="searchList" action="aptsearch_ok.com" method="GET">
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
		 <button type="submit" class="button"><i class="fa fa-search"></i></button>
		 
		 <input type="hidden" id="sel1" name="sel1" value="">
		 <input type="hidden" id="sel2" name="sel2" value="">
		 <input type="hidden" id="sel3" name="sel3" value="">
	</form>
	</div>

<p>넘어온 개수 : ${listcount}</p>

<div class="apart_name">
		<h3><span></span>매물</h3>
		
	<div class="order_by">
	<ul>
		<li><button class="buttonsort" type="button" onClick="sysdateSort()">분양시기  ▼  |</button></li>
		<li><button class="buttonsort" type="button" onClick="priceSort()">가격  ▼  |</button></li>
		<li><button class="buttonsort" type="button" onClick="areaSort()">면적  ▼  |</button></li>
		<li><button class="buttonsort" type="button" onClick="subwaySort()">역세권  ▼ </button></li>
	
		<!-- <a href="#">분양시기</a><a href="#">가격</a><a href="#">면적</a><a href="#">역세권</a> -->
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
				<th>역세권</th>
				<th>근처역/도보 소요시간</th>
			</tr>
		</thead>
		
		<tbody>
		<tr>
			<td colspan="5" align="center">검색된 매물이 없습니다.<br>
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
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "aptList" items="${aptList}">
			<tr>
				<td>${aptList.complex_pdate}</td>
				<td>${aptList.complex_address}</td>
				<td>${aptList.complex_apartname}</td>
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
				
			</tr>
</c:forEach>
		</tbody>
		
		<tfoot>
			<tr class="h30 lime cneter btn">
				<td colspan="5">
					<c:if test="${page<=1}">
						이전&nbsp;
					</c:if>
					<c:if test="${page>1}">
						<a href="./aptsearch_list.com?page=${page-1}&select1=${param.select1}&select2=${param.selec2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">이전</a>
					</c:if>
					
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==page}">
							${a}
						</c:if>
						<c:if test="${a != page }">
							<a href="./aptsearch_list.com?page=${a}&select1=${param.select1}&select2=${param.selec2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">${a}</a>
						</c:if>
					</c:forEach>
					
					<c:if test="${page>=maxpage }">
						다음&nbsp;
					</c:if>
					<c:if test="${page<maxpage}">
							<a href="./aptsearch_list.com?page=${page+1}&select1=${param.select1}&select2=${param.selec2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">다음</a>
					</c:if>
				</td>
			</tr>
		</tfoot>
	</table>
</c:if>

</div>
</body>
</html>