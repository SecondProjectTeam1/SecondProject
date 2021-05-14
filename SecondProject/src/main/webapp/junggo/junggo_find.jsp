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
		 <img src="dev.jpg" id="dev">
			<div class="blog-banner">
				<div class="text-center">
					<h1 style="color:white;">중고책 검색</h1>
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
      
      <!-- 카테고리 바 -->
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
        </div>
        
        
        
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search" v-model="userFind" autocomplete=off>
                <div class="input-group-append">
                 <button type="button" v-on:click="sendData()"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->
          
          
   
           
        <section class="lattest-product-area pb-40 category-list">
             <div class="row">
              <div class="col-md-6 col-lg-4" v-for="f in findList">
                <div class="card text-center card-product"> 
                  <div class="card-product__img">
                   <a :href="'../junggo/junggo_detail.do?no='+f.no">
                    <img :src="f.poster" class="card-img" >
                    </a> 
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                 
                  <div class="card-body">
                   <p>{{f.category}}</p>
                    <h4 class="card-product__title"><a href="#">{{f.title}}</a></h4>
                    <p class="card-product__price">{{f.price}}</p>
                  </div>
                </div>
              </div>
            </div>
          </section> 

          
          <!-- End Best Seller -->
   			<div class="row">
		      <div class="text-center">
		       <div style="height:100px"></div>
		       <button class="btn btn-sm" v-on:click="showPrevPage()">이전</button>
		        {{curpage}} page / {{totalpage}} pages
		       <button class="btn btn-sm" v-on:click="showNextPage()">다음</button>
		      </div>
		    </div>
        </div>
        
        
        
      </div>
    </div>
  </section>
 </div>
 
  	<script>
  	 new Vue({
		 el:'#app',
		 data:{
			 findList:[],
			 userFind:'',
			 findTitle:'title',
			 curpage:1,
			 totalpage:1
		 }, 
		 mounted:function(){
			 let _this=this;
			 this.junggoGetData();
			 this.junggoTotalPage();
		 },
		 methods:{
			 junggoGetData:function(){
				let _this=this;
				axios.get("http://211.238.142.211/main/junggo/find.do",{
					 params:{
						 userFind:this.userFind,
						 type:this.findTitle,
				 		 page:this.curpage
					 }
				 }).then(function(result){
					 _this.findList=result.data;
					 console.log(result.data)
				 })
			},
			
			junggoTotalPage:function(){
				let _this=this;
				axios.get("http://211.238.142.211/main/junggo/junggo_find_total.do",{
					params:{
						type:_this.findTitle,
						userFind:_this.userFind
					}
				}).then(function(response){
					_this.totalpage=response.data
				})
			},
		 
			 sendData:function(){
				 
				 this.curpage=1;
				 this.junggoGetData();
				 this.junggoTotalPage();
			 },
		 
			 showPrevPage(){
			 		this.curpage=this.curpage>1?this.curpage-1:this.curpage;
			 		this.junggoGetData();
			 	},
			 	
			 	showNextPage(){
			 		this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
			 		this.junggoGetData();
			 	}
		 
		 }
	 })         
	</script>
   <div style="height:300px"></div>
  
</body>
</html>