<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

    <link rel="stylesheet" href="/resources/css/style2.css">


<script type="text/javascript">

//★★★★★ 또리스 regForm.jsp다 헷갈리지 마라~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$(document).ready(function() {
    
   $("#userId").focus();
   
   $("#btnReg").on("click", function() { 
      
      // 모든 공백 체크 정규식
      var emptCheck = /\s/g;
      // 영문 대소문자, 숫자로만 이루어진 4~12자리 정규식
      var idPwCheck = /^[a-zA-Z0-9]{4,12}$/;
      // 한글로만 이루어진 1~20자리 정규식 //이름&닉네임 사용
      var nameNNameCheck = /^[가-힣]{1,20}$/;
     // 핸드폰번호 정규식 / 하이픈 없이
     var phoneNumCheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
            
      if($.trim($("#userId").val()).length <= 0)
      {
         alert("사용자 아이디를 입력하세요.");
         $("#userId").val("");
         $("#userId").focus();
         return;
      }
      
      if (emptCheck.test($("#userId").val())) 
      {
         alert("사용자 아이디는 공백을 포함할 수 없습니다.");
         $("#userId").focus();
         return;
      }
      
      if (!idPwCheck.test($("#userId").val())) 
      {
         alert("사용자 아이디는 4~12자의 영문 대소문자와 숫자로만 입력하세요");
         $("#userId").focus();
         return;
      }
      
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
      
      if($.trim($("#userEmail").val()).length <= 0)
      {
         alert("사용자 이메일을 입력해주세요.");
         $("#userEmail").val("");
         $("#userEmail").focus();
         return;
      }
      
      if(!fn_validateEmail($("#userEmail").val()))
      {
         alert("사용자 이메일 형식이 올바르지 않습니다.");
         $("#userEmail").focus();
         return;   
      }
      
      $("#userPwd").val($("#userPwd1").val());
      
      
      if($.trim($("#userPNum").val()).length <= 0)
      {
         alert("핸드폰 번호를 입력하세요. 예) ('-' 없이)01012341234");
         $("#userPNum").val("");
         $("#userPNum").focus();
         return;
      }
      
      if (!phoneNumCheck.test($("#userPNum").val()))  ///////////////////////////////////////
      {
         alert("핸드폰 번호를 입력하세요. 예) ('-' 없이)01012341234");
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
      

      //ajax 통신연결
      $.ajax({
        type:"POST",
        url:"/user/idCheck", 
        data:{
           userId:$("#userId").val()
        },
        datatype:"JSON", 
        beforeSend:function(xhr){
          xhr.setRequestHeader("AJAX", "true"); 
        },
        success:function(response){
           if(response.code == 0) 
           {
              fn_userReg();
           }
           else if(response.code == 100)
            {
              alert("중복 된 아이디 입니다."); 
              $("#userId").focus();
           }
           else if(response.code ==400) 
           {
              alert("파라미터 값이 잘못 되었습니다.");
              $("#userId").focus();
           }
           else
            {
              alert("오류가 발생했습니다.");
              $("#userId").focus();
           }
        },
        complete:function(data)
        {
           icia.common.log(data);
        },
        error:function(xhr,status,error)
        {
           icia.common.error(error);
        }
      });
   });
});

function fn_userReg()
{
   //ajax
    $.ajax({
       type:"POST",
       url:"/user/regProc",
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
       datatype:"JSON", //dataType 이거하면 안됨 오류남...!!!!!!!!
       beforeSend:function(xhr){
         xhr.setRequestHeader("AJAX", "true"); 
       },
       success:function(response){
          if(response.code == 0) 
          {//중복없이 정상일 때 0으로 넘기자고
             alert("회원가입이 되었습니다.");
              location.href = "/index";
          }
          else if(response.code == 100)
           {
             alert("중복 된 아이디 입니다."); 
             $("#userId").focus();
          }
          else if(response.code == 400) 
          {//파라미터가 잘못될경우, 유저아이디가 안넘어왔을 경우
             alert("파라미터 값이 잘못 되었습니다.");
             $("#userId").focus();
          }
          else if(response.code == 500)
         {
            alert("회원가입 중 오류가 발생했습니다.");
            $("#userId").focus();
         }            
          else
           {//나머지
             alert("오류가 발생했습니다.");
             $("#userId").focus();
          }
       },
       complete:function(data)
       {
          icia.common.log(data);
       },
       error:function(xhr,status,error)
       {
          icia.common.error(error); 
       }
  });
}

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
                                     <h3>WELCOME DDORI's HOUSE</h3>
    <div class="row mt-5">
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <form id="regForm" method="post">
                <div class="form-group">
                    <label for="userId">DDORI's Id</label>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력해주세요." maxlength="12" />
                </div>
                <div class="form-group">
                    <label for="userPwd1">DDORI's Password</label>
                    <input type="password" class="form-control" id="userPwd1" name="userPwd1" placeholder="비밀번호를 입력해주세요." maxlength="12" />
                </div>
                <div class="form-group">
                    <label for="userPwd2">DDORI's Password (Double Check)</label>
                    <input type="password" class="form-control" id="userPwd2" name="userPwd2" placeholder="재확인 비밀번호를 입력해주세요." maxlength="12" />
                </div>
                <div class="form-group">
                    <label for="userName">User Name</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="성함을 입력해주세요." maxlength="20" />
                </div>           
                <div class="form-group">
                    <label for="userEmail">User Email</label>
                    <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요." maxlength="30" />
                </div>
                <div class="form-group">
                    <label for="userAddress">User Address</label>
                    <input type="text" class="form-control" id="userAddress" name="userAddress" placeholder="주소를  입력해주세요. 미기재 경우 상품구매가 제한됩니다." maxlength="30" />
                </div>
                <div class="form-group">
                    <label for="userPNum">User Phone Number</label>
                    <input type="text" class="form-control" id="userPNum" name="userPNum" placeholder="핸드폰 번호를 입력해주세요. 예) ('-' 없이) 01012341234" maxlength="11" />
                </div>  
                 <div class="form-group">
                    <label for="userBDate">User Birth</label>
                    <input type="date" class="form-control" id="userBDate" name="userBDate" placeholder="생년월일을 입력해주세요." maxlength="30" />
                </div> 
                <div class="form-group">
                    <label for="userNName">User NickName</label>
                    <input type="text" class="form-control" id="userNName" name="userNName" placeholder="닉네임을 입력해주세요." maxlength="20" />
                </div>                                                                           
                <input type="hidden" id="userPwd" name="userPwd" value="" />
                <button type="button" id="btnReg" class="btn btn-primary">등록</button>

            </form>
        </div>
    </div>
</div>
   </div>
</div>
       </div>

</section>
</body>
</html>