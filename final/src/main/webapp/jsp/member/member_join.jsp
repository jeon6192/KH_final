<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>



<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    

<script>

function check(f){
	var n = f.familySize.length;
	for(var i=0;i<n;i++){
		if(f.familySize[i].checked==false)
			alert("부양가족수를 체크하세요")
	}
	
}


function Postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address1').value = fullRoadAddr;
            document.getElementById('address2').value = data.jibunAddress;

        }
    }).open();
}
	
	
	var checkconfirm=false;//아이디 중복 체크 안한 경우
	var checkid = '';
	function id_check(){
	    
	     
	   var inputId = $('#id').val();
	   var checkId = /^[a-z]{1}[a-z0-9_]{3,11}$/;
	   var msg = '';
	   
	     if(!checkId.test(inputId)) {
	         msg = '영어 소문자로 시작하는 영문자 + 숫자 4~12자리만 입력가능합니다.';
	         $('#idcheck').text(msg);
	     } else {
	        $.ajax({
	         type : "POST",
	         data : {"id" : inputId},
	         url : "./member_idcheck.nhn",
	         cache : false,
	         success: function(data){
	        	 console.log(data);
	            if (data == -1) {//중복 아이디가 없으면
	               msg = 'ID 사용가능';
	              checkconfirm = true;
	              checkid=inputId;
	            } else {//중복 아이디가 있으면
	               msg = 'ID 중복';
	            }
	            $('#idcheck').text(msg);
	         },
	         error: function() {
	            alert("error");
	         }
	      }); // ajax
	     }
	}
	      
	      function check(){
	      
	      if($("#id").val()==""){
	    	  alert($("#id").val());
	    	  $("#id").val("").focus();
	    	  return false;
	      } 
	      if(checkconfirm==false||checkid != $("#id").val()) {
	    	  alert("아이디 중복체크 하세요!");
	    	  return false;
	      }
	      if($.trim($("#password").val())==""){
	    	  alert("회원비번을 입력하세요!");
	    	  $("#password").val("").focus();
	    	  return false;
	      }
	     
	     
	      if($.trim($("#name").val())==""){
	    	  alert("회원이름을 입력하세요!");
	    	  $("#name").val("").focus();
	    	  return false;
	      }
	      if($.trim($("#idNumber1").val())==""){
	    	  alert("주민등록번호를 입력하세요!");
	    	  $("#idNumber1").val("").focus();
	    	  return false;
	      }
	      if($.trim($("#idNumber2").val())==""){
	    	  alert("주민등록번호를 입력하세요!");
	    	  $("#idNumber2").val("").focus();
	    	  return false;
	      }
	    
	      if($.trim($("#idNumber2").val())==""){
	    	  alert("주민등록번호를 입력하세요!");
	    	  $("#idNumber2").val("").focus();
	    	  return false;
	      }
	      
	      
	      
	      
	      
	      
	     }
	
	
</script>
<style>
	
	#join_wrap{padding-top: 200px; padding-left: 100px;  margin: 0 auto; 
	}
	tr>td{
		font-size:13pt;
	}
	tr>th{
	font-size:15pt;
	}
	
	
	#join_wrap input[type=button] {
	margin-bottom:0.5em;
	background-color : #CCCCCC;
	color: black;
	border :  2px solid white;
	padding:7px;
	border-radius:1em;
	height: 35px;
	
}
	#join_menu{
	text-align:center
	}
	
	#join_menu input[type=submit]{
	
	background-color : #555555;
	color: white;
	border :  2px solid white;
	padding:10px;
	border-radius:1em;
	width: 130px;
	
	
}

	 #join_menu input[type=reset] {
	 
	background-color : #555555;
	color: white;
	border :  2px solid white;
	padding:10px;
	border-radius:1em;
	width: 130px;
	
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
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

   <div id="join_wrap" class="container">
      <form name="f" method="post" action="member_join_ok.nhn" onsubmit="return check()">
      <h2 class="join_title">회원가입</h2>
      <!-- 이진파일을 업로드 하려면 enctype 속성을 지정 -->
      <table id="join_t" class="table">
         <tr>
            <th>아이디</th>
            <td>
            <input name="id" id="id" size="14" class="input_box">
            <input type="button" value="아이디 중복체크" class="input_button" onclick="id_check()">
            <div id="idcheck"></div>
            </td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td>
            <input type="password" name="password" id="password" size="14" class="input_box">
            </td>
         </tr>
        
         <tr>
            <th>이름</th>
            <td>
            <input name="name" id="name" size="14" class="input_box">
            </td>
         </tr>
         
         
         
         <tr>
            <th>주소</th>
            <td>
	            <input type="text" id="postcode" name = "postcode" placeholder="우편번호">
				<input type="button" onclick="Postcode()" value="우편번호 찾기"><br>
				<input type="text" id="address1" name = "address1" size="40" placeholder="도로명주소">
				<input type="text" id="address2" name = "address2" size="40" placeholder="지번주소">
				<span id="guide" style="color:#999"></span>
            </td>
         </tr>
         
         <tr>
            <th>나머지 주소</th>
            <td>
            <input name="address3" id="address3" size="50" class="input_box">
            </td>
         </tr>

         <tr id="tel">
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
         		<input name="idNumber1" id="idNumber1" size="10" maxlength="6" class="input_box">
           		 -  <input name="idNumber2" id="idNumber2" size="10" maxlength="7" class="input_box">
         	</td>
         </tr>
         
         <tr>
         	<th>나이</th>
         	<td>
         		20대<input value=5 name="age"  type="radio">
         		30대<input value=10 name="age"  type="radio">
         		40대<input value=15 name="age"  type="radio">
         		50대<input value=20 name="age"  type="radio">
         		60대이상<input value=25 name="age"  type="radio">
         	</td>
         	
         </tr>
         <tr>
         	<th>무주택기간</th>
         	<td >
         		무주택<input value=35 name="homelessTerm"  type="radio">
         		1년 미만<input value=30 name="homelessTerm"  type="radio">
         		1년이상~3년 미만<input value=25 name="homelessTerm"  type="radio">
         		3년이상~5년 미만<input value=20 name="homelessTerm"  type="radio">
         		5년이상~8년 미만<input value=15 name="homelessTerm"  type="radio">
         		8년이상~11년 미만<input value=10 name="homelessTerm"  type="radio">
                11년이상<input value=35 name="homelessTerm"  type="radio">
         	</td>
         </tr>
         <tr>
         	<th>부양가족수</th>
         	<td>
         	    1~3명<input value=20 name="familySize"  type="radio">
         		4~6명<input value=30 name="familySize" type="radio">
         		7명 이상<input value=40 name="familySize"  type="radio">
         	</td>
         </tr>
      </table>
      
      </div>
<!--       <input type="button" onclick="Postcode()" value="우편번호 찾기"><br>
 -->      
      <div id="join_menu">
         <input type="submit" value="회원가입" class="input_button">
         <input type="reset" value="가입취소" class="input_button" onclick="history.go(-1)">
      </div>
     
    </form>

</body>
</html>