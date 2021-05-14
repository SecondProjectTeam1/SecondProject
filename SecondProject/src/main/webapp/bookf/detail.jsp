<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function onestar(e) {
	for(let j=1; j<=e; j++){
		let id = "star"+j;
		document.getElementById(id).style.color = "gold";
	}
	if(e!=5){
		for(let k=e+1; k<=5; k++){
			let id = "star"+k;
			document.getElementById(id).style.color = "gray";
		}
	}
	document.getElementById("score").value = e;
	
}

</script>
<style type="text/css">
.review-img{
	width:60px;
	height:60px;
}
.detail-img{
 width : 400px;
 height : 500px;
}
</style>
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
		<form method="post" action="../cart/finput.do">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<img class="detail-img" src="${vo.poster }">
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${vo.title }</h3>
						<h2>${vo.price }</h2>
						<ul class="list">
							<li><a class="active" href="#"><span>Category</span> : ${vo.category }</a></li>
							<li><a href="#"><span>Availibility</span> : In Stock</a></li>
						</ul>
						<p>${vo.title }</p>
						<div class="product_count">
						
						<tr>
             			<td>
             			<select name="su">
				           <c:forEach var="i" begin="1" end="10">
				            <option>${i }</option>
				           </c:forEach>
				          </select>
             			</td>
             			</tr>
             			
             			<tr>
					       <td colspan="2" class="text-right">
					          <input type=hidden name="no" value="${vo.no }">
					          <input type=hidden name="price" value="${vo.price }">
					        <c:if test="${sessionScope.id!=null }">
					          <input type="submit" value="장바구니" class="btn btn-sm btn-danger" onclick="alert('장바구니에 담겼습니다.');">
					        </c:if>
					       </td>
					     </tr>    
							           
						</div>

						<div class="card_area d-flex align-items-center">
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-diamond"></i></a>
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Description</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
					 aria-selected="false">Specification</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false">Reviews</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>${vo.title }</p>
				</div>
				<div class="table-responsive">
					<table class="table">
							<tbody>
								<tr>
					                 <td colspan="3" class="text-right">
							                <c:if test="${sessionScope.id!=null }">
												<c:if test="${count==0 }">
													<form name="myForm" action="../bookf/jjim.do" method="post">
													<input type="hidden" name="no" value="${vo.no}">
													</form>
													<a href="#" onclick="javascript:document.myForm.submit();">찜하기</a>
												</c:if>
											 	<c:if test="${count!=0 }">
													<a href="#">찜완료</a>
											 	</c:if>
											</c:if>
						                 
					                 </td>
				                </tr>
				     		</tbody>
				     </table>
                </div>
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<h5>author</h5>
									</td>
									<td>
										<h5>${vo.author }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>publisher</h5>
									</td>
									<td>
										<h5>${vo.publisher }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>page</h5>
									</td>
									<td>
										<h5>${vo.bookpage }</h5>
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
			
				<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>평점</h5>
										<h4>${avg }</h4>
										<h6>${fn:length(slist) } reviews</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>리뷰 통계</h3>
										<ul class="list">
										<c:forEach var="score" items="${slist }" varStatus="status">
											<li><a href="#">${score.cs }
											<c:forEach var="i" begin="${status.index }" end="4">
												<i class="fa fa-star"></i>
											</c:forEach>
											</a></li>
										</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
							<!--  -->
							<c:forEach var="review" items="${rlist }">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img class="review-img" src="${review.poster }" alt="">
										</div>
										<div class="media-body">
											<h4>${review.name }</h4>
											<c:forEach var="i" begin="1" end="${review.score }">
												<i class="fa fa-star"></i>
											</c:forEach>
										</div>
									</div>
									<p>${review.content }</p>
								</div>
							</c:forEach>
							<!--  -->
							</div>
						</div>
						
						<div class="col-lg-6">
							<div class="review_box">
								<h4>리뷰 쓰기</h4>
								<p>별:</p>
								<div class="starRev">
									<i id="star1" onclick="onestar(1)" class="fa fa-star"></i>
									<i id="star2" onclick="onestar(2)" class="fa fa-star"></i>
									<i id="star3" onclick="onestar(3)" class="fa fa-star"></i>
									<i id="star4" onclick="onestar(4)" class="fa fa-star"></i>
									<i id="star5" onclick="onestar(5)" class="fa fa-star"></i>
								</div>	
               					<form action="bookfReplyInsert.do" method="post" class="form-contact form-review mt-3">
               						<input type="hidden" id="no" name="no" value="${vo.no }">
               						<input type="hidden" id="score" name="score" value="5">
                  					<div class="form-group">
                  						<input class="form-control" name="name" type="text" placeholder="이름" required>
                  					</div>
                  					<div class="form-group">
                  						<textarea class="form-control different-control w-100" name="content" id="textarea" cols="30" rows="5" placeholder="내용을 적어주세요"></textarea>
                  					</div>
                  					<div class="form-group text-center text-md-right mt-3">
                  						<button type="submit" class="button button--active button-review">쓰기</button>
                					</div>
                				</form>
							</div>
						</div>
					</div>
					<nav class="blog-pagination justify-content-center d-flex">
		<ul class="pagination">
			<c:if test="${startPage>1 }">
				<li class="page-item">
					<a href="detail.do?no=${fno}&page=${startPage-1}" class="page-link" aria-label="Previous"> 이전
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
					<a href="detail.do?no=${fno}&page=${i}" class="page-link">${i }</a>
				</li>
			</c:forEach>
                            
			<c:if test="${endPage<allPage}">
				<li class="page-item">
					<a href="detail.do?no=${fno}&page=${endPage+1}" class="page-link" aria-label="Next"> 다음
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
		</div>
	</section>
	<!--================End Product Description Area =================-->


</body>
</html>