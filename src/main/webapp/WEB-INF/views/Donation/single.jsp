<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript">
$(document).ready(function() {

   $("#btnOrder").on("click", function() {
      document.bbsForm.action="/Donation/orderForm";
      document.bbsForm.submit();
   });
   
});
</script>

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
   data-offset="300">
   <c:if test="${!empty donation}">
      <%@ include file="/WEB-INF/views/include/navigation.jsp"%>

      <section class="hero-wrap hero-wrap-2"
         data-stellar-background-ratio="0.5">
         <div class="overlay"></div>
         <div class="container">
            <div
               class="row no-gutters slider-text align-items-end justify-content-start">
               <div class="col-md-9 ftco-animate pb-4">
                  <h1 class="mb-3 bread">We Are Family</h1>
                  <p class="breadcrumbs">
                     <span class="mr-2"><a href="/index">Home <i
                           class="ion-ios-arrow-forward"></i></a></span> <span>또리소개 <i
                        class="ion-ios-arrow-forward"></i></span>
                  </p>
               </div>
            </div>
         </div>

         <section class="ftco-section ftco-services-2 ftco-no-pt">
            <div class="container-fluid px-0 bg-light">
               <div class="container">
                  <div class="row tour py-5">
                     <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services text-center d-block"></div>
                     </div>
                     <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services text-center d-block"></div>
                     </div>
                     <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services text-center d-block"></div>
                     </div>
                     <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services text-center d-block"></div>
                     </div>
                     <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services text-center d-block"></div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="container">

               <div class="col-md-12 tour-wrap mb-5">
                  <div class="row">
                     <div class="col-md-7 d-flex ftco-animate">
                        <div class="img align-self-stretch"
                           style="background-image: url(/resources/images/${donation.pdsSeq}.jpg);"></div>
                     </div>

                     <div class="col-md-5 ftco-animate">


                        <br>
                        <p>DDORI'S MARKET</p>
                        <h3 class="mb-3">
                           <c:out value="${donation.pdsName}" />
                        </h3>
                        <p class="text-right" id="fff">
                           <b><fmt:formatNumber type="number" maxFractionDigits="0" value="${donation.pdsPrice}" />원</b>
                        </p>
                        <form action="#" class="search-property-1">
                           <div class="row">



                              <div class="col-lg-12 align-self-end">
                                 <div class="form-group">
                                    <div class="form-field">
                                       <br>
                                       <p>DDORI'S HOUSE 고객들 위한 혜택</p>
                                       <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>

                                       <div id="f">적립금</div>
                                       <div id="s">구매내역의 10%</div>
                                       <br>
                                       <div id="f">택배비</div>
                                       <div id="s">전국무료</div>
                                       <br>
                                       <div id="f">결제</div>
                                       <div id="s">카카오페이</div>
                                       <br> <br> <br>
                                       <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>
                                       <button type="button" id="btnOrder"
                                          class="form-control btn btn-primary">order</button> <br>

                                    </div>
                                 </div>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
                  <!-- end -->
               </div>
            </div>

            <div class="container">
               <div class="container">
                  <div class="row">
                     <div class="col"></div>
                     <div class="col">
                        <img src="/resources/images/KakaoTalk_20211224_163526598.png">
                     </div>
                     <div class="col"></div>
                  </div>
               </div>


               <br> <br> <img
                  src="/resources/images/${donation.pdsSeq}.jpg" width="100%">
               <br> <br> <br> <br>
               <br> <br> <br> <img
                  src="/resources/images/${donation.pdsSeq}_(1).jpg" width="100%">
               <br> <br> <br> <br> <br> <br>
               <br> <br> <br> <img
                  src="/resources/images/1_(2).jpg" width="100%"> <br> <br>
               <br> <br> <br> <br> <br> <br> <br>
               <br>



               <div class="container">
                  <div class="row">
                     <div class="col"></div>
                     <div class="col">
                        <img src="/resources/images/6.png">
                     </div>
                     <div class="col"></div>
                  </div>
               </div>


                <br> <br>
               <img src="/resources/images/order.png" width="100%"> <br>
               <br>


            </div>

         </section>
      </section>
   </c:if>
   <form name="bbsForm" id="bbsForm" method="post">
      <input type="hidden" name="pdsSeq" value="${pdsSeq}" />
   </form>
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

</body>
</html>