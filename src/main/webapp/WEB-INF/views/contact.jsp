<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/resources/dist/jquery.convform.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/resources/css/demo.css">

</head>
<body>
<section id="demo" z-index="6">
	    <div class="vertical-align">
	        <div class="container">
	            <div class="row">
	                <div class="" boarder="0">
	                    <div class="card no-border">
	                        <div id="chat" class="conv-form-wrapper">
	                            <form action="" method="GET" class="hidden" id="fq">
									<input type="text" data-conv-question= "<img src='/resources/images/image_6.jpg' height='230px' width='200px'>" data-no-answer="true">
	                                <select data-conv-question="안녕하세요 또리네하우스입니다! 무엇을 도와드릴까요?"  name="first-question">
	                                    <option value="pay">결제문의</option><br>
	                                    <option value="loc">위치문의</option><br>
										<option value="login">로그인오류</option><br>
										<option value="adopt">입양문의</option>
	                                </select>
	                            
									<div data-conv-fork="first-question">
	                                    <div data-conv-case="pay">
	                                        <input type="text" data-conv-question= "저희 결제방식은 카카오페이로 샬라샬라" data-no-answer="true">
	                                    </div>
	                                    
										<div data-conv-case="loc">
	                                        <input type="text" data-conv-question= "위치는 학익동 샬라샬라" data-no-answer="true">
	                                    </div>

										<div data-conv-case="login">
	                                        <input type="text" data-conv-question= "로그인 오류시 해결방법 샬라샬라" data-no-answer="true">
	                                    </div>

										<div data-conv-case="adopt">
	                                        <input type="text" data-conv-question= "입양은 샬라샬라 자세한 링크 입양공지 올리고" data-no-answer="true">
	                                    </div>
	                                </div>

									<div data-conv-fork="last-question" id="lq">
										<select data-conv-question="또리의 또 다른 궁금한 점이 있으신가요?" name="question2">
											<option value="another" id="another">다른것이 궁금해요!</option>
											<option value="yes" id="yes">상담사 연결하기</option>
											<option value="no" id="no">아뇨 없습니다.</option>
										</select>
									</div>

									<div data-conv-fork="question2">
										<div data-conv-case="another">
											
											<option value="">또리상담사</option>
											</select>
										</div>
									</div>

										<div data-conv-fork="question2">
											<div data-conv-case="yes">
												<select data-conv-question="감사합니다 또리상담사입니다 아래의 링크로 들어와주세요." id="result">
												<option value="">또리상담사</option>
												</select>
											</div>
										</div>

										<div data-conv-fork="question2">
											<div data-conv-case="no">
											<input type="text" data-conv-question= "감사합니다 또 놀러와주세요!" data-no-answer="true">
											<select data-conv-question="또리네하우스 둘러보기" id="result">
												<option value="">지금 바로 또리들을 만나러가봐요!<a href=""></a></option>
											</select>
											</div>
										</div>	
									
	                              
	                            </form>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	<script type="text/javascript" src="/resources/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="/resources/dist/autosize.min.js"></script>
	<script type="text/javascript" src="/resources/dist/jquery.convform.js"></script>
	<script>
		jQuery(function($){
			convForm = $('#chat').convform({selectInputStyle: 'disable'});
			console.log(convForm);
		});

		
	</script>
</body>
</html>