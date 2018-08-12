<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../header.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 아파트 옵션 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="./resources/css/optionPublic.css" rel="stylesheet">
<script src="http://code.jQuery.com/jquery-latest.js">
</script>
<script>
$(document).ready(function(){
		function find_check(){
			if($.trim($("#searchContent").val())==""){
				alert("검색어를 입력하세요!");
				$("#searchContent").val("").focus();
				return false;
			}
		}
		
		$("#searchform").submit(function(){
			var page="${page}";
			var searchinfo=$("#searchform").serialize()+"&page="+page+"&state='ajax'";
	
			alert(searchinfo);
			
			$.ajax({
				type : "GET",
				data : searchinfo,
				url : "./options_admin.op",
				cache : false,
				headers : {"cache-control" : "no-cache", "pragma" : "no-cache"},
				success : function(data){
					$("#bbslist_wrap").empty().prepend(data);
				},
				error : function(status){
					alert(status);
				}
			})
			return false;
		})
		
		$(".filebtn").click(function(){
			location.href='./downoptions.op?aptXid='+$(this).val();
		})
})
		</script>
</head>
<body>
<div class="optionContainer">
	<table id="bbslist_wrap" border='1'>

		<c:if test="${listcount>0}">
			<tr>
				<th width="70%" colspan="3" class="bbslist_title">아파트 옵션 관리 TABLE</th>
				<th width="30%" colspan="2" class="bbslist_title">아파트 개수 : ${listcount}</th>
			</tr>
			<tr>
				<th width="8%">
					<div>번호</div>
				</th>
				<th width="30%">
					<div>아파트 이름</div>
				</th>
				<th width="32%">
					<div>주소</div>
				</th>
				<th width="20%">
					<div>완료 날짜</div>
				</th>
				<th width="5%">
					파일
				</th>

			</tr>
			<c:set var="num" value="${listcount-(page-1)*10}" />
			<c:forEach var="bo" items="${AptXList}">
				<tr>
					<td><c:out value="${num}" /> <c:set var="num" value="${num-1}" />
					</td>

					<td>
						<div>${bo.getComplex_apartname()}</div>
					</td>
					<td>
						<div>${bo.getComplex_address()}</div>
					</td>
					<td>
						<div>${bo.getComplex_edate()}</div>
					</td>
					<td>
						<c:if test="${true}">
							 <button id="filebtn" class="filebtn" value="${bo.getComplex_id()}">파일</button>
						</c:if>
					</td>
				</tr>
	
			</c:forEach>

		</c:if>


		<tr class="h30 lime center btn">
			<td colspan=5>
			<c:if test="${page <=1}">
			 이전 &nbsp;
			</c:if>
			<c:if test="${page >1 }">
				<a href="./options_admin.op?page=${page-1}">이전</a>
			</c:if>
			
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a==page}">
					${a}
				</c:if>
				<c:if test="${a!=page}">
					<a href="./options_admin.op?page=${a}">${a}</a>
				</c:if>
			
			</c:forEach>
			<c:if test="${page >= maxpage }">
				&nbsp; 다음
			</c:if> <c:if test="${page <maxpage }">
					<a href="./options_admin.op?page=${page+1}">&nbsp;다음</a>
				</c:if></td>
		</tr>

	</table>

	<div id="bbsfind">
		
		
		<form method="get"  id="searchform" onsubmit="return find_check()">
			<table class="table">
				<tr>
					<td><select name="searchtype" id="searchtype">
							<option value="addr">주소</option>
							<option value="aptname">아파트 이름</option>
							<option value="date">날짜</option>
					</select></td>
					<td colspan="2"><input type="text" id="searchContent" name="searchContent" size="18" class="input_box">
						<input type="submit" id="searchbtn" value="검색" class="input_button">
					</td>
				
				</tr>
			</table>
		</form>
	</div>
	</div>
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>