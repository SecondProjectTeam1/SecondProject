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
})
</script>
</head>  
<body>

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
                              <c:choose>
						         <c:when test = "${vo.poster eq null}">
								         <c:choose>
								         <c:when test = "${type=='q'}">
								            <img src="../img/qa.png" alt="" style="width:500px;height:227px;">
								         </c:when>
								         <c:otherwise>
								         	<img src="../img/free.png" alt="" style="width:500px;height:227px;">
								         </c:otherwise>
								      	</c:choose>
						         </c:when>
						         <c:otherwise>
						            <img src="${vo.poster}" alt="" style="width:500px;height:227px;">
						         </c:otherwise>
						      </c:choose>
                                  <div class="blog_details">
                                      <a href="../board/detail.do?type=${type}&no=${vo.no}">
                                          <h2>${vo.title}</h2>
                                      </a>
                                      <p>${vo.content}</p>
                                      <a class="button button-blog" href="../board/detail.do?type=${type}&no=${vo.no}">View More</a>
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

                  </div>
              </div>
          </div>
      </div>
  </section>
  <!--================Blog Area =================-->
</body>
</html>