<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>당첨자 현황 리스트</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<script>
	function search(){
		var keyword=$('#keyword').val();
		var complex_id = $('#complex_id').val();
		alert(complex_id);
		$.ajax({
			type:"post",
			url:"event_win_search.ev",
			data:{"complex_id":complex_id,"keyword":keyword},
			success:function(data){
				$('.head_ajax').empty();
				$('.head_ajax').append(data);
			}
		})
		
	}
	
	
	function up(a,b){
		var complex_id = $('#complex_id').val();
		
		$.ajax({
			type:"post",
			url:"update_up.ev",
			data:{"apart_id":a,"user_no":b},
			success:function(){
				alert("확정완료 되었습니다.");
				location.href="event_win_list.ev?complex_id="+complex_id;
			},
			error:function(data){
				alert("error");
			}
		})
		
	}
	
	function down(a,b){
		var complex_id = $('#complex_id').val();
		
		$.ajax({
			type:"post",
			url:"update_down.ev",
			data:{"apart_id":a,"user_no":b},
			success:function(){
				alert("분양취소 되었습니다.");
				location.href="event_win_list.ev?complex_id="+complex_id;
			},
			error:function(data){
				alert("error");
			}
		})
		
	}
	

</script>


</head>
<body>
	<input type="hidden" value="${complex_id}" id="complex_id">
	<div class="container-fluid">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-3">
            <h2 class="text-center pull-left" style="padding-left: 30px;"> <span class="glyphicon glyphicon-list-alt"> </span> 당첨자 현황 리스트 </h2>
          </div>
          <div class="col-xs-9 col-sm-9 col-md-9">
            <div class="col-xs-12 col-sm-12 col-md-12">
              <div class="col-xs-12 col-md-4">
                <label> Search </label>
                <div class="form-group">
                  <div class="input-group">
                    <input type="text" class="form-control input-md" name="keyword" id="keyword" placeholder="당첨자명">
                    <div class="input-group-btn">
                      <button type="button" class="btn btn-md btn-warning" id="searchbtn" onclick="search();"> <span class=" glyphicon glyphicon-search"></span></button>
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
        <table class="table table-hover">
          <thead>
            <tr>
              <th class="text-center"> 아파트 동 </th>
              <th class="text-center"> 호수</th>
              <th class="text-center"> 당첨자 아이디</th>
              <th class="text-center"> 확정여부 </th>
            </tr>
          </thead>

          <tbody>
          	<c:forEach items="${win}" var="event">
          	<tr class="edit">
          		<td class="text-center">${event.apart_dong }</td>
          		<td class="text-center">${event.apart_ho }</td>
          		<td class="text-center">${event.id }(${event.name })</td>
				<td class="text-center">
				<c:if test="${event.event_con ==0 }">
				<button onclick="up(${event.user_no},${event.apart_id })">확정하기</button>
				<button onclick="down(${event.user_no},${event.apart_id })">취소하기</button>
				</c:if>
				<c:if test="${event.event_con ==1 }">
				확정완료
				</c:if>
				<c:if test="${event.event_con ==2 }">
				분양취소
				</c:if>
				</td>
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