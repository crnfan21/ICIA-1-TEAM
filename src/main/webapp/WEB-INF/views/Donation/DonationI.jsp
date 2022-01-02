<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
   data-offset="300">
   <%@ include file="/WEB-INF/views/include/navigation.jsp"%>
   <br>
   <br>
   <br>
   <header>
      <div id="carouselExampleIndicators" class="carousel slide"
         data-ride="carousel">
         <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0"
               class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
         </ol>
         <div class="carousel-inner" role="listbox">
            <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active"
               style="background-image: url('/resources/images/7777.png')">
               <div class="carousel-caption d-none d-md-block">
                  <h3 id="fontt">DDORRI'S HOUSE</h3>
                  <p>We are family.</p>
               </div>
            </div>
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item"
               style="background-image: url('/resources/images/777.png')">
               <div class="carousel-caption d-none d-md-block">
                  <h3 id="fontt">DDORRI'S HOUSE</h3>
                  <p>We are family.</p>
               </div>
            </div>
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item"
               style="background-image: url('/resources/images/77777.png')">
               <div class="carousel-caption d-none d-md-block">
                  <h3 id="fontt">DDORRI'S HOUSE</h3>
                  <p>We are family.</p>
               </div>
            </div>
         </div>
         <a class="carousel-control-prev" href="#carouselExampleIndicators"
            role="button" data-slide="prev"> <span
            class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="sr-only">Previous</span>
         </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
            role="button" data-slide="next"> <span
            class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="sr-only">Next</span>
         </a>
      </div>
   </header>

   <br>
   <br>
   <br>
   <div class="container">

      <div class="container">
         <div class="row">
            <div class="col"></div>
            <div class="col">
               <span id="Innt"><b>DDORI'S </b></span><span id="Int">후원안내</span>
            </div>
            <div class="col"></div>
         </div>

         <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>

      </div>

      <br> <br> <br>

      <p class="text-center" id="text">
         <b>여러분의 소중한 후원금은 도움이 꼭 필요한 또리들을 위해 투명하고 정직하게 사용됩니다.</b>
      </p>

      <br> <br> <br> <br> <br> <br>
      <section class="ftco-section ftco-services-2 ftco-no-pt">
         <div class="container-fluid px-0 bg-light">
            <div class="container">
               <div class="row tour py-5">
                  <div class="col-md d-flex align-self-stretch ftco-animate">
                     <div class="media block-6 services text-center d-block">
                        <div
                           class="icon justify-content-center align-items-center d-flex">
                           <span class="flaticon-alarm-clock"></span>
                        </div>
                        <div class="media-body">
                           <h3 class="heading mb-3">24hours</h3>
                        </div>
                     </div>
                  </div>
                  <div class="col-md d-flex align-self-stretch ftco-animate">
                     <div class="media block-6 services text-center d-block">
                        <div
                           class="icon justify-content-center align-items-center d-flex">
                           <span class="flaticon-manager"></span>
                        </div>
                        <div class="media-body">
                           <h3 class="heading mb-3">Age 20+</h3>
                        </div>
                     </div>
                  </div>
                  <div class="col-md d-flex align-self-stretch ftco-animate">
                     <div class="media block-6 services text-center d-block">
                        <div
                           class="icon justify-content-center align-items-center d-flex">
                           <span class="flaticon-calendar"></span>
                        </div>
                        <div class="media-body">
                           <h3 class="heading mb-3">All Days</h3>
                        </div>
                     </div>
                  </div>
                  <div class="col-md d-flex align-self-stretch ftco-animate">
                     <div class="media block-6 services text-center d-block">
                        <div
                           class="icon justify-content-center align-items-center d-flex">
                           <span class="flaticon-wallet"></span>
                        </div>
                        <div class="media-body">
                           <h3 class="heading mb-3">
                              <span>clean</span>
                           </h3>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <p class="text-center">
         저희 또리의 집에 후원해주신 후원금은 재단의 나눔사업을 지원합니다.<br> 후원금 사용의 투명성을 위해 매년
         재무정보의 공시 외에 기부된 명단과 사용처를 공개합니다.
      </p>

      <br> <br> <br>

      <hr class="my-5">
      <p>
      <h3>기업후원</h3>
      </p>
      <ul id="nav4" class="nav justify-content-between bg-light">
         <li class="nav-item" id="ma"><a class="nav-link active" href="#">일반후원</a>
         </li>

         <li class="nav-item"><a class="nav-link disabled" href="#">재단의
               목적사업 전개를 위한 일반후원이 있습니다. <br> 기부해주신 기업은 홈페이지와 사업 홍보 매체를 통해 재단의
               파트너즈로 소개됩니다.
         </a>
            <ul>
               <li id="main">재단 목적사업 후원</li>
               <li id="main">협찬을 통한 특정사업 참여</li>
               <li id="main">특정 사업 후원과 협찬</li>
            </ul> <br>
            <ul>

               <li id="sub">후원을 계획하는 기업은 사무국의 자세한 안내를 받으실 수 있습니다.</li>
            </ul></li>


      </ul>

      <hr class="my-5">
      <p>
      <h3>개인후원</h3>
      </p>
      <ul id="nav4" class="nav justify-content-between bg-light">
         <li class="nav-item" id="ma"><a class="nav-link active" href="#">일반후원</a>
         </li>

         <li class="nav-item"><a class="nav-link disabled" href="#">비정기적으로
               후원금액을 기부하시는 분<br> 또리네 통장으로 기부해주신 금액들은 홈페이지와 매체를 통해 투명하게 공개됩니다.
         </a>
            <ul>
               <li id="main">또리하우스의 계좌로 무통장입금</li>
               <li id="main">상담사와의 연결을 통해 후원</li>
            </ul> <br>
            <ul>

               <li id="sub">농협 352-0822-5428-33 채민희</li>
            </ul></li>


      </ul>
      <br>
      <ul id="nav4" class="nav justify-content-between bg-light">
         <li class="nav-item" id="ma"><a class="nav-link active" href="#">구매후원</a>
         </li>

         <li class="nav-item"><a class="nav-link disabled" href="#">또리's
               메이드를 통해 후원금액을 기부하시는 분<br> 또리네 통장으로 기부해주신 금액들은 홈페이지와 매체를 통해
               투명하게 공개됩니다.
         </a>
            <ul>
               <li id="main">또리's 메이드 구매</li>
               <li id="main">또리들을 위해 만든 굳즈 기부</li>
            </ul> <br>
            <ul>

               <li id="sub">또리들을 위해 만들어주신 물건은 상담사와의 상담을 통해 문의주세요</li>
            </ul></li>

      </ul>

      <br><br><br>

      <div id="divv">
         <span id="divs"><b>간편 후원안내</b> </span> <span id="divss">사랑과 관심이 또리들의 미래를 밝힙니다.</span><br>

         <div class="row">
            <div class="col">032-876-3332</div>

            

      </div>
   </div>



   <div id="remoCo">
      <a id="popup_open_btn" href="/Donation/Dmade"><img
         src="/resources/images/07.png" id="sss"></a>
   </div>
   <span id="remoCo"></span>

   <br>
   <br>
   <br>



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
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
   <script src="/resources/js/google-map.js"></script>

   <script src="/resources/js/main.js"></script>
   <script src="/resources/vendor/jquery/jquery.min.js"></script>
   <script src="/resources/endor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>