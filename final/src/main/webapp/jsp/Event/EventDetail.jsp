<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<!-- Daum Map -->
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d8e47b00c2f9c5701d6a158cfe8df08&libraries=services,clusterer,drawing"></script>
      
      <script src="${pageContext.request.contextPath}/resources/js/apart_contents.js"></script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/apart_contents.css">
      
      <!-- Image Silder -->
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
<style>
.head{
   padding-top: 95px;
}
ul{
   width:75%;
   margin: 0 auto
}
#length1{
    border-radius: 8px;
}
#length2{
    border-radius: 8px;
}
.contents{
   margin-left: 0px !important;
}
.cpx_text{
   background-color: #002060 ;
}
</style>
<script>
   function tap(){
      var complex_id = $('#complex_id').val();
      window.open("event_win_list.ev?complex_id="+complex_id,"당첨자 현황 리스트","width=800,height=800");
   }
   
   function start(){
      var length1 = $('#length1').val();
      var length2 = $('#length2').val();
      var complex_id = $('#complex_id').val();
      var total = $('#total_list').val();
      
      
      if(confirm("제비뽑기"+length1+"명  점수 순위 뽑기 "+length2+"명 입니다. 분양을 시작하시겠습니까?")){
         length1=typeof(length1);
         length2=typeof(length2);
         total =typeof(total);
         
         if((length1+length2)<=total){
            
          $.ajax({
         
            type:"post",
            url:"insertEventplay.ev",
            data:{"length1":length1,"length2":length2,"complex_id":complex_id},
            success:function(data){
               
            },
            error:function(){

               alert("error");
            }
            
                  
         }) 
         }else{
            alert("총 세대수보다 지정한 인원이 많습니다. 다시확인하세요.");
         }
      }
      
      
   }
   
   function restart(){
         
      var total =  $('#listcount').val();
      var complex_id = $('#complex_id').val();
      
      if(confirm("미분양중인 "+total+"세대에 대하여 재분양을 시작하시겠습니까?")){
         
         
            $.ajax({
               
               type:"post",
               url:"restartform.ev",
               data:{"complex_id":complex_id},
               success:function(data){
                     alert("재분양을 시작합니다.");
                     location.href="apartdetail.ev?complex_id="+complex_id;
               }
            })
      
      }
      
      
   }

   
</script>

<body>
      <jsp:include page="../header.jsp"></jsp:include>
   <input type="hidden" value="${complex.complex_id }" id="complex_id">
   <input type="hidden" value="${apt_listcount}" id="listcount">
   <c:set var="cpx" value="${apartMap.aptComplexBean}"/>
      <c:set var="aptList" value="${apartMap.apartmentBeanList}"/>
   <div class="contents">
            <div class="detail cpx">
               <input type="hidden" id="cpx_lat" value="${cpx.complex_lat}">
               <input type="hidden" id="cpx_lng" value="${cpx.complex_lng}">
               <input type="hidden" id="cpx_id" value="${cpx.complex_id}">
               <input type="hidden" id="apt_name" value="${cpx.complex_apartname}">
               <input type="hidden" id="cpx_sdate" value="${cpx.complex_sdate}">
               <input type="hidden" id="cpx_edate" value="${cpx.complex_edate}">
               <input type="hidden" id="user_id" value="${id}">
               
               <div class="div cpx_aptname">
                  <div class="div apticon">
                     <img alt="아파트~" src="./resources/image/apartment.png">
                  </div>
                  <div class="div aptname">
                     ${cpx.complex_apartname}
                  </div>
                  <div class="div timer-btn">
                     <c:if test="${complex.complex_state !=0 }">
                     <c:if test="${apt_listcount >0}">
                     <a href=" " onclick="restart();" style="color: blue;">재분양 하기</a>
                     </c:if>
                     <a href=" " onclick="tap();">당첨자 현황 보기</a>
                     </c:if>
                     
                     
      
                  </div>
               </div>

               <div class="cpx_text">
                  <span class="span cpx">위치</span>
               </div>
               <div class="map_wrap">
                  <div id="cpx_map" style="width: 95%; height: 330px; margin: 0 auto;">
                  </div>
      
                   <script src="${pageContext.request.contextPath}/resources/js/event_map.js"></script>
               </div>
               
               <div class="cpx info">
                  <div class="div addr">
                     <div class="cpx_text">
                        <span class="span cpx">주소</span>
                     </div>
                     <div class="cpx addr">
                        ${cpx.complex_address}
                     </div>
                  </div>
                  
                  <div class="div household">
                     <div class="cpx_text">
                        <span class="span cpx">총 세대수</span>
                     </div>
                     <div class="cpx household">
                     <input type="hidden" value="${fn:length(aptList)}" id="total_list">
                        ${fn:length(aptList)} 세대 
                     </div>
                  </div>
                  
                  
                  <div class="div subway">
                     <div class="cpx_text">
                        <span class="span cpx">분양 신청자 수</span>
                     </div>
                     <div class="cpx subway">
                        ${event_listcount} 명
                     </div>
                  </div>
                  
                  <div class="div date">
                     <div class="cpx_text">
                        <span class="span cpx">분양 공급 세대 수</span>
                     </div>
                     <div class="cpx pdate">
                        ${apt_listcount } 세대
                     </div>
                  </div>
                  
                  <c:if test="${complex.complex_state ==0 }">
                  <div class="cpx_text">
                     <span class="span cpx">제비뽑기 / 순위별 뽑기</span>
                     <div class="cpx aptinfo">
                        <br>
                        
         <input type="text" maxlength="200" id="length1" size="5" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" style="IME-MODE:disabled;">/
         <input type="text" maxlength="200" id="length2" size="5" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" style="IME-MODE:disabled;">
                     <button style="border-radius: 5px; background-color: black;color: white;" onclick="start();">분양하기</button>
                        
                     </div>
                  </div>
                  </c:if>
                  
                  
               </div>   
            </div>
         </div>
   
</body>
</html>