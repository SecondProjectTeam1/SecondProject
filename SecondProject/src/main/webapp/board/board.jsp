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
</head>  
<body>
<%@include file ="../board/header.jsp" %>

  <!-- ================ start banner area ================= -->	
  <section class="blog-banner-area" id="blog">
    <div class="container h-100">
      <div class="blog-banner">
        <div class="text-center">
          <h1>BOARD</h1>
          <nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">BOARD</li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ end banner area ================= -->


  <!--================Blog Categorie Area =================-->
  <section class="blog_categorie_area">
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
            <div class="categories_post">
                <img class="card-img rounded-0" src="../img/blog/cat-post/cat-post-3.jpg" alt="post">
                <div class="categories_details">
                    <div class="categories_text">
                        <a href="../board/board.do?type=f">
                            <h5>FREE BOARD</h5>
                        </a>
                        <div class="border_line"></div>
                        <p>Enjoy your social life together</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
          <div class="categories_post">
            <img class="card-img rounded-0" src="../img/blog/cat-post/cat-post-2.jpg" alt="post">
            <div class="categories_details">
              <div class="categories_text">
                <a href="../board/board.do?type=q">
                    <h5>Q&A BOARD</h5>
                </a>
                <div class="border_line"></div>
                <p>Be a part of politics</p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
            <div class="categories_post">
                <img class="card-img rounded-0" src="../img/blog/cat-post/cat-post-1.jpg" alt="post">
                <div class="categories_details">
                    <div class="categories_text">
                        <a href="single-blog.html">
                            <h5>MY POST</h5>
                        </a>
                        <div class="border_line"></div>
                        <p>Let the food be finished</p>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  </section>
  <!--================Blog Categorie Area =================-->

  <!--================Blog Area =================-->
  <section class="blog_area">
      <div class="container">
          <div class="row">
              <div class="col-lg-8">
                  <div class="blog_left_sidebar">
                  
                  
                  <c:forEach var="vo" items="${list}">
                      <article class="row blog_item">
                          <div class="col-md-3">
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
                              </div>
                          </div>
                          <div class="col-md-9">
                              <div class="blog_post">
                                  <img src="../img/free.png" alt="" style="width:500px;height:227px;">
                                  <div class="blog_details">
                                      <a href="../board/detail.do?no=${vo.no}">
                                          <h2>${vo.title}</h2>
                                      </a>
                                      <p>${vo.content}</p>
                                      <a class="button button-blog" href="../board/detail.do?no=${vo.no}">View More</a>
                                  </div>
                              </div>
                          </div>
                      </article>
                     </c:forEach>
                      
                      <nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
					         <c:if test="${startPage>1}">
					         <li class="page-item">
					              <a href="../board/board.do?type=${type}&page=${startPage-1}" class="page-link" aria-label="Previous">
					                  <span aria-hidden="true">
					                      <span class="lnr lnr-chevron-left"></span>
					                  </span>
					              </a>
					          </li>
					         </c:if>
					         <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					           <c:if test="${i==curpage}">
					            <c:set var="ptype" value="active"/>
					           </c:if>
					           <c:if test="${i!=curpage}">
					            <c:set var="ptype" value=""/>
					           </c:if>
					           <li class="page-item ${ptype}">
					              <a href="../board/board.do?type=${type}&page=${i}" class="page-link">${i}</a>
					          </li>
					         </c:forEach>
					         <c:if test="${endPage<totalpage }">
					         <li class="page-item">
					              <a href="../board/board.do?type=${type}&page=${endPage+1}" class="page-link" aria-label="Next">
					                  <span aria-hidden="true">
					                      <span class="lnr lnr-chevron-right"></span>
					                  </span>
					              </a>
					          </li>
					         </c:if>
					       </ul>
					  </nav>
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