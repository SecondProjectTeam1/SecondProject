<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.card-img{
	width:250px;
	height:300px;
}
#dev{
	width:100%;
	height:100%;
	overflow:hidden;
}
</style>
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


	<!-- ================ category section start ================= -->		  
 <div id="app"> 
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
                    <a href="video_list.do?cno=${cvo.cno }&page=1"><span style="font-size:10px">${cvo.category }(${cvo.count })</span></a></label></li>
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
              <div class="input-group filter-bar-search">
                <!-- <input type="text" placeholder="Search" v-model="userFind" autocomplete=off> -->
                <div class="input-group-append">
                  <a href="../video/find.do">검색하러가기<i class="ti-search"></i></a></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->
          
          
          <!-- Start Best Seller -->
           <section class="lattest-product-area pb-40 category-list">
            <div class="row" id="videoList">
            <c:forEach var="vo" items="${list }">
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
               
                  <div class="card-product__img">
                   <a href="video_detail.do?no=${vo.no}&cno=${curcno}&page=${curpage}">
                   <input type=hidden name=page value="${curpage }">
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
                    <p class="card-product__price">${vo.price }</p>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
          </section> 
        </div>
        
        
        
      </div>
    </div>
  </section>
 </div>
 
  
  
 
	<!-- ================ category section end ================= -->		  

	<!-- ==============페이지 처리=================== -->
	
			<nav class="blog-pagination justify-content-center d-flex">
			    
                         <ul class="pagination">
                           <c:if test="${startPage>1 }">
                              <li class="page-item">
                                  <a href="video_list.do?cno=${curcno}&page=${startPage-1}" class="page-link" aria-label="Previous"> 이전
                                      <span aria-hidden="true">
                                          <span class="lnr lnr-chevron-left"></span>
                                      </span>
                                  </a>
                              </li>
                             </c:if> 
                              
                            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                             <c:if test="${curpage==i}">
                             	<c:set var="type" value="page-item active"/>
                             </c:if>                            
                               <c:if test="${curpage!=i}">
                               	<c:set var="type" value="page-item"/>
                               </c:if>
                             <li ${type }>
                                  <a href="video_list.do?cno=${curcno}&page=${i}" class="page-link">${i }</a>
                              </li>
                            </c:forEach>
                            
                           <c:if test="${endPage<totalpage}">
                              <li class="page-item">
                                  <a href="video_list.do?cno=${curcno}&page=${endPage+1}" class="page-link" aria-label="Next"> 다음
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
   <div style="height:300px"></div>
	<!-- ================ Subscribe section end ================= -->		
</body>
</html>