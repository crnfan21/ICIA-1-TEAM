<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<script>
$(document).ready(function(){
    $("#btnAdopt").on("click", function() {
        document.dogForm.action = "/adopt/dogAdopt";
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
             <p class="breadcrumbs"><span class="mr-2"><a href="/index">Home&nbsp;<i class="ion-ios-arrow-forward"></i></a></span><span class="mr-2"><a href="/adopt/dogList">Adopt&nbsp;<i class="ion-ios-arrow-forward"></i></a></span><span class="mr-2"><a href="/adopt/dogList">또리소개&nbsp;<i class="ion-ios-arrow-forward"></i></a></span><span class="mr-2">${dog.dogName}</span></p>
          </div>
        </div>
      </div>
    </section>

<section class="ftco-section ftco-services-2 ftco-no-pt">
    	<div class="container-fluid px-0 bg-light">
    		<div class="container">
    			<div class="row tour py-5">
        	<div class="col-md d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services text-center d-block">
            
            </div>      
          </div>
          <div class="col-md d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services text-center d-block">
        
            </div>      
          </div>
          <div class="col-md d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services text-center d-block">
       
            </div>      
          </div>
          <div class="col-md d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services text-center d-block">
      

            </div>      
          </div>
          <div class="col-md d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services text-center d-block">

            </div>      
          </div>
        </div>
    		</div>
    	</div>
      <div class="container">
        
        	<div class="col-md-12 tour-wrap mb-5">
   				<div class="row">
   					<div class="col-md-6 d-flex ftco-animate">
   						<div class="img align-self-stretch" style="background-image: url(/resources/images/dog/${dog.dogSeq}.jpg);"></div>
           			</div>
            
					<div class="col-md-6 ftco-animate">
						<div class="text py-5">
							<h3 class="font2"><b>${dog.dogSpecies}</b></h3>
							<p class="pos"><span class="price font4"> ${dog.dogName}</span></p>
							<p>${dog.dogContent}</p>
						</div>
            
		                <table class="table">
		                
		                  <tbody>
		                    <tr>
		                      <th scope="row">입소일</th>
		                      <td>
		                        <p>${dog.entDate}</p>
		                      </td>
		                    </tr><!-- END TR-->
							
							<tr>
		                      <th scope="row">성별</th>
		                      <td>
		                        <p>${dog.dogGender}</p>
		                      </td>
		                    </tr><!-- END TR-->					
							
		                    <tr>
		                      <th scope="row">중성화</th>
		                      <td>
		                        <p>${dog.neutering}</p>
		                      </td>
		                    </tr><!-- END TR-->
		
		                    <tr>
		                      <th scope="row">특이사항</th>
		                      <td>
		                        <p>${dog.dogSig}</p>
		                      </td>
		                    </tr><!-- END TR-->
		                    <tr>
		                      <th scope="row" colspan="2">
		                      	<button id="btnAdopt" name="btnAdopt" class="btn btn-primary" style="width:530px; height:50px; line-height: 35px; font-size:16px;"><b>입&nbsp;&nbsp;&nbsp;&nbsp;양&nbsp;&nbsp;&nbsp;&nbsp;신&nbsp;&nbsp;&nbsp;&nbsp;청</b></button>
		                      </th>
		                    </tr><!-- END TR-->
		 
		                   </tbody>
		                </table>
            		</div>
    			</div>
         <br><br>
          

          <div class="container">
            <div class="row">
              <div class="col">
               
              </div>
              <div class="col">
                <img src="/resources/images/KakaoTalk_20211224_163526598.png">
              </div>
              <div class="col">
              
              </div>
            </div>
          </div>
         
         
         
          <br><br>
          <img src="/resources/images/dog/${dog.dogSeq}_ (1).jpg" width="100%">
          <br><br>
          

          <br><br>
          <img src="/resources/images/3.png" width="100%">
          <br><br>

          <br><br><br>
          <img src="/resources/images/dog/${dog.dogSeq}_ (2).jpg" width="100%">
          <br><br><br>
          
          <br><br><br>
          <img src="/resources/images/4.png" width="100%">
          <br><br><br>

          <br><br>
          <img src="/resources/images/dog/${dog.dogSeq}_ (3).jpg" width="100%">
          <br><br>


          <br><br>
          <br><br>
          <br><br>
          <br><br>


          
          <div class="container">
            <div class="row">
              <div class="col">
               
              </div>
              <div class="col">
                <img src="/resources/images/6.png">
              </div>
              <div class="col">
              
              </div>
            </div>
          </div>



        
          <br><br><br>
          <img src="/resources/images/5.png" width="100%">
          <br><br><br>

          <br><br>
          <img src="/resources/images/2.PNG" width="100%">
          <br><br>


      </div>   
	</div>
</section>
 

    		

    <!--푸터-->
   
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


	<form name="dogForm" id="dogForm" method="post">
		<input type="hidden" name="dogSeq" value="${dog.dogSeq}" />
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/resources/js/google-map.js"></script>
  
  <script src="/resources/js/main.js"></script>

</body>
</html>