	var addr;
	$(function(){
		//map★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		//param 으로 받은걸 조건에 맞게 고쳐준다
		if(sel2 != ""){
			sel2 = " " + sel2;
		}
		if(sel3 != ""){
			sel3 = " " + sel3;			
		}
		addr = sel1 + sel2 + sel3;
		
		map();
		
		
		$('.apart_name span').text(sel1+" "+ sel2+" "+sel3);
		
		
		//select1 에 값들을 반복해서 실행해주고
		$('.select1 option').each(function(){
			
			//thisVal 에 현재 선택된 밸류 값을 넣어준다. 하나씩 비교하기위해
			 var thisVal = $(this).val();
			
			//현재선택된 밸류 값과 넘어온 밸류값과 비교
			if(thisVal == select1){
				
				//같다면 현재 옵션값을 선택여부를 true 로 바꿔준다.
				$(this).prop('selected', true);
				
				//select2 와 select3 에 값을 넣어주기위해 search.js 에서 했던것을 또해준다.
				var inner = "";
				var inner2 = "";

				inner += "<option value="+-1+">";
				inner += "시/군/구";
				inner += "</option>";

				inner2 += "<option value="+-1+">";
				inner2 += "읍/면/동";
				inner2 += "</option>";

				
				for (var i = 0; i < sigungu[thisVal].length; i++) {
					inner += "<option value=" + i + ">";
					inner += sigungu[thisVal][i];
					inner += "</option>";

				} 
				$('.select2 option').remove();
				$('.select2').append(inner);
				$('.select3 option').remove();
				$('.select3').append(inner2);
			}
		});
		
		
		
		
		$('.select2 option').each(function(){
			var selectVal1 = $('.select1').val();
			var thisVal = $(this).val();
			if(thisVal == select2){
				$(this).prop('selected', true);
				
				var inner3 = "";
				inner3 += "<option value="+-1+">";
				inner3 += "읍/면/동";
				inner3 += "</option>";
				
				if($('.select2').val() != -1){
				 for (var i = 0; i < donghap[selectVal1][thisVal].length; i++) {
					inner3 += "<option value=" + i + ">";
					inner3 += donghap[selectVal1][thisVal][i];
					inner3 += "</option>"
					} 
				}
				
				$('.select3 option').remove();
				$('.select3').append(inner3);
			}
			});
		
		$('.select3 option').each(function(){
			var thisVal = $(this).val();
			if(thisVal == select3){
				$(this).prop('selected', true)
			}
		})
		//======== ajax 정렬된 값 받아오기================================
			//처음 화면에서 desc 를 보여주기위해 display none 설정
		$('.buttonsort.asc').css('display', 'none');
		
		
		// select1 값 을 다시보내주는이유는 ajax 로 넘어올때 벨류와 주소를 보내주고 검색결과를 받아오기 위해서다
		$('.buttonsort').click(function () {
			var select1 = $('.select1').val();
			var select2 = $('.select2').val();
			var select3 = $('.select3').val();
			
			// order by 에 필요한값을 버튼에 value 에 넣어놨다. sort 에 담아준다.
			var sort = $(this).val();
			

			//현재 셀렉트 옵션에 담겨있는값도 보내준다 
		 	var sido = $('.select1 option:selected').text();
			var gu = $('.select2 option:selected').text();
			var dong = $('.select3 option:selected').text();
			
			//검색 조건에 맞춰 값을 보낸다.
			if(gu == "시/군/구"){
				gu = "";
			}
			if(dong == "읍/면/동"){
				dong = "";
			}
			
			//확인
			console.log("시도 값은 : " + sido + gu + dong);
			
			
			// 현재 눌린객체가 none 이라면  형제 객체의 disaply 를 none 으로 설정
				// 자기자신은 다시 블록으로 설정
			if ($(this).siblings().css('display') == 'none') {
				$(this).css('display', 'none');
				$(this).siblings().css('display', 'block');
			}
			
			
			
			// 값들을 ajax 로보내준다.
			//state 값이 null 이 아니면 list2로 값을 보내고 list2 값을 list1 에 prepend 해준다 
			$.ajax({
				type : "GET",
				url : "aptsearch_list.com",
				data : {
						"sort" : sort, "sel1" : sido, "sel2" : gu,
						"sel3" : dong, "state" : "ajax",
						"select1" : select1, "select2" : select2,
						"select3" : select3,
				},
				success : function(result){
					$('table:first').empty().prepend(result);
				},
				error : function(){
					alert("에러");
				}
			});
			return false;
		});
		
		//========================================================
		
			
			//list 화면에서 검색 할 시
			$('.listSearch').submit(function(){
				var select1 = $('.select1').val();
				var select2 = $('.select2').val();
				var select3 = $('.select3').val();
				
				//여기서도 search 에서 값 보내준것처럼 select 박스에 있는 값의 text 부분을 hidden 으로 보내준다.
				var sel1 = $('.select1 option:selected').text();
				var sel2 = $('.select2 option:selected').text();
				var sel3 = $('.select3 option:selected').text();
				
				/// 보낼 값들을 정리해주고
				if(sel2 == "시/군/구"){
					sel2 = "";
				}
				if(sel3 == "읍/면/동"){
					sel3 = "";
				}
				
				addr = sel1 + sel2 + sel3;
				
				map();
				//여기서 보낼값들도 아파트 검색한 네임span 에 넣어준다.
				$('.apart_name span').text(sel1+" "+ sel2+" "+sel3);
				
				//ajax 로보낼땐 주소값이 변경되지않기때문에 새로고침할시에 처음검색한 데이터로 이동한다.
				//그걸방지하기위해 history.pushState() 을 사용하여 ajax 로 보내지만 주소값 이 변경되게 만든다.
				var url = "http://localhost:8088/house/aptsearch_list.com?select1="+select1+"&select2="+select2+"&select3="+select3+"&sel1="+sel1+"&sel2="+sel2+"&sel3="+sel3
				history.pushState(null,null,url);
				$.ajax({
					type : "GET",
					url : "aptsearch_list.com",
					data : {
					"sel1" : sel1, "sel2" : sel2,
					"sel3" : sel3, "state" : "ajax",
					"select1" : select1, "select2" : select2,
					"select3" : select3,
			},
			success : function(result){
				$('table:first').empty().prepend(result);
			},
			error : function(){
				
				alert("에러");
			}
		});
				return false;
	})
		$('#listSearch').submit(function(){
		if($('#select1').val() == "-1"){
			alert('시/도 를 입력해주세요');
			return false;
		}
	})
})




		