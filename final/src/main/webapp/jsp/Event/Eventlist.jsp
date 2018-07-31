<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>Insert title here</title>
</head>
<style>
.head {
	text-align: center;
	margin-top: 10px;
}

table {
	width: 80%;
	margin: auto;
	margin-top: 20px;
}

td {
	width: 120px;
}

th {
	text-align: center;
	padding-bottom: 8px;
}

.top {
	margin-top: 92px;
}

h4 {
	text-align: center
}

.headbtn {
	border-radius: 6px
}
</style>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script>
	function play() {

		$.ajax({
			type : "post",
			url : "event_list_play.ev",
			success : function(data) {
				$('.head_ajax').empty();
				$('.head_ajax').append(data);
			}
		})
	}

	function end() {

		$.ajax({
			type : "post",
			url : "event_list_end.ev",
			success : function(data) {
				$('.head_ajax').empty();
				$('.head_ajax').append(data);
			}
		})
	}
	
	function search(){
		
		var state = $('#state').val();
		var search = $('#search').val();
		var keyword = $('#keyword').val();
		alert(state);
		alert(search);
		alert(keyword);
		
		$.ajax({
			type: "post",
			url : "searchEvent.ev",
			data:{"state":state,"search":search,"keyword":keyword},
			success:function(data){
				$('.head_ajax').empty();
				$('.head_ajax').append(data);
			}
		})
	}

	
</script>
<body>
	<p>
		<jsp:include page="../header.jsp"></jsp:include>
	</p>
	<br>
	
	<p class="top">
	<h4>
		<input type="button" onclick="location.reload();" class="headbtn"
			value="아파트 분양 정보">  <input type="button" onclick="end();"
			class="headbtn" value="분양이 끝난 아파트 정보">  <input
			type="button" onclick="play();" class="headbtn"
			value="현재 분양중인 아파트 정보">
	</h4>
	</p>
	<p>
		<h4 style="text-align: center;">
		<select id="search" style="height: 100%;">
		<option value="1">주소</option>
		<option value="2">아파트 명</option>
		</select>
		<input type="text" id="keyword" name="keyword" size="10" style="height: 100%;">
		<input type="button" id="searchbtn" value="검색하기" style="height: 100%" onclick="search();">
	</h4>
	</p>
	<div class="head_ajax">
		<input type="hidden" name="state" value="1" id="state">
		<p>
		<h1 class="head">아파트 분양 정보</h1>
		</p>
		<table>
			<tr>
				<th>분양 아파트 주소</th>
				<th>분양 아파트 명</th>
				<th>아파트 분양일</th>
				<th>아파트 당첨일</th>
			</tr>
			
			<c:forEach var="apt" items="${list}">
				<tr>
				
					<td>${apt.complex_address }</td>
					<td><a href="apartdetail.ev?complex_id=${apt.complex_id }">${apt.complex_apartname }</a>
					</td>
					<td>${apt.complex_sdate }~ ${apt.complex_edate}</td>
					<c:if test="${apt.complex_state == 0 }">
						<td>${apt.complex_pdate}</td>
					</c:if>

					<c:if test="${apt.complex_state != 0 }">
						<td colspan="2"><label>분양 마감</label></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>