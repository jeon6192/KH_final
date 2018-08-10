<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>정보게시판</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	@font-face{
  		font-family : 'NanumGothic';
  		src : url(../fonts/NanumGothic.ttf) format('truetype');
	}
	body{
		font-family: NanumGothic
	}
	#infoPolicycont_t {width: 100%}
	#policylist {float:right; border: 0 none; background-color: transparent;}
	#infoPolicycont_wrap {margin:0 auto}
	#listOpentable table {
		border-collapse:collapse;
		text-align:left;
		line-height: 1.5; 
		width: 100%; 
	}
	#listOpenClose thead th {
		padding: 10px;
		font-weight: bold;
    	vertical-align: top;
   		color: #369;
    	border-bottom: 3px solid #036;
	}
	#listOpenClose tr td:first-child {
		width:30%;
		padding: 5px;
		vertical-align: top;
		border-bottom: 1px solid #828282;
	}
	#listOpenClose tr td:last-child {
		width:70%;
		padding: 5px;
		vertical-align: top;
		border-bottom: 1px solid #828282;
	}
	#listOpenClose tr:last-child td{
		text-align:center;
	}
	#wrap a:first-child{float:left}
	#wrap a:last-child{float:right}
	.infowrap{
    	padding-top: 12%; width:1000px; padding-bottom:5%;  margin: 0 auto;
	}
	#inhr{width:100%}
	#ohr{margin-top:20px; }
	#ohr hr{background-color: #2e75b6;}
	#infoPolicycont_menu input[type=button] {background-color:white; border:1.5px solid #008CBA; }
</style>
<script>
	var level=0;//
	function listOpen(){
		if(level==1){
			$("#listOpenClose").show();
			$("#policylist").val("목록닫기");
			level=0;
		}
		else{
			$("#listOpenClose").hide();
			$("#policylist").val("목록열기");
			level=1;
		}
	}

</script>
</head>
<body>
<div class="infowrap">
	<div id="infoPolicycont_wrap" style="width:600px">
		<h2>정보 게시판</h2>
		<form>
			<input type="button" value="필요서류" onclick="location='infoDoc_list.nhn?page=1'" style="border:none">
			<input type="button" value="정책" onclick="location='infoPolicy_list.nhn?page=1'" style="background:#2e75b6;color:white;border:none">
			<input type="button" value="기타정보" onclick="location='infoEtc_list.nhn?page=1'" style="border:none">
	    		
			<br>
		
		</form> 
	
		<div id="ohr">
			<hr id="inhr">
		</div>
		
		
		<div style="padding-bottom: 10px">
			전체보기 
			글 개수 : ${listcount}
			<input type="button" value="목록닫기" id="policylist" onclick="listOpen()">
		</div>
			
		<div id="listOpentable" style="padding-bottom: 150px">
			<table id="listOpenClose" >
				<thead>
					<tr>
						<th>글제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<c:if test="${listcount != 0 }">
					<tbody>
						<c:set var = "infoPolicy_num" value = "${listcount-(listpage-1)*limit}"/>
    					<c:forEach var = "p" items = "${infoPolicylist}">
							<tr>
								<td>
									<div style="text-align:left">
             							<a href = "infoPolicy_cont.nhn?infoPolicy_num=${p.INFO_POLICY_NUM}&page=${page}&state=cont&listpage=${listpage}">
                     						 ${p.INFO_POLICY_SUB}
             							</a>
             						</div>
								</td>
								<td>
									${p.INFO_POLICY_DATE}
								</td>
							</tr>
						</c:forEach>
						<tr>
       						<td colspan = 2>
       							<a href = "./infoPolicy_cont.nhn?listpage=1&infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&state=cont">&lt;</a>
          						<c:if test = "${listpage <= 1}">
            						 이전&nbsp;
          						</c:if>
          						<c:if test = "${listpage > 1}">
            						 <a href = "./infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&state=cont&listpage=${listpage - 1}">이전</a>&nbsp;   
          						</c:if>
          
          						<c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
             						<c:if test = "${a == listpage}">
                						${a}
             						</c:if>
             						<c:if test = "${a != listpage}">
                						<a href = "./infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&state=cont&listpage=${a}">${a}</a>
             						</c:if>   
          						</c:forEach>
          
          						<c:if test = "${listpage >= maxpage}">
             						&nbsp;다음
          						</c:if>
          						<c:if test = "${listpage < maxpage}">
             						<a href = "./infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&state=cont&listpage=${listpage+1 }">&nbsp;다음</a>
          						</c:if>
          						<a href = "./infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&state=cont&listpage=${endpage}">&gt;</a>
       						</td>                  
    					</tr>
   		 			</c:if>
 

 					<!-- 레코드가 없으면 -->
   					<c:if test="${listcount == 0 }">
       					<tr>
          					<td style = "text-align:right" colspan="3">
             					등록된 글이 없습니다.
          					</td>   
       					</tr>
    				</c:if>
    			</tbody>
    		</table>
    	</div>

		<h4 style="padding-bottom: 50px">게시물 내용보기</h4>

		<div id="wrap">
			<table id="infoPolicycont_t" border="1">
				<c:set var = "infoPolicy_num" value = "${listcount-(listpage-1)*1}"/>
				<tr>
					<th>제목</th>
					<td>
            	 		${infoPolicy.INFO_POLICY_SUB}
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						${infoPolicy.INFO_POLICY_CONT}
					</td>
				</tr>
				<c:if test="${!empty infoPolicy.INFO_POLICY_FILE }">
					<tr>
						<th>첨부파일</th>
						<td>
							<a href="./infoPolicy_download.file?path=${infoPolicy.INFO_POLICY_FILE}&original=${infoPolicy.INFO_POLICY_ORIGINAL}">
								${infoPolicy.INFO_POLICY_ORIGINAL}</a>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>조회수</th>
					<td>
						${infoPolicy.INFO_POLICY_VISIT}
					</td>
				</tr>
			</table>
		</div>	
		<br>
		<br>
		<div id="infoPolicycont_menu" style="margin-left:200px">
			<c:if test="${!empty sessionScope.Admin_no}">
			<input type="button" value="수정" class="input_button"
			onclick="location='infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&listpage=${listpage}&state=edit'">
		
			<input type="button" value="삭제" class="input_button"
			onclick="location='infoPolicy_cont.nhn?infoPolicy_num=${infoPolicy.INFO_POLICY_NUM}&page=${page}&listpage=${listpage}&state=del'">
			</c:if>
			
			<input type="button" value="목록" class="input_button"
			onclick="location='infoPolicy_list.nhn?page=1'">
		</div>
	</div>
</div>
</body>
</html>