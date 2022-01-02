<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  구글 지도 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCGoVu-FdMS74UNCTZny_QPA5MxNCU3A3E" ></script>
<!--  구글 지도 끝 -->
<style> #map_ma {width:100%; height:400px; clear:both; border:solid 1px red;} </style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
 
 <section class="hero-wrap hero-wrap-2" style="background-image: url('/resources/images/0.PNG');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-4">
            <h1 class="mb-3 bread font-1">We Are Family</h1>
             <p class="breadcrumbs"><span class="mr-2"><a href="/index">Home&nbsp;<i class="ion-ios-arrow-forward"></i></a></span><span class="mr-2"><a href="/contact2/contact2">Contact&nbsp;<i class="ion-ios-arrow-forward"></i></a></span><span>DDORI'S HOUSE 위치/문의</span></p>
          </div>
        </div>
      </div>
    </section>
<!--  지도 -->
<hr>
      <div class="container">
      	<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">DDORI'S HOUSE</span>
            <h2 class="mb-4">DDORI'S HOUSE 위치</h2>
            <p>인천광역시 남구 학익동 663-1번지 5층</p>
<hr>
<div id="map_ma"></div> 
<script type="text/javascript"> 
$(document).ready(function() 
		{
			var myLatlng = new google.maps.LatLng(37.438977,126.675090); // 위치값 위도 경도 
			var Y_point = 37.438977; // Y 좌표 
			var X_point = 126.675090; // X 좌표
			var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼 
			var markerTitle = "대구광역시"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보 
			var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기 // 말풍선 내용 
			var contentString = '<div>' + '<h2>DDORIS HOUSE</h2>'+ '<p>유기견 보호소</p>' + '</div>'; 
			var myLatlng = new google.maps.LatLng(Y_point, X_point); 
			var mapOptions = { zoom: zoomLevel, center: myLatlng, mapTypeId: google.maps.MapTypeId.ROADMAP } 
			var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions); 
			var marker = new google.maps.Marker({ position: myLatlng, map: map, title: markerTitle }); 
			var infowindow = new google.maps.InfoWindow( { content: contentString, maxWizzzdth: markerMaxWidth } ); 
				google.maps.event.addListener(marker, 'click', function() 
				{ 
					infowindow.open(map, marker); 
				}); 
		}); 
</script>
</div>
</div>
</div>
<!--  -->
<hr>
<section class="ftco-section contact-section ftco-no-pb" id="contact-section">
      <div class="container">
      	<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">Contact</span>
            <h2 class="mb-4">Contact us</h2>
            <p>문의사항은 아래의 연락처를 통해서 해주시면 감사하겠습니다.</p>
          </div>
        </div>

        <div class="row block-9">
          <div class="col-md-7 order-md-last d-flex">
            <form action="#" class="bg-light p-4 p-md-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Name">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Email">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject">
              </div>
              <div class="form-group">
                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>

          <div class="col-md-5 d-flex">
          	<div class="row d-flex contact-info mb-5">
		          <div class="col-md-12 ftco-animate">
		          	<div class="box p-2 px-3 bg-light d-flex">
		          		<div class="icon mr-3">
		          			<span class="icon-map-signs"></span>
		          		</div>
		          		<div>
			          		<h3 class="mb-3">Address</h3>
				            <p>인천광역시미추홀구 학익동 663-1 태승빌딩 5층 DDORI'S HOUSE</p>
			            </div>
			          </div>
		          </div>
		          <div class="col-md-12 ftco-animate">
		          	<div class="box p-2 px-3 bg-light d-flex">
		          		<div class="icon mr-3">
		          			<span class="icon-phone2"></span>
		          		</div>
		          		<div>
			          		<h3 class="mb-3">Contact Number</h3>
				            <p><a href="tel://1234567920">+ 0507-1491-3360</a></p>
			            </div>
			          </div>
		          </div>
		          <div class="col-md-12 ftco-animate">
		          	<div class="box p-2 px-3 bg-light d-flex">
		          		<div class="icon mr-3">
		          			<span class="icon-paper-plane"></span>
		          		</div>
		          		<div>
			          		<h3 class="mb-3">Email Address</h3>
				            <p><a href="mailto:info@yoursite.com">ddoriya@icia.co.kr</a></p>
			            </div>
			          </div>
		          </div>
		          <div class="col-md-12 ftco-animate">
		          	<div class="box p-2 px-3 bg-light d-flex">
		          		<div class="icon mr-3">
		          			<span class="icon-globe"></span>
		          		</div>
		          		<div>
			          		<h3 class="mb-3">Open kkaotalk</h3>
				            <p><a href="#">//ddorisite.com</a></p>
			            </div>
			          </div>
		          </div>
		        </div>
          </div>
        </div>
      </div>
    </section>
    <hr>
    <!--  footer -->
    <div class="container">
      	<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">DDORI'S HOUSE</span>
            <p>주소: 인천광역시 남구 학익동 663-1번지 5층</p>
            <p>대표: 오재욱</p>
            <p>대표번호: 032-000-0000</p>
            <p>동물판매등록 번호: 3230000-037-2017-0002</p>
       </div>
           </div>
           </div>
    <!--  끝 -->
<!--  -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
</body>
</html>