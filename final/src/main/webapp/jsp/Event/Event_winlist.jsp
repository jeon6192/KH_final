<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta>
<title>Insert title here</title>
</head>
<body>
<h1>당첨자 현황 리스트</h1>
<ul>
	<c:forEach items="${win }" var="event">
	<li>${event.apart_id }</li>
	</c:forEach>
</ul>
</body>
</html>