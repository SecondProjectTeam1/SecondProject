<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main_img{
	width:450px;
	height:450px;
}
.icon{
	width:20px;
	height:20px;
}
</style>
<script type="text/javascript">
$(function(){
	var userScore=$('#makeStar');
	userScore.change(function(){
		var userScoreNum=$(this).val();
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
					<h1>Shop Single</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Single</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->


  <!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
			
				<div class="col-lg-6">	
				<div style="height:50px"></div>	
				<div class="single-prd-item">
					<img src="${vo.poster}" class="main_img">
				</div>
				</div>
				
				<!-- 
						<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img src="${vo.poster}">
						</div>
					</div>
				</div>
				 -->
				
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${vo.title} </h3>
						<h2>${vo.price} </h2>
						<ul class="list">
							<li><a class="active" href="#"><span>Category</span> :${vo.category}</a></li>
						</ul>
						<p>${vo.content1} </p>
						<div class="product_count">
              <label for="qty">Quantity:</label>
              <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
							 class="increase items-count" type="button"><i class="ti-angle-left"></i></button>
							<input type="text" name="qty" id="sst" size="2" maxlength="12" value="1" title="Quantity:" class="input-text qty">
							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
               class="reduced items-count" type="button"><i class="ti-angle-right"></i></button>
							<a class="button primary-btn" href="#">Add to Cart</a>               
						</div>
						<div class="card_area d-flex align-items-center">
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-diamond"></i></a>
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->
	
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Description</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false">Reviews</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>${vo.content2 }</p>
               <table class="table">
                <tr>
                 <td>✍️ 이런 걸 배워요!</td>
                 <td colspan="2">
                 <c:forTokens items="${vo.content3 }" delims="^" var="content3">
                 <img src="clipboards.png" class="icon"> &nbsp;${content3}<br>
                 </c:forTokens>
                 </td>
                </tr>
                <tr>
                 <td>🎓 이런 분들께 추천드려요!</td>
                 <td colspan="2">
                 <c:forTokens items="${vo.content4 }" delims="^" var="content4">
                 <img src="clipboards.png" class="icon"> &nbsp;${content4}<br>
                 </c:forTokens>
                 </td>
                </tr>
                <tr>
                 <td>📚 선수 지식, 필요한가요?</td>
                 <td colspan="2">
                 <c:forTokens items="${vo.content5 }" delims="^" var="content5">
                 <img src="clipboards.png" class="icon"> &nbsp;${content5}<br>
                 </c:forTokens>
                 </td>
                </tr>
                <tr>
                 <td colspan="3" class="text-right"><a href="javascript:history.back();">목록</a>
                 </td>
                </tr>
               </table>
               <p></p>
				</div>
				
				
				
				<!-- ===============리뷰 탭===================== -->
				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Overall</h5>
										<h4>4.0</h4>
										<h6>(03 Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on 3 Reviews</h3>
										<ul class="list">
										<c:forEach var="j" begin="1" end="5">
											<li><a href="#">${j} Star 
											<c:if test="${j==1 }">
											<i class="fa fa-star"></i>
											</c:if>
											<c:if test="${j==2 }">
											<i class="fa fa-star"></i><i class="fa fa-star"></i>
											</c:if>
											<c:if test="${j==3 }">
											<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
											</c:if>
											<c:if test="${j==4 }">
											<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
											</c:if>
											<c:if test="${j==5 }">
											<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
											</c:if>
											 01</a></li>
										</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<c:forEach var="rvo" items="${list }">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4>${rvo.name }</h4>
											<c:forEach var="i" begin="1" end="${rvo.star }">
											<i class="fa fa-star"></i>
											</c:forEach>
										</div>
									</div>
									<p>${rvo.msg }</p>
								</div>
								</c:forEach>
							
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Add a Review</h4>
								<p>Your Rating:</p>
								<form method="post" action="review_insert_ok.do" class="form-contact form-review mt-3">
								<input type="hidden" name="no" value="${vno}">
								<select name="star" id="makeStar">
								 <option>1</option>
								 <option>2</option>
								 <option>3</option>
								 <option>4</option>
								 <option>5</option>
								</select>
								<ul class="list rating" id="rateStar">
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
								</ul>
								<p>Outstanding</p>
                
                  <div class="form-group">
                    <input class="form-control" name="name" type="text" placeholder="Enter your name" required>
                  </div>
                  <div class="form-group">
                    <textarea class="form-control different-control w-100" name="msg" id="textarea" cols="30" rows="5" placeholder="Enter Message"></textarea>
                  </div>
                  <div class="form-group text-center text-md-right mt-3">
                    <button type="submit" class="button button--active button-review">Submit Now</button>
                  </div>
                </form>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
	</section>
	
	<!--================End Product Description Area =================-->

	<!--================ Start related Product area =================-->  
	<section class="related-product-area section-margin--small mt-0">
		<div class="container">
			<div class="section-intro pb-60px">
        <p>비슷한 강의 둘러보기</p>
        <h2>Top <span class="section-intro__style">Product</span></h2>
      </div>
			<div class="row mt-30">
        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
          
          
          <c:forEach var="svo" items="${sList }">         
            <div class="single-search-product d-flex">
              <a href="video_detail.do?no=${svo.no }"><img src="${svo.poster }" alt=""></a>
              <div class="desc">
                  <a href="video_detail.do?no=${svo.no }" class="title">${svo.title }</a>
                  <div class="price">${svo.price }</div>
              </div>
            </div>
            </c:forEach>
 		  </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-4.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-5.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-6.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-7.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-8.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-9.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>
      </div>
		</div>
	</section>
	<!--================ end related Product area =================--> 
</body>
</html>