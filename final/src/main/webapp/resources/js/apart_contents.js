$(document).ready(function(){
    var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

    if (isMobile) {
        console.log('Mobile!');
    } else {
        console.log('Not Mobile!');
    }
    const text = $('.left_menu.text');
    const icon = $('.left_menu.icon');


    $('.ul.apart_detail>li').hover(function(){
        var className = $(this).attr('class');
        $('.' + className + '>a>span').css('color', 'white');
    }, function(){
        var className = $(this).attr('class');
        $('.' + className + '>a>span').css('color', '#ababab');
    });

    // text
    $('.li.text.cpx>a').hover(function(){
        $(this).css({
            'color' : 'white'
        });
    }, function(){
        $(this).css({
            'color' : '#ababab'
        });
    });

    $('.li.text.apt>a').hover(function(){
        $(this).css({
            'color' : 'white'
        });
    }, function(){
        $(this).css({
            'color' : '#ababab'
        });
    });

    $('.ul.apt.text>li>a').hover(function(){
        $(this).css({
            'color' : 'white'
        });
    }, function(){
        $(this).css({
            'color' : '#ababab'
        });
    });

    $('.li.text.cpx').click(function(){
        $('.ul.apt.text').hide();
    });
    $('.li.text.apt>a').click(function(){
        $('.ul.apt.text').toggle('show');
    });





    // icon
    $('.li.icon.cpx>a').hover(function(){
        $('img.img_cpx').attr('src','./resources/image/apt_complex.png');
    }, function(){
        $('img.img_cpx').attr('src','./resources/image/apt_complex_s.png');
    });

    $('.li.icon.apt>a').hover(function(){
        $('img.img_apart').attr('src','./resources/image/apart.png');
    }, function(){
        $('img.img_apart').attr('src','./resources/image/apart_s.png');
    });

    $('.ul.apt.icon>li>a').hover(function(){
        $(this).css({
            'color' : 'white'
        });
    }, function(){
        $(this).css({
            'color' : '#ababab'
        });
    });

    const aptLength = $('.ul.apt.icon>li').length;
    for (let i = 0; i < aptLength; i++) {
        $('.ul.apt.icon>li').eq(i).css({
            'animation-name' : 'menu-2', 
            'animation-duration': '300ms',
            'animation-delay': i * 150 + 'ms',
            'animation-fill-mode': 'forwards',
            'animation-timing-function': 'ease-in-out'
        });
    }





    // 클릭시 active
    var aTag = $('.left_menu>div>ul>li>a');
    $(aTag).click(function(){
        $('.left_menu>div>ul>li>a').removeClass("active"); 

        let thisClass = $(this).parent().attr('class').substr(-3);
        if (thisClass == 'cpx') {
            $('.li.text.cpx>a').addClass('active');
            $('.li.icon.cpx>a').addClass('active');
            $('.img_apart').show();
            $('.img_apart2').hide();
            $('.img_cpx').hide();
            $('.img_cpx2').show();
        } else {
            $('.li.text.apt>a').addClass('active');
            $('.li.icon.apt>a').addClass('active');
            $('.img_cpx').show();
            $('.img_cpx2').hide();
            $('.img_apart').hide();
            $('.img_apart2').show();
        }
    });


    ///// map
    var cpxLat = $('#cpx_lat').val();
    var cpxLng = $('#cpx_lng').val();

	var container = document.getElementById('cpx_map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(cpxLat, cpxLng), //지도의 중심좌표.
		level: 5 //지도의 레벨(확대, 축소 정도)
	};

    var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
    
    var markerPosition  = new daum.maps.LatLng(cpxLat, cpxLng); 

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);


    


    
}); // document.ready ///////////


function showCpx(){
    $('.detail.cpx').show();
    $('.detail.apt').hide();
}
function showApt(dong) {
    $('.detail.cpx').hide();
    $('.detail.apt').show();

    let cpx_id = $('#cpx_id').val();

    $.ajax({
        type : "POST",
        data : {"dong" : dong, "complex_id" : cpx_id},
        url : "./apart_dongdetail.com",
        success: function(data){
            $('.detail.apt').empty().append(data);
           
        },
        error: function() {
            alert("error");
        }
    });

}
