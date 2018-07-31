<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<p><h1 class="head">분양이 끝난 아파트 정보</h1></p>
<input type="hidden" name="state" value="2" id="state">
<table>
	<tr>
	<th>분양 아파트 주소</th><th>분양 아파트 명</th>  <th>아파트 당첨일</th> <th>분양 상태</th>
	</tr>
	<c:forEach var="apt" items="${list}">
	<tr>
	<td>${apt.complex_address }</td>
	<td>
	<a href="apartdetail.ev?complex_id=${apt.complex_id }">${apt.complex_apartname }</a>
	</td>
	<td>${apt.complex_pdate }</td>
	
	<td>
		<label>분양 마감</label>
	</td>
	
	</tr>
	</c:forEach>
</table>