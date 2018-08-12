$(document).ready(function () {
    // 현재 페이지 URL 주소 얻어오기
    let nowURL = $(location).attr('pathname');
    console.log(nowURL);

    
    if (nowURL == '/house/main.com' || nowURL == '/house/') {
        clearInterval(scrollE);
    }

    
    $(window).scroll(function (event) {
        didScroll = true;
    });

    $(window).resize(function(){
        if ($(window).height() >= $(document).height()) {
            $('#myTopnav').removeClass('nav-up').addClass('nav-down');
        }
    });

});

var lastScrollTop = 0;
var delta = 5; // 동작의 구현이 시작되는 위치 
var navbarHeight = $('#myTopnav').outerHeight(); // 영향을 받을 요소를 선택


var didScroll; // 스크롤시에 사용자가 스크롤했다는 것을 알림 



// hasScrolled()를 실행하고 didScroll 상태를 재설정 
var scrollE = setInterval(function () {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
    var st = $(this).scrollTop(); // 설정한 delta 값보다 더 스크롤되었는지를 확인한다. 
    if (Math.abs(lastScrollTop -  st) <= delta) {
        return; 
    } 
    // 헤더의 높이보다 더 스크롤되었는지 확인하고 스크롤의 방향이 위인지 아래인지를 확인한다. 
    // If current position > last position AND scrolled past navbar... 
    if (st > lastScrollTop && st > navbarHeight) {
        // Scroll Down 
        $('#myTopnav').removeClass('nav-down').addClass('nav-up');
    } else {
        // Scroll Up 
        // If did not scroll past the document (possible on mac)... 
        if (st + $(window).height() < $(document).height()) {
            $('#myTopnav').removeClass('nav-up').addClass('nav-down');
        }
    }
    // lastScrollTop 에 현재 스크롤위치를 지정한다. 
    lastScrollTop = st;

}
