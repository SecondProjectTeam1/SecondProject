<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
</script>

<style type="text/css">
.card-img{
	width:250px;
	height:300px;
}
#price{
	text-decoration : line-through;
	size:5px;
}
</style>
</head>
<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop Category</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Category</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">Browse Categories</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                  <ul>
                 	<c:forEach var="cvo" items="${cList }">
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="man" name="brand"><label for="men">
                    <a href="list.do?cno=${cvo.cno }&page=1"><span style="font-size:10px">${cvo.category }(${cvo.count })</span></a></label></li>
                  </c:forEach>
                  </ul>
                </form>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div>
             <form action="listSearch.do" method="GET" id="search">
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search" id="sText" name="sText" required>
                <div class="input-group-append">
                  <button type="button" onclick="document.getElementById('search').submit();"><i class="ti-search"></i></button>
                </div>
              </div>
             </form>
            </div>
          </div>
          <!-- End Filter Bar -->
          <!-- Start Best Seller -->
          <section class="lattest-product-area pb-40 category-list">
            <div class="row">
			<!--  -->
			<c:forEach var="vo" items="${list }">
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="${vo.poster }" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>${vo.category }</p>
                    <h4 class="card-product__title"><a href="detail.do?no=${vo.no }">${vo.title }</a></h4>
                    <p class="card-product__price">${vo.price }</p>
                  </div>
                </div>
              </div>
            </c:forEach>
              <!--  -->
            </div>
          </section>
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  
	<nav class="blog-pagination justify-content-center d-flex">
		<ul class="pagination">
			<c:if test="${startPage>1 }">
				<li class="page-item">
					<a href="list.do?cno=${curcno}&page=${startPage-1}" class="page-link" aria-label="Previous"> 이전
						<span aria-hidden="true">
							<span class="lnr lnr-chevron-left"></span>
						</span>
					</a>
				</li>
			</c:if> 
                              
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${curpage==i} ">
					<c:set var="type" value="page-item active"/>
				</c:if>                            
				<c:if test="${curpage!=i} ">
					<c:set var="type" value="page-item"/>
				</c:if>
				<li ${type }>
					<a href="list.do?cno=${curcno}&page=${i}" class="page-link">${i }</a>
				</li>
			</c:forEach>
                            
			<c:if test="${endPage<allPage}">
				<li class="page-item">
					<a href="list.do?cno=${curcno}&page=${endPage+1}" class="page-link" aria-label="Next"> 다음
						<span aria-hidden="true">
							<span class="lnr lnr-chevron-right"></span>
						</span>
					</a>
				</li>
			</c:if> 
		</ul> 
	</nav> 
	<!-- ================ top product area start ================= -->	
	
	<!-- ================ top product area end ================= -->		

	<!-- ================ Subscribe section start ================= -->		  
 
	<!-- ================ Subscribe section end ================= -->	
</body>
</html>