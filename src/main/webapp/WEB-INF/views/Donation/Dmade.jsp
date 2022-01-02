<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
   $("#btnSearch").on("click", function() {
      //조회항목, 조회값, 커런트페이지 값을 가져가야됨
      document.bbsForm.pdsSeq.value="";
      document.bbsForm.searchType1.value= $("#_searchType1").val();
      document.bbsForm.searchType2.value=$("#_searchType2").val();
      document.bbsForm.curPage.value = 1;
      document.bbsForm.action="/Donation/Dmade";
      document.bbsForm.submit();
      
      
   });
});




function fn_view(pdsSeq)
{
   document.bbsForm.pdsSeq.value=pdsSeq;   //마지막 밸류의 값이 들어감 서치타입과 서치밸류는 입력했지만, 조회를 눌르지앟ㄴ았을 때는 bbs만 가져가고 밑에거는 가져가지않음
   document.bbsForm.action="/Donation/single";
   document.bbsForm.submit();
}

function fn_list(curPage)
{
   document.bbsForm.pdsSeq.value="";
   document.bbsForm.curPage.value=curPage;
   document.bbsForm.action="/Donation/Dmade";
   document.bbsForm.submit();
}
</script>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>


     <section class="hero-wrap hero-wrap-2" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-4">
            <h1 class="mb-3 bread">We Are Family</h1>
             <p class="breadcrumbs"><span class="mr-2"><a href="/index">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>또리's 메이드 <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>


    <section class="ftco-section">
       <div class="container">
          <div class="row">
             <div class="col-lg-9 pr-lg-4">
                <div class="row">
                
                <c:if test="${!empty list}">
                  <c:forEach var="donation" items="${list}" varStatus="status">
                   <div class="col-md-6 col-lg-4 ftco-animate">
                      <div class="project">
                         <div class="img">
                            <a href="javascript:void(0)" onclick="fn_view(${donation.pdsSeq})"><img src="/resources/images/${donation.pdsSeq}.jpg" class="img-fluid"></a>
                         </div>
                         <div class="text">
                            <h4 class="price"><fmt:formatNumber type="number" maxFractionDigits="0" value="${donation.pdsPrice}" />원</h4>
                            <span>잔여 : ${donation.pdsStock}개</span>
                            <p ><a href="javascript:void(0)" onclick="fn_view(${donation.pdsSeq})">${donation.pdsName}</a></p>
                            <div class="star d-flex clearfix">
                   
                               <div class="float-right">
                                  
                               </div>
                            </div>
                         </div>
                         <a href="/resources/images/${donation.pdsSeq}.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                            <span class="icon-expand"></span>
                         </a>
                      </div>
                   </div>
                  </c:forEach>
                </c:if>
                </div>
                <div class="row mt-5">
                <div class="col text-center">      
                  <div class="block-27">
                  
                    <ul>
                <c:if test="${!empty paging}">
                   <c:if test="${paging.prevBlockPage gt 0}">
                      <li><a href="javascript:void(0)" onclick="fn_list(1)">&lt;&lt;</a></li>
                      <li><a href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">&lt;</a></li>
                   </c:if>
                   
             <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
              <c:choose>
                <c:when test="${i ne curPage}">
                      <li><a href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="active"><a href="javascript:void(0)">${i}</a></li>
                    </c:otherwise>
                    </c:choose>
              </c:forEach>    
                    <c:if test="${paging.nextBlockPage gt 0}">  
                      <li><a href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">&gt;</a></li>
                      <li><a href="javascript:void(0)" onclick="fn_list(${paging.totalPage})">&gt;&gt;</a></li>
                    </c:if>
                 </c:if>
                    </ul>
                  </div>
                </div>
              </div>
             </div> <!-- end -->
             <div class="col-lg-3 p-4 bg-light">
                <div class="search-wrap-1 ftco-animate">
                   <h2 class="mb-3">Find Product</h2>
                     <form action="#" class="search-property-1">
                    <div class="row">
                       
                       <div class="col-lg-12 align-items-end mb-3">
                          <div class="form-group">
                             <label for="#">Dog Size</label>
                             <div class="form-field">
                               <div class="icon"><span class="ion-ios-calendar"></span></div>
                             <select name="_searchType1" id="_searchType1" class="form-control">
                                <option value="" >선택하세요.</option>
                              <option value="1" <c:if test="${searchType1 eq'1'}">selected</c:if>>small</option>
                              <option value="2" <c:if test="${searchType1 eq'2'}">selected</c:if>>midium</option>
                              <option value="3" <c:if test="${searchType1 eq'3'}">selected</c:if>>large</option>
                             </select>
                          </div>
                       </div>
                       </div>
                       <div class="col-lg-12 align-items-end mb-3">
                          <div class="form-group">
                             <label for="#">Product</label>
                             <div class="form-field">
                               <div class="select-wrap">
                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                            <select name="_searchType2" id="_searchType2" class="form-control">
                               <option value="" >선택하세요.</option>
                              <option value="1" <c:if test="${searchType2 eq'1'}">selected</c:if>>사료</option>
                              <option value="2" <c:if test="${searchType2 eq'2'}">selected</c:if>>간식/영양제</option>
                              <option value="3" <c:if test="${searchType2 eq'3'}">selected</c:if>>외출용품</option>
                              <option value="4" <c:if test="${searchType2 eq'4'}">selected</c:if>>장난감/잡화</option>
                              <option value="5" <c:if test="${searchType2 eq'5'}">selected</c:if>>굿즈</option>
                            </select>
                          </div>
                          </div>
                       </div>
                       </div>
                       <div class="col-lg-12 align-self-end">
                          <div class="form-group">
                             <div class="form-field">
                            <input type="button"  id="btnSearch" value="Search" class="form-control btn btn-primary">
                          </div>
                       </div>
                       </div>
                    </div>
                 </form>
              </div>
             </div> <!-- end -->
          </div>
       </div>
    </section>

   
   <form name="bbsForm" id="bbsForm" method="post">
      <input type="hidden" name="pdsSeq" value="" />   <!--제목을 눌렀을 때, 즉 상세페이지로 넘어갈 떄 필요함 -->
      <input type="hidden" name="searchType1" value="${searchType1}" />
      <input type="hidden" name="searchType2" value="${searchType2}" />
      <input type="hidden" name="curPage" value="${curPage}" />
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