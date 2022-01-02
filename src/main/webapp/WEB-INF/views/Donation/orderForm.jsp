<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
   $("#productOrder").on("click", function() {
      if($.trim($("#sample3_postcode").val()).length <= 0)
      {
         alert("우편번호를 입력하세요");
         $("#sample3_postcode").val("");
         $("#sample3_postcode").focus();
         return;
      }
      
      
      if($.trim($("#sample3_detailAddress").val()).length <= 0)
      {
         alert("상세주소를 입력하세요");
         $("#sample3_detailAddress").val("");
         $("#sample3_detailAddress").focus();
         return;
      }
      
      document.bbsForm.pdsSeq.value=${donation.pdsSeq};   
      document.bbsForm.action="/Donation/orderCheck";
      document.bbsForm.pdsStock.value=$("#ck1").val();
      document.bbsForm.pdsPrice.value=$("#summ").val();
      document.bbsForm.sample3postcode.value=$("#sample3_postcode").val();
      document.bbsForm.sample3address.value=$("#sample3_address").val();
      document.bbsForm.sample3detailAddress.value=$("#sample3_detailAddress").val();
      document.bbsForm.submit();
      
      
   });
});


function product_view(pdsSeq)
{
   document.bbsForm.pdsSeq.value=pdsSeq;
   document.bbsForm.action="/Donation/single";
   document.bbsForm.submit();
}


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
            <h2 class="mb-4">ORDER</h2>
            <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>
         </div>
      </div>


      <div class="col-md-12">
         <div id="aaa">
            <div class="row">
               <br> <br> <br>
               <div class="col-md-4 d-flex ftco-animate">

                  <div class="img">
                     <a href="javascript:void(0)"
                        onclick="product_view(${donation.pdsSeq})"><img
                        src="/resources/images/${donation.pdsSeq}.jpg" class="img-fluid"
                        width="260px"></a>
                  </div>

               </div>

               <div class="col-md-8 ftco-animate">
                  <div class="col-md-12">
                     <br> <br> <br>
                     <div class="row">

                        <div class="col-md-4 d-flex ftco-animate">product</div>
                        <div class="col-md-2 d-flex ftco-animate">price</div>
                        <div class="col-md-2 d-flex ftco-animate">number</div>
                        <div class="col-md-2 d-flex ftco-animate">point</div>
                        <div class="col-md-2 d-flex ftco-animate">total</div>
                     </div>
                     <form name="bbsForm" id="bbsForm" method="post">
                        <input type="hidden" name="pdsSeq" value="" /> 
                        <input type="hidden" name="sample3postcode" value="" /> 
                        <input type="hidden" name="sample3address" value="" />
                        <input type="hidden" name="sample3detailAddress" value="" />
                           
                        <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>

                        <div class="row">
                           <div class="col-md-4 d-flex ftco-animate">


                              <c:out value="${donation.pdsName}" />

                           </div>
                           <div class="col-md-2 d-flex ftco-animate">
                              <fmt:formatNumber type="number" maxFractionDigits="0"
                                 value="${donation.pdsPrice}" />
                              원

                           </div>
                           <div class="col-md-2 d-flex ftco-animate">
                              <input type="number" name="pdsStock" id="ck1"
                                 onclick="nightlight()" min="1" max="${donation.pdsStock}"
                                 value="1"> <input type="hidden" id="price"
                                 value="${donation.pdsPrice }">
                           </div>
                           <div class="col-md-2 d-flex ftco-animate">

                              <fmt:formatNumber type="number" maxFractionDigits="0"
                                 value="${donation.pdsPrice*0.1 }" />
                              원
                           </div>

                           <div class="col-md-2 d-flex ftco-animate">
                              <input type="text" name="pdsPrice" id="summ" size="5"
                                 value="${donation.pdsPrice }">원
                           </div>
                        </div>
                     </form>

                  </div>

               </div>
               <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>
            </div>

         </div>



         <!-- end -->


         <br> <br>
         <div class="container">
            <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>

            <div class="col-md-12">
               <div class="row">
                  <div class="col-md-6">
                     <b>주문자정보</b>

                     <div class="col-md-12">
                        <br> <br>
                        <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>
                        <div class="row">
                           <div class="col-md-4 d-flex ftco-animate">
                              이름 <br> <br> 전화번호 <br> <br> 생년월일 <br>
                              <br> 이메일 <br> <br>
                           </div>
                           <div class="col-md-8 d-flex ftco-animate">
                              <c:out value="${user.userName}" />
                              <br> <br> ${user.userPNum }<br> <br>${user.userBDate }<br>
                              <br>${user.userEmail }<br> <br>

                           </div>
                        </div>
                        <h3 style="border-bottom: 1px solid #f2f2f2;"></h3>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <b>배송지 정보</b><br> <br> <br>
                     <h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;"></h3>

                     <input type="text" id="sample3_postcode" name="sample3_postcode"
                        value="" placeholder="우편번호"> <input type="button"
                        id="btnAddress" onclick="sample3_execDaumPostcode()"
                        value="우편번호 찾기"><br> <br> <input type="text"
                        id="sample3_address" name="sample3_address" value=""
                        placeholder="주소"><br> <br> <input type="text"
                        id="sample3_detailAddress" value="" placeholder="상세주소"
                        name="sample3_detailAddress"> <input type="text"
                        id="sample3_extraAddress" value="" placeholder="참고항목">



                     <div id="wrap"
                        style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
                        <img src="//t1.daumcdn.net/postcode/resource/images/close.png"
                           id="btnFoldWrap"
                           style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
                           onclick="foldDaumPostcode()" alt="접기 버튼">
                     </div>

                     <br> <br> <br>
                     <h3 style="border-bottom: 1px solid #f2f2f2;"></h3>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <div id="remote">
         <a href="javascript:void(0)" onclick="fn_view(${donation.pdsSeq})"><button
               type="button" id="productOrder">order</button></a>
      </div>
      <span id="remote"></span>
   </section>


   <script type="text/javascript">
      var total = parseInt(document.getElementById("summ").value);

      function nightlight() {
         var result = parseInt(document.getElementById("ck1").value);
         var checked = document.getElementById("price").value;
         if (checked) {
            total = result * checked;
         } else {
            total -= result;
         }
         document.getElementById("summ").value = total;
      }
   </script>


   <script
      src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
                     // 우편번호 찾기 찾기 화면을 넣을 element
                     var element_wrap = document.getElementById('wrap');

                     function foldDaumPostcode() {
                        // iframe을 넣은 element를 안보이게 한다.
                        element_wrap.style.display = 'none';
                     }

                     function sample3_execDaumPostcode() {
                        // 현재 scroll 위치를 저장해놓는다.
                        var currentScroll = Math.max(
                              document.body.scrollTop,
                              document.documentElement.scrollTop);
                        new daum.Postcode(
                              {
                                 oncomplete : function(data) {
                                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                    var addr = ''; // 주소 변수
                                    var extraAddr = ''; // 참고항목 변수

                                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                       addr = data.roadAddress;
                                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                       addr = data.jibunAddress;
                                    }

                                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                    if (data.userSelectedType === 'R') {
                                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                       if (data.bname !== ''
                                             && /[동|로|가]$/g
                                                   .test(data.bname)) {
                                          extraAddr += data.bname;
                                       }
                                       // 건물명이 있고, 공동주택일 경우 추가한다.
                                       if (data.buildingName !== ''
                                             && data.apartment === 'Y') {
                                          extraAddr += (extraAddr !== '' ? ', '
                                                + data.buildingName
                                                : data.buildingName);
                                       }
                                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                       if (extraAddr !== '') {
                                          extraAddr = ' ('
                                                + extraAddr
                                                + ')';
                                       }
                                       // 조합된 참고항목을 해당 필드에 넣는다.
                                       document
                                             .getElementById("sample3_extraAddress").value = extraAddr;

                                    } else {
                                       document
                                             .getElementById("sample3_extraAddress").value = '';
                                    }

                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    document
                                          .getElementById('sample3_postcode').value = data.zonecode;
                                    document
                                          .getElementById("sample3_address").value = addr;
                                    // 커서를 상세주소 필드로 이동한다.
                                    document
                                          .getElementById(
                                                "sample3_detailAddress")
                                          .focus();

                                    // iframe을 넣은 element를 안보이게 한다.
                                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                                    element_wrap.style.display = 'none';

                                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                                    document.body.scrollTop = currentScroll;
                                 },
                                 // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                                 onresize : function(size) {
                                    element_wrap.style.height = size.height
                                          + 'px';
                                 },
                                 width : '100%',
                                 height : '100%'
                              }).embed(element_wrap);

                        // iframe을 넣은 element를 보이게 한다.
                        element_wrap.style.display = 'block';
                     }
                  </script>
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