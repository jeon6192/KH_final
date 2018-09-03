<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${listcount == 0 }">
		
		
		<thead>
			<tr>
				<th>분양시기</th>
				<th>주소</th>
				<th>아파트명</th>
				<th>가격</th>
				<th>면적(㎡)</th>
				<th>역세권</th>
				<th>근처역/도보 소요시간</th>
				<th>분양상태</th>
			</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="7" align="center">검색된 매물이 없습니다.<br>
			다른 조건으로 검색하시기 바랍니다.</td>
		</tr>
		</tbody>
</c:if>
		
		
		<c:if test="${listcount !=0}">
		
		<thead>
			<tr>
				<th>분양시기</th>
				<th>주소</th>
				<th>아파트명</th>
				<th>가격</th>
				<th>면적(㎡)</th>
				<th>역세권</th>
				<th>근처역/도보 소요시간</th>
				<th>분양상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "aptList" items="${aptList}">
			<tr>
				<td>${aptList.complex_pdate}</td>
				<td>${aptList.complex_address}</td>
				<td><a style="color: #2a6496;" href="complex/${aptList.complex_id}">${aptList.complex_apartname}</a></td>
				<c:choose>
				<c:when test="${aptList.minprice == aptList.maxprice}">
				<td>${aptList.maxprice}만원</td>
				</c:when>
				<c:otherwise>
				<td>${aptList.minprice}만원~${aptList.maxprice}만원</td>
				</c:otherwise>
				</c:choose>
				
				
				<c:choose>
				<c:when test="${aptList.minarea == aptList.maxarea}">
					<td>${aptList.maxarea}</td>
				</c:when>
				<c:otherwise>
				<td>${aptList.minarea}~${aptList.maxarea}</td>
				</c:otherwise>
				</c:choose>
				
								
		<c:choose>
			<c:when test="${aptList.complex_subway == 1}"> 
				<td>O</td>
				<td>${aptList.complex_station}/${aptList.complex_foot}분</td>
			</c:when>
			
			<c:otherwise>
					<td>X</td>
					<td></td>
			</c:otherwise>
		</c:choose>
				
		
			<c:choose>
			<c:when test="${aptList.complex_state == 0}"> 
				<td>분양 진행중</td>
			</c:when>
			
			<c:when test="${aptList.complex_state == 1}">
				<td>분양 종료</td>
			</c:when>
		</c:choose>
				
			</tr>
</c:forEach>
		</tbody>
		
		<tfoot>
			<tr class="pageBtn" align="center">
				<td colspan="8">
					<c:if test="${page<=1}">
						이전&nbsp;
					</c:if>
					<c:if test="${page>1}">
						<a href="./aptsearch_list.com?page=${page-1}&select1=${param.select1}&select2=${param.select2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">이전</a>
					</c:if>
					
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==page}">
							${a}
						</c:if>
						<c:if test="${a != page }">
							<a href="./aptsearch_list.com?page=${a}&select1=${param.select1}&select2=${param.select2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">${a}</a>
						</c:if>
					</c:forEach>
					
					<c:if test="${page>=maxpage }">
						다음&nbsp;
					</c:if>
					<c:if test="${page<maxpage}">
							<a href="./aptsearch_list.com?page=${page+1}&select1=${param.select1}&select2=${param.select2}&select3=${param.select3}&sel1=${param.sel1}&sel2=${param.sel2}&sel3=${param.sel3}">다음</a>
					</c:if>
				</td>
			</tr>
		</tfoot>
	</c:if>
