<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
    
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    />
    
    <link rel="stylesheet" href="/resources/css/DMcss/main.css" />
    <link rel="stylesheet" href="/resources/css/DMcss/qna.css" />
    <link rel="stylesheet" href="/resources/css/DMcss/animation.css" />
    <link rel="stylesheet" href="/resources/css/DMcss/result.css" />
    
<script type="text/javascript">
$(document).ready(function(){
	$("#btnSearch").on("click", function(){
		document.dogForm.curPage.value = 1;
		document.dogForm.action = "/adopt/dogList";
		document.dogForm.submit();
	});
});
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

 <section class="hero-wrap hero-wrap-2" style="background-image: url('/resources/images/0.PNG');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-4">
            <h1 class="mb-3 bread">We Are Family</h1>
             <p class="breadcrumbs"><span class="mr-2"><a href="/index">Home&nbsp;<i class="ion-ios-arrow-forward"></i></a></span><span class="mr-2"><a href="/adopt/dogList">Adopt&nbsp;<i class="ion-ios-arrow-forward"></i></a></span><span>또리매칭</span></p>
          </div>
        </div>
      </div>
    </section>
    
<section class="ftco-section">
	<div class="container">
		<div class="row">
			    <div class="container">
      <section id="main" class="mx-auto my-5 py-5 px-3" style="background:#ffc0cb;">
        <h1 class="font2"><b>MBTI로 알아보는 나에게 맞는 또리는?</b></h1>
        <div class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto">
          <img src="/resources/images/DMimg/main.png" alt="mainImage" class="img-fluid" />
        </div>
        <p>
        <h3 class="font3">
          나에게 맞는 또리가 궁금하다면? <br />
          아래 시작하기 버튼을 눌러 알아볼까요?
         </h3>
        </p>
        <button
          type="button"
          class="btn btn-primary font3"
          onclick="js:begin()"
          style="background:#ff9999;"
        >
          시&nbsp;작&nbsp;하&nbsp;기
        </button>
      </section>
      
      <section id="qna">
        <div class="status mx-auto mt-5">
          <div class="statusBar"></div>
        </div>
        <div class="qBox my-5 py-3 mx-auto font2" style="background:#ffc0cb; color:white;"></div>
        <div class="answerBox font3"></div>
      </section>
      <section id="result" class="mx-auto my-5 py-5 px-3" style="background:#ffc0cb;">
        <h1 class="font2"><b>당신의 결과는?!</b></h1>
        <div class="resultName" style="color:black;"></div>
        <div class="resultSpe font5" style="color:black;"></div>
        <div
          id="resultImg"
          class="my-3 col-lg-6 col-md-8 col-sm-10 col-12 mx-auto"
        ></div>
        <br/>
        <div class="resultDesc font3" style="color:white;"></div>
        <br/>
        <button
          type="button"
          class="btn btn-primary font3"
          id="btnSearch"
          style="background:#ff9999;"
        >
          보&nbsp;러&nbsp;가&nbsp;기&nbsp;→
        </button>
      </section>
    </div>
		</div>
	</div>
</section>
    
    
   	<!-- footer section start -->
    <footer class="ftco-footer ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-3">
              <img src="/resources/images/111.png">
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Online Enquiry</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>General Enquiry</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Booking</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Privacy</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Refund Policy</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Call Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Experience</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Adventure</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Hotel and Restaurant</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Beach</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Nature</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Camping</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Party</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            
          </div>
        </div>
      </div>
    </footer>
    <!-- footer section end --> 
    
   <form name="dogForm" id="dogForm" method="post">
      <input type="hidden" name="dogSeq" value="" />
      <input type="hidden" name="searchType" value="2" />
      <input type="hidden" name="searchValue" id="searchValue" value="" />
      <input type="hidden" name="curPage" value="" />
   </form>
    
    
  <!-- loader -->
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
  
  <script src="/resources/js/DMjs/data.js" charset="utf-8"></script>
  <script src="/resources/js/DMjs/start.js" charset="utf-8"></script>
    
</body>
</html>