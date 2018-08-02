<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:if test="${event_con==0 }">
 당첨 정보가 없습니다
 </c:if>
 
	당첨된 내 아파트 : 
	<ul>
	<c:forEach var="item" items="${winList}">
		<li>${item.getComplex_apartname()}  아파트 ${item.getApart_dong()} 동  ${item.getApart_ho()}호 
				주소 : ${item.getComplex_address()} // 옵션 신청 마감 날짜 : ${item.getComplex_edate() }
				<a href="./option.op?apt_id=${item.getApart_id()}">옵션신청하기</a>
				</li>
	
	</c:forEach>
	</ul>
</body>
</html>