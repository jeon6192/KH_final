<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	margin-top: 30px;
}

h4 {
	text-align: center
}


</style>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style>
#cc{
	background-color: #002060 ;
}
</style>
<script>

	function listss() {
		
		$.ajax({
			type : "post",
			url : "event_list_all.ev",
			success : function(data) {
				$('.head_ajax').empty();
				$('.head_ajax').append(data);
			}
		})
	}
	
	
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
		var keyword = $('#keyword').val();
		
		$.ajax({
			type: "post",
			url : "searchEvent.ev",
			data:{"state":state,"keyword":keyword},
			success:function(data){
				$('.head_ajax').empty();
				$('.head_ajax').append(data);
			}
		})
	}
	
	$(".filebtn").click(function(){
        location.href='./downoptions.op?aptXid='+$(this).val();
     })

	
</script>
<body>
	<p>
		<jsp:include page="../header.jsp"></jsp:include>
	</p>
	<br>
	
	
	<p class="top">
	<h4>
		<input type="button" onclick="listss();" class="btn btn-success btn-filter"value="전체">  
		<input type="button" onclick="play();" class="btn btn-warning btn-filter" value="분양중">
		<input type="button" onclick="end();"class="btn btn-danger btn-filter" value="분양끝"> 
		
	</h4>
	</p>
	
	
		
	<div class="container-fluid">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-3">
            <h2 class="text-center pull-left" style="padding-left: 30px;"> <span class="glyphicon glyphicon-list-alt"> </span> Details </h2>
          </div>
          <div class="col-xs-9 col-sm-9 col-md-9">
            <div class="col-xs-12 col-sm-12 col-md-12">
              <div class="col-xs-12 col-md-4">
                <label> Search </label>
                <div class="form-group">
                  <div class="input-group">
                    <input type="text" class="form-control input-md" name="keyword" id="keyword" placeholder="아파트명">
                    <div class="input-group-btn">
                      <button type="button" class="btn btn-md btn-info" id="searchbtn" onclick="search();"> <span class=" glyphicon glyphicon-search"></span></button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="panel-body table-responsive">
      <div class="head_ajax">
      <input type="hidden" name="state" value="1" id="state">
        <table class="table table-hover">
          <thead>
            <tr>
              <th class="text-center"> 분양 아파트 주소 </th>
              <th class="text-center"> 분양 아파트 명 </th>
              <th class="text-center"> 아파트 분양일 </th>
              <th class="text-center"> 아파트 당첨일 </th>
              <th class="text-center"> 아파트 옵션 현황 </th>
            </tr>
          </thead>

          <tbody>
          	<c:forEach var="apt" items="${list}">
          	<tr class="edit" id="detail">
				
					<td class="text-center">${apt.complex_address }</td>
					<td class="text-center"><a href="apartdetail.ev?complex_id=${apt.complex_id }">${apt.complex_apartname }</a>
					</td>
					<td class="text-center">${apt.complex_sdate }~ ${apt.complex_edate}</td>
					<c:if test="${apt.complex_state == 0 }">
						<td class="text-center">${apt.complex_pdate}</td>
						<td class="text-center"> x </td>
					</c:if>

					<c:if test="${apt.complex_state != 0 }">
						<td class="text-center">분양 마감</td>
						<td class="text-center"> 
						<input type="image" class="filebtn" value="${bo.getComplex_id()}" src="resources/img/excel.png" width="44px" height="26px">
					<%-- 	<button id="filebtn" class="filebtn" value="${bo.getComplex_id()}">파일</button> --%>
						</td>
					</c:if>
				</tr>
          	</c:forEach>
          	 </tbody>
        </table>
        </div>
      </div>
     </div>
    </div>
    
      
</body>
</html>