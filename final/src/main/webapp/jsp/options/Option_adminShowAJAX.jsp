<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<c:if test="${listcount>0}">
			<tr>
			<input type="hidden" value="${searchtype}" name="searchtype">	
			<input type="hidden" value="${searchContent}" name="searchContent">
			<input type="hidden" value="${page}" name="page">
			<input type="hidden" value="${state}" name="state">
			
				<th width="70%" colspan="3" class="bbslist_title">아파트 옵션 관리 TABLE</th>
				<th width="30%" colspan="2" class="bbslist_title">검색된 개수 : ${listcount}</th>
			</tr>
			<tr>
				<th width="8%">
					<div>번호</div>
				</th>
				<th width="30%">
					<div>아파트 이름</div>
				</th>
				<th width="32%">
					<div>주소</div>
				</th>
				<th width="20%">
					<div>완료 날짜</div>
				</th>
				<th width="5%">
					파일
				</th>

			</tr>
			<c:set var="num" value="${listcount-(page-1)*10}" />
			<c:forEach var="bo" items="${AptXList}">
				<tr>
					<td><c:out value="${num}" /> <c:set var="num" value="${num-1}" />
					</td>

					<td>
						<div>${bo.getComplex_apartname()}</div>
					</td>
					<td>
						<div>${bo.getComplex_address()}</div>
					</td>
					<td>
						<div>${bo.getComplex_edate()}</div>
					</td>
					<td>
						<c:if test="${true}">
							 <button value="${bo.getComplex_id()}">파일</button>
						</c:if>
					</td>
				</tr>
	
			</c:forEach>

		</c:if>
	
		<c:if test="${listcount==0}">
		검색 결과가 없습니다.
		</c:if>

		<tr class="h30 lime center btn">
			<td colspan=5>
			<c:if test="${page <=1}">
			 이전 &nbsp;
			</c:if>
			<c:if test="${page >1 }">
				<a href="./options_admin.op?page=${page-1}&searchtype=${searchtype}&searchContent=${searchContent}&state=${state}">이전</a>
			</c:if>
			
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a==page}">
					${a}
				</c:if>
				<c:if test="${a!=page}">
					<a href="./options_admin.op?page=${a}&searchtype=${searchtype}&searchContent=${searchContent}&state=${state}">${a}</a>
				</c:if>
			
			</c:forEach>
			<c:if test="${page >= maxpage }">
				&nbsp; 다음
			</c:if> <c:if test="${page <maxpage }">
					<a href="./options_admin.op?page=${page+1}&searchtype=${searchtype}&searchContent=${searchContent}&state=${state}">&nbsp;다음</a>
				</c:if></td>
		</tr>

	