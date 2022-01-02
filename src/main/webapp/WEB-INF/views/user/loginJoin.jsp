<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDORILS'S HOUSE LOGIN</title>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

  
    <link rel="stylesheet" href="/resources/css/style2.css">
    
</head>

<script type="text/javascript"> 
$(document).ready(function() {
   
   $("#userId").focus();
   
   $("#userId").on("keypress", function(e){
      if(e.which == 13)
      {   
         fn_loginCheck();
      }      
   });
   
   $("#userPwd").on("keypress", function(e){      
      if(e.which == 13)
      {   
         fn_loginCheck();
      }      
   });
      
   $("#btnLogin").on("click", function() {
      fn_loginCheck();
   });
   
   $("#btnReg").on("click", function() {
      location.href = "/user/regForm";
   });
});

function fn_loginCheck()
{
   if($.trim($("#userId").val()).length <= 0)
   {
      alert("아이디를 입력하세요.");
      $("#userId").focus();
      return;
   }
   
   if($.trim($("#userPwd").val()).length <= 0)
   {
      alert("비밀번호를 입력하세요.");
      $("#userPwd").focus();
      return;
   }
   
   $.ajax({
      type : "POST",
      url : "/user/login",
      data : {
         userId: $("#userId").val(),
         userPwd: $("#userPwd").val() 
      },
      datatype : "JSON",
      beforeSend : function(xhr){
            xhr.setRequestHeader("AJAX", "true");
        },
      success : function(response) {
         
         if(!icia.common.isEmpty(response))
         {
            icia.common.log(response);
            
            // var data = JSON.parse(obj);
            var code = icia.common.objectValue(response, "code", -500);
            
            if(code == 0)
            {
               location.href = "/index"; 
            }
            else
            {
               if(code == -1)
               {
                  alert("비밀번호가 올바르지 않습니다.");
                  $("#userPwd").focus();
               }
               else if(code == 404)
               {
                  alert("아이디와 일치하는 사용자 정보가 없습니다.");
                  $("#userId").focus();                  
               }
               else if(code == 403)
               {
                  alert("사용이 중지된 사용자 입니다.");
                  $("#userId").focus();
               }                  
               else if(code == 400)
               {
                  alert("파라미터 값이 올바르지 않습니다.");
                  $("#userId").focus();
               }
               else
               {
                  alert("오류가 발생하였습니다.");
                  $("#userId").focus();
               }   
            }   
         }
         else
         {
            alert("오류가 발생하였습니다.");
            $("#userId").focus();
         }
      },
      complete : function(data) 
      { 
         // 응답이 종료되면 실행, 잘 사용하지않는다
         icia.common.log(data);
      },
      error : function(xhr, status, error) 
      {
         icia.common.error(error);
      }
   });
}
</script>


<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>   
<br />
<br />
<br />

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(/resources/images/0.PNG);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Login</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->


<!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>Welcome Back</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                            <form action="#" method="post">
                                <div class="form-group">
                                    <label for="userId">DDORI's Id</label>
                                    <input type="text" class="form-control" id="userId" placeholder="Please wirte your Id.">

                                </div>
                                <div class="form-group">
                                    <label for="userPwd">DDORI's Password</label>
                                    <input type="password" class="form-control" id="userPwd" placeholder="Please write your Password.">
                                </div>
                                <button type="button" id="btnLogin" class="btn oneMusic-btn mt-30">Login</button>
                                <button type="button" id="btnReg" class="btn oneMusic-btn mt-30">JOIN</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->
    
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