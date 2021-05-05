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
          
          
      
</body>
</html>