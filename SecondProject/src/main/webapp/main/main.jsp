<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Home</title>
	<link rel="icon" href="../img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="../css/style.css">
  
   <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.css'>
   <link rel="stylesheet" href="../css/maincard_style.css">
   
</head>
<body>
  <!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="../main/main.do"><img src="../img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href="../main/main.do">Home</a></li>
              
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">도서구매</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="../book/list.do">국내도서</a></li>
                  <li class="nav-item"><a class="nav-link" href="../bookf/list.do">해외도서</a></li>
                  <li class="nav-item"><a class="nav-link" href="../junggo/junggo_list.do">중고도서</a></li>
                </ul> 
            
              
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">인강&자격증</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="../video/video_list.do">인강</a></li>
                  <li class="nav-item"><a class="nav-link" href="../recommend/list.do">자격증 도서 추천</a></li>
                </ul>
              </li>
              
              
				
				<li class="nav-item submenu dropdown">
                <a href="../board/board.do" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">게시판</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="../board/board.do">자유게시판</a></li>
                  <li class="nav-item"><a class="nav-link" href="../board/board.do?type=q">문의게시판</a></li>
                  <li class="nav-item"><a class="nav-link" href="../news/main.do">뉴스</a></li>
                </ul>
              </li>
              
              	<c:if test="${sessionScope.id == 'admin' }">
	             <li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">관리자 페이지</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="cart/orderAdmin.do">회원 구매 승인</a></li>
	                  <li class="nav-item"><a class="nav-link" href="../member/admin.do">회원 관리</a></li>
	                </ul>
				</li>
				</c:if>
              
            </ul>
				
			<c:if test="${sessionScope.id == null }">
				<a href="../main/login.do"><h6>로그인</h6></a>&nbsp;|&nbsp;
				<a href="../member/join.do"><h6>회원가입</h6></a>
			</c:if>
			<c:if test="${sessionScope.id != null }">
				<h6>${sessionScope.id }으로 로그인됨</h6>&nbsp;&nbsp;&nbsp;
				<a href="../mypage/mypage.do?id=${sessionScope.id }"><h6>마이페이지</h6></a>&nbsp;|&nbsp;<br>
				<a href="../cart/list.do"><h6>장바구니</h6></a>&nbsp;|&nbsp;
				<a href="../member/logout.do"><h6>로그아웃</h6></a>
			</c:if>
			
            
          </div>
        </div>
      </nav>
    </div>
  </header>
	<!--================ End Header Menu Area =================-->

 <jsp:include page="${main_jsp }"></jsp:include>  

  </main>


  <!--================ Start footer Area  =================-->	
	<footer class="footer">
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no 
								divided deep moved us lan Gathering thing us land years living.
							</p>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved 
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="#">Home</a></li>
								<li><a href="#">Shop</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Product</a></li>
								<li><a href="#">Brand</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="../img/gallery/r1.jpg" alt=""></li>
								<li><img src="../img/gallery/r2.jpg" alt=""></li>
								<li><img src="../img/gallery/r3.jpg" alt=""></li>
								<li><img src="../img/gallery/r5.jpg" alt=""></li>
								<li><img src="../img/gallery/r7.jpg" alt=""></li>
								<li><img src="../img/gallery/r8.jpg" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>123, Main Street, Your City</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+123 456 7890 <br>
									+123 456 7890
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									free@infoexample.com <br>
									www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->



  <script src="../vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="../vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="../vendors/skrollr.min.js"></script>
  <script src="../vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="../vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="../vendors/jquery.ajaxchimp.min.js"></script>
  <script src="../vendors/mail-script.js"></script>
  <script src="../js/main.js"></script>
</body>
</html>