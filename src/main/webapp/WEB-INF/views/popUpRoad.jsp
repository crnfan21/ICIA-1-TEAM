<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function popUpExit()
        {
            
            if($("input[name=checkPop]").is(":checked") == true)
            {
               setCookie("close", "Yes", 1);
            }else
            {
                //쿠키 삭제 이 메소드도 아래에 정의되어 있음. 내가 정의한 메소드를 사용한 것.
                deleteCookie();
            }
        }
   
        //오늘 하루 열지 않기라는 a태그를 눌렀을 때 쿠키 생성 후 팝업창 닫기.
        function popUpExit2()
        {
            setCookie("close", "Yes", 1);
            $("#popUp").hide();
            window.close();
        }

        //창닫기 누르면 쿠키는 생성하지 않고 창을 종료
        function hidePop()
        {
            $("#popUp").hide();
            window.close();
        }

        //쿠키 삭제 메서드, 사실상 삭제가 아니라 만료시켜버림. 
        function deleteCookie()
        {
            document.cookie = "close" + '=Yes; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
        }

        function setCookie(name, value, timeEnd)
        {
           
            var Cdate = new Date();
            Cdate.setTime(Cdate.getTime() + (timeEnd*24*60*60*1000));
            var expiresDay= "expires="+Cdate.toUTCString();
            var tmp = name + "=" + value + "; path=/;"+expiresDay;
            document.cookie = tmp;
        
        }
    </script>
</head>
<body>
    <div name="popUp" id="popUp">
        <img src="/resources/images/oneday.png" alt="이미지" width="480" height="450">
        <br />
        <a href="javascript:void(0)" onclick="popUpExit2()">오늘 하루 열지않기</a>
        <input type="checkbox" name="checkPop" id="checkPop" onclick="popUpExit()">
        <a href="javascript:void(0)" onclick="hidePop()">창 닫기</a>
    </div>
    
    
    
    
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/jquery.waypoints.min.js"></script>
<script src="/resources/js/jquery.stellar.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/aos.js"></script>
<script src="/resources/js/jquery.animateNumber.min.js"></script>
<script src="/resources/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/js/google-map.js"></script>

<script src="/resources/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>