<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script>
$(document).ready(function() {
   $("#btnOrder").on("click", function() {
      
      
      var form = $("#orderForm")[0];
      var formData = new FormData(form);
      
      $.ajax({
         type:"POST",
         enctype:'multipart/form-data',
         url: "/Donation/orderProc",
         data: formData,
         processData:false,      
         contentType:false,      
         cache:false,
         timeout:600000,
         beforeSend:function(xhr)
         {
            xhr.setRequestHeader("AJAX", "true");
            
         },
         success:function(response)
         {
            if(response.code == 0)
            {
               alert("주문이 완료되었습니다.");
               location.href="/index";
            }
            else
            {
               alert("주문처리에서 오류가 발생하였습니다.");
               location.href="/Donation/orderForm";
            }
         },
         error:function(error)
         {
            icia.common.error(error);
            alert("주문처리 중 오류가 발생하였습니다.");
         }
      });
      
   });
});
</script>

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
   data-offset="300">
   

   <%@ include file="/WEB-INF/views/include/navigation.jsp"%>
   <br>
   <br>
   <br>
   <br>
   <section class="ftco-section" id="Dog">

      <div class="row justify-content-center pb-5">
         <div class="col-md-12 heading-section text-center ftco-animate">
            <span class="subheading">DDORI'S HOUSE</span>
            <h2 class="mb-4">Check Your Order</h2>
            <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>
            <div class="row">
               <div class="col-md-12 heading-section text-center ftco-animate">
                  <div id="bbb">
                     <div class="col-md-12">
                        <h3>User</h3>
                        <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>
                        <div class="row">
                           <br> <br> <br>
                           <div class="col-md-3">
                              이름<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              전화번호<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              이메일<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              생년월일<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              주소<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>

                           </div>

                           <div class="col-md-1"></div>

                           <div class="col-md-8">
                              <c:out value="${user.userName}" />
                              <br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              ${user.userPNum }<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              ${user.userEmail }<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              ${user.userBDate }<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              ${pdsAddress}<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                           </div>

                        </div>

                     </div>
                     <br> <br>
                     <div class="col-md-12">
                        <h3>Product</h3>
                        <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>
                        <div class="row">
                           <br> <br> <br>
                           <div class="col-md-3">
                              상품명<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              수량<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              가격<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              적립포인트<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>


                           </div>

                           <div class="col-md-1"></div>

                           <div class="col-md-8">
                              ${donation.pdsName}<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              ${pdsStock}
                              <br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              <fmt:formatNumber type="number" maxFractionDigits="0"
                                 value="${donation.pdsPrice}" />
                              원 <br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>
                              <fmt:formatNumber type="number" maxFractionDigits="0"
                                 value="${donation.pdsPrice*0.1 }" />
                              원<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>

                           </div>

                        </div>

                     </div>
                     <br> <br>
                     <div class="col-md-12">
                        <h3>Total</h3>
                        <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>
                        <div class="row">
                           <br> <br> <br>
                           <div class="col-md-3">
                              결제금액<br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>


                           </div>

                           <div class="col-md-1"></div>

                           <div class="col-md-8">
                                 <fmt:formatNumber type="number" maxFractionDigits="0"
                                 value="${pdsPrice}" />
                              원
                              <br>
                              <h3 class="mb-5" style="border-bottom: 2px solid #f2f2f2;"></h3>


                           </div>

                        </div>

                     </div>

                  </div>
               </div>
               <!-- end -->
            </div>
         </div>
      </div>

   </section>
   
   <form name="orderForm" id="orderForm" method="post" enctype="multipart/form-data">
      <input type="hidden" name="pcsAmount" value="${pdsPrice}">
      <input type="hidden" name="pcsStock" value="${pdsStock}">
      <input type="hidden" name="pcsRAmount" value="${pdsPrice}">
      <input type="hidden" name="pcsPoint" value="${donation.pdsPrice*0.1 }">
      <input type="hidden" name="pcsAddress" value="${pdsAddress}">
      <input type="hidden" name="pdsSeq" value="${donation.pdsSeq}">
   </form>

   <div id="remote">
      <button type="button" id="btnOrder">order</button>
   </div>
   <span id="remote"></span>

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