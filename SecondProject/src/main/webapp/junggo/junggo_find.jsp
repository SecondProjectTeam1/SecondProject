<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="men" name="brand"><label for="men">
                    <a href="junggo_list.do?cno=${cvo.cno }&page=1"><span style="font-size:10px">${cvo.category }(${cvo.count })</span></a></label></li>
                  </c:forEach>
                  </ul>
                </form>
              </li>
            </ul>
          </div>
          <div class="sidebar-filter">
            <div class="top-filter-head">Product Filters</div>
            <div class="common-filter">
              <div class="head">Brands</div>
              <form action="#">
                <ul>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand"><label for="apple">Apple<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="asus" name="brand"><label for="asus">Asus<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="gionee" name="brand"><label for="gionee">Gionee<span>(19)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="micromax" name="brand"><label for="micromax">Micromax<span>(19)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="samsung" name="brand"><label for="samsung">Samsung<span>(19)</span></label></li>
                </ul>
              </form>
            </div>
            <div class="common-filter">
              <div class="head">Color</div>
              <form action="#">
                <ul>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="black" name="color"><label for="black">Black<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="balckleather" name="color"><label for="balckleather">Black
                      Leather<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="blackred" name="color"><label for="blackred">Black
                      with red<span>(19)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="gold" name="color"><label for="gold">Gold<span>(19)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="spacegrey" name="color"><label for="spacegrey">Spacegrey<span>(19)</span></label></li>
                </ul>
              </form>
            </div>
            <div class="common-filter">
              <div class="head">Price</div>
              <div class="price-range-area">
                <div id="price-range"></div>
                <div class="value-wrapper d-flex">
                  <div class="price">Price:</div>
                  <span>$</span>
                  <div id="lower-value"></div>
                  <div class="to">to</div>
                  <span>$</span>
                  <div id="upper-value"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <form method="post" action="junggo_find.do">
         	<input type=hidden name=page value="${curpage }">
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div class="sorting">
               <select name="findTitle">
                <option value="T">책 제목</option>
                <option value="A">저자</option>
                <option value="TA">책 제목+저자</option>
              </select>   
            </div>
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search">
                <div class="input-group-append">
                  <button type="button"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          </form>
          <!-- End Filter Bar -->
          
          
          <!-- Start Best Seller -->
           <section class="lattest-product-area pb-40 category-list">
            <div class="row">
            <c:forEach var="vo" items="${fList }">
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
               
                  <div class="card-product__img">
                   <a href="junggo_detail.do?no=${vo.no}">
                    <img class="card-img" src="${vo.poster }" alt="">
                    </a> 
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                 
                  <div class="card-body">
                    <p>${vo.category }</p>
                    <h4 class="card-product__title"><a href="#">${vo.title }</a></h4>
                    <p id="price">${vo.price }</p>
                    <p class="card-product__price">${vo.sale_price }</p>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
          </section> 
          <!-- End Best Seller -->
          
          
          
        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  

	
</body>
</html>