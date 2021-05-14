<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Blog</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
<style type="text/css">

</style>

</head>
<body>
  <!--================ Start Header Menu Area =================-->

	<!--================ End Header Menu Area =================-->


  <!-- ================ start banner area ================= -->	

  <!-- ================ end banner area ================= -->


  <!--================Blog Categorie Area =================-->
  
    <div class="container" style="height:70px">
      
    </div>
  
  <!--================Blog Categorie Area =================-->

  <!--================Blog Area =================-->
  <section class="blog_area">
      <div class="container" style="height:100px">
      <h3 style="text:center;color:#384AEB">${name }님의 마이페이지</h3>
      </div>
      <div class="container">
          <div class="row">
              
              <div class="col-lg-12">
                  <div class="blog_right_sidebar">
                     
                      <aside class="single_sidebar_widget author_widget">
                          <img class="author_img rounded-circle" src="../img/blog/author.png" alt="">
                          <h4>${id }님 환영합니다.</h4>
                          
                          <div class="social_icon">
                              <a href="../mypage/mypage_update.do"><button type="submit" value="submit" class="button button-login w-100">프로필 수정</button></a>
                          </div>
                          <p>
                          </p>
                      <div class="container" style="height:30px"></div>
                      </aside>
                      
                      </div>
                      <div class="book">
			         <div class="cart_inner">
			              <div class="table-responsive">
			                  <table class="table">
			                  <h4>국내서적 찜목록은 총 ${BookJcount }개</h4>
			                      <thead>
			                          <tr>
			                              <th scope="col">제품</th>
			                              <th scope="col">저자
			                              <br>(출판사)</th>
			                              <th scope="col">출간일</th>
			                              <th scope="col">원가</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                      <c:forEach var="vo" items="${List }">
			                          <tr>
			                              <td>
			                              <a href="../book/detail.do?no=${vo.no }">
			                                  <div class="media">
			                                      <div class="d-flex" style="width:150px;height:120px">
			                                          <img src="${vo.poster }" alt="">
			                                      </div>
			                                      <div class="media-body">
			                                          <p>${vo.title}</p>
			                                      </div>
			                                  </div>
			                              </a>
			                              </td>
			                              <td>
			                                  <h5>${vo.author }
			                                  <br>(${vo.publisher })</h5>
			                              </td>
			                              <td>
			                              	   <h5>${vo.pudate }</h5>
			                              </td>
			                              <td>
			                                  <h5>${vo.price }원</h5>
			                              </td>
			                          </tr>
			                         
			                         </c:forEach>
			                          
			                      </tbody>
			                  </table>
			              </div>
			          </div>
			        </div>
			        <div class="bookf">
			          <div class="cart_inner">
			              <div class="table-responsive">
			                  <table class="table">
			                  <h4>해외서적 찜목록은 총 ${BookfJcount }개</h4>
			                      <thead>
			                          <tr>
			                              <th scope="col">제품</th>
			                              <th scope="col">저자
			                              <br>(출판사)</th>
			                              <th scope="col">출간일</th>
			                              <th scope="col">원가</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                      <c:forEach var="fvo" items="${fList }">
			                          <tr>
			                              <td>
			                              <a href="../bookf/detail.do?no=${fvo.no }">
			                                  <div class="media">
			                                      <div class="d-flex" style="width:150px;height:120px">
			                                          <img src="${fvo.poster }" alt="">
			                                      </div>
			                                      <div class="media-body">
			                                          <p>${fvo.title}</p>
			                                      </div>
			                                  </div>
			                              </a>
			                              </td>
			                              <td>
			                                  <h5>${fvo.author }
			                                  <br>(${fvo.publisher })</h5>
			                              </td>
			                              <td>
			                              	   <h5>${fvo.pudate }</h5>
			                              </td>
			                              <td>
			                                  <h5>${fvo.price }</h5>
			                              </td>
			                          </tr>
			                         
			                         </c:forEach>
			                          
			                      </tbody>
			                  </table>
			              </div>
			          </div>
			         </div>
			         <div class="books">
			          <div class="cart_inner">
			              <div class="table-responsive">
			                  <table class="table">
			                  <h4>중고서적 찜목록은 총 ${BooksJcount }개</h4>
			                      <thead>
			                          <tr>
			                              <th scope="col">제품</th>
			                              <th scope="col">저자
			                              <br>(출판사)</th>
			                              <th scope="col">출간일</th>
			                              <th scope="col">원가
			                              <br>(할인가)</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                      <c:forEach var="svo" items="${sList }">
			                          <tr>
			                              <td>
			                              <a href="../junggo/junggo_detail.do?no=${svo.no }">
			                                  <div class="media">
			                                      <div class="d-flex" style="width:150px;height:120px">
			                                          <img src="${svo.poster }" alt="">
			                                      </div>
			                                      <div class="media-body">
			                                          <p>${svo.title}</p>
			                                      </div>
			                                  </div>
			                              </a>
			                              </td>
			                              <td>
			                                  <h5>${svo.author }
			                                  <br>(${svo.publisher })</h5>
			                              </td>
			                              <td>
			                              	   <h5>${svo.pudate }</h5>
			                              </td>
			                              <td>
			                                  <h5>${svo.price }
			                                  <br>(${svo.sale_price })</h5>
			                              </td>
			                          </tr>
			                         
			                         </c:forEach>
			                          
			                      </tbody>
			                  </table>
			              </div>
			          </div>
			          </div>
			          <div class="video">
			           <div class="cart_inner">
			              <div class="table-responsive">
			                  <table class="table">
			                  <h4>인터넷강의 찜목록은 총 ${VideoJcount }개</h4>
			                      <thead>
			                          <tr>
			                              <th scope="col">강의</th>
			                              <th scope="col">강사</th>
			                              <th scope="col">수강료</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                      <c:forEach var="vvo" items="${vList }">
			                          <tr>
			                          
			                              <td>
			                              <a href="../video/video_detail.do?no=${vvo.no }">
			                                  <div class="media">
			                                      <div class="d-flex" style="width:150px;height:120px">
			                                          <img src="${vvo.poster }" alt="">
			                                      </div>
			                                      <div class="media-body">
			                                          <p>${vvo.title}</p>
			                                      </div>
			                                  </div>
			                                   </a>
			                              </td>
			                         
			                              <td>
			                                  <h5>${vvo.teacher }</h5>
			                              </td>
			                              
			                              <td>
			                                  <h5>${vvo.price }</h5>
			                              </td>
			                          </tr>
			                         
			                         </c:forEach>
			                          
			                      </tbody>
			                  </table>
			              </div>
			          </div>
			       </div>
              </div>
          </div>
      </div>
  </section>
<section class="cart_area">
      <div class="container">
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr>
                              <th scope="col">구매번호</th>
                              <th scope="col">상품명</th>
                              <th scope="col">가격</th>
                              <th scope="col">구매갯수</th>
                              <th scope="col">총가격</th>
                              <th scope="col">상태</th>
                          </tr>
                      </thead>
                      <tbody>
                      	 
                      	 <tr>
                               <c:forEach var="d" items="${dclist }">
                                <td>${d.cartno}</td>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${d.dvo.poster}" alt="" style="width:165px; height:220px">
                                      </div>
                                      <div class="media-body">
                                          <p>${d.dvo.title}</p>
                                      </div>
                                  </div>
                              </td>
                              <td>
                                  <h5>${d.dvo.price }</h5>
                              </td>
                              <td>
                                  <div class="product_count">
                                      <h5>${d.qty }권</h5>
                                  </div>
                              </td>
                              <td>
                                  <h5>${d.total_price }원</h5>
                              </td>
                        	<td>
                              	<c:if test="${d.state=='n' }">
						           <h5>주문대기</h5>
						         </c:if>
						           
						         <c:if test="${d.state=='y' }">
						           <h5>주문완료</h5>
						         </c:if>
                              </td>
                              
                              
                              
                              <tr>
                              <tr>
                        	</c:forEach>
                          </tr>
                          
                          <tr>
                              <c:forEach var="f" items="${fclist }">
                               <td>${f.cartno}</td>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${f.fvo.poster}" alt="" style="width:165px; height:220px">
                                      </div>
                                      <div class="media-body">
                                          <p>${f.fvo.title}</p>
                                      </div>
                                  </div>
                              </td>
                              <td>
                                  <h5>${f.fvo.price }</h5> 
                              </td>
                              <td>
                                  <div class="product_count">
                                      <h5>${f.qty }권</h5>
                                  </div>
                              </td>
                              <td>
                                  <h5>${f.total_price }원</h5> 
                              </td>
                        	<td>
                              	<td>
                              	<c:if test="${f.state=='n' }">
						           <h5>주문대기</h5>
						         </c:if>
						           
						         <c:if test="${f.state=='y' }">
						           <h5>주문완료</h5>
						         </c:if>
						        
						           
                              
                              </td>
                              
                              
                              
                              <tr>
                              <tr>
                        	</c:forEach>
                          </tr>
                          
                          
                          
                           <tr>
                               <c:forEach var="u" items="${uclist }">
                                <td>${u.cartno}</td>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${u.uvo.poster}" alt="" style="width:165px; height:220px">
                                      </div>
                                      <div class="media-body">
                                          <p>${u.uvo.title}</p>
                                      </div>
                                  </div>
                              </td>
                              <td>
                                  <h5>${u.uvo.price }</h5>
                              </td>
                              <td>
                                  <div class="product_count">
                                      <h5>${u.qty }권</h5>
                                  </div>
                              </td>
                              <td>
                                  <h5>${u.total_price }원</h5>
                              </td>
                        	<td>
                              	<td>
                              	<c:if test="${u.state=='n' }">
						           <h5>주문대기</h5>
						         </c:if>
						           
						         <c:if test="${u.state=='y' }">
						           <h5>주문완료</h5>
						         </c:if>
						        
						           
                              
                              </td>
                              
                              
                              
                              
                              <tr>
                              <tr>
                        	</c:forEach>
                          </tr>
                          
                           
                          <tr>
                               <c:forEach var="v" items="${vclist }">
                               <td>${v.cartno}</td>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${v.cvo.poster}" style="width:165px; height:220px" alt="">
                                      </div>
                                      <div class="media-body">
                                          <p>${v.cvo.title}</p>
                                      </div>
                                  </div>
                              </td>
                              <td>
                                  <h5>${v.cvo.price }</h5>
                              </td>
                              <td>
                                  <div class="product_count">
                                      <h5>${v.qty }개</h5>
                                  </div>
                              </td>
                              <td>
                                  <h5>${v.total_price }원</h5>
                              </td>
                              
                              
                              <td>
                              	<c:if test="${v.state=='n' }">
						           <h5>주문대기</h5>
						         </c:if>
						           
						         <c:if test="${v.state=='y' }">
						           <h5>주문완료</h5>
						         </c:if>
						        
						           
                              </td>
                             
                              
                             
                              
                              
                              <tr>
                              <tr>
                              
                        	</c:forEach>
                          </tr>
                          
                           
                         
                          
                          
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>
  <!--================Blog Area =================-->

  <!--================Instagram Area =================-->
 	<div class="container" style="height:70px">
      
    </div>
  <!--================End Instagram Area =================-->
  

  <!--================ Start footer Area  =================-->	
	
<!--================ End footer Area  =================-->



  
</body>
</html>