<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
    <link rel="stylesheet" href="/resources/css/style2.css">

</head>


<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

<br />
<br />
<br />     
            
<body>

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(/resources/images/0.PNG);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Mypage</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->


  <c:if test="${user.userGrade eq 'N'}">     
  
    <!-- ##### 유저꺼 Blog Area Start ##### -->
    <div class="blog-area section-padding-100-0">
        <div class="container">
              <div class="single-blog-post mb-50 wow fadeInUp" data-wow-delay="100ms">
            <div class="blog-post-thumb mt-30">
              <div class="blog-area section-padding-100-0">
              <div class="container">
              <div class="row">
                <div class="col-12 col-lg-9">   
                <div class="col-12">
                    <div class="elements-title mb-70">
                        <h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기준 또리스 현황</h2>
                        <br />
                         <!-- 오늘 날짜 찍기 -->
                            <div class="post-date">
                                <jsp:useBean id="now1" class="java.util.Date" />
                        <fmt:formatDate value="${now1}" pattern="dd" var="today1" />
                                <span><c:out value="${today1}"/></span>                               
                                                   
                                <jsp:useBean id="now2" class="java.util.Date" />
                        <fmt:formatDate value="${now2}" pattern="MM-yyyy" var="today2" />
                                <span><c:out value="${today2}"/></span>
                            </div>
                    </div>
                </div>

                <div class="col-12">
                    <!-- Loaders Area Start -->
                    <div class="our-skills-area">
                        <div class="row">

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle" class="circle" data-value="0.75">
                                        <div class="skills-text">
                                            <span>75%</span>
                                            <p>또리스 입양율</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle2" class="circle" data-value="0.83">
                                        <div class="skills-text">
                                            <span>94%</span>
                                            <p>보호자 만족도 </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle3" class="circle" data-value="0.25">
                                        <div class="skills-text">
                                            <span>17%</span>
                                            <p>또리스 파양율</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle4" class="circle" data-value="0.95">
                                        <div class="skills-text">
                                            <span>95%</span>
                                            <p>또리스 시설평가</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>             
                <img src="/resources/images/slide_(3).jpg" alt="" width="800px">

        <div class="elements-area mt-0 section-padding-0-100">
        <div class="container">
            <div class="row">

                <!-- ========== Progress Bars & Accordions ========== -->
                <div class="col-12">
                    <div class="elements-title mb-30">
                        <h2><br />[깔짝 FAQ] <br /> 코로나바이러스 (COVID-19)과 애완동물에 관한 도움이 되는 질문과 답</h2>
                    </div>
                </div>
    
 <!-- ##### Accordians ##### -->
                <div class="col-12 col-lg-6">
                    <div class="accordions mb-100" id="accordion" role="tablist" aria-multiselectable="true">
                        <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6><a role="button" class="" aria-expanded="true" aria-controls="collapseOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                               Q.1 보호소에 있는 애완동물들을 입양하는 것은 안전한가요?
                                    <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                    <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                    </a></h6>
                            <div id="collapseOne" class="accordion-content collapse show">
                                <p>A. 현재까지의 제한된 정보에 의하면 동물들이 코로나바이러스감염증을 사람들에게 전파할 위험은 낮다고 생각됩니다. 보호소에 있는 애완동물을 포함한 동물들이 코로나바이러스감염증을 일으키는 바이러스를 전파시키는 데 중요한 역할을 한다고 생각할 만한 이유는 없습니다.</p>
                            </div>
                        </div>
                        <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6>
                                <a role="button" class="collapsed" aria-expanded="true" aria-controls="collapseTwo" data-parent="#accordion" data-toggle="collapse" href="#collapseTwo">
                                  Q.2 동물들은 코로나바이러스감염증을 일으키는 바이러스를 피부나 털에 가지고 있을 수 있습니까?
                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                        </a>
                            </h6>
                            <div id="collapseTwo" class="accordion-content collapse">
                                <p>A. 특정 박테리아와 진균류가 털에 있을 수는 있지만, 코로나바이러스감염증을 일으키는 바이러스를 포함한 바이러스가 애완동물의 피부나 털로부터 사람에게 전파된다는 증거는 없습니다.
                                   그러나 동물들은 때때로 세균을 옮겨 사람들에게 질병을 가져다주므로 항상 애완동물과 그 외 다른 동물들 주변에서는 건강한 습관을 가지는 것이 중요합니다. 여기에는 그들과 접촉하기 전과 후에 손을 씻는 것이 포함됩니다</p>
                            </div>
                        </div>
                        <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6>
                                <a role="button" aria-expanded="true" aria-controls="collapseThree" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseThree">
                                  Q.3 애완동물을 코로나바이러스 검사 받게 해야 합니까?
                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                    </a>
                            </h6>
                            <div id="collapseThree" class="accordion-content collapse">
                                <p>A. 현재로는 애완동물의 코로나바이러스 정규 검사를 추천하지 않습니다. 저희는 아직까지 이 바이러스에 대하여 배우고 있는 단계에 있지만 어떤 경우에 사람에게서 동물에게 전파되는 것으로 보입니다. 
                                   현재까지의 제한된 정보에 근거하면 애완동물들이 바이러스를 전파할 위험은 낮다고 생각됩니다. 애완동물이 아프면 수의사와 상담하십시오.</p>
                            </div>
                        </div>
                    </div>
                </div>

</div>
</div>
</div>   
                
 </div>
                
                <div class="col-12 col-lg-3">
                    <div class="blog-sidebar-area">

                       
                            <div class="single-web-icon mb-30">
                                <i class="icon-user-1"></i>
                                 <a href="/user/updateForm"><img src="/resources/images/111.png" alt=""></a>                                
                                <span>회원정보수정</span>
                            </div>

                            <div class="single-web-icon mb-30">
                                <i class="icon-user-2"></i>
                                 <a href="#"><img src="/resources/images/112.png" alt=""></a>                                
                                <span>주문배송<br />&주문내역 조회</span>
                            </div>

                            <div class="single-web-icon mb-30">
                                <i class="icon-user-3"></i>
                                 <a href="#"><img src="/resources/images/111.png" alt=""></a>                                
                                <span>입양신청 현황</span>
                            </div>
                        
                            <div class="single-web-icon mb-30">
                                <i class="icon-user-4"></i>
                                 <a href="#"><img src="/resources/images/112.png" alt=""></a>                                
                                <span>내 게시물 관리 </span>
                            </div>
                            
                            <div class="single-web-icon mb-30">
                                <i class="icon-user-5"></i>
                                 <a href="#"><img src="/resources/images/111.png" alt=""></a>                                
                                <span>1:1문의 현황 </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>                     
 </div>              
</div>               
</div>
</c:if>


  <c:if test="${user.userGrade eq 'M'}">
    <!-- ##### 관리자꺼  Blog Area Start ##### -->
    <div class="blog-area section-padding-100-0">
        <div class="container">
              <div class="single-blog-post mb-50 wow fadeInUp" data-wow-delay="100ms">
            <div class="blog-post-thumb mt-30">
              <div class="blog-area section-padding-100-0">
              <div class="container">
              <div class="row">
                <div class="col-12 col-lg-9">   
                <div class="col-12">
                    <div class="elements-title mb-70">
                        <h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기준 또리스 현황</h2>
                        <br />
                         <!-- 오늘 날짜 찍기 -->
                            <div class="post-date">
                                <jsp:useBean id="now3" class="java.util.Date" />
                        <fmt:formatDate value="${now3}" pattern="dd" var="today3" />
                                <span><c:out value="${today3}"/></span>                               
                                                   
                                <jsp:useBean id="now4" class="java.util.Date" />
                        <fmt:formatDate value="${now4}" pattern="MM-yyyy" var="today4" />
                                <span><c:out value="${today4}"/></span>
                            </div>
                    </div>
                </div>

                <div class="col-12">
                    <!-- Loaders Area Start -->
                    <div class="our-skills-area">
                        <div class="row">

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle" class="circle" data-value="0.75">
                                        <div class="skills-text">
                                            <span>75%</span>
                                            <p>또리스 입양율</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle2" class="circle" data-value="0.83">
                                        <div class="skills-text">
                                            <span>94%</span>
                                            <p>보호자 만족도 </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle3" class="circle" data-value="0.25">
                                        <div class="skills-text">
                                            <span>17%</span>
                                            <p>또리스 파양율</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Skills Area -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single-skils-area mb-100">
                                    <div id="circle4" class="circle" data-value="0.95">
                                        <div class="skills-text">
                                            <span>95%</span>
                                            <p>또리스 시설평가</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>             
                <img src="/resources/images/notice.jpg" alt="" width="800px">

        <div class="elements-area mt-0 section-padding-0-100">
        <div class="container">
            <div class="row">

                <!-- ========== Progress Bars & Accordions ========== -->
                <div class="col-12">
                    <div class="elements-title mb-30">
                        <h2><br />[단순한 제안] <br /> 여기에 바로 공지사항 작성폼을 넣는건 어땨용, 아니면 관리자들끼리 메모장</h2>
                    </div>
                </div>
    
 <!-- ##### Accordians ##### -->
                <div class="col-12 col-lg-6">
                    <div class="accordions mb-100" id="accordion" role="tablist" aria-multiselectable="true">
                        <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6><a role="button" class="" aria-expanded="true" aria-controls="collapseOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                               Q.1 보호소에 있는 애완동물들을 입양하는 것은 안전한가요?
                                    <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                    <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                    </a></h6>
                            <div id="collapseOne" class="accordion-content collapse show">
                                <p>A. 현재까지의 제한된 정보에 의하면 동물들이 코로나바이러스감염증을 사람들에게 전파할 위험은 낮다고 생각됩니다. 보호소에 있는 애완동물을 포함한 동물들이 코로나바이러스감염증을 일으키는 바이러스를 전파시키는 데 중요한 역할을 한다고 생각할 만한 이유는 없습니다.</p>
                            </div>
                        </div>
                        <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6>
                                <a role="button" class="collapsed" aria-expanded="true" aria-controls="collapseTwo" data-parent="#accordion" data-toggle="collapse" href="#collapseTwo">
                                  Q.2 동물들은 코로나바이러스감염증을 일으키는 바이러스를 피부나 털에 가지고 있을 수 있습니까?
                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                        </a>
                            </h6>
                            <div id="collapseTwo" class="accordion-content collapse">
                                <p>A. 특정 박테리아와 진균류가 털에 있을 수는 있지만, 코로나바이러스감염증을 일으키는 바이러스를 포함한 바이러스가 애완동물의 피부나 털로부터 사람에게 전파된다는 증거는 없습니다.
                                   그러나 동물들은 때때로 세균을 옮겨 사람들에게 질병을 가져다주므로 항상 애완동물과 그 외 다른 동물들 주변에서는 건강한 습관을 가지는 것이 중요합니다. 여기에는 그들과 접촉하기 전과 후에 손을 씻는 것이 포함됩니다</p>
                            </div>
                        </div>
                        <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6>
                                <a role="button" aria-expanded="true" aria-controls="collapseThree" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseThree">
                                  Q.3 애완동물을 코로나바이러스 검사 받게 해야 합니까?
                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                    </a>
                            </h6>
                            <div id="collapseThree" class="accordion-content collapse">
                                <p>A. 현재로는 애완동물의 코로나바이러스 정규 검사를 추천하지 않습니다. 저희는 아직까지 이 바이러스에 대하여 배우고 있는 단계에 있지만 어떤 경우에 사람에게서 동물에게 전파되는 것으로 보입니다. 
                                   현재까지의 제한된 정보에 근거하면 애완동물들이 바이러스를 전파할 위험은 낮다고 생각됩니다. 애완동물이 아프면 수의사와 상담하십시오.</p>
                            </div>
                        </div>
                    </div>
                </div>

</div>
</div>
</div>              
 </div>
                
                <div class="col-12 col-lg-3">
                    <div class="blog-sidebar-area">

                       
                            <div class="single-web-icon mb-30">
                                <i class="icon-user-1"></i>
                                 <a href="/user/updateForm"><img src="/resources/images/111.png" alt=""></a>                                
                                <span>관리자정보 수정</span>
                            </div>

                            <div class="single-web-icon mb-30">
                                <i class="icon-user-2"></i>
                                 <a href="#"><img src="/resources/images/112.png" alt=""></a>                                
                                <span>[관리자ver] <br /> 주문배송<br />&주문내역</span>
                            </div>

                            <div class="single-web-icon mb-30">
                                <i class="icon-user-3"></i>
                                 <a href="#"><img src="/resources/images/111.png" alt=""></a>                                
                                <span>[관리자ver] <br /> 입양신청 현황</span>
                            </div>
                        
                            <div class="single-web-icon mb-30">
                                <i class="icon-user-4"></i>
                                 <a href="#"><img src="/resources/images/112.png" alt=""></a>                                
                                <span>[관리자ver] <br /> 게시물 관리</span>
                            </div>
                            
                            <div class="single-web-icon mb-30">
                                <i class="icon-user-5"></i>
                                 <a href="#"><img src="/resources/images/111.png" alt=""></a>                                
                                <span>[관리자ver] <br /> 1:1문의 현황</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>                     
 </div>              
</div>               
</div>
</c:if>


    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="/resources/js/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="/resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="/resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="/resources/js/active.js"></script>
    
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