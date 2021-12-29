<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%
	if(com.icia.web.util.CookieUtil.getCookie(request, (String)request.getAttribute("AUTH_COOKIE_NAME")) != null)
	{
%>
<nav class=" navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar" fixed-top>

		<div class="container">
		  <a class="navbar-brand" href="index.html">DDORI'S HOUSE</a>
		  <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		  </button>
	
		  <div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav nav ml-auto">
			  <li class="nav-item" ><a href="" class="nav-link"><span>About</span></a></li>
			  <li class="nav-item dropdown">
				<a class="nav-link" href="#Dog" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				<span> Adopt</span>
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				  <li><a class="dropdown-item" href="Adopt.html" id="box"><span><img src="./images/112.png" height="45px">또리소개</span></a></li>
				  <li><a class="dropdown-item" href="#" id="box"><span><img src="./images/111.png" height="45px">또리매칭</span></a></li>
				</ul>
			 </li>
	
			 <li class="nav-item dropdown">
				<a class="nav-link " href="#donation-section" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<span> Donation</span>
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				  <li><a class="dropdown-item" href="#" id="box"><span>후원안내</span></a></li>
				  <li><a class="dropdown-item" href="#" id="box"><span>또리's 메이드</span></a></li>
				</ul>
			 </li>

			  <li class="nav-item "><a href="#volunteer-section" class="nav-link"><span>Volunteer</span></a></li>
	
			  <li class="nav-item dropdown" >
				<a class="nav-link " href="#review-section" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				 <span> Community</span>
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				  <li><a class="dropdown-item" href="" id="box"><span>입양후기</span></a></li>
				  <li><a class="dropdown-item" href="#" id="box"><span>자유게시판</span></a></li>
				</ul>
			 </li>
	
			  <li class="nav-item"><a href="#contact-section" class="nav-link"><span>Contact</span></a></li>
	
			  <li class="nav-item"><a href="" class="nav-link"><span>Logout/Mypage</span></a></li>
			</ul>
			
		  </div>
		</div>
	  </nav>
<%
	}
	else
	{
%>
<nav class=" navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar" fixed-top>

		<div class="container">
		  <a class="navbar-brand" href="/index">DDORI'S HOUSE</a>
		  <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		  </button>
	
		  <div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav nav ml-auto">
			  <li class="nav-item" ><a href="" class="nav-link"><span>About</span></a></li>
			  <li class="nav-item dropdown">
				<a class="nav-link" href="#Dog" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				<span> Adopt</span>
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				  <li><a class="dropdown-item" href="Adopt.html" id="box"><span><img src="/resources/images/112.png" height="45px">또리소개</span></a></li>
				  <li><a class="dropdown-item" href="#" id="box"><span><img src="/resources/images/111.png" height="45px">또리매칭</span></a></li>
				</ul>
			 </li>
	
			 <li class="nav-item dropdown">
				<a class="nav-link " href="#donation-section" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<span> Donation</span>
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				  <li><a class="dropdown-item" href="#" id="box"><span>후원안내</span></a></li>
				  <li><a class="dropdown-item" href="#" id="box"><span>또리's 메이드</span></a></li>
				</ul>
			 </li>

			  <li class="nav-item "><a href="#volunteer-section" class="nav-link"><span>Volunteer</span></a></li>
	
			  <li class="nav-item dropdown" >
				<a class="nav-link " href="#review-section" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				 <span> Community</span>
				</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				  <li><a class="dropdown-item" href="" id="box"><span>입양후기</span></a></li>
				  <li><a class="dropdown-item" href="#" id="box"><span>자유게시판</span></a></li>
				</ul>
			 </li>
	
			  <li class="nav-item"><a href="#contact-section" class="nav-link"><span>Contact</span></a></li>
	
			  <li class="nav-item"><a href="/user/logJoin" class="nav-link"><span>Login/Join</span></a></li>
			</ul>
			
		  </div>
		</div>
	  </nav>
<%
	}
%>
