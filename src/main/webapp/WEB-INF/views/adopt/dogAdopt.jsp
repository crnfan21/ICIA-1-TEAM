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
	   
	   $("#q1").focus();
	   
	   $("#btnAdopt").on("click", function(){
		   $("#btnAdopt").prop("disabled", true);
		   
		   if($.trim($("#q1").val()).length <= 0)
			{
		      alert("1번 질문을 입력해주세요.");
		      $("#q1").focus();
		      $("#btnAdopt").prop("disabled", false);
		      return;
			}
		   
		   if($.trim($("#q2").val()).length <= 0)
		   {
		      alert("2번 질문을 입력해주세요.");
		      $("#q2").focus();
		      $("#btnAdopt").prop("disabled", false);
		      return;
		   }
		   
			var chk_radio = document.getElementsByName('living');

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
		        alert("3번 질문을 선택하세요.");
		        $("#btnAdopt").prop("disabled", false);
				return;
			}
			
			var chk_radio2 = document.getElementsByName('living2');

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
		        alert("4번 질문을 선택하세요.");
		        $("#btnAdopt").prop("disabled", false);
				return;
			}
		   
		   if($.trim($("#q5").val()).length <= 0)
		   {
		      alert("5번 질문을 입력해주세요");
		      $("#q5").focus();
		      $("#btnAdopt").prop("disabled", false);
		      return;
		   }
		   
			for(var i = 1; i < $("input:checkbox[name=agreeBox]").length; i++)
			{
				var j = '#chkBox' + i;
				
				if(!$(j).is(':checked'))
				{
					alert(i + "번항목에 동의해주세요");
					$("#btnAdopt").prop("disabled", false);
				    return;
				}
			}
		   
		   $.ajax({
		      type : "POST",
		      url : "/adopt/adoptProc",
		      data : {
		         q1: $("#q1").val(),
		         q2: $("#q2").val(),
		         q3: sel_type,
		         q4: sel_type2,
		         q5: $("#q5").val(),
		         dogSeq: $("#dogSeq").val()
		      },
		      datatype : "JSON",
		      beforeSend : function(xhr){
		            xhr.setRequestHeader("AJAX", "true");
		        },
		        success:function(response)
				{
					if(response.code == 0)
					{
						alert("입양 신청이 완료되었습니다.");
						location.href = "/adopt/dogList";
					}
					else if(response.code == 400)
					{
						alert("입력 값이 올바르지 않습니다.");
						$("#btnAdopt").prop("disabled", false);		//저장 버튼 활성화
					}
					else
					{
						alert("입양 신청 중 오류가 발생했습니다.");
						$("#btnAdopt").prop("disabled", false);
					}
				},
				error:function(error)
				{
					icia.common.error(error);
					alert("입양 신청 중 오류가 발생하였습니다.");
					$("#btnAdopt").prop("disabled", false);
				}
		   });
	   });
});

function fn_view(dogSeq)
{
	document.dogForm.dogSeq.value = dogSeq;
	document.dogForm.action = "/adopt/dogView";
	document.dogForm.submit();
}

function selectAll(selectAll)  
{
	  const checkboxes 
	       = document.getElementsByName('agreeBox');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
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
             <p class="breadcrumbs">
	             <span class="mr-2"><a href="/index">Home&nbsp;&nbsp;<i class="ion-ios-arrow-forward"></i></a></span>
	             <span class="mr-2"><a href="/adopt/dogList">Adopt&nbsp;&nbsp;<i class="ion-ios-arrow-forward"></i></a></span>
	             <span class="mr-2"><a href="/adopt/dogList">또리소개&nbsp;&nbsp;<i class="ion-ios-arrow-forward"></i></a></span>
	             <span class="mr-2"><a href="javascript:void(0)" onclick="fn_view(${dog.dogSeq})">${dog.dogName}&nbsp;&nbsp;<i class="ion-ios-arrow-forward"></i></a></span>
	             <span class="mr-2">입양신청</span>
             </p>
          </div>
        </div>
      </div>
    </section>



<!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-12">
                    <div class="login-content">
                        <h3>입&nbsp;&nbsp;&nbsp;양&nbsp;&nbsp;&nbsp;신&nbsp;&nbsp;&nbsp;청</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                            <form action="#" method="post">
                                <div class="form-group">
                                    <label for="q1"><b>1. 입양을 결정하시기 까지 얼마나 오랜 시간을 고민하셨나요?</b></label>
                                    <input type="text" class="form-control" id="q1" placeholder="ex) 1주일,  3달,  1년 등등">
                                </div>
                                <div class="form-group">
                                    <label for="q2"><b>2. 입양을 원하시는 가장 큰 이유는 무엇인가요?</b></label>
                                    <input type="text" class="form-control" id="q2" placeholder="ex) 유기견 봉사 경험, 평소 동물의 처우에 관심이 많아서 등등">
                                </div>
                                <div class="form-group">
                                    <label for="living"><b>3. 주거의 형태는?</b></label>
                                    <br/>
                                    <label><input type="radio" name="living" value="1">단독주택</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label><input type="radio" name="living" value="2">공동주택</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label><input type="radio" name="living" value="3">아파트</label>
                                </div>
                                <div class="form-group">
                                    <label for="living2"><b>4. 임대한 주택의 경우 집주인의 동의를 얻으셨나요?</b></label>
                                    <br/>
                                    <label><input type="radio" name="living2" value="1">네</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label><input type="radio" name="living2" value="2">아니오</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label><input type="radio" name="living2" value="3">해당없음</label>
                                </div>
                                <div class="form-group">
                                    <label for="q5"><b>5. 키우고 계신 반려동물이 있나요? 있다면 소개해주세요.</b></label>
                                    <input type="text" class="form-control" id="q5" placeholder="ex) 강아지 2마리, 순하고 다른 강아지들과 잘 어울림">
                                </div>
                                <div class="form-group">
                                    <label for="chkBox"><b>6. 입양동의</b></label>
                                    <table style="background:#FFC0CB; width:100%;" id="chkBox">
	                                 
	                                    <tr>
	                                    	<td>1) 본인(이하 '입양인'이라 합니다.)은 'DDORI'S HOUSE' (이하 '단체'라 합니다.)를 통하여 반려동물(이하 '입양동물'이라 합니다.)을 입양함에 있어 입양동물이 자연사하는 시점까지 책임 있는 보호자로서 입양동물에게 최적의 환경과 보살핌을 제공할 것이며 최선을 다하여 입양동물을 보호할 의무가 있습니다.</td>
	                                    </tr> 
	                                    <tr>
	                                    	<td><label><input type="checkbox" name="agreeBox" id="chkBox1">동의합니다.</label></td>
	                                    </tr>
	                                    <tr>
	                                    <td><br /></td>
	                                    </tr>
	                                    
	                                    <tr>
	                                    	<td>2) 입양인은 입양인이나 혹은 가족을 포함한 제 3자의 고의 또는 과실로 인하여 입양동물에 대한 학대행위가 발생하거나 입양동물이 양도, 매매, 유기, 유실된 경우에는 단체로부터의 어떠한 민, 형사상의 처벌에도 이의를 제기하지 않고 따르는데 동의합니다. 입양인은 입양동물이 양도, 매매, 유기, 유실된 경우에 그 즉시로 단체에 통지할 의무를 지니며 입양동물을 되찾기 위한 노력에 최선을 다하여 협조할 의무가 있습니다.</td>
	                                    </tr> 
	                                    <tr>
	                                    	<td><label><input type="checkbox" name="agreeBox" id="chkBox2">동의합니다.</label></td>
	                                    </tr>
	                                    <tr>
	                                    <td><br /></td>
	                                    </tr>
	                                    
	                                    <tr>
	                                    	<td>3) 입양인은 입양동물에게 양질의 사료와 깨끗한 물을 공급하고, 적합하고 적절한 운동, 질병에 대한 예방접종, 정기 건강검진을 시행하는 등, 꼭 필요한 복지를 제공할 의무가 있습니다.</td>
	                                    </tr> 
	                                    <tr>
	                                    	<td><label><input type="checkbox" name="agreeBox" id="chkBox3">동의합니다.</label></td>
	                                    </tr>
	                                    <tr>
	                                    <td><br /></td>
	                                    </tr>
	                                    
	                                    <tr>
	                                    	<td>4) 만일 입양동물이 질병에 걸렸을 때 입양인은 신속하게 필요한 수의학적 치료를 받게 하고 성실하게 그 치료에 임할 것이며 만일 입양동물의 완치가 불가능하고 그 고통이 극심한 경우에는 이를 단체에 통지하고 단체와의 협의 하에 대안을 강구하여야 하며 임의로 처리해서는 안 됩니다. 입양인은 입양동물이 자연사한 경우에도 즉시 이 사실을 단체에 통지할 의무가 있습니다.</td>
	                                    </tr> 
	                                    <tr>
	                                    	<td><label><input type="checkbox" name="agreeBox" id="chkBox4">동의합니다.</label></td>
	                                    </tr>
	                                    <tr>
	                                    <td><br /></td>
	                                    </tr>
	                                    
	                                    <tr>
	                                    	<td>5) 입양인은 상시 입양동물에게 입양인의 연락처가 기재된 이름표를 반드시 착용시켜야 하며 만일 입양인의 연락처가 변경되거나 주거지의 변동사항이 있을 시에는 즉시 단체에 이에 대한 정보를 통지할 의무가 있습니다.</td>
	                                    </tr> 
	                                    <tr>
	                                    	<td><label><input type="checkbox" name="agreeBox" id="chkBox5">동의합니다.</label></td>
	                                    </tr>
	                                    <tr>
	                                    <td><br /></td>
	                                    </tr>
	                                    
	                                    <tr>
	                                    	<td>6) 입양인은 입양 후 단체에서 시행하는 입양동물의 모니터링을 위한 전화 또는 방문에 응할 것이며 단체가 입양동물의 면회나 사진을 요구할 시 언제든지 이에 협조할 의무가 있습니다.</td>
	                                    </tr> 
	                                    <tr>
	                                    	<td><label><input type="checkbox" name="agreeBox" id="chkBox6">동의합니다.</label></td>
	                                    </tr>
	                                    <tr>
	                                    <td><br /></td>
	                                    </tr>
	                                    
	                                    <tr>
	                                    	<td>7) 입양인은 단체의 입양동물 중성화수술 방침에 동의하며, 입양 전에 미리 중성화수술이 시행될 수 없는 경우에는 입양동물의 건강상태가 양호하고 그 연령이 수술하기에 적합한 조건이 갖추어지는 즉시로 중성화수술을 시행하고 이에 대한 사실을 즉시 단체에 통지하며 중성화수술 전이라 할지라도 그 어떠한 경우에도 입양동물을 교배하지 않을 의무가 있습니다.</td>
	                                    </tr> 
	                                    <tr>
	                                    	<td><label><input type="checkbox" name="agreeBox" id="chkBox7">동의합니다.</label></td>
	                                    </tr>
	                                    <tr>
	                                    <td><br /></td>
	                                    </tr>
	                                    
	                                    <tr>
	                                    	<td>8) 입양인은 개인적인 사유로 파양을 하는 경우에는, 반드시 단체에게 통보해야 하며 임의대로 재입양할 수 없습니다. 또한, 단체에게 입양비 반환을 청구할 수 없습니다.</td>
	                                    </tr> 
	                                    <tr>
	                                    	<td><label><input type="checkbox" name="agreeBox" id="chkBox8">동의합니다.</label></td>
	                                    </tr>
	                                    <tr>
	                                    <td><br /></td>
	                                    </tr>
	                                    
	                                    <tr>
	                                    	<td>9) 입양인은 입양 후에도, 만일 단체에서 입양인이 입양동물을 돌볼 여건과 환경이 적합하지 않다고 판단하여 입양동물의 반환을 요구하는 경우에는 이에 이의를 제기하지 않고 적극 협조할 의무가 있습니다.</td>
	                                    </tr> 
	                                    <tr>
	                                    	<td><label><input type="checkbox" name="agreeBox" id="chkBox9">동의합니다.</label></td>
	                                    </tr>
	                                    <tr>
	                                    <td><br /></td>
	                                    </tr>
	                                    
	                                    <tr>
	                                    	<td>10) 입양인은 입양 시에, 유기동물의 구조와 치료, 보호비로 사용되는 일정금액의 맞음비 7만원을 납부해주셔야 합니다. (최종 입양 시 납부 방법 안내)</td>
	                                    </tr> 
	                                    <tr>
	                                    	<td><label><input type="checkbox" name="agreeBox" id="chkBox10">동의합니다.</label></td>
	                                    </tr>
	                                    <tr>
	                                    <td><br /></td>
	                                    </tr>
	                                    
	                                    <tr>
	                                    	<td>11) 입양인은 입양 후 일정 기간 모니터링을 위한 전화연락이나 방문이 필요할 수 있습니다.</td>
	                                    </tr> 
	                                    <tr>
	                                    	<td><label><input type="checkbox" name="agreeBox" id="chkBox11">동의합니다.</label></td>
	                                    </tr>
                                    </table>
                                <label><input type="checkbox" name="agreeBox" id="checkAll" onclick='selectAll(this)'>전체 동의</label><br /><br />
                                <b>입양인은 이하에 신청함으로써 상기의 조항에 동의하며, 입양인이 상기의 조항을 위반 시에는 단체의 어떠한 처벌조치에도 이의를 제기함이 없이 따를 것을 서약합니다. </b>
                                </div>
                                <button type="button" id="btnAdopt" class="btn oneMusic-btn mt-30">신&nbsp;&nbsp;&nbsp;청&nbsp;&nbsp;&nbsp;하&nbsp;&nbsp;&nbsp;기</button>
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


	<form name="dogForm" id="dogForm" method="post">
		<input type="hidden" name="dogSeq" id="dogSeq" value="${dog.dogSeq}" />
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