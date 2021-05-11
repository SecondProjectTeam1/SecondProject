<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>관리자 페이지</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#"></a></li>
              <li class="breadcrumb-item active" aria-current="page">회원관리</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  
  <!--================Checkout Area =================-->
  <section class="checkout_area section-margin--small">
    <div class="container">
        <div class="returning_customer">
            <div class="check_title">
                <h2>회원 정보 검색 </h2>
            </div>
            
        </div>
        <div class="cupon_area">
            <div class="container">
            	<div class="search_row" width=100%>
            	<form action="member_find.do" method="post">
            		<table class="table">
       					<tr>
            				<td style="width:30px; margin-top:px;" valign="middle">
            				<select class="member_type" style="margin-top:25px;" >
            					<option name=data value="id">아이디</option>
            					<option name =data value="name">이름</option>
            				</select>
            				</td>
            				<td><input type="text" name="ss"  class="input-sm"  width=40% style="margin-bottom:10px; "></td>
            				<td style="margin-left: 10px;"><button type="submit" class="btn btn-sm btn-primary" style="margin-left: 20px; margin-top:25px;">검색</button></td>
            			</tr>
            		</table>
            	</form>
            	</div>
            	<div>
            	<div class="member_container">
            			<table>
            			<tr width=100%>	
            				<th calss="text-center" width=10%>ID</th>
            				<th calss="text-center" width=15%>이름</th>
            				<th calss="text-center" width=10%>성별</th>
            				<th calss="text-center" width=20%>Email</th>
            				<th calss="text-center" width=25%>주소</th>
            				<th calss="text-center" width=20%>전화번호</th>
            			</tr>
            			
            			<c:forEach var="mvo" items="${mList }">
            				<tr>
            					<td>${mvo.id }</td>
            					<td>${mvo.name }</td>
            					<td>${mvo.sex }</td>
            					<td>${mvo.email }</td>
            					<td>${mvo.addr1 }</td>
            					<td>${mvo.tel }</td>
            				</tr>
            				<a href=""><button class="btn btn-sm btn warning">회원탈퇴</button></a>
            			</c:forEach>
            			
            		</table>
            		</div>
            	</div>
            </div>
        <div class="check_title">
                <h2>회원 기록 조회 </h2>
            </div>    
        </div>
        <div class="billing_details">
            <div class="row">
                <div class="col-lg-8">
                    <h3>Billing Details</h3>
                    <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                        <div class="col-md-6 form-group p_star">
                            <input type="text" class="form-control" id="first" name="name">
                            <span class="placeholder" data-placeholder="First name"></span>
                        </div>
                        <div class="col-md-6 form-group p_star">
                            <input type="text" class="form-control" id="last" name="name">
                            <span class="placeholder" data-placeholder="Last name"></span>
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="text" class="form-control" id="company" name="company" placeholder="Company name">
                        </div>
                        <div class="col-md-6 form-group p_star">
                            <input type="text" class="form-control" id="number" name="number">
                            <span class="placeholder" data-placeholder="Phone number"></span>
                        </div>
                        <div class="col-md-6 form-group p_star">
                            <input type="text" class="form-control" id="email" name="compemailany">
                            <span class="placeholder" data-placeholder="Email Address"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">
                            <select class="country_select">
                                <option value="1">Country</option>
                                <option value="2">Country</option>
                                <option value="4">Country</option>
                            </select>
                        </div>
                        <div class="col-md-12 form-group p_star">
                            <input type="text" class="form-control" id="add1" name="add1">
                            <span class="placeholder" data-placeholder="Address line 01"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">
                            <input type="text" class="form-control" id="add2" name="add2">
                            <span class="placeholder" data-placeholder="Address line 02"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">
                            <input type="text" class="form-control" id="city" name="city">
                            <span class="placeholder" data-placeholder="Town/City"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">
                            <select class="country_select">
                                <option value="1">District</option>
                                <option value="2">District</option>
                                <option value="4">District</option>
                            </select>
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="text" class="form-control" id="zip" name="zip" placeholder="Postcode/ZIP">
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="creat_account">
                                <input type="checkbox" id="f-option2" name="selector">
                                <label for="f-option2">Create an account?</label>
                            </div>
                        </div>
                        <div class="col-md-12 form-group mb-0">
                            <div class="creat_account">
                                <h3>Shipping Details</h3>
                                <input type="checkbox" id="f-option3" name="selector">
                                <label for="f-option3">Ship to a different address?</label>
                            </div>
                            <textarea class="form-control" name="message" id="message" rows="1" placeholder="Order Notes"></textarea>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4">
                    <div class="order_box">
                        <h2>Your Order</h2>
                        <ul class="list">
                            <li><a href="#"><h4>Product <span>Total</span></h4></a></li>
                            <li><a href="#">Fresh Blackberry <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
                            <li><a href="#">Fresh Tomatoes <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
                            <li><a href="#">Fresh Brocoli <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
                        </ul>
                        <ul class="list list_2">
                            <li><a href="#">Subtotal <span>$2160.00</span></a></li>
                            <li><a href="#">Shipping <span>Flat rate: $50.00</span></a></li>
                            <li><a href="#">Total <span>$2210.00</span></a></li>
                        </ul>
                        <div class="payment_item">
                            <div class="radion_btn">
                                <input type="radio" id="f-option5" name="selector">
                                <label for="f-option5">Check payments</label>
                                <div class="check"></div>
                            </div>
                            <p>Please send a check to Store Name, Store Street, Store Town, Store State / County,
                                Store Postcode.</p>
                        </div>
                        <div class="payment_item active">
                            <div class="radion_btn">
                                <input type="radio" id="f-option6" name="selector">
                                <label for="f-option6">Paypal </label>
                                <img src="img/product/card.jpg" alt="">
                                <div class="check"></div>
                            </div>
                            <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal
                                account.</p>
                        </div>
                        <div class="creat_account">
                            <input type="checkbox" id="f-option4" name="selector">
                            <label for="f-option4">I’ve read and accept the </label>
                            <a href="#">terms & conditions*</a>
                        </div>
                        <div class="text-center">
                          <a class="button button-paypal" href="#">Proceed to Paypal</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </section>
  <!--================End Checkout Area =================-->
</body>
</html>