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
        $('.' + className + '>a>span').css('color', 'black');
    });

    // text
    $('.li.text.cpx>a').hover(function(){
        $(this).css({
            'color' : 'white'
        });
    }, function(){
        $(this).css({
            'color' : 'black'
        });
    });

    $('.li.text.apt>a').hover(function(){
        $(this).css({
            'color' : 'white'
        });
    }, function(){
        $(this).css({
            'color' : 'black'
        });
    });

    $('.ul.apt.text>li>a').hover(function(){
        $(this).css({
            'color' : 'white'
        });
    }, function(){
        $(this).css({
            'color' : 'black'
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
            'color' : 'black'
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
    var aTag = $('.left_menu>ul>li a:not(.li.icon.apt>a), .li.icon.apt>a');
    $(aTag).click(function(){
        $('.left_menu>ul>li a, .li.icon.apt>a').removeClass("active"); 

        $(this).addClass('active');
        let thisClass = $(this).closest('li').attr('class').substr(-3);
        console.log(thisClass);
        if (thisClass == 'cpx') {
            $('.li.text.cpx>a').addClass('active');
            $('.li.icon.cpx>a').addClass('active');
            $('.img_cpx').hide();
            $('.img_cpx2').show()
            $('.img_apart').show();
            $('.img_apart2').hide();
            ;
        } else {
            $('.img_cpx').show();
            $('.img_cpx2').hide();
            $('.img_apart').hide();
            $('.img_apart2').show();
        }
    });

    /*
    $('.ul.apt.icon>li>a').click(function(){
        console.log('??');
        $('.img_cpx').show();
        $('.img_cpx2').hide();
        $(this).addClass('active');
    });
    */

    var aTag2 = $('.div.bottom>a');
    $(aTag2).click(function(){
        $('.div.bottom>a').removeClass("active");
        $(this).addClass('active');
    });


    // Timer!
    var countDownDate = new Date("Sep 5, 2018 15:37:25").getTime();

    var x = setInterval(function() {

        var now = new Date().getTime();
        
        var distance = countDownDate - now;
        
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
        $('.span.timer').text(days + "일 " + hours + "시간 "
        + minutes + "분 " + seconds + "초 ");

        if (distance < 100000000) {
            $('.span.timer').css('color', 'red');
        }
        if (distance < 0) {
            clearInterval(x);
            $('.span.timer-name').text('');
            $('.span.timer').html('<b>분양신청 종료</b>');
            $('.button-4').hide();
        }
    }, 1000);

    $('.navbar-toggle.collapsed').click(function(){

    });
    
    
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
        type : "GET",
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

// 분양신청
function sellInLots(){
    let cpx_id = $('#cpx_id').val();
    location.href = './insertEvent.ev?complex_id=' + cpx_id;
}
