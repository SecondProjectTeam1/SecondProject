<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>    
      <!--================ Hero banner start =================-->
   <!-- partial:index.partial.html -->
   
<div style="height: 80px"></div>


<div class="book-store">
<div class="section-intro pb-60px text-center">
          <h2><span class="section-intro__style">Best Sellers</span></h2>
        </div>
 <div class="book-slide">
  <div class="book js-flickity" data-flickity-options='{ "wrapAround": true }'>
  
   <div class="book-cell">
    <div class="book-img">
     <img src="http://image.yes24.com/goods/71051687/800x0" alt="" class="book-photo">
    </div>
    <div class="book-content">
     <div class="book-title">파이썬을 이용한 머신러닝, 딥러닝 실전 앱 개발</div>
     <div class="book-author">￦ 24,300</div><br>
     <div class="book-sum">실무에서 즉시 활용 가능한 머신러닝, 딥러닝 실전 앱 개발 </div><br>
     <div class="book-see"><a href="../book/detail.do?no=13840">See The Book</a></div>
    </div>
   </div>
   
   
   <div class="book-cell">
    <div class="book-img">
     <img src="http://image.yes24.com/goods/96262613/800x0" alt="" class="book-photo">
    </div>
    <div class="book-content">
     <div class="book-title">모두의 인공지능 with 파이썬</div>
     <div class="book-author">￦  19,800</div><br>
     <div class="book-sum">누구나 쉽게 시작하는 딥러닝 기초 프로그래밍</div><br><br>
     <div class="book-see book-blue"><a href="../book/detail.do?no=7962">See The Book</a></div>
    </div>
   </div>
   
   
   <div class="book-cell">
    <div class="book-img">
     <img src="http://image.yes24.com/goods/76634227/800x0" alt="" class="book-photo">
    </div>
    <div class="book-content">
     <div class="book-title">구글 클라우드 플랫폼 뽀개기</div>
     <div class="book-author">￦  36,000</div><br>
     <div class="book-sum">인프라, 데이터베이스, 머신러닝 개발을 위한 최적 솔루션</div><br>
     <div class="book-see book-pink"><a href="../book/detail.do?no=35944">See The Book</a></div>
    </div>
   </div>
   
   <div class="book-cell">
    <div class="book-img">
     <img src="http://image.yes24.com/goods/68796734/800x0" alt="" class="book-photo">
    </div>
    <div class="book-content">
     <div class="book-title">코틀린 마이크로서비스 개발</div>
     <div class="book-author">￦  29,700</div><br>
     <div class="book-sum">스프링 5와 스프링 부트 2.0을 활용해 코틀린으로 구축하는 리액티브 마이크로서비스</div><br>
     <div class="book-see book-yellow"><a href="../book/detail.do?no=36231">See The Book</a></div>
    </div>
   </div>
   
   
   <div class="book-cell">
    <div class="book-img">
     <img src="http://image.yes24.com/goods/84937604/800x0" alt="" class="book-photo">
    </div>
    <div class="book-content">
     <div class="book-title">기계는 어떻게 생각하는가?</div>
     <div class="book-author">￦  16,200</div><br>
     <div class="book-sum">알파고부터 자율 주행차까지! 기계 학습의 실제 사례와 작동 원리</div><br>
     <div class="book-see book-purple"><a href="../book/detail.do?no=36400">See The Book</a></div>
    </div>
   </div>
  </div>
 </div>
 
</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.pkgd.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<div style="height: 50px"></div>
    <!-- ================ trending product section start ================= -->  
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>Popular Item in the market</p>
          <h2>Best <span class="section-intro__style">Lecture</span></h2>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img class="card-img" src="https://cdn.inflearn.com/wp-content/uploads/web_mvc7.jpg" style="height: 180px">
                <ul class="card-product__imgOverlay">
                  <li><a href="../video/video_detail.do?no=49"><button><i class="ti-search"></i></button></a></li>
                  <li><button><i class="ti-shopping-cart"></i></button></li>
                  <li><button><i class="ti-heart"></i></button></li>
                </ul>
              </div>
              <div class="card-body">
                <p>강사 : 백기선</p>
                <h4 class="card-product__title"><a href="../video/video_detail.do?no=49"><br><br>스프링 웹 MVC</a></h4>
                <p class="card-product__price">₩ 110,000</p>
              </div>
            </div>
          </div>
          
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img class="card-img" src="https://cdn.inflearn.com/public/course-325248-cover/9cb6375d-6ca4-4e2f-9212-6675f45d7396" style="height: 180px">
                <ul class="card-product__imgOverlay">
                  <li><a href="../video/video_detail.do?no=7"><button><i class="ti-search"></i></button></a></li>
                  <li><button><i class="ti-shopping-cart"></i></button></li>
                  <li><button><i class="ti-heart"></i></button></li>
                </ul>
              </div>
              <div class="card-body">
                <p>강사 : 1분코딩</p>
                <h4 class="card-product__title"><a href="../video/video_detail.do?no=7"><br>애플 웹사이트<br>인터랙션 클론!</a></h4>
                <p class="card-product__price">₩ 77,000</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img class="card-img" src="https://cdn.inflearn.com/public/course-325684-cover/beb08379-7695-4cec-946c-c4f291d56b69" style="height: 180px">
                <ul class="card-product__imgOverlay">
                  <li><a href="../video/video_detail.do?no=62"><button><i class="ti-search"></i></button></a></li>
                  <li><button><i class="ti-shopping-cart"></i></button></li>
                  <li><button><i class="ti-heart"></i></button></li>
                </ul>
              </div>
              <div class="card-body">
                <p>코딩웍스</p>
                <h4 class="card-product__title"><a href="../video/video_detail.do?no=62"><br>반응형 웹사이트<br>포트폴리오</a></h4>
                <p class="card-product__price">₩ 61,600</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img class="card-img" src="https://cdn.inflearn.com/public/courses/324037/course_cover/626bed53-f79c-4fbf-b513-b18772f0ef6c/%E1%84%82%E1%85%A1%E1%86%B7%E1%84%87%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A1_100.png" style="height: 180px">
                <ul class="card-product__imgOverlay">
                  <li><a href="../video/video_detail.do?no=70"><button><i class="ti-search"></i></button></a></li>
                  <li><button><i class="ti-shopping-cart"></i></button></li>
                  <li><button><i class="ti-heart"></i></button></li>
                </ul>
              </div>
              <div class="card-body">
                <p>강사 : 남박사</p>
                <h4 class="card-product__title"><a href="../video/video_detail.do?no=70"><br>남박사의 파이썬 실전 100% 활용</a></h4>
                <p class="card-product__price">₩ 66,000</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img class="card-img" src="https://cdn.inflearn.com/public/courses/326368/cover/03c66e23-4e7e-480a-8d01-691fa57d7e45" style="height: 180px">
                <ul class="card-product__imgOverlay">
                  <li><a href="../video/video_detail.do?no=33"><button><i class="ti-search"></i></button></a></li>
                  <li><button><i class="ti-shopping-cart"></i></button></li>
                  <li><button><i class="ti-heart"></i></button></li>
                </ul>
              </div>
              <div class="card-body">
                <p>강사 : 김시훈</p>
                <h4 class="card-product__title"><a href="../video/video_detail.do?no=33"><br>mongoDB 기초부터 <br>실무까지</a></h4>
                <p class="card-product__price">₩ 77,000</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img class="card-img" src="https://cdn.inflearn.com/public/courses/324056/course_cover/d7843f34-f5a0-47e1-abb6-f16ad51fcc6a/ljh_springboot.png" style="height: 180px">
                <ul class="card-product__imgOverlay">
                  <li><a href="../video/video_detail.do?no=144"><button><i class="ti-search"></i></button></a></li>
                  <li><button><i class="ti-shopping-cart"></i></button></li>
                  <li><button><i class="ti-heart"></i></button></li>
                </ul>
              </div>
              <div class="card-body">
                <p>강사 : 이재환</p>
                <h4 class="card-product__title"><a href="../video/video_detail.do?no=144"><br>예제로 배우는<br>스프링부트 입문</a></h4>
                <p class="card-product__price">₩ 44,000</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img class="card-img" src="https://cdn.inflearn.com/public/courses/324038/course_cover/ad135c4f-a879-4665-9bac-964ddb0e08a6/kky_angular.png" style="height: 180px">
                <ul class="card-product__imgOverlay">
                  <li><a href="../video/video_detail.do?no=145"><button><i class="ti-search"></i></button></a></li>
                  <li><button><i class="ti-shopping-cart"></i></button></li>
                  <li><button><i class="ti-heart"></i></button></li>
                </ul>
              </div>
              <div class="card-body">
                <p>강사 : 김영태</p>
                <h4 class="card-product__title"><a href="../video/video_detail.do?no=145"><br>Angular(2+) <br>Front에서 Back까지</a></h4>
                <p class="card-product__price">무료</p>
              </div> 
            </div>
          </div>
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img class="card-img" src="https://cdn.inflearn.com/public/courses/325641/cover/7cfe4afe-eaf6-44ac-96fb-150fcf44aecd" style="height: 180px">
                <ul class="card-product__imgOverlay">
                  <li><a href="../video/video_detail.do?no=6"><button><i class="ti-search"></i></button></a></li>
                  <li><button><i class="ti-shopping-cart"></i></button></li>
                  <li><button><i class="ti-heart"></i></button></li>
                </ul>
              </div>
              <div class="card-body">
                <p>강사 : 코딩일레븐</p>
                <h4 class="card-product__title"><a href="../video/video_detail.do?no=6"><br>인터랙티브 <br>웹 개발[초급편]</a></h4>
                <p class="card-product__price">₩ 44,000</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ================ trending product section end ================= -->  


    <!-- ================ offer section start ================= --> 
    <section class="offer" id="parallax-1" data-anchor-target="#parallax-1" data-300-top="background-position: 20px 30px" data-top-bottom="background-position: 0 20px">
      <div class="container">
        <div class="row">
          <div class="col-xl-5">
            <div class="offer__content text-center">
              <h3>최대 70%까지!</h3>
              <h4>Big Sale</h4>
              <p>새책같은 중고책 저렴하게 구입할 수 있는기회!</p>
              <a class="button button--active mt-3 mt-xl-4" href="../junggo/junggo_list.do">Shop Now</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ================ offer section end ================= --> 

    <!--================ Hero banner start =================-->

<section class="order_details section-margin--small">
    <div class="container" >
      <div class="section-intro pb-30px" >
          <h2>Latest <span class="section-intro__style">News</span></h2>
        </div>
      <div class="order_details_table"  style="background-color: #f7f8ff;">  
      <table class="table table-hover">
    <thead>
      <tr>
        <th colspan="2" class="text-center" style="font-size: 20px;">실시간 IT 취업 뉴스</th>
      </tr>
    </thead>
    
    <c:forEach var="vo" items="${list }" varStatus="s">
            <c:if test="${s.index<7 }">
     <tbody>
      <tr>
        <th width=15% class="text-center">${vo.author}</th>
        <td width=85%><a href="${vo.link}">"${vo.description.substring(0,65)}..."</td></a>
      </tr>
       </tbody>
      </c:if>
      </c:forEach>
  </table>
      </div>
    </div>
  </section>
    <!--================ Hero Carousel start =================-->
    <!-- <section class="section-margin mt-0">
      <div class="owl-carousel owl-theme hero-carousel">
        <div class="hero-carousel__slide">
          <img src="../img/home/hero-slide1.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Wireless Headphone</h3>
            <p>Accessories Item</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="../img/home/hero-slide2.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Wireless Headphone</h3>
            <p>Accessories Item</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="../img/home/hero-slide3.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Wireless Headphone</h3>
            <p>Accessories Item</p>
          </a>
        </div>
      </div>
    </section> -->
    <!--================ Hero Carousel end =================-->




    <!-- ================ Best Selling item  carousel ================= -->   
    
    <c:if test="${sessionScope.id != null }">
    <div class="testcontainer">
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p></p>
          <h2>당신이 <span class="section-intro__style">관심가질만한 강의</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="bestSellerCarousel">
          
          <div class="" v-for="rvo in recommed">
        <span>
          <div class="card text-center card-product"  >
          
            <div class="card-product__img">
              <img class="img-fluid" :src="rvo.poster" alt="" width=250 height=250>
              
            </div>
            <div class="card-body">
              <h4 class="card-product__title"><a href="single-product.html">{{rvo.title}}</a></h4>
              <p class="card-product__price">{{rvo.teacher}}</p>
            </div>
          </div>
		</span>
         </div>
        </div>
      </div>
    </section>
    </div>
    </c:if>
    <!-- ================ Best Selling item  carousel end ================= --> 

    <!-- ================ Blog section start ================= -->  
    <!-- <section class="blog">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>Popular Item in the market</p>
          <h2>Latest <span class="section-intro__style">News</span></h2>
        </div>

        <div class="row">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-blog">
              <div class="card-blog__img">
                <img class="card-img rounded-0" src="../img/blog/blog1.png" alt="">
              </div>
              <div class="card-body">
                <ul class="card-blog__info">
                  <li><a href="#">By Admin</a></li>
                  <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
                </ul>
                <h4 class="card-blog__title"><a href="single-blog.html">The Richland Center Shooping News and weekly shooper</a></h4>
                <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-blog">
              <div class="card-blog__img">
                <img class="card-img rounded-0" src="../img/blog/blog2.png" alt="">
              </div>
              <div class="card-body">
                <ul class="card-blog__info">
                  <li><a href="#">By Admin</a></li>
                  <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
                </ul>
                <h4 class="card-blog__title"><a href="single-blog.html">The Shopping News also offers top-quality printing services</a></h4>
                <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-blog">
              <div class="card-blog__img">
                <img class="card-img rounded-0" src="../img/blog/blog3.png" alt="">
              </div>
              <div class="card-body">
                <ul class="card-blog__info">
                  <li><a href="#">By Admin</a></li>
                  <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
                </ul>
                <h4 class="card-blog__title"><a href="single-blog.html">Professional design staff and efficient equipment you’ll find we offer</a></h4>
                <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
                <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->
    <!-- ================ Blog section end ================= -->  

    <!-- ================ Subscribe section start ================= --> 
    <section class="subscribe-position">
      <div class="container">
        <div class="subscribe text-center">
          <h3 class="subscribe__title">Get Update From Anywhere</h3>
          <p>Bearing Void gathering light light his eavening unto dont afraid</p>
          <div id="mc_embed_signup">
            <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe-form form-inline mt-5 pt-1">
              <div class="form-group ml-sm-auto">
                <input class="form-control mb-1" type="email" name="EMAIL" placeholder="Enter your email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '" >
                <div class="info"></div>
              </div>
              <button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe Now</button>
              <div style="position: absolute; left: -5000px;">
                <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
              </div>

            </form>
          </div>
          
        </div>
      </div>
    </section>
    <!-- ================ Subscribe section end ================= --> 
<script>
new Vue({
	el:'.testcontainer',
	data:{
		recommed:[],
		id:''
	},
	mounted:function(){
		console.log('test mounted');
		this.videoListed()
	},
	 methods:{
		
		videoListed:function(){
			let ttis=this;
			console.log('testfunction');
			console.log('testttis  '+this);
			axios.get("http://localhost/main/main/mainrecom.do",{
				params:{
					
				}
			}).then(function(response){
				ttis.recommed=response.data
				//console.log(response.data);
				
			})
			
		}
	} 

}) 
</script>
    