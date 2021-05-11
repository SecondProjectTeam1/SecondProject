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
<script type="text/javascript">
$(function(){
	console.log(window.history)

	$.ajax({
		type:'GET',
		url:'reply_list.do',
		data:{"bno":<c:out value="${vo.no}"/>},
		success:function(result){
			$('#reply_data').html(result);
		}
	});
});
function deletepost(){
	 if (!confirm("게시글을 삭제하시겠습니까?")) {
            alert("취소(아니오)를 누르셨습니다.");
        } else {
        	location.href="delete.do?no="+<c:out value="${vo.no}"/>;
        }
};
</script>
</head>  
<body>
<%@include file ="../board/header.jsp" %>

	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Board Details</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Board Details</li>
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
					<div class="single-post row">
					<div class="col-lg-12">
							<div class="feature-img">
							<c:choose>
					         <c:when test = "${vo.poster eq null}">
							         <c:choose>
							         <c:when test = "${type eq f}">
							            <img class="img-fluid" src="../img/free.png" alt="FREE BOARD" style="width:700px;height:300px;">
							         </c:when>
							         <c:otherwise>
							            <img class="img-fluid" src="../img/qa.png" alt="FREE BOARD" style="width:700px;height:300px;">
							         </c:otherwise>
							      	</c:choose>
					         </c:when>
					         <c:otherwise>
					            <img class="img-fluid" src="${vo.poster}" alt="POST IMAGE" style="width:700px;height:300px;">
					         </c:otherwise>
					      </c:choose>
							</div>
					</div>
					<div class="col-lg-3 col-md-3">
							<div class="blog_info text-right">
								<div class="post_tag">
                                      POST NO. &nbsp;&nbsp;<a class="active" href="#">${vo.no}</a>

                                  </div>
                                  <ul class="blog_meta list">
                                      <li>
                                          <a href="#">${vo.id}
                                              <i class="lnr lnr-user"></i>
                                          </a>
                                      </li>
                                      <li>
                                          <a href="#"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>
                                              <i class="lnr lnr-calendar-full"></i>
                                          </a>
                                      </li>
                                      <li>
                                          <a href="#">${vo.hit} Views
                                              <i class="lnr lnr-eye"></i>
                                          </a>
                                      </li>
                                      <li>
                                          <a href="#">${vo.replyCount} Comments
                                              <i class="lnr lnr-bubble"></i>
                                          </a>
                                      </li>
                                  </ul>
									<ul class="social-links">
										<li>
											<a href="#">
												<i class="fab fa-facebook-f"></i>
											</a>
										</li>
										<li>
											<a href="#">
												<i class="fab fa-twitter"></i>																				
											</a>
										</li>
										<li>
											<a href="#">
												<i class="fab fa-github"></i>																				
											</a>
										</li>
										<li>
											<a href="#">
												<i class="fab fa-behance"></i>																				
											</a>
										</li>
									</ul>
							</div>
					</div>
					<div class="col-lg-9 col-md-9 blog_details">
						<h2>${vo.title }</h2>
						<p class="excert">${vo.content}</p>
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
			<div id="reply_data">
			<!--  reply -->
			</div>
			<div class="navigation-area">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
						
					</div>
					
					<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
						<c:if test="${sessionScope.id eq vo.id }">
						<div class="detials">
							<a href="update.do?no=${vo.no}" class="button button-postComment button--active">MODIFY</a>
						</div>
						<div class="detail">
						&nbsp;&nbsp;&nbsp;
						</div>
						<div class="detials">
							<a href="javascript:deletepost();" class="button button-postComment button--active">DELETE</a>
						</div>
						<div class="detail">
						&nbsp;&nbsp;&nbsp;
						</div>
						</c:if>
						<div class="detials">
							<a href="#" onclick="history.back();" class="button button-postComment button--active" id="reBtn">LIST</a>
						</div>
					</div>
			  </div>
			</div>
		
	</div>
	<div class="col-lg-4">
			<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<div class="input-group">
								<input type="text" class="form-control" placeholder="Search Posts">
								<span class="input-group-btn">
										<button class="btn btn-default" type="button">
												<i class="lnr lnr-magnifier"></i>
										</button>
								</span>
						</div>
						<!-- /input-group -->
						<div class="br"></div>
					</aside>
					<aside class="single_sidebar_widget post_category_widget">
                         <h4 class="widget_title">Post Catgories</h4>
                         <ul class="list cat-list">
                             <li>
                                 <a href="../board/board.do?type=f" class="d-flex justify-content-between">
                                     <p>자유게시판</p>
                                     <p>37</p>
                                 </a>
                             </li>
                             <li>
                                 <a href="../board/board.do?type=q" class="d-flex justify-content-between">
                                     <p>문의게시판</p>
                                     <p>24</p>
                                 </a>
                             </li>
                             <li>
                                 <a href="#" class="d-flex justify-content-between">
                                     <p>내가 쓴 글</p>
                                     <p>59</p>
                                 </a>
                             </li>
                         </ul>
                         <div class="br"></div>
                     </aside>
                     <aside class="single-sidebar-widget newsletter_widget">
                         <a href="insert.do" style="display:block;">
                          <h4 class="widget_title">Upload Post</h4>
                          <p>
                              upload your own post
                          </p>
                          </a>
                     </aside>
                     <aside class="single_sidebar_widget author_widget">
                         <img class="author_img rounded-circle" src="img/blog/author.png" alt="">
                         <h4>Charlie Barber</h4>
                         <p>Senior blog writer</p>
                         <div class="social_icon">
                             <a href="#">
                                 <i class="fab fa-facebook-f"></i>
                             </a>
                             <a href="#">
                                 <i class="fab fa-twitter"></i>
                             </a>
                             <a href="#">
                                 <i class="fab fa-github"></i>
                             </a>
                             <a href="#">
                               <i class="fab fa-behance"></i>
                             </a>
                         </div>
                         <p>Boot camps have its supporters andit sdetractors. Some people do not understand why you should
                             have to spend money on boot camp when you can get. Boot camps have itssuppor ters andits
                             detractors.
                         </p>
                         <div class="br"></div>
                     </aside>
                     <aside class="single_sidebar_widget popular_post_widget">
                         <h3 class="widget_title">Popular Posts</h3>
                         <div class="media post_item">
                             <img src="img/blog/popular-post/post1.jpg" alt="post">
                             <div class="media-body">
                                 <a href="single-blog.html">
                                     <h3>Space The Final Frontier</h3>
                                 </a>
                                 <p>02 Hours ago</p>
                             </div>
                         </div>
                         <div class="media post_item">
                             <img src="img/blog/popular-post/post2.jpg" alt="post">
                             <div class="media-body">
                                 <a href="single-blog.html">
                                     <h3>The Amazing Hubble</h3>
                                 </a>
                                 <p>02 Hours ago</p>
                             </div>
                         </div>
                         <div class="media post_item">
                             <img src="img/blog/popular-post/post3.jpg" alt="post">
                             <div class="media-body">
                                 <a href="single-blog.html">
                                     <h3>Astronomy Or Astrology</h3>
                                 </a>
                                 <p>03 Hours ago</p>
                             </div>
                         </div>
                         <div class="media post_item">
                             <img src="img/blog/popular-post/post4.jpg" alt="post">
                             <div class="media-body">
                                 <a href="single-blog.html">
                                     <h3>Asteroids telescope</h3>
                                 </a>
                                 <p>01 Hours ago</p>
                             </div>
                         </div>
                         <div class="br"></div>
                     </aside>
                     <aside class="single_sidebar_widget ads_widget">
                         <a href="#">
                             <img class="img-fluid" src="img/blog/add.jpg" alt="">
                         </a>
                         <div class="br"></div>
                     </aside>

                     <aside class="single-sidebar-widget newsletter_widget">
                         <h4 class="widget_title">Newsletter</h4>
                         <p>
                             Here, I focus on a range of items and features that we use in life without giving them a second thought.
                         </p>
                         <div class="form-group d-flex flex-row">
                             <div class="input-group">
                                 <div class="input-group-prepend">
                                     <div class="input-group-text">
                                         <i class="fa fa-envelope" aria-hidden="true"></i>
                                     </div>
                                 </div>
                                 <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Enter email address" onfocus="this.placeholder = ''"
                                     onblur="this.placeholder = 'Enter email'">
                             </div>
                             <a href="#" class="bbtns">Subcribe</a>
                         </div>
                         <p class="text-bottom">You can unsubscribe at any time</p>
                         <div class="br"></div>
                     </aside>
                     <aside class="single-sidebar-widget tag_cloud_widget">
                         <h4 class="widget_title">Tag Clouds</h4>
                         <ul class="list">
                             <li>
                                 <a href="#">Technology</a>
                             </li>
                             <li>
                                 <a href="#">Fashion</a>
                             </li>
                             <li>
                                 <a href="#">Architecture</a>
                             </li>
                             <li>
                                 <a href="#">Fashion</a>
                             </li>
                             <li>
                                 <a href="#">Food</a>
                             </li>
                             <li>
                                 <a href="#">Technology</a>
                             </li>
                             <li>
                                 <a href="#">Lifestyle</a>
                             </li>
                             <li>
                                 <a href="#">Art</a>
                             </li>
                             <li>
                                 <a href="#">Adventure</a>
                             </li>
                             <li>
                                 <a href="#">Food</a>
                             </li>
                             <li>
                                 <a href="#">Lifestyle</a>
                             </li>
                             <li>
                                 <a href="#">Adventure</a>
                             </li>
                         </ul>
                     </aside>
				</div>
			</div>
		</div>
		</div>
</section>
	<!--================Blog Area =================-->
  
<%@include file ="../board/footer.jsp" %>
</body>
</html>