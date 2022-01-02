<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnSearch").on("click", function(){
		document.dogForm.dogSeq.value = "";
		document.dogForm.searchType.value = $("#_searchType").val();
		document.dogForm.searchValue.value = $("#_searchValue").val().toUpperCase();
		document.dogForm.curPage.value = 1;
		document.dogForm.action = "/adopt/dogList";
		document.dogForm.submit();
	});
	
    $("#btnWrite").on("click", function() {
        document.dogForm.dogSeq.value= "";
        document.dogForm.action = "/adopt/dogWriteForm";
        document.dogForm.submit();
     });
    

	$("#_searchValue").on("keypress", function(e){
		
		if(e.which == 13)
		{	
			document.dogForm.dogSeq.value = "";
			document.dogForm.searchType.value = $("#_searchType").val();
			document.dogForm.searchValue.value = $("#_searchValue").val().toUpperCase();
			document.dogForm.curPage.value = 1;
			document.dogForm.action = "/adopt/dogList";
			document.dogForm.submit();
		}	
	});    
});

//조회를 안 누르면 searchType과 searchValue는 가져갈 필요가 없기때문에 따로 정의 X
function fn_view(dogSeq)
{
	document.dogForm.dogSeq.value = dogSeq;
	document.dogForm.action = "/adopt/dogView";
	document.dogForm.submit();
}

function fn_list(curPage)
{
	document.dogForm.dogSeq.value = "";
	document.dogForm.curPage.value = curPage;
	document.dogForm.action = "/adopt/dogList";
	document.dogForm.submit();
}
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
             <p class="breadcrumbs"><span class="mr-2"><a href="/index">Home&nbsp;<i class="ion-ios-arrow-forward"></i></a></span><span class="mr-2"><a href="/adopt/dogList">Adopt&nbsp;<i class="ion-ios-arrow-forward"></i></a></span><span>또리소개</span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
    		
    			<!-- start -->
    			<div class="col-lg-9 pr-lg-4">
    				<div class="row">
    					<c:if test="${!empty list}">
								<c:forEach var="dog" items="${list}" varStatus="status">      
							     	<div class="col-md-6 col-lg-4 ftco-animate">
					    				<div class="project">
					    					<div class="img">
							    				<a href="javascript:void(0)" onclick="fn_view(${dog.dogSeq})"><img src="/resources/images/dog/${dog.dogSeq}.jpg" class="img-fluid" alt="Colorlib Template" style="width:300px; height:250px;"></a>
						    				</div>
						    				<div class="text">
						    					<span class="font1">${dog.dogSpecies}</span>
						    					<h3 class="font3"><a href="javascript:void(0)" onclick="fn_view(${dog.dogSeq})">${dog.dogName}</a></h3>
						    				</div>
						    				<a href="/resources/images/dog/${dog.dogSeq}.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
						    					<span class="icon-expand"></span>
						    				</a>
					    				</div>
					    			</div>
								</c:forEach>
						</c:if>
						<c:if test="${empty list}">
						
			            	<div class="col-md-10 col-lg-4 ftco-animate" style="position: relative; left: 100px;">
			            	<img src="/resources/images/NoSearchResult.jpg"  alt="Colorlib Template" style="width:500px; height:400px;">
					    		<div class="project" style="position: relative; left: 140px; top: 20px;">	
			            			<h1 class="font1">조회 가능한 강아지가 없습니다.</h1>
			            		</div>
			            	</div>
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
				         	<li class="active"><a href="javascript:void(0)" >${i}</a></li>
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
		         
    			</div>
    			<!-- end -->
    			
    			<!-- start -->
    			<div class="col-lg-3 p-4 bg-light">
    				<div class="search-wrap-1 ftco-animate">
    					<h2 class="mb-3">Find Dogs</h2>
					<div class="search-property-1">
		        		<div class="row">
		        			
		        			<div class="col-lg-12 align-items-end mb-3">
		        				<div class="form-group">
		        					<label>Option</label>
		        					<div class="form-field">
		          					<div class="icon"><span class="ion-ios-calendar"></span></div>
									  <select name="_searchType" id="_searchType" class="form-control">
										<option value="">조회 항목</option>
							            <option value="1" <c:if test="${searchType eq '1'}">selected</c:if>>성별(M, F)</option>
							            <option value="2" <c:if test="${searchType eq '2'}">selected</c:if>>견종</option>
							            <option value="3" <c:if test="${searchType eq '3'}">selected</c:if>>사이즈(S, M, L)</option>
									  </select>
				              		</div>
			              		</div>
		        			</div>
		        			
		        			<div class="col-lg-12 align-items-end mb-3">
		        				<div class="form-group">
		        					<label>Value</label>
		        					<div class="form-field">
			          					<div class="select-wrap">
					                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
					                      <input type="text" name="_searchValue" id="_searchValue" value="${searchValue}" class="form-control" maxlength="20" style="width:235px; ime-mode:active;" placeholder="조회값을 입력하세요."  />
					                    </div>
				              		</div>
			              		</div>
		        			</div>
		        			
		        			<div class="col-lg-12 align-self-end">
		        				<div class="form-group">
		        					<div class="form-field">
				                		<button type="button" id="btnSearch" class="form-control btn btn-primary">Search</button>
				                		<c:if test="${user.getUserGrade() eq 'M'}">
				                		<br />
				                		<button type="button" id="btnWrite" class="form-control btn btn-primary">Dog Register</button>
				                		</c:if>
				              		</div>
			              		</div>
		        			</div>

		        		</div>
		        	</div>
		        </div>
    			</div> 
    			<!-- end -->
    			
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
      <input type="hidden" name="searchType" value="${searchType}" />
      <input type="hidden" name="searchValue" value="${searchValue}" />
      <input type="hidden" name="curPage" value="${curPage}" />
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

</body>
</html>