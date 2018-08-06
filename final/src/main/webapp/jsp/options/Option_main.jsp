<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jQuery.com/jquery-latest.js"></script>
<jsp:include page="../header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./resources/css/optionPublic.css" rel="stylesheet">
<style> 
	.Condiv{margin:auto; text-align:center; display:inline-block ; border :1px solid lightgray; height:300px ; border-radius:30px}
	.Condiv_menu{margin:auto;background:cornflowerblue ; color:white; border-radius:30px}
</style>
</head>
<body>
	<div class="optionContainer">
		<div id="showEventInList" class="Condiv">
		<div class="Condiv_menu">분양 신청 중인 아파트</div>
			<div>
				<c:if test="${eventIn_con==0 }">
					<div id="noWin">신청 한 아파트 정보가 없습니다</div>
				</c:if>

				<c:if test="${eventIn_con==1 }">
					<ul>
						<c:forEach var="item" items="${EventInList}">
							<li>
								<a href="">${item.getComplex_apartname()}아파트</a>
							주소 : ${item.getComplex_address()}
							분양 상태 : <c:if test="${item.complex_state}==0"> 분양 중 </c:if>
										<c:if test="${item.complex_state}==1"> 1차 분양 중 </c:if>
										<c:if test="${item.complex_state}==2"> 2차 분양 중 </c:if>
										<c:if test="${item.complex_state}==2"> 종료 </c:if>
							
							</li>

						</c:forEach>
					</ul>
				</c:if>
			</div>
		</div>

		<div id="showWInList" class="Condiv">
			<div class="Condiv_menu">당첨된 내 아파트</div>
			<div>
				<c:if test="${event_con==0 }">
					<div id="noWin">당첨 정보가 없습니다</div>
				</c:if>

				<c:if test="${event_con==1 }">
					<ul>
						<c:forEach var="item" items="${winList}">
							<li>
								<a href="">${item.getComplex_apartname()}아파트</a>
								${item.getApart_dong()} 동 ${item.getApart_ho()}호 주소 :
								${item.getComplex_address()} // 옵션 신청 마감 날짜 :
								${item.getComplex_edate() } <a
								href="./option.op?apt_id=${item.getApart_id()}">옵션신청하기</a>
							</li>

						</c:forEach>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>