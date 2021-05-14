<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
<meta name="viewport" content="width=device-width"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
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
#dev{
	width:100%;
	height:100%;
	overflow:hidden;
}
.comment-block{
	border: 1px solid #c2ade7;
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
			url:'video_review_delete.do',
			data:{"no":no,"vno":vno},
			success:function(result)
			{
				location.href="../video/video_detail.do?no="+vno;
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
		url:'video_review_update.do',
		data:{"no":no, "vno":vno, "msg":msg},
		success:function(result)
		{
			location.href="../video/video_detail.do?no="+vno;
		}
	})
})
	
})
</script>
</head>
<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
		 <img src="dev.png" id="dev">
			<div class="blog-banner">
				<div class="text-center">
					<h1 style="color:white;">강의 목록</h1>
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
		<form method="post" action="../cart/vinput.do">
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
					</div>
				</div>
			</div>
			</form>
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
                 <td colspan="3" class="text-right">
	                <c:if test="${sessionScope.id!=null }">
						<c:if test="${count==0 }">
							<form name="myForm" action="../video/jjim.do" method="post">
							<input type="hidden" name="no" value="${vo.no}">
							</form>
							<a href="#" onclick="javascript:document.myForm.submit();">찜하기</a>
						</c:if>
					 <c:if test="${count!=0 }">
						<a href="#">찜완료</a>
					 </c:if>
					</c:if>
                 <a href="video_list.do?cno=${cno }&page=${page}">목록</a>
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
										<h4>${avg }</h4>
										<h6>${revCount } reviews</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on ${revCount } Reviews</h3>
										<ul class="list">
										<c:forEach var="tvo" items="${tList }">
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
                
                  <!-- <div class="form-group">
                    <input class="form-control" name="name" type="text" placeholder="Enter your name" required>
                  </div> -->
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

     <%--    <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
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
        </div> --%>
      </div>
		</div>
	</section>
	<!--================ end related Product area =================--> 
</body>
</html>