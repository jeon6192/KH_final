<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		console.log('${dong101}')
	})
</script>
</head>
<body>
${dong101[5].dressroom}

<div id="1">
<c:forEach var="a" items="${dong101}" varStatus="e">
	<div>[${e.index}]	${a.apart_dong} 동 ${a.apart_ho} 호  옵션 :안방슬라이딩장 / ${a.main_room_slide}   호  옵션 :드레스룸 / ${a.dressroom} </div>
</c:forEach>
</div>

<div id="2">
<c:forEach var="b" items="${dong102}" varStatus="e">
	<div>[${e.index}]	${b.apart_dong} 동 ${b.apart_ho} 호  옵션 :주방선반 / ${b.kitchen_shelf}   //  빌트인 김치냉장고 ${b.builtin_kref}  </div>
</c:forEach>
</div>

<div id="2">
<c:forEach var="b" items="${dong201}" varStatus="e">
	<div>[${e.index}]	${b.apart_dong} 동 ${b.apart_ho} 호  옵션 :주방선반 / ${b.kitchen_shelf}   //  빌트인 김치냉장고 ${b.builtin_kref}  </div>
</c:forEach>
</div>


</body>
</html>