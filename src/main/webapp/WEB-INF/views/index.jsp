<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">

</script>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

<section id="home-section" class="hero">
	  	<img src="/resources/images/blob-shape-3.svg" class="svg-blob" alt="Colorlib Free Template">
		  <div class="home-slider owl-carousel">
	      <div class="slider-item">
	      	<div class="overlay"></div>
	        <div class="container-fluid p-0">
	          <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
	          	<div class="one-third order-md-last">
	          		<div class="img" style="background-image:url(/resources/images/img_bg_1.jpg);">
	          			<div class="overlay"></div>
	          		</div>
	          	
	          		<div class="vr"><span class="pl-3 py-4" style="background-image: url(/resources/images/bg_2-2.jpg);">Pomeranian</span></div>
	          	</div>
		          <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
		          	<div class="text">
		          		<span class="subheading pl-5">Welcome to DORRI'S HOUSE</span>
			            <h1 class="mb-4 mt-3">또리의 쉼터</h1>
			            <p>또리의 쉼터에는 많은 또리들이 <br>
							여러분을 기다리고 있습니다.</p>
			            
			            <p><a href="Adopt.html" class="btn btn-primary px-5 py-3 mt-3">View Dogs <span class="ion-ios-arrow-forward"></span></a></p>
		            </div>
		          </div>
	        	</div>
	        </div>
	      </div>

	      <div class="slider-item">
	      	<div class="overlay"></div>
	        <div class="container-fluid p-0">
	          <div class="row d-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
	          	<div class="one-third order-md-last">
	          		<div class="img" style="background-image:url(/resources/images/bg_2.jpg);">
	          			<div class="overlay"></div>
	          		</div>
	          		<div class="vr"><span class="pl-3 py-4" style="background-image: url(/resources/images/bg_2-2.jpg);">Retriever</span></div>
	          	</div>
		          <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
		          	<div class="text">
		          		<span class="subheading pl-5">Special Product</span>
			            <h1 class="mb-4 mt-3">또리의 간식</span></h1>
			            <p>또리의 쉼터에서만 볼 수 있는 <br> 착한가격의 간식!</p>
			            
			            <p><a href="#" class="btn btn-primary px-5 py-3 mt-3">View Product <span class="ion-ios-arrow-forward"></span></a></p>
		            </div>
		          </div>
	        	</div>
	        </div>
	      </div>
	    </div>
    </section>

  
	<section class="ftco-section" id="Dog">
    	<div class="container">
    		<div class="row justify-content-center pb-5">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">CHOOSE YOUR'S</span>
            <h2 class="mb-4">Weekly Top6 Dogs</h2>
            <p>일주일동안 선호도가 높았던 또리들을 소개합니다.</p>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<a href="Adopt-single.html"><img src="/resources/images/destination-1.jpg" width="350px" height="300px" class="img-fluid" alt="Colorlib Template"></a>
	    				</div>
	    				<div class="text">
	    					<h3><a href=".html">Pomeranian</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="/resources/images/destination-1.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<a href=".html"><img src="/resources/images/destination-2.jpg" width="350px" height="320px" class="img-fluid" alt="Colorlib Template"></a>
	    				</div>
	    				<div class="text">
	    					<h3><a href="Adopt.html">Poodle</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="/resources/images/destination-2.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<a href=".html"><img src="/resources/images/destination-3.jpg" width="350px" height="300px" class="img-fluid" alt="Colorlib Template"></a>
	    				</div>
	    				<div class="text">
	    					<h3><a href=".html">Malteze</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="/resources/images/destination-3.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<a href=".html"><img src="/resources/images/destination-4.jpg" width="350px" height="300px" class="img-fluid" alt="Colorlib Template"></a>
	    				</div>
	    				<div class="text">
	    					<h3><a href=".html">Pomeranian</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="/resources/images/destination-4.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<a href=".html"><img src="/resources/images/destination-5.jpg" width="350px" height="300px" class="img-fluid" alt="Colorlib Template"></a>
	    				</div>
	    				<div class="text">
	    					<h3><a href=".html">Shih Tzu</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="/resources/images/destination-5.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<a href=".html"><img src="/resources/images/destination-6.jpg" width="350px" height="300px" class="img-fluid" alt="Colorlib Template"></a>
	    				</div>
	    				<div class="text">
	    					<h3><a href=".html">Malteze</a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						<div class="float-right">
	    							<span class="rate"><a href="#">(120)</a></span>
	    						</div>
	    					</div>
	    				</div>
	    				<a href="/resources/images/destination-6.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

	

    <section class="ftco-intro img" style="background-image: url(/resources/images/bg_3.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-9 text-center">
						<h2>Choose the Perfect Partner</h2>
						<p>아직 많은 또리들이 당신을 기다리고있어요!</p>
						<p class="mb-0"><a href="Adopt.html" class="btn btn-white px-4 py-3">View more</a></p>
					</div>
				</div>
			</div>
		</section>


	
		<section class="ftco-section" id="donation-section">
			<div class="container">
				<div class="row justify-content-center pb-5">
			  <div class="col-md-12 heading-section text-center ftco-animate">
				  <span class="subheading">DDORI'S PRODUCT</span>
				<h2 class="mb-4">Choose Tasty Foood</h2>
				<p>당신의 또리에게 줄 맛있는 간식을 담아가세요.</p>
			  </div>
			</div>
				<div class="row">
					<div class="col-md-6 col-lg-4 ftco-animate">
						<div class="project">
							<div class="img">
								<div class="vr"><span>Sale</span></div>
								<a href=".html"><img src="/resources/images/1.jpg" class="img-fluid" alt="Colorlib Template"></a>
							</div>
							<div class="text">
								<h4 class="price"><span class="old-price mr-2">30,000</span>25,000</h4>
								<span>set</span>
								<h3><a href=".html">포켓수제간식 6종</a></h3>
								<div class="star d-flex clearfix">
									<div class="mr-auto float-left">
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
									</div>
									<div class="float-right">
										<span class="rate"><a href="#">(120)</a></span>
									</div>
								</div>
							</div>
							<a href="/resources/images/hotel-1.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
								<span class="icon-expand"></span>
							</a>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 ftco-animate">
						<div class="project">
							<div class="img">
								<a href=".html"><img src="/resources/images/2.jpg" class="img-fluid" alt="Colorlib Template"></a>
							</div>
							<div class="text">
								<h4 class="price">15,000</h4>
								<span>single</span>
								<h3><a href=".html">송아지 갈비뼈 150g</a></h3>
								<div class="star d-flex clearfix">
									<div class="mr-auto float-left">
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
									</div>
									<div class="float-right">
										<span class="rate"><a href="#">(120)</a></span>
									</div>
								</div>
							</div>
							<a href="/resources/images/hotel-2.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
								<span class="icon-expand"></span>
							</a>
						</div>
					</div>
					<div class="col-md-6 col-lg-4 ftco-animate">
						<div class="project">
							<div class="img">
								<a href=".html"><img src="/resources/images/3.jpg" class="img-fluid" alt="Colorlib Template"></a>
							</div>
							<div class="text">
								<h4 class="price">20,000</h4>
								<span>set</span>
								<h3><a href=".html">강아지 껌</a></h3>
								<div class="star d-flex clearfix">
									<div class="mr-auto float-left">
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
										<span class="ion-ios-star"></span>
									</div>
									<div class="float-right">
										<span class="rate"><a href="#">(120)</a></span>
									</div>
								</div>
							</div>
							<a href="/resources/images/hotel-3.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
								<span class="icon-expand"></span>
							</a>
						</div>
					</div>
					<p><a href="#" class="btn btn-secondary">View more</a></p>
				</div>

			


    <section class="ftco-section" id="volunteer-section">
    	<div class="container">
    		<div class="row justify-content-center pb-5">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">With Dogs</span>
            <h2 class="mb-4">Best Place to Volunteer</h2>
            <p>당신의 주변에 있는 또리들과 함께 봉사를 해보세요.</p>
          </div>
        </div>

		<section class="ftco-intro img" id="hotel-section" style="background-image: url(/resources/images/bg_4.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-9 text-center">
						<h2>Choose Volunteer</h2>
						<p class="mb-0"><a href="#" class="btn btn-white px-4 py-3">View more</a></p>
					</div>
				</div>
			</div>
		</section>

    <section class="ftco-section bg-light" id="review-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">Comunity</span>
            <h2 class="mb-4">Reviews</h2>
		<p>또리를 데려간 다른 사람들의 후기 보고가세요!</p>
          </div>
        </div>
        <div class="row d-flex">
          <div class="col-md-6 col-lg-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href=".html" class="block-20" style="background-image: url('/resources/images/image_1.jpg');">
              </a>
              <div class="text float-right d-block">
              	<div class="d-flex align-items-center pt-2 mb-4 topp">
              		<div class="one mr-2">
              			<span class="day">12</span>
              		</div>
              		<div class="two">
              			<span class="yr">2019</span>
              			<span class="mos">april</span>
              		</div>
              	</div>
                <h3 class="heading"><a href=".html">또리의 하우스의 또리가</a></h3>
                <p>저인 줄 알았는데 강아지가 또리였네요^^; </p>
                <div class="d-flex align-items-center mt-4 meta">
	                <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                	<a href="#" class="mr-2">제욱이삐져떠 흥</a>
	                	<a href="#" class="meta-chat"><span class="icon-chat"></span> 30000</a>
	                </p>
                </div>
              </div>
            </div>
          </div>
		  
          <div class="col-md-6 col-lg-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href=".html" class="block-20" style="background-image: url('/resources/images/image_2.jpg');">
              </a>
              <div class="text float-right d-block">
              	<div class="d-flex align-items-center pt-2 mb-4 topp">
              		<div class="one mr-2">
              			<span class="day">12</span>
              		</div>
              		<div class="two">
              			<span class="yr">2020</span>
              			<span class="mos">april</span>
              		</div>
              	</div>
                <h3 class="heading"><a href=".html">제가 원래 귀여운거보면 좀</a></h3>
                <p>만지면 터질거같아서 무서워하는데,,</p>
                <div class="d-flex align-items-center mt-4 meta">
	                <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                	<a href="#" class="mr-2">보은 마르코 강</a>
	                	<a href="#" class="meta-chat"><span class="icon-chat"></span> 30000</a>
	                </p>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-flex ftco-animate">
          	<div class="blog-entry">
              <a href=".html" class="block-20" style="background-image: url('/resources/images/image_3.jpg');">
              </a>
              <div class="text float-right d-block">
              	<div class="d-flex align-items-center pt-2 mb-4 topp">
              		<div class="one mr-2">
              			<span class="day">31</span>
              		</div>
              		<div class="two">
              			<span class="yr">2020</span>
              			<span class="mos">april</span>
              		</div>
              	</div>
                <h3 class="heading"><a href=".html">강아지용 소주는 안파나요???</a></h3>
                <p>같이 한 잔하고싶은데</p>
                <div class="d-flex align-items-center mt-4 meta">
	                <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                	<a href="#" class="mr-2">하꼬 가브리엘 쏭</a>
	                	<a href="#" class="meta-chat"><span class="icon-chat"></span> 9000</a>
	                </p>
                </div>
              </div>
            </div>
          </div>

		  <div class="col-md-6 col-lg-4 d-flex ftco-animate">
			<div class="blog-entry justify-content-end">
			<a href=".html" class="block-20" style="background-image: url('/resources/images/image_4.jpg');">
			</a>
			<div class="text float-right d-block">
				<div class="d-flex align-items-center pt-2 mb-4 topp">
					<div class="one mr-2">
						<span class="day">02</span>
					</div>
					<div class="two">
						<span class="yr">2021</span>
						<span class="mos">March</span>
					</div>
				</div>
			  <h3 class="heading"><a href=".html">진짜 황당하고 어이없네요</a></h3>
			  <p>저보다 귀여운게 존재한다는게</p>
			  <div class="d-flex align-items-center mt-4 meta">
				  <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
				  <p class="ml-auto mb-0">
					  <a href="#" class="mr-2">볼빨간 다람쥐</a>
					  <a href="#" class="meta-chat"><span class="icon-chat"></span> 30000</a>
				  </p>
			  </div>
			</div>
		  </div>
		</div>

		<div class="col-md-6 col-lg-4 d-flex ftco-animate">
			<div class="blog-entry justify-content-end">
			<a href=".html" class="block-20" style="background-image: url('/resources/images/image_5.jpg');">
			</a>
			<div class="text float-right d-block">
				<div class="d-flex align-items-center pt-2 mb-4 topp">
					<div class="one mr-2">
						<span class="day">10</span>
					</div>
					<div class="two">
						<span class="yr">2021</span>
						<span class="mos">april</span>
					</div>
				</div>
			  <h3 class="heading"><a href=".html">좀 짜증나요 제가 만두인데</a></h3>
			  <p>얘가 더 만두같아서 질투나요</p>
			  <div class="d-flex align-items-center mt-4 meta">
				  <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
				  <p class="ml-auto mb-0">
					  <a href="#" class="mr-2">내가만두야;</a>
					  <a href="#" class="meta-chat"><span class="icon-chat"></span> 30000</a>
				  </p>
			  </div>
			</div>
		  </div>
		</div>

		<div class="col-md-6 col-lg-4 d-flex ftco-animate">
			<div class="blog-entry justify-content-end">
			<a href=".html" class="block-20" style="background-image: url('/resources/images/image_6.jpg');">
			</a>
			<div class="text float-right d-block">
				<div class="d-flex align-items-center pt-2 mb-4 topp">
					<div class="one mr-2">
						<span class="day">30</span>
					</div>
					<div class="two">
						<span class="yr">2021</span>
						<span class="mos">april</span>
					</div>
				</div>
			  <h3 class="heading"><a href=".html">강아지 케이스도 팔아줘요</a></h3>
			  <p>이 겸댕이가 그려진 케이스가 없다는게 말..</p>
			  <div class="d-flex align-items-center mt-4 meta">
				  <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
				  <p class="ml-auto mb-0">
					  <a href="#" class="mr-2">혀니혀니서혀니</a>
					  <a href="#" class="meta-chat"><span class="icon-chat"></span> 30000</a>
				  </p>
			  </div>
			</div>
		  </div>
		</div>

        </div>
      </div>
    </section>

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
				            <p>인천광역시미추홀구 학익동 663-1 태승빌딩 5층 B강의실 똘이와 아이들</p>
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
    
<!-- 모달창 -->

	<div id="my_modal">
		<iframe src ="" width="100%" height="100%" id="ff" name="modalFrame"></iframe>
		<a class="modal_close_btn">닫기</a>
	</div>
	<div id="remoCon">
		<a id="popup_open_btn" href="/contact" target="modalFrame"><img src="/resources/images/111.png" id="ss"></a>
	</div>

	<div id="my_modal2">
		<iframe src ="in.html" width="600px" height="600px" ></iframe>
		<br>
		<button id="btn"><a class="modal_close_btn">닫기</a></button>
		<button type="button" onClick="PopupNoDisplay_1()" id="btn"><span>하루동안 보지않기</span></button> 
	</div>




	<span id="remoCon">

		Going Up
  
   </span>  
   
   <script type="text/javascript">
function modal(id) {
	var zIndex = 9999;
	var modal = document.getElementById(id);

	// 모달 div 뒤에 희끄무레한 레이어
	var bg = document.createElement('div');
	bg.setStyle({
		position: 'fixed',
		zIndex: zIndex,
		left: '0px',
		top: '0px',
		width: '100%',
		height: '100%',

	});
	document.body.append(bg);

	// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	modal.querySelector('.modal_close_btn').addEventListener('click', function() {
		bg.remove();
		modal.style.display = 'none';
	});

	modal.setStyle({
		position: 'fixed',
		display: 'block',
		boxShadow: '2px 2px 8px 10px rgba(0, 0, 0, 0.2), 0 60px 20px 0 rgba(0, 0, 0, 0.19)',

		// 시꺼먼 레이어 보다 한칸 위에 보이기
		zIndex: zIndex + 1,

		// div center 정렬
		top: '50%',
		left: '83%',
		transform: 'translate(-50%, -50%)',
		msTransform: 'translate(-50%, -50%)',
		webkitTransform: 'translate(-50%, -50%)'
	});

}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
	for (var k in styles) this.style[k] = styles[k];
	return this;
};

document.getElementById('popup_open_btn').addEventListener('click', function() {
	// 모달창 띄우기
	modal('my_modal');
});

</script>
   
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