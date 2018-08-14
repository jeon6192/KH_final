<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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