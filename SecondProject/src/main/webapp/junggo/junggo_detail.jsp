<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/comment_style.css">
<style type="text/css">
.main_img{
	width:450px;
	height:450px;
}
.icon{
	width:20px;
	height:20px;
}
.fa {
	color:orange;
}
.comment-block{
	border: 1px solid #c2ade7;
}
#dev{
	width:100%;
	height:100%;
	overflow:hidden;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let u=0;
let i=0;
$(function(){
$('.dBtn').click(function(){
		let no=$(this).attr("data-no");
		let vno=$(this).attr("data-vno");
		$.ajax({
			type:'get',
			url:'junggo_review_delete.do',
			data:{"no":no,"vno":vno},
			success:function(result)
			{
				location.href="../junggo/junggo_detail.do?no="+vno;
			}
		})
	})
$('.uBtn').click(function(){
	let no=$(this).attr("data-no");
	if(u==0)
	{
		$('#m'+no).show();
		$(this).text("취소");
		u=1;
	}
	else
	{
		$('#m'+no).hide();
		$(this).text("수정");
		u=0;
	}
})
$('.update').click(function(){
	let data_no=$(this).attr("data-no");
	let no=$('#update_no'+data_no).val();
	let vno=$('#update_vno'+data_no).val();
	let msg=$('#update_msg'+data_no).val();
	$.ajax({
		type:'post',
		url:'junggo_review_update.do',
		data:{"no":no, "vno":vno, "msg":msg},
		success:function(result)
		{
			location.href="../junggo/junggo_detail.do?no="+vno;
		}
	})
})

})
</script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
		 <img src="dev.jpg" id="dev">
			<div class="blog-banner">
				<div class="text-center">
					<h1 style="color:white;">중고책 구매</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <!-- <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Category</li> -->
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
		<form method="post" action="../cart/uinput.do">
			<div class="row s_product_inner">
			
				<div class="col-lg-6">	
				<div style="height:50px"></div>	
				<div class="single-prd-item">
					<img src="${vo.poster}" class="main_img">
				</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${vo.title} </h3>
						<h2>${vo.sale_price} (중고 할인가)</h2>
						<h6 id="price">${vo.price} </h6>
						<ul class="list">
							<li><a class="active" href="#"><span>Category</span> :${vo.category}</a></li>
							<li><a href="#"><span>재고</span> : ${vo.stock }</a></li>
						</ul>
						<p>${vo.subtitle} </p>
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
					          <input type=hidden name="price" value="${vo.sale_price }">
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
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Description</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false">Reviews</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<h5>저자</h5>
									</td>
									<td>
										<h5>${vo.author }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>발행일</h5>
									</td>
									<td>
										<h5>${vo.pudate }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>출판사</h5>
									</td>
									<td>
										<h5>${vo.publisher }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>원가</h5>
									</td>
									<td>
										<h5>${vo.price }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>중고서적 할인가</h5>
									</td>
									<td>
										<h5>${vo.sale_price }</h5>
									</td>
								</tr>
								<tr>
			                 		<td colspan="3" class="text-right">
			                 			<c:if test="${sessionScope.id!=null }">
											<c:if test="${count==0 }">
												<form name="myForm" action="../junggo/jjim.do" method="post">
												<input type="hidden" name="no" value="${vo.no}">
												</form>
												<a href="#" onclick="javascript:document.myForm.submit();">찜하기</a>
											</c:if>
											<c:if test="${count!=0 }">
												<a href="#">찜완료</a>
											</c:if>
										</c:if>
			                 			<a href="junggo_list.do?cno=${cno }&page=${page}">목록</a>
			                 		</td>
                				</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				
			<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Overall</h5>
										<h4>${avg }</h4>
										<h6>${revCount } reviews</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on ${revCount } Reviews</h3>
										<ul class="list">
										<c:forEach var="tvo" items="${sList }">
											<li><a href="#">${tvo.star } Star 
											<c:if test="${tvo.star==1 }">
											<i class="fa fa-star"></i> 
											</c:if>
											<c:if test="${tvo.star==2 }">
											<i class="fa fa-star"></i><i class="fa fa-star"></i>  
											</c:if>
											<c:if test="${tvo.star==3 }">
											<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>   
											</c:if>
											<c:if test="${tvo.star==4 }">
											<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> 
											  
											</c:if>
											<c:if test="${tvo.star==5 }">
											<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> 
											    
											</c:if>
											${tvo.starCount }</a></li> 
										</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<br><br><br>
							<div class="review_list">
							<c:forEach var="rvo" items="${list }">
							<div class="comment-wrap">
						<div class="photo">
						<div class="avatar" style="background-image: url('https://s3.amazonaws.com/uifaces/faces/twitter/felipenogs/128.jpg')"></div>
						</div>
						
						<div class="comment-block">
						<p class="comment-text">${rvo.msg }</p>
						<div class="bottom-comment">
								 별점: <c:forEach var="i" begin="1" end="${rvo.star }">
											<i class="fa fa-star"></i>
											</c:forEach>
											<br><br>
								<div class="comment-date">id:&nbsp;${rvo.id }</div>			
								<br><div class="comment-date">${rvo.dbday }</div>			
								<c:if test="${sessionScope.id==rvo.id }">
								<ul class="comment-actions">
										<li class="complain uBtn" data-no="${rvo.no }" data-vno="${rvo.vno }">수정</li>
										<li class="reply dBtn" data-no="${rvo.no }" data-vno="${rvo.vno }">삭제</li>
									</ul>
								</c:if>
								</div>
								
								<br>
								<%-- 수정 데이터 --%>
								<div class="comment-wrap" style="display:none" id="m${rvo.no }">
							<div class="comment-block">
								<input type=hidden name=no value="${rvo.no }" id="update_no${rvo.no }">
								<input type=hidden name=vno value="${rvo.vno }" id="update_vno${rvo.vno }">
								<textarea name="msg" cols="30" rows="3" placeholder="${rvo.msg }" id="update_msg${rvo.no }"></textarea>
							<ul class="comment-actions">
								<li class="reply update"  data-no="${rvo.no }">수정하기</li>
								</ul>
							</div>
						</div>
							</div>
							<br><br>
						</div>
						</c:forEach>
							
							
							
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Add a Review</h4>
								<p>Your Rating:</p>
								<form method="post" action="review_insert_ok.do" class="form-contact form-review mt-3">
								<input type="hidden" name="no" value="${no}">
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
                    <textarea class="form-control different-control w-100" name="msg" id="textarea" cols="30" rows="5" placeholder="Enter Message"></textarea>
                  </div>
                  <div class="form-group text-center text-md-right mt-3">
                    <c:if test="${sessionScope.id!=null }">
                    <button type="submit" class="button button--active button-review">Submit Now</button>
                  </c:if>
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
        <p>중고 보단 새책을 선호하시나요?</p>
        <h2>새책 구매는<span class="section-intro__style">여기서</span></h2>
      </div>
			<div class="row mt-30">
        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
          
          	
            <div class="single-search-product d-flex">
              <a href="#"><img src="${nvo.poster }" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">${nvo.title }</a>
                  <div class="price">${nvo.price }</div>
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