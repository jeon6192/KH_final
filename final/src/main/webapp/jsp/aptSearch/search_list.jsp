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


.button{
    width: 7%;
    height: 50px;
    border: 0;
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
   	border: none;
    border-left: 1px solid #b1b1b1;
	}
	
	


	.table{
	margin : 0 auto;
	width : 80%;
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
		
		
		$('.select1').val(select1);
		$('.select1 option:selected').text(sel1);
		
		$('.select1').val(select2);
		$('.select2 option:selected').text(sel2);
		
		$('.select1').val(select3);
		$('.select3 option:selected').text(sel3);
	})
	

</script>
</head>
<body>


	
	
	<div class="search">
	<form class="searchList" action="aptsearch_ok.com" method="GET">
		<select class="select1" name="select1">
			<option value="-1">시/도</option>
			<option value="0">서울특별시</option>
			<option value="1">경기도</option>
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
			<c:when test="${aptList.complex_subway == 1}"> 
				<td>O</td>
			</c:when>
			
			<c:otherwise>
					<td>X</td>
			</c:otherwise>
		</c:choose>
				<td>${aptList.complex_station}/${aptList.complex_foot}분</td>
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