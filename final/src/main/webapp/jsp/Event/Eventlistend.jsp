<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

  <input type="hidden" name="state" value="2" id="state">
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
						<input type="image" class="filebtn" value="${apt.complex_id}" src="resources/img/excel.png" width="44px" height="26px">
						</td>
					</c:if>
				</tr>
          	</c:forEach>
          	 </tbody>
        </table>