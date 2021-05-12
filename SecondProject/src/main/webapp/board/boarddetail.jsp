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
	$.ajax({
		type:'GET',
		url:'rightNav.do',
		data:{"type":'<c:out value="${type}"/>'},
		success:function(result){
			$('.blog_right_sidebar').html(result);
		}
	});
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
						<c:choose>
					        <c:when test="${sessionScope.admin eq 'y'}">
					         <div class="detials">
								<a href="javascript:deletepost();" class="button button-postComment button--active">DELETE</a>
							</div>
							<div class="detail">&nbsp;&nbsp;&nbsp;</div>
					        </c:when>
					        <c:otherwise>
					            <c:choose>
						         <c:when test="${sessionScope.id eq vo.id }">
						           <div class="detials">
										<a href="update.do?no=${vo.no}" class="button button-postComment button--active">MODIFY</a>
									</div>
									<div class="detail">&nbsp;&nbsp;&nbsp;</div>
									<div class="detials">
										<a href="javascript:deletepost();" class="button button-postComment button--active">DELETE</a>
									</div>
									<div class="detail">&nbsp;&nbsp;&nbsp;</div>
						         </c:when>
						         <c:otherwise>
						         </c:otherwise>
						      	</c:choose>
					         </c:otherwise>
					      </c:choose>
						<div class="detials">
							<a href="#" onclick="history.back();" class="button button-postComment button--active" id="reBtn">LIST</a>
						</div>
					</div>
			  </div>
			</div>
		
	</div>
	<div class="col-lg-4">
			<div class="blog_right_sidebar">
					
				</div>
			</div>
		</div>
		</div>
</section>
	<!--================Blog Area =================-->
  
<%@include file ="../board/footer.jsp" %>
</body>
</html>