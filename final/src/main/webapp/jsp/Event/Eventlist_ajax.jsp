<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   


<input type="hidden" name="state" value="1" id="state">
		<p>
		<h1 class="head">아파트 분양 정보</h1>
		</p>
		<table>
			<tr>
				<th>분양 아파트 주소</th>
				<th>분양 아파트 명</th>
				<th>아파트 분양일</th>
				<th>아파트 당첨일</th>
			</tr>
			
			<c:forEach var="apt" items="${list}">
				<tr>
				
					<td>${apt.complex_address }</td>
					<td><a href="apartdetail.ev?complex_id=${apt.complex_id }">${apt.complex_apartname }</a>
					</td>
					<td>${apt.complex_sdate }~ ${apt.complex_edate}</td>
					<c:if test="${apt.complex_state == 0 }">
						<td>${apt.complex_pdate}</td>
					</c:if>

					<c:if test="${apt.complex_state != 0 }">
						<td colspan="2"><label>분양 마감</label></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>