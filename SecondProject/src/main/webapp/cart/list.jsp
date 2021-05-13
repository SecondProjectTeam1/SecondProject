<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Cart</title>
  <link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shopping Cart</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="../main/main.do">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  

  <!--================Cart Area =================-->
  <section class="cart_area">
      <div class="container">
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr>
                              <th scope="col">Product</th>
                              <th scope="col">Price</th>
                              <th scope="col">Quantity</th>
                              <th scope="col">Total</th>
                              <th scope="col">Order</th>
                              <th scope="col"></th>
                          </tr>
                      </thead>
                      <tbody>
                      	 
                      	 <tr>
                               <c:forEach var="d" items="${dclist }">
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${d.dvo.poster}" alt="">
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
						           <a class="btn btn-sm btn-danger" href="../cart/order_ok.do?cartno=${d.cartno }">주문하기</a>
						         </c:if>
						         <!-- 
						         <c:if test="${d.state=='y' }">
						            <span class="btn btn-sm btn-success">주문완료</span>
						         </c:if>
						          -->
                              </td>
                              
                              <td>
                              	<img src="delete.png" style= width:18px;hight:18px;>
                              </td>
                              
                              <tr>
                              <tr>
                        	</c:forEach>
                          </tr>
                          
                          <tr>
                              <c:forEach var="f" items="${fclist }">
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${f.fvo.poster}" alt="">
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
                              	<c:if test="${f.state=='n' }">
						           <a class="btn btn-sm btn-danger" href="../cart/order_ok.do?cartno=${f.cartno }">주문하기</a>
						         </c:if>
						         <!--  
						         <c:if test="${f.state=='y' }">
						            <span class="btn btn-sm btn-success">주문완료</span>
						         </c:if>
						         -->
                              </td>
                              
                              <td>
                              	<img src="delete.png" href="delete.do?cartno=${f.cartno }" style= width:18px;hight:18px; >
                              </td>
                              
                              <tr>
                              <tr>
                        	</c:forEach>
                          </tr>
                          
                          
                          
                           <tr>
                               <c:forEach var="u" items="${uclist }">
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${u.uvo.poster}" alt="">
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
                              	<c:if test="${u.state=='n' }">
						           <a class="btn btn-sm btn-danger" href="../cart/order_ok.do?cartno=${u.cartno }">주문하기</a>
						         </c:if>
						         <!-- 
						         <c:if test="${u.state=='y' }">
						            <span class="btn btn-sm btn-success">주문완료</span>
						         </c:if>
						          -->
                              </td>
                              
                              <td>
                              	<a href="../cart/delete.do?cartno=${u.cartno }">
                              	<img src="delete.png" style= width:18px;hight:18px; alt="" class="delete-img">
                              	</a>
                              </td>
                              
                              
                              <tr>
                              <tr>
                        	</c:forEach>
                          </tr>
                          
                           
                          <tr>
                               <c:forEach var="v" items="${vclist }">
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
						           <a class="btn btn-sm btn-danger" href="../cart/order_ok.do?cartno=${v.cartno }">주문하기</a>
						         </c:if>
						         <!--  
						         <c:if test="${v.state=='y' }">
						            <span class="btn btn-sm btn-success">주문완료</span>
						         </c:if>
						         -->
						           
                              </td>
                             
                              
                              <td>
                              	<a href="../cart/delete.do?cartno=${v.cartno }">
                              	<img src="delete.png" style= width:18px;hight:18px; alt="" class="delete-img">
                              	</a>
                              </td>
                              
                              
                              <tr>
                              <tr>
                              
                        	</c:forEach>
                          </tr>
                          
                           
                         
                          
                          <tr class="out_button_area">
                              <td class="d-none-l">

                              </td>
                              <td class="">

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="checkout_btn_inner d-flex align-items-center">
                                     <a class="primary-btn ml-2" href="../main/main.do" style= float:left;>메인으로</a>
                                  </div>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>
  <!--================End Cart Area =================-->
  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/skrollr.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="vendors/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/mail-script.js"></script>
  <script src="js/main.js"></script>
</body>
</html>