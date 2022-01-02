<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/style2.css">

<script>
$(document).ready(function() {
	   
	   $("#_dogName").focus();
	   
	   $("#btnRegister").on("click", function(){
		   $("#btnRegister").prop("disabled", true);
		   
		   if($.trim($("#_dogName").val()).length <= 0)
			{
		      alert("강아지 이름을 입력해주세요.");
		      $("#_dogName").focus();
		      $("#btnRegister").prop("disabled", false);
		      return;
			}
		   
			var chk_radio = document.getElementsByName('_gender');

			var sel_type = null;

			for(var i=0; i<chk_radio.length; i++)
			{
				if(chk_radio[i].checked == true)
				{ 
					sel_type = chk_radio[i].value;
				}
			}

			if(sel_type == null)
			{
		        alert("강아지 성별을 선택하세요.");
		        $("#btnRegister").prop("disabled", false);
				return;
			}
			
			if($.trim($("#_endDate").val()).length <= 0)
			{
		      alert("입소일을 입력해주세요.");
		      $("#_endDate").focus();
		      $("#btnRegister").prop("disabled", false);
		      return;
			}
			
			
			var chk_radio2 = document.getElementsByName('_neutering');

			var sel_type2 = null;

			for(var i=0; i<chk_radio2.length; i++)
			{
				if(chk_radio2[i].checked == true)
				{ 
					sel_type2 = chk_radio2[i].value;
				}
			}

			if(sel_type2 == null)
			{
		        alert("중성화 여부를 선택하세요.");
		        $("#btnRegister").prop("disabled", false);
				return;
			}
		   
		   if($.trim($("#_dogSig").val()).length <= 0)
		   {
		      alert("강아지 특징을 입력해주세요");
		      $("#_dogSig").focus();
		      $("#btnRegister").prop("disabled", false);
		      return;
		   }
		   
		  if(!$("#_mainImg").val())
		  {
			  alert("메인 이미지를 선택해주세요");
		      $("#btnRegister").prop("disabled", false);
		      return;
		  }
		  
		  if(!$("#_subImg1").val())
		  {
			  alert("서브 이미지1을 선택해주세요");
		      $("#btnRegister").prop("disabled", false);
		      return;
		  }
		  
		  if(!$("#_subImg2").val())
		  {
			  alert("서브 이미지2를 선택해주세요");
		      $("#btnRegister").prop("disabled", false);
		      return;
		  }
		  
		  if(!$("#_subImg3").val())
		  {
			  alert("서브 이미지3을 선택해주세요");
		      $("#btnRegister").prop("disabled", false);
		      return;
		  }
		   
		    var form = $("#writeForm")[0];		//writeForm이 여러개 존재할 수 있기 때문
			var formData = new FormData(form);	//JSON 방식으로 넘길 때 데이터를 form으로 넘기겠다
			
			$.ajax({
				type:"POST",
				enctype:'multipart/form-data',
				url:"/adopt/dogWriteProc",
				data: formData,
				processData:false,		//formData를 String으로 변환하지 않음
				contentType:false,		//content-type헤더가 multipart/form-data로 전송
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
						alert("강아지가 등록되었습니다.");
						location.href = "/adopt/dogList";
					}
					else if(response.code == 400)
					{
						alert("입력 값이 올바르지 않습니다.");
						$("#btnRegister").prop("disabled", false);
					}
					else
					{
						alert("강아지 등록 중 오류가 발생했습니다.");
						$("#btnRegister").prop("disabled", false);
					}
				},
				error:function(error)
				{
					icia.common.error(error);
					alert("강아지 등록 중 오류가 발생하였습니다.");
					$("#btnRegister").prop("disabled", false);
				}
			});
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
             <p class="breadcrumbs">
	             <span class="mr-2"><a href="/index">Home&nbsp;&nbsp;<i class="ion-ios-arrow-forward"></i></a></span>
	             <span class="mr-2"><a href="/adopt/dogList">Adopt&nbsp;&nbsp;<i class="ion-ios-arrow-forward"></i></a></span>
	             <span class="mr-2"><a href="/adopt/dogList">또리소개&nbsp;&nbsp;<i class="ion-ios-arrow-forward"></i></a></span>
	             <span class="mr-2">Dog Register</span>
             </p>
          </div>
        </div>
      </div>
    </section>



<!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-10">
                    <div class="login-content">
                        <h3>강&nbsp;&nbsp;&nbsp;아&nbsp;&nbsp;&nbsp;지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등&nbsp;&nbsp;&nbsp;록</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                            <form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="_dogSeq"><b>1. 강아지 번호</b></label>
                                    <input type="text" class="form-control" id="_dogSeq" name="_dogSeq" value="${nextDogSeq}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="_dogName"><b>2. 강아지 이름</b></label>
                                    <input type="text" class="form-control" id="_dogName" name="_dogName" placeholder="강아지 이름을 입력하세요.">
                                </div>
                                <div class="form-group">
                                    <label for="_gender"><b>3. 강아지 성별</b></label>
                                    <br/>
                                    <label><input type="radio" name="_gender" value="F">여아</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label><input type="radio" name="_gender" value="M">남아</label>
                                </div>
                                <div class="form-group">
                                    <label for="_species"><b>4. 견종</b></label>
                                    <br/>
                                    <select name="_species" id="_species">
                                    	<option value="AAAA">치와와</option>
                                    	<option value="INTP">포메라니안</option>
                                    	<option value="ENTJ">스피츠</option>
                                    	<option value="INFP">시츄</option>
                                    	<option value="INFJ">요크셔테리어</option>
                                    	<option value="BBBB">말라뮤트</option>
                                    	<option value="ISTP">프렌치불독</option>
                                    	<option value="ISTJ">사모예드</option>
                                    	<option value="ISFP">시베리안허스키</option>
                                    	<option value="ESTP">웰시코기</option>
                                    	<option value="ESFP">닥스훈트</option>
                                    	<option value="ENFJ">푸들</option>
                                    	<option value="INTJ">시바견</option>
                                    	<option value="ESTJ">보더콜리</option>
                                    	<option value="ENFP">말티즈</option>
                                    	<option value="ISFJ">비숑프리제</option>
                                    	<option value="ESFJ">골든리트리버</option>
                                    	<option value="ENTP">비글</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="_endDate"><b>5. 입양일</b></label>
                                    <input type="date" class="form-control" id="_endDate" name="_endDate">
                                </div>
                                <div class="form-group">
                                    <label for="_neutering"><b>6. 중성화 여부</b></label>
                                    <br/>
                                    <label><input type="radio" name="_neutering" value="Y">예</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label><input type="radio" name="_neutering" value="N">아니오</label>
                                </div>
                                <div class="form-group">
                                    <label for="_dogSig"><b>7. 강아지 특징</b></label>
                                    <input type="text" class="form-control" id="_dogSig" name="_dogSig" placeholder="강아지  특징을 입력하세요. ex) 약  2개월 ">
                                </div>
                                <div class="form-group">
                                    <label for="_mainImg"><b>8. 메인 이미지</b></label>
                                    <input type="file" class="form-control" id="_mainImg" name="_mainImg" placeholder="메인 이미지를 선택하세요.">
                                    <h6 style="font-size:13px; color:red;">※ 메인 이미지는 반드시 '강아지 번호.jpg'로 첨부해주세요 (ex)강아지 번호 : 271, 파일명 : 271.jpg)</h6>
                                </div>
                                <div class="form-group">
                                    <label for="_subImg"><b>9. 서브 이미지</b></label>
                                    <input type="file" class="form-control" name="_subImg1" id="_subImg1" placeholder="파일을 선택하세요.">
                                    <h6 style="font-size:12px; color:red;">※ 서브 이미지1은 반드시 '강아지 번호_ (1).jpg'로 첨부해주세요 (ex)번호 : 271, 파일명 : 271_ (1).jpg, '_'와 '(1)' 사이 공백 한 칸)</h6>
                                    <input type="file" class="form-control" name="_subImg2" id="_subImg2" placeholder="파일을 선택하세요.">
                                    <h6 style="font-size:12px; color:red;">※ 서브 이미지2는 반드시 '강아지 번호_ (2).jpg'로 첨부해주세요 (ex)번호 : 271, 파일명 : 271_ (2).jpg, '_'와 '(2)' 사이 공백 한 칸)</h6>
                                    <input type="file" class="form-control" name="_subImg3" id="_subImg3" placeholder="파일을 선택하세요.">
                                    <h6 style="font-size:12px; color:red;">※ 서브 이미지3은 반드시 '강아지 번호_ (3).jpg'로 첨부해주세요 (ex)번호 : 271, 파일명 : 271_ (3).jpg, '_'와 '(3)' 사이 공백 한 칸)</h6>
                                </div>
                                <button type="button" id="btnRegister" class="btn oneMusic-btn mt-30">등&nbsp;&nbsp;&nbsp;록&nbsp;&nbsp;&nbsp;하&nbsp;&nbsp;&nbsp;기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->
    
    

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