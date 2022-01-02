<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<script>
$(document).ready(function(){
	$("#hiBbsTitle").focus();
	
	$("#btnList").on("click", function(){
		document.bbsForm.action = "/about/notice";
		document.bbsForm.submit();
	});
	
	$("#btnWrite").on("click", function(){
		$("#btnWrite").prop("disabled", true);
		
		if($.trim($("#hiBbsTitle").val()).length <= 0)
		{
			alert("제목을 입력하세요.");
			$("#hiBbsTitle").val("");
			$("#hiBbsTitle").focus();
			
			$("#btnWrite").prop("disabled", false);
			
			return;
		}
		
		if($.trim($("#hiBbsContent").val()).length <= 0)
		{
			alert("내용을 입력하세요.");
			$("#hiBbsContent").val("");
			$("#hiBbsContent").focus();
			
			$("#btnWrite").prop("disabled", false);
			
			return;
		}
		
		var form = $("#writeForm")[0];
		var formData = new FormData(form);
		
		$.ajax({
			type:"POST",
			enctype:'multipart/form-data',
			url:"/board/writeProc",
			data: formData,
			processData:false, //formData를 String으로 변환하지 않음
			contentType:false, //content-type헤더가 multipart/form-data로 전송
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
					alert("게시물이 등록되었습니다.");
					location.href = "/about/notice";
				}
				else if(response.code == 400)
				{
					alert("파라미터 값이 올바르지 않습니다.");
					$("#btnWrite").prop("disabled", false); //자징 버튼 활성화
				}
				else
				{
					alert("게시물 등록 중 오류가 발생했습니다.");
					$("#btnWrite").prop("disabled", false);
				}
			},
			error:function(error)
			{
				icia.common.error(error);
				alert("게시물 등록 중 오류가 발생하였습니다.");
				$("#btnWrite").prop("disabled", false);
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
            <h1 class="mb-3 bread font-1">We Are Family</h1>
             <p class="breadcrumbs"><span class="mr-2"><a href="/index">Home&nbsp;<i class="ion-ios-arrow"></i></a></span><span class="mr-2"><a href="/adout">About&nbsp;<i class="ion-ios-arrow-forward"></i></a></span><span>공지사항</span></p>
          </div>
        </div>
      </div>
    </section>

<div class="container">
   <h2>공지사항 쓰기</h2>
   <form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data">
      <input type="text" name="hiBbsTitle" id="hiBbsTitle" maxlength="100" style="ime-mode:active;" class="form-control mb-2" placeholder="제목을 입력해주세요." required />
      <div class="form-group">
         <textarea class="form-control" rows="10" name="hiBbsContent" id="hiBbsContent" style="ime-mode:active;" placeholder="내용을 입력해주세요" required></textarea>
      </div>
      <input type="file" id="hiBbsFile" name="hiBbsFile" class="form-control mb-2" placeholder="파일을 선택하세요." required />
      <input type="file" id="hiBbsFile" name="hiBbsFile" class="form-control mb-2" placeholder="파일을 선택하세요." required />
      <div class="form-group row">
         <div class="col-sm-12">
            <button type="button" id="btnWrite" class="btn btn-primary" title="저장">저장</button>
            <button type="button" id="btnList" class="btn btn-primary" title="리스트">리스트</button>
         </div>
      </div>
   </form>
   <form name="bbsForm" id="bbsForm" method="post">
      <input type="hidden" name="searchType" value="${searchType}" />
      <input type="hidden" name="searchValue" value="${searchValue}" />
      <input type="hidden" name="curPage" value="${curPage}" />
   </form>
</div>
</body>
</html>