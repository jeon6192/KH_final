<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta>
<title>Insert title here</title>
</head>
<link  href="http://fonts.googleapis.com/css?family=Cabin:400,500,600,bold" rel="stylesheet" type="text/css" >
<link  href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:regular,bold" rel="stylesheet" type="text/css" >
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script>
	function admin(){
		location.href="./admin_join.nhn";
	}
	function user(){
		location.href="./member_join.nhn";
	}
	
</script>
<style>

	

#pagegradient {
  margin:0 auto;  
  text-align:center;
  width: 200px;
  padding-top: 250px;
  
}

.button {
    display: block;
    width: 100%;
    margin: 0 auto;
    margin-top: 30px;
    -webkit-border-radius: 10px;
    
    -webkit-box-shadow: 
        0px 3px rgba(128,128,128,1), /* gradient effects */
        0px 4px rgba(118,118,118,1),
        0px 5px rgba(108,108,108,1),
        0px 6px rgba(98,98,98,1),
        0px 7px rgba(88,88,88,1),
        0px 8px rgba(78,78,78,1),
        0px 14px 6px -1px rgba(128,128,128,1); /* shadow */
    
    -webkit-transition: -webkit-box-shadow .1s ease-in-out;
} 

.button span {
    background-color: #E8E8E8;
    width: 100%;
    box-sizing: border-box;
    background-image: 
        /* gloss gradient */
        -webkit-gradient(
            linear, 
            left bottom, 
            left top, 
            color-stop(50%,rgba(255,255,255,0)), 
            color-stop(50%,rgba(255,255,255,0.3)), 
            color-stop(100%,rgba(255,255,255,0.2))),
        
        /* dark outside gradient */
        -webkit-gradient(
            linear, 
            left top, 
            right top, 
            color-stop(0%,rgba(210,210,210,0.3)), 
            color-stop(20%,rgba(210,210,210,0)), 
            color-stop(80%,rgba(210,210,210,0)), 
            color-stop(100%,rgba(210,210,210,0.3))),
        
        /* light inner gradient */
        -webkit-gradient(
            linear, 
            left top, 
            right top, 
            color-stop(0%,rgba(255,255,255,0)), 
            color-stop(20%,rgba(255,255,255,0.5)), 
            color-stop(80%,rgba(255,255,255,0.5)), 
            color-stop(100%,rgba(255,255,255,0))),        
        
        /* diagonal line pattern */
        -webkit-gradient(
            linear, 
            0% 100%, 
            100% 0%, 
            color-stop(0%,rgba(255,255,255,0)), 
            color-stop(40%,rgba(255,255,255,0)), 
            color-stop(40%,#D2D2D1), 
            color-stop(60%,#D2D2D1), 
            color-stop(60%,rgba(255,255,255,0)), 
            color-stop(100%,rgba(255,255,255,0)));
    
        -webkit-box-shadow:
            0px -1px #fff, /* top highlight */
            0px 1px 1px #FFFFFF; /* bottom edge */
    
    -webkit-background-size: 100%, 100%, 100%, 4px 4px;
    
    -webkit-border-radius: 10px;
    -webkit-transition: -webkit-transform .1s ease-in-out;
    
    display: inline-block;
    padding: 10px 40px 10px 40px;
    
    color: #3A474D;
    text-transform: uppercase;
    font-family: 'TradeGothicLTStd-BdCn20','PT Sans Narrow';
    font-weight: 700;
    font-size: 22px;
    
    text-shadow: 0px 1px #fff, 0px -1px #262F33;
}

        .button span:hover {
            color: #AEBF3B;
            text-shadow: 0px -1px #97A63A;
            cursor: pointer;
        }

        .button:active {
            -webkit-box-shadow: 
                0px 3px rgba(128,128,128,1),
                0px 4px rgba(118,118,118,1),
                0px 5px rgba(108,108,108,1),
                0px 6px rgba(98,98,98,1),
                0px 7px rgba(88,88,88,1),
                0px 8px rgba(78,78,78,1),
                0px 10px 2px 0px rgba(128,128,128,.6); /* shadow */
        }

        .button:active span{
            -webkit-transform: translate(0, 5px); /* depth of button press */
        }

    .button span:after {
        content: ">";
        display: block;
        width: 10px;
        height: 10px;
    
        position: absolute;
        right: 14px;
        top: 12px;    
        
        font-family: 'Cabin';
        font-weight: 700;
        color: #AEBF3B;
        text-shadow: 0px 1px #fff, 0px -1px #97A63A;
        font-size: 26px;
    }
    
</style>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class = "pagegradient" id="pagegradient" >
		<a class="button" onclick="admin()" id = "button1">
		        <span>기업/관리자</span>
		</a>
		
		<a class="button" onclick="user()" id = "button2">
		        <span>일반사용자</span>
		</a>
	</div>
<!-- <input type="button" value="기업/관리자" onclick="admin()">
<input type="button" value="일반사용자" onclick="user()"> -->

</body>
</html>