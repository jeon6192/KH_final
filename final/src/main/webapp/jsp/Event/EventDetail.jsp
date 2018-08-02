<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta>
<title>Insert title here</title>
</head>
<style>
.head{
	padding-top: 150px;
}
</style>
<script>
	function tap(){
		
		$.ajax({
			var data = $('#complex_id').val();
			type:"post",
			data:{"id":data},
			success : function(data){
				window.open("event_win_list.ev","당첨자 현황 리스트","width=300,height=300");
			}
		})
		
	}
</script>

<body>
		<jsp:include page="../header.jsp"></jsp:include>
		
	<p class="head"><h3 style="text-align: center;">${complex.complex_apartname}</h3></p>
	<input type="hidden" value="${complex.complex_id }" id="complex_id">
	<ul>
		<li>분양 신청자 수${event_listcount}</li>
		<li>분양 공급 세대 수${apt_listcount }</li>
		<c:if test="${complex.complex_state !=0 }">
		<li><a href="#" onclick="tap();">당첨자 현황 보기</a> </li>
		</c:if>
	</ul>
</body>
</html>