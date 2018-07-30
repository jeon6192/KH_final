<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<script>
$(document).ready(function(){
	var tema = "home"+$('#homelesschecked').val();
	var tem ="#"+tema;
	
	$(tem).attr("checked", true);
	
	var tema1 = "age"+$('#agechecked').val();
	var tem1 ="#"+tema1;
	$(tem1).attr("checked", true);
	
	var tema2 = "family"+$('#familysizechecked').val();
	var tem2 = "#"+tema2;
	$(tem2).attr("checked", true);
	
	var tema3 = $('#telchecked').val();
	$('.tel1').val(tema3).prop("checked",true);
	
	var splitTel2 = "${memberinfo.getTel()}";
	var splitTel= splitTel2.split("-");
	var splitTel1 = (splitTel[0]);
	var splitTel2 = (splitTel[1]);
	var splitTel3 = (splitTel[2]);
	
	$('#tel1').val(splitTel1);
	$('#tel2').val(splitTel2);
	$('#tel3').val(splitTel3);
})







</script>


<style>
	#member_info{padding-top: 200px; padding-left: 200px;  margin: 0 auto; 
				width:1200px;}
	tr>td{
		font-size:13pt;
	}
	tr>th{
	font-size:15pt;
	}
	
	#postcode{
		margin-bottom:5px;
	}
				
	#tel1{
		margin-top:-10px;
		margin-left:-90px;
	}
	
	#tel2{
		margin-left:-90px;
	}
	
	#tel3{
		margin-left:10px;
	}
	
	input[type=reset]{
	
	background-color : #555555;
	color: white;
	border :  2px solid white;
	padding:10px;
	border-radius:1em;
	width: 130px;
	margin-left: 400px;
	
}
		
</style>	
</head>
<body>
<input type = "hidden" id = "homelesschecked" value = "${memberinfo.homelessTerm}">
<input type = "hidden" id = "familysizechecked" value = "${memberinfo.familySize}">
<input type = "hidden" id = "agechecked" value = "${memberinfo.age}">
<input type = "hidden" id = "telchecked" value = "${memberinfo.getTel()}">
<jsp:include page="../header.jsp"></jsp:include>
	 <div id="member_info">
	 <form name="f" method="post" action="member_info.nhn" onsubmit="return check()">
      <!-- 이진파일을 업로드 하려면 enctype 속성을 지정 -->
      <table id="join_t" class="table">
         <tr>
            <th>아이디</th>
            <td>
            <input name="id" id="id" size="14" class="input_box"  readonly="readonly" value = "${memberinfo.id}">
      
            <div id="idcheck"></div>
            </td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td>
            <input type="password" name="password" id="password" size="14" class="input_box" readonly="readonly" value="${memberinfo.password}">
            </td>
         </tr>
        
         <tr>
            <th>이름</th>
            <td>
            <input name="name" id="name" size="14" class="input_box" readonly="readonly" value="${memberinfo.name } " >
            </td>
         </tr>
         
         
         
         <tr>
            <th>주소</th>
            <td>
	            <input type="text" id="postcode" name = "postcode" placeholder="우편번호" readonly="readonly" value = "${memberinfo.postcode}">
				<input type="button" onclick="Postcode()" value="우편번호 찾기"><br>
				<input type="text" id="address1" name = "address1" size="40" placeholder="도로명주소" readonly="readonly" value = "${memberinfo.address1}">
				<input type="text" id="address2" name = "address2" size="40" placeholder="지번주소" readonly="readonly" value = "${memberinfo.address2}">
				<span id="guide" style="color:#999"></span>
            </td>
         </tr>
         
         <tr>
            <th>나머지 주소</th>
            <td>
            <input name="address3" id="address3" size="50" class="input_box" readonly="readonly" value = "${memberinfo.address3}">
            </td>
         </tr>

         <tr>
            <th>휴대전화번호</th>
            <td>
            <div class="form-group" id=tel1>
			        <label for="gender1" class="col-sm-2 control-label"></label>
			        <div class="col-sm-2">;
			            
			        <select class="form-control selcls" id="tel1" name = "tel1">
						<option>010</option>
						<option>019</option>
					</select>
					</div>
					</div>
			             <input name="tel2" id="tel2" size="10" maxlength="4" class="input_box">
			             <input name="tel3" id="tel3" size="10" maxlength="4" class="input_box">
			  </td>
         </tr>
         
         <tr>
         	<th>주민등록번호</th>
         	<td>
         		<input name="idNumber1" id="idNumber1" size="10" maxlength="6" class="input_box" readonly="readonly" value = "${memberinfo.idNumber1}">
           		 -<input name="idNumber2" id="idNumber2" size="10" maxlength="7" class="input_box" readonly="readonly" value = "${memberinfo.idNumber2}">
         	</td>
         </tr>
         
         <tr>
         	<th>나이</th>
         	<td>
         		20대<input value=5 name="age" id="age5" type="radio" readonly="readonly">
         		30대<input value=10 name="age" id="age10" type="radio" readonly="readonly">
         		40대<input value=15 name="age" id="age15" type="radio" readonly="readonly">
         		50대<input value=20 name="age" id="age20" type="radio" readonly="readonly">
         		60대이상<input value=25 name="age" id="age25" type="radio" readonly="readonly">
         	</td>
         	
         </tr>
         <tr>
         	<th>무주택기간</th>
         	<td >
         		무주택<input value=35 name="homelessTerm" id="home0" type="radio" readonly="readonly">
         		1년 미만<input value=30 name="homelessTerm" id="home10" type="radio" readonly="readonly">
         		1년이상~3년 미만<input value=25 name="homelessTerm" id="home15"  type="radio" readonly="readonly">
         		3년이상~5년 미만<input value=20 name="homelessTerm" id="home20" type="radio" readonly="readonly">
         		5년이상~8년 미만<input value=15 name="homelessTerm" id="home25" type="radio" readonly="read readonly="readonly">
         		8년이상~11년 미만<input value=10 name="homelessTerm" id="home30" type="radio" readonly="readonly">
                11년이상<input value=35 name="homelessTerm" id="home35" type="radio">
         	</td>
         </tr>
         <tr>
         	<th>부양가족수</th>
         	<td>
         	    1~3명<input value=20 name="familySize" id="family20" type="radio"  readonly="readonly">
         		4~6명<input value=30 name="familySize" id="family30" type="radio" readonly="readonly">
         		7명 이상<input value=40 name="familySize" id="family40" type="radio" readonly="readonly">
         	</td>
         </tr>
         
          <tr>
			<th>분양 점수</th>
			<td><input name="score" id="score" size="37"
			class="score" value="${memberinfo.score}" readonly="readonly"></td>
					
		 </tr>
      </table>
  
      <div id="info_menu">
          <input type="reset" value="뒤로 가기" class="input_button" onclick="history.go(-1)">
      </div>
      </form>
   </div>
</body>
</html>