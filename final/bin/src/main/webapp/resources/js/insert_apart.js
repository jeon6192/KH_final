$(document).ready(function() {
	
	// 역세권
	$('.div_subway_bottom').css({
		'pointer-events' : 'none'
	});
	/*
	$('.chk_subway').change(function(){
		$('.div_subway_bottom').css('pointer-events', 'unset').toggle();
		$('.div_subway_mask').css('display', 'none !important').toggle();
		
		if ($('.chk_subway').prop('checked') == false) {
			$('.div_subway_bottom').css('pointer-events', 'none');
			$('.div_subway_mask').css('display', 'inline-block');
		} else {
			console.log('바발바');
			$('.div_subway_bottom').css('pointer-events', 'unset');
			$('.div_subway_mask').css('display', 'none !important');
		}
		
	});
	*/
	
	// 지하철역 검색
    $(".input_subway").autocomplete({
        source: function(request, response){
        	var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
        	$.ajax({
				url : './resources/json/subway.json',
				dataType : "json",
				data : request.term,
				success : function(data) {
					response($.map(data.DATA, function(v,i){
	                    var text = v.station_nm;
	                    if ( text && ( !request.term || matcher.test(text) ) ) {
	                        return {
	                                label: v.station_nm,
	                                value: v.station_nm
	                        };
	                    }
					}));
				}
			});
        },
        messages: {
            noResults: '',
            results: function() {}
        },
        select: function(event, ui) {
            console.log(ui.item);
        },
        focus: function(event, ui) {
            return false;
        }

    });
	
	
	// 아파트 세부사항
    $('.btn_cpx_count').click(function(){
    	var front = $('.select_cpx_count').val();
    	var back = $('.input_cpx_count').val();
    	
    	if (back > 20) {
    		alert('20동 이하까지만 가능');
    		$('.input_cpx_count').val('').focus();
    		return false;
		}
		
		$('.li_info2').show();
		$('.li_info2').animate({opacity: '1'}, 550);
    	
    	$('.div_detail_left').css('background-color', '#d8d8d8');
    	$('.div_apart_info_detail').css('border', '1px solid #dfdfdf');
    	
    	var apart = [];
    	var left = '';
		var right = '';
		var right_script = '<script>';
    	
    	for (let i = 1; i <= back; i++) {
    		if (i < 10) {
    			apart[i] = front + '0' + i;
    		} else {
    			apart[i] = front + i;
    		}
    		
    		left += '<div class="div_apart_dong" id="detail_left'+i+'" onclick="select_apart('+i+')">'+apart[i]+
    			'<input type="hidden" name="apartBeanList['+(i-1)+'].apart_dong" value="'+apart[i]+'"></div>';
    		
    		right += '<div class="div_dong_detail" id="detail_right'+i+'">'
    			+'<ul class="ul_dong_detail">'
    			+'<li class="li_dong_detail0">'+apart[i]+'동</li>'
    			+'<li class="li_dong_detail1"><div class="div_dong_detail1">층수&nbsp;<input type="text" name="apartBeanList['+(i-1)+'].apart_floor" placeholder="층" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"> </div></li>'
    			+'<li class="li_dong_detail2"><div class="div_dong_detail2">면적&nbsp;<input type="text" name="apartBeanList['+(i-1)+'].apart_area" placeholder="m²" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"> </div></li>'
    			+'<li class="li_dong_detail3"><div class="div_dong_detail3">방 개수&nbsp;<input type="text" name="apartBeanList['+(i-1)+'].apart_room" placeholder="개" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"> </div></li>'
    			+'<li class="li_dong_detail4"><div class="div_dong_detail4">화장실&nbsp;<input type="text" name="apartBeanList['+(i-1)+'].apart_toilet" placeholder="개" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"> </div></li>'
    			+'<li class="li_dong_detail5"><div class="div_dong_detail5">가격&nbsp;<input type="text" name="apartBeanList['+(i-1)+'].apart_price" placeholder="만원" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"> </div></li>'
    			+'</ul><div class="div_dong_detail_img">' 
    			+'<input type="hidden" role="uploadcare-uploader" id="image'+apart[i]+'" data-images-only="true" data-multiple="true" onclick="insert_img('+apart[i]+')" />' 
    			+'<div id="showImage'+apart[i]+'" class="showImg"></div>' 
    			+'<input type="hidden" id="img_hidden'+apart[i]+'" name="apartBeanList['+(i-1)+'].apart_interior" value="">'
				+'</div></div>';
				
			right_script += 'uploadcare.MultipleWidget("[id=image'+apart[i]+']").onUploadComplete(function(info){'
							+ 'insert_img(info, '+apart[i]+'); });';
		}
		
		right_script += '</script>';

    	$('.div_detail_left').empty().append(left);
		$('.div_detail_right').empty().append(right).append(right_script);
		
		$('.div_dong_detail_img').css({
			'width' : '58%', 
			'height' : '100%'
		});
    	$('.div_apart_dong').css({
			'height' : '20px',
			'cursor' : 'pointer'
    	});
    	$('.ul_dong_detail').css({
    		'box-sizing' : 'border-box',
    		'padding' : '3px',
    		'width' : '40%',
			'height' : '100%',
			'display' : 'inline-block'
		});
		$('.uploadcare--widget__dragndrop-area').css('display', 'none');
    	$('.ul_dong_detail>li').css({
    		'box-sizing' : 'border-box',
    		'height' : '16.666%',
    		'width' : '100%',
    		'padding-top' : '5px'
    	});
    	$('.li_dong_detail0').css({
    		'font-size' : '12pt'
    	});
    	$('.ul_dong_detail>li>div').css({
    		'height' : '100%',
    		'width' : '100%',
    		'padding-right' : '80px'
    	});
    	$('.ul_dong_detail li input').css({
    		'width' : '40%',
    		'float' : 'right'
		});
		$('.uploadcare--widget.uploadcare--widget_status_ready').css({
			'height' : '15%',
			'padding-top' : '0.5em'
		});
		$('.div_dong_detail_img>.showImg').css('height', '85%');
		$('canvas.uploadcare--progress__canvas').css({
			'width' : '15%',
			'margin' : '0 auto'
		});
    	
    	
    	$('.div_dong_detail').css({
    		'position' : 'absolute',
    		'left' : '0',
    		'display' : 'none'
    	});
    	$('#detail_right1').css('display', 'block');
    	$('#detail_left1').css({
			'background-color' : 'black', 
			'color' : 'white'
		});
    	
    	
	});
	

	// datepicker
	$('#date').bootstrapMaterialDatePicker({
		time: false,
		clearButton: true,
		minDate : new Date()
	});

	// 지하철 체크
	$('.chk_subway').change(function(){
		if($('.chk_subway').prop('checked') == false) {
			$('input.input_subway.ui-autocomplete-input, input.input_foot').val('');
			$('.div_subway_bottom>input').prop('disabled', 'disabled');
			$('.div_subway_bottom').css('pointer-events', 'none');
			$('.div_subway_mask').show();
		}else{
			$('.div_subway_bottom>input').prop('disabled', false);
			$('.div_subway_bottom').css('pointer-events', 'unset');
			$('.div_subway_mask').hide();
		}
	});



	// Daum Map 
	var container = document.getElementById('div_map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(37.57011423284105, 126.98877100169027), //지도의 중심좌표.
		level: 5 //지도의 레벨(확대, 축소 정도)
	};


	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

	var marker = new daum.maps.Marker({ 
	});

	daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
		// 클릭한 위도, 경도 정보를 가져옵니다 
		var latlng = mouseEvent.latLng; 
		
		// 마커 위치를 클릭한 위치로 옮깁니다
		marker.setPosition(latlng);

		marker.setMap(map);

		var latlng = mouseEvent.latLng;
		console.log('lat : '+latlng.getLat());
		console.log('lng : '+latlng.getLng());

		$('#complex_lat').val(latlng.getLat());
		$('#complex_lng').val(latlng.getLng());

		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			console.log(result[0].address.address_name);
			$('#complex_address').val(result[0].address.address_name);
		});


	});


	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}


	

});	// document.ready




// 유효성 검사 . SUBMIT
function insert(){
	if($('#complex_address').val() == ''){
		alert('insert address!');
		return false;
	}
	if($('.input_cpx_apartname').val() == ''){
		alert('insert aptname!');
		$('.input_cpx_apartname').focus();
		return false;
	}

	if(typeof $('.div_dong_detail').val() === 'undefined'){
		alert('add!');
		return false;
	}

	var count = 0;
	$('.ul_dong_detail li>div>input').each(function(){	
		count++;
		if ($(this).val() == ''){
			alert(($(this).attr('name').split('[')[1].split(']')[0]*1+1) +'동 세부사항 미입력!');
			$(this).focus();
			return false;
		}
	});

	if(count != $('.ul_dong_detail li>div>input').length){
		return false;
	}

	
	//return ture;
}


// Image API
UPLOADCARE_LOCALE = "ko";
UPLOADCARE_TABS = "file url";
UPLOADCARE_PUBLIC_KEY = "c45d0fc9bcc9538a677e";
UPLOADCARE_LOCALE_TRANSLATIONS = {
	buttons: {
		cancel: 'Cancel',
		remove: 'Remove',
		choose: {
			images: {
			one: '파일 첨부',
			other: '파일 첨부'
			}
		}
	}
};

function insert_img(info, id) {
	var url=[];
	console.log(info.cdnUrl);
	
	var showImage = '#showImage' + id;
	var img_hidden = '#img_hidden' + id;
	console.log(showImage + '  ' + img_hidden);
	
	$('#showImage'+id).empty();
	$('#img_hidden'+id).attr('value', '');
	var length=info.cdnUrl.charAt(info.cdnUrl.length-2);
	
	for(var i=0;i<length;i++){
		url[i]=info.cdnUrl+"nth/"+i+"/";
		$('#showImage'+id).append('<img src="'+url[i]+'-/resize/x100/"/>');
		var val=$('#img_hidden'+id).attr('value');
		url[i] += " ";
		$('#img_hidden'+id).attr('value', val+url[i]);
	}
	
}

//////


function select_apart(num) {
	$('.div_apart_dong').css({
		'background-color': 'transparent', 
		'color': 'black'
	});
	$('.div_dong_detail').css('display', 'none');
	
	var id1 = '#detail_left' + num;
	var id2 = '#detail_right' + num;
	$(id1).css({
		'background-color' : 'black', 
		'color' : 'white'
	});
	$(id2).css('display', 'block');
}

function onlyNumber(e){
	e = e || window.e;
	var keyID = (e.which) ? e.which : e.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}

function removeChar(e) {
	e = e || window.e;
	var keyID = (e.which) ? e.which : e.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		e.target.value = e.target.value.replace(/[^0-9]/g, "");
}

// wordCounting
function chkword(obj, maxByte) {
   var strValue = obj.value;
   var strLen = strValue.length;
   var totalByte = 0;
   var len = 0;
   var oneChar = "";
   var str2 = "";

   for (var i = 0; i < strLen; i++) {
       oneChar = strValue.charAt(i);
       if (escape(oneChar).length > 4) {
           totalByte += 3;
       } else {
           totalByte++;
       }
       $('#counter').html(totalByte + '/1000');
       // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
       if (totalByte <= maxByte) {
           len = i + 1;
       }
   }

   // 넘어가는 글자는 자른다.
   if (totalByte > maxByte) {
       alert(maxByte + "자를 초과 입력 할 수 없습니다.");
       str2 = strValue.substr(0, len);
       obj.value = str2;
       chkword(obj, 4000);
   }
}



