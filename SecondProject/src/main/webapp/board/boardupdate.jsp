<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Blog</title>
	<link rel="icon" href="../img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../vendors/linericon/style.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(function(){
	if('<c:out value="${vo.isFree}"/>'==1) type='f'
	$.ajax({
		type:'GET',
		url:'rightNav.do',
		data:{"type":<c:out value="${vo.isFree}"/>==1?'f':'q'},
		success:function(result){
			$('.blog_right_sidebar').html(result);
		}
	});
})
</script>
</head>  
<body>

	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Upload Post</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Upload Post</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->


  <!--================Blog Area =================-->
	<section class="blog_area single-post-area py-80px section-margin--small">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
				<form action="update_ok.do" name=frm method="post">
					<div class="single-post row">
					<div class="col-lg-12">
						<span>THUMBNAIL</span>
						<div>
							<input name="img" type="file" id="img" onchange="setThumbnail(event);"/><br>
							<div id="image_container">
							<img src="${vo.poster}" style="width:100%">
							</div>
						</div>
					</div>

					<div class="col-lg-12 col-md-9 blog_details">
						<input type="hidden" name=id value="${sessionScope.id}">
						<input type="hidden" name="poster" value="">
						<input type="hidden" name="no" value="${vo.no}">
						<div class="form-group">
						<span>TITLE</span>
							<input type="text" class="form-control" value="${vo.title}" name='title' id="title" placeholder="Insert Title" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Insert Title'">
						</div>
						<div class="form-group">
						<span>CONTENT</span>
							<textarea class="form-control mb-10" rows="20" name="content" id='content' placeholder="Insert Content" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Insert Content'"
										required="">${vo.content}</textarea>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="row">
								<div class="col-6">
									<img class="img-fluid" src="img/blog/post-img1.jpg" alt="">
								</div>
								<div class="col-6">
									<img class="img-fluid" src="img/blog/post-img2.jpg" alt="">
								</div>
								<div class="col-lg-12 mt-4">
									<p>
										MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money
										on boot camp when you can get the MCSE study materials yourself at a fraction of
										the camp price. However, who has the willpower.
									</p>
								</div>
						</div>
					</div>
			</div>
			<div class="navigation-area">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
						
					</div>
					<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
						<div class="detials">
							<a href="javascript:submit();" class="button button-postComment button--active" id="reBtn">MODIFY</a>
						</div>
						<div class="detail">
						&nbsp;&nbsp;&nbsp;
						</div>
						<div class="detials">
							<a href="#" onclick="history.back();" class="button button-postComment button--active" id="reBtn">CANCLE</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="col-lg-4">
			<div class="blog_right_sidebar">

				</div>
			</div>
		</div>
		</div>
</section>
	<!--================Blog Area =================-->
  
<script src="insert.js"></script>
</body>
</html>