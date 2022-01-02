<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

    <link rel="stylesheet" href="/resources/css/style2.css">
    
<script type="text/javascript">
$(document).ready(function() {

   $("#btnUpdate").on("click", function() {
      
      // 모든 공백 체크 정규식
      var emptCheck = /\s/g;
      // 영문 대소문자, 숫자로만 이루어진 4~12자리 정규식
      var idPwCheck = /^[a-zA-Z0-9]{4,12}$/;
      // 한글로만 이루어진 1~20자리 정규식 //이름&닉네임 사용
      var nameNNameCheck = /^[가-힣]{1,20}$/;
     // 핸드폰번호 정규식 / 하이픈 없이
     var phoneNumCheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
            
      if($.trim($("#userPwd1").val()).length <= 0)
      {
         alert("비밀번호를 입력하세요.");
         $("#userPwd1").val("");
         $("#userPwd1").focus();
         return;
      }
      
      if (emptCheck.test($("#userPwd1").val())) 
      {
         alert("비밀번호는 공백을 포함할 수 없습니다.");
         $("#userPwd1").focus();
         return;
      }
      
      if (!idPwCheck.test($("#userPwd1").val())) 
      {
         alert("비밀번호는 영문 대소문자와 숫자로 4~12자리 입니다.");
         $("#userPwd1").focus();
         return;
      }
      
      if ($("#userPwd1").val() != $("#userPwd2").val()) 
      {
         alert("비밀번호가 일치하지 않습니다.");
         $("#userPwd2").focus();
         return;
      }

      $("#userPwd").val($("#userPwd1").val());
      
      if($.trim($("#userName").val()).length <= 0)
      {
         alert("사용자 이름을 입력하세요.");
         $("#userName").val("");
         $("#userName").focus();
         return;
      }
      
      if (!nameNNameCheck.test($("#userName").val()))  ///////////////////////////////////////
      {
         alert("사용자 이름은 문자로 1~20자리 입력하세요.");
         $("#userName").focus();
         return;
      }
      
      if(!fn_validateEmail($("#userEmail").val()))
      {
         alert("사용자 이메일 형식이 올바르지 않습니다.");
         $("#userEmail").focus();
         return;   
      }
      
      if($.trim($("#userEmail").val()).length <= 0)
      {
         alert("사용자 이메일을 입력해주세요.");
         $("#userEmail").val("");
         $("#userEmail").focus();
         return;
      } 
      
      
      if($.trim($("#userPNum").val()).length <= 0)
      {
         alert("연락처를 입력하세요. 예) 01012341234");
         $("#userPNum").val("");
         $("#userPNum").focus();
         return;
      }
      
      if (!phoneNumCheck.test($("#userPNum").val()))  ///////////////////////////////////////
      {
         alert("핸드폰 번호를 입력하세요. 예) ('-'없이) 01012341234");
         $("#userPNum").focus();
         return;
      }
      
      if (emptCheck.test($("#userPNum").val())) 
      {
         alert("핸드폰 번호는 공백을 포함할 수 없습니다.");
         $("#userPNum").focus();
         return;
      }

      if($.trim($("#userBDate").val()).length <= 0)
      {
         alert("생년월일을 입력하세요");
         $("#userBDate").val("");
         $("#userBDate").focus();
         return;
      }  
      
      if($.trim($("#userNName").val()).length <= 0)
      {
         alert("닉네임을 입력하세요");
         $("#userNName").val("");
         $("#userNName").focus();
         return;
      } 
      
      if (!nameNNameCheck.test($("#userNName").val()))  ///////////////////////////////////////
      {
         alert("닉네임은 문자로 1~20자리로 입력하세요.");
         $("#userNName").focus();
         return;
      }
      
      $.ajax({
         type : "POST",
         url:"/user/updateProc",
         data:{
                 userId:$("#userId").val(),
                 userPwd:$("#userPwd").val(),
                 userName:$("#userName").val(),
                 userEmail:$("#userEmail").val(),
                 userAddress:$("#userAddress").val(),
                 userPNum:$("#userPNum").val(),
                 userBDate:$("#userBDate").val(),
                 userNName:$("#userNName").val()
         },
         datatype:"JSON",
         beforeSend:function(xhr){
          xhr.setRequestHeader("AJAX", "true");  
         },
         success:function(response)
         {
            if(response.code==0)
            {
               alert("회원정보가 수정되었습니다.");
               location.href = "/user/myPage";
            }
            else if(response.code==400)
            {
               alert("파리미터 값이 올바르지 않습니다.");
               $("#userPwd1").focus();
            }
            else if(response.code==404)
            {
               alert("회원정보가 없습니다.");
               location.href = "/";
            }
            else if(response.code==500)
            {
               alert("회원정보 수정 중 오류가 발생했습니다.");
               $("#userPwd1").focus();
            }
            else
            {
               alert("회원정보 수정 중 오류가 발생했습니다.");
               $("#userPwd1").focus();
            }
         },
         complete:function(data)
         {
            icia.common.log(data);
         },
         error:function(xhr, status, error)
         {
            icia.common.error(error);
         }
      });
   });
});

function fn_validateEmail(value)
{
   var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
   
   return emailReg.test(value);
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

   </br>
   </br>
   </br>
   
    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(/resources/images/0.PNG);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Sign Up</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    
        <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
               <div class="col-12 col-lg-8">
                    <div class="login-content">
                       <h3>회원정보 수정</h3>
                       
    <div class="row mt-5">
    </div>
    
    <div class="row mt-2">
        <div class="col-12">
            <form>
                <div class="form-group">
                    <label for="username">사용자 아이디</label>
                    <h3>${user.userId}</h3>
                </div>
                <div class="form-group">
                    <label for="username">비밀번호</label>
                    <input type="password" class="form-control" id="userPwd1" name="userPwd1" value="${user.userPwd}" placeholder="비밀번호" maxlength="12" />
                </div>
                <div class="form-group">
                    <label for="username">비밀번호 확인</label>
                    <input type="password" class="form-control" id="userPwd2" name="userPwd2" value="${user.userPwd}" placeholder="비밀번호 확인" maxlength="12" />
                </div>
                <div class="form-group">
                    <label for="username">사용자 이름</label>
                    <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="사용자 이름" maxlength="15" />
                </div>
                <div class="form-group">
                    <label for="userEmail">사용자 이메일</label>
                    <input type="text" class="form-control" id="userEmail" name="userEmail" value="${user.userEmail}" placeholder="사용자 이메일" maxlength="30" />
                </div>
                <div class="form-group">
                    <label for="userAddress">주소</label>
                    <input type="text" class="form-control" id="userAddress" name="userAddress" value="${user.userAddress}" placeholder="사용자 주소. 미기재시 상품구매가 제한됩니다." maxlength="30" />
                </div>                
                <div class="form-group">
                    <label for="userPNum">연락처</label>
                    <input type="text" class="form-control" id="userPNum" name="userPNum" value="${user.userPNum}" placeholder="사용자 연락처" maxlength="11" />
                </div>                
                <div class="form-group">
                    <label for="userBDate">생년월일</label>
                    <input type="text" class="form-control" id="userBDate" name="userBDate" value="${user.userBDate}" placeholder="사용자 생년월일" maxlength="30" />
                </div>
                <div class="form-group">
                    <label for="userNName">닉네임</label>
                    <input type="text" class="form-control" id="userNName" name="userNName" value="${user.userNName}" placeholder="사용자 닉네임" maxlength="30" />
                </div>                                
                
                
                <input type="hidden" id="userId" name="userId" value="${user.userId}" />
                <input type="hidden" id="userPwd" name="userPwd" value="" />
                <input type="hidden" id="userPwdOld" name="userPwdOld" value="${user.userPwd}" />
                

                
                <button type="button" id="btnUpdate" class="btn btn-primary">수정</button>
            </form>
        </div>
    </div>
</div>
</div>
</div>

</section>

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
    
    
</body>
</html>   