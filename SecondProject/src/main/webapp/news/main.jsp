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
   $('#searchBtn').click(function(){
	   let word = $('#searchword').val();
	   let fd = $('#fd').val();
	   window.location.href="../news/main.do?fd="+fd+"&word="+word;
   })
   $('#newsSearchBtn').click(function(){
	   let fd = $('#newsSearch').val();
	   window.location.href="../news/main.do?fd="+fd;
   })  
})
</script>
</head>
<body>
  <!-- ================ start banner area ================= -->	
  <section class="blog-banner-area" id="blog">
    <div class="container h-100">
      <div class="blog-banner">
        <div class="text-center">
          <h1>NEWS</h1>
          <nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Blog</li>
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
                        <a href="main.do?fd=IT">
                            <h5>IT</h5>
                        </a>
                        <div class="border_line"></div>
                        <p>Check out the latest IT news</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
          <div class="categories_post">
            <img class="card-img rounded-0" src="../img/blog/cat-post/cat-post-2.jpg" alt="post">
            <div class="categories_details">
              <div class="categories_text">
                <a href="main.do?fd=sport">
                    <h5>Sport</h5>
                </a>
                <div class="border_line"></div>
                <p>Be a part of sports</p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
            <div class="categories_post">
                <img class="card-img rounded-0" src="../img/blog/cat-post/cat-post-1.jpg" alt="post">
                <div class="categories_details">
                    <div class="categories_text">
                        <a href="main.do?fd=food">
                            <h5>Food</h5>
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
                  <div class="blog_left_sidebar" id="news">
                  <c:if test="${list.size()==0 }">
					<div class="text-center" style="height:200px">
					일치하는 검색 결과가 없습니다
					</div>
				</c:if>
				<c:forEach var="vo" items="${list}">
				  <article class="row blog_item">
				      <div class="col-md-3">
				          <div class="blog_info text-right">
				              <div class="post_tag">
				                  Category: &nbsp;&nbsp;<a class="active" href="#">${fd}</a>
				              </div>
				              <ul class="blog_meta list">
				                  <li>
				                      <a href="#">${vo.author}
				                          <i class="lnr lnr-user"></i>
				                      </a>
				                  </li>
				                  <li>
				                      <a href="#">${vo.pubDate}
				                          <i class="lnr lnr-calendar-full"></i>
				                      </a>
				                  </li>
				              </ul>
				          </div>
				      </div>
				      <div class="col-md-9">
				          <div class="blog_post">
				              <div class="blog_details">
				                  <a href="${vo.link}" target=_blank>
				                      <h2>${vo.title}</h2>
				                  </a>
				                  <p>${vo.description}</p>
				                  <a class="button button-blog" href="${vo.link}">View More</a>
				              </div>
				          </div>
				      </div>
				  </article>
				  </c:forEach>
				  
				  <input type="hidden" id="fd" value="${fd}">
				  <input type="hidden" id="word" value="${word}">
				  <nav class="blog-pagination justify-content-center d-flex">
					<ul class="pagination">
					
				         <c:if test="${startPage>1}">
				         <li class="page-item">
				              <a href="../news/main.do?fd=${fd}&word=${word}&page=${startPage-1}" class="page-link" aria-label="Previous">
				                  <span aria-hidden="true">
				                      <span class="lnr lnr-chevron-left"></span>
				                  </span>
				              </a>
				          </li>
				         </c:if>
				         
				         <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				           <c:if test="${i==curpage}">
				            <c:set var="type" value="active"/>
				           </c:if>
				           <c:if test="${i!=curpage}">
				            <c:set var="type" value=""/>
				           </c:if>
				           <li class="page-item ${type}">
				              <a href="../news/main.do?fd=${fd}&word=${word}&page=${i}" class="page-link">${i}</a>
				          </li>
				         </c:forEach>
				         
				         <c:if test="${endPage<totalpage }">
				         <li class="page-item">
				              <a href="../news/main.do?fd=${fd}&word=${word}&page=${endPage+1}" class="page-link" aria-label="Next">
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
                  <%@include file ="../news/newsSearch.jsp" %>
                      <aside class="single_sidebar_widget search_widget">
                          <div class="input-group">
                              <input type="text" class="form-control" id="searchword" placeholder="Search by Keyword">
                              <span class="input-group-btn">
                                  <button class="btn btn-default" type="button" id="searchBtn">
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
					             <a href="main.do?fd=IT" class="d-flex justify-content-between">
					                 <p>IT</p>
					                 <p>12</p>
					             </a>
					         </li>
					         <li>
					             <a href="main.do?fd=sport" class="d-flex justify-content-between">
					                 <p>SPORT</p>
					                 <p>12</p>
					             </a>
					         </li>
					         <li>
					             <a href="main.do?fd=food" class="d-flex justify-content-between">
					                 <p>FOOD</p>
					                 <p>12</p>
					             </a>
					         </li>
					     </ul>
					     <div class="br"></div>
					 </aside>
					<aside class="single-sidebar-widget newsletter_widget">
					   <a href="../board/board.do" style="display:block;">
					   <h4 class="widget_title">Board</h4>
					    <p>
					        Here, ask anything you want!
					    </p>
					    </a>
					    <div class="br"></div>
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
                          <h3 class="widget_title">Newest News</h3>
                          
                          <c:forEach var="i" begin="0" end="2">
                          
                          <div class="media post_item">
                              <img src="../img/News.png" alt="news" style="width:45px;height:45px">
                              <div class="media-body">
                                  <a href="single-blog.html">
                                      <h3>${list[i].title}</h3>
                                  </a>
                                  <p>${list[i].pubDate}</p>
                              </div>
                          </div>
                          
                          </c:forEach>

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

  <!--================Instagram Area =================-->
  <section class="instagram_area">
    <div class="container box_1620">
      <div class="insta_btn">
        <a class="btn theme_btn" href="#">Follow us on instagram</a>
      </div>
      <div class="instagram_image row m0">
        <a href="#"><img src="../temp/img/instagram/ins-1.jpg" alt=""></a>
        <a href="#"><img src="../temp/img/instagram/ins-2.jpg" alt=""></a>
        <a href="#"><img src="../temp/img/instagram/ins-3.jpg" alt=""></a>
        <a href="#"><img src="../temp/img/instagram/ins-4.jpg" alt=""></a>
        <a href="#"><img src="../temp/img/instagram/ins-5.jpg" alt=""></a>
        <a href="#"><img src="../temp/img/instagram/ins-6.jpg" alt=""></a>
      </div>
    </div>
  </section>
  <!--================End Instagram Area =================-->

  <script src="../vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="../vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="../vendors/skrollr.min.js"></script>
  <script src="../vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="../vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="../vendors/jquery.ajaxchimp.min.js"></script>
  <script src="../vendors/mail-script.js"></script>
  <script src="../temp/js/main.js"></script>
</body>
</html>