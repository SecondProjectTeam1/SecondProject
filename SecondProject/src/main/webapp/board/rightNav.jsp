<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
$(function(){
   $('#newsSearchBtn').click(function(){
	   let fd = $('#newsSearch').val();
	   window.location.href="../news/main.do?fd="+fd;
   })  
})
</script>
</head>
<body>
 <aside class="single_sidebar_widget search_widget">
     <div class="input-group">
         <input type="text" class="form-control" placeholder="Search Posts">
         <span class="input-group-btn">
             <button class="btn btn-default" type="button">
                 <i class="lnr lnr-magnifier"></i>
             </button>
         </span>
     </div>
     <!-- /input-group -->
     <div class="br"></div>
 </aside>
 <aside class="single_sidebar_widget post_category_widget">
     <h4 class="widget_title">Post Catgories</h4>
     <ul class="list cat-list">
         <li>
             <a href="../board/board.do?type=f" class="d-flex justify-content-between">
                 <p>자유게시판</p>
                 <p>37</p>
             </a>
         </li>
         <li>
             <a href="../board/board.do?type=q" class="d-flex justify-content-between">
                 <p>문의게시판</p>
                 <p>24</p>
             </a>
         </li>
         <li>
             <a href="#" class="d-flex justify-content-between">
                 <p>내가 쓴 글</p>
                 <p>59</p>
             </a>
         </li>
     </ul>
     <div class="br"></div>
 </aside>
 <aside class="single-sidebar-widget newsletter_widget">
 	<c:choose>
       <c:when test = "${sessionScope.id eq null}">
         <h4 class="widget_title">Upload Post</h4>
	     <p>
	         LogIn to upload your own post
	     </p>
       </c:when>
       <c:otherwise>
         <a href="insert.do" style="display:block;">
	     <h4 class="widget_title">Upload Post</h4>
	     <p>
	         upload your own post
	     </p>
	     </a>
       </c:otherwise>
    </c:choose>
 	
 </aside>
 <aside class="single_sidebar_widget author_widget">
     <img class="author_img rounded-circle" src="img/blog/author.png" alt="">
     <h4>Charlie Barber</h4>
     <p>Senior blog writer</p>
     <div class="social_icon">
         <a href="#">
             <i class="fab fa-facebook-f"></i>
         </a>
         <a href="#">
             <i class="fab fa-twitter"></i>
         </a>
         <a href="#">
             <i class="fab fa-github"></i>
         </a>
         <a href="#">
           <i class="fab fa-behance"></i>
         </a>
     </div>
     <p>Boot camps have its supporters andit sdetractors. Some people do not understand why you should
         have to spend money on boot camp when you can get. Boot camps have itssuppor ters andits
         detractors.
     </p>
     <div class="br"></div>
 </aside>
 <aside class="single_sidebar_widget popular_post_widget">
     <h3 class="widget_title">Popular Posts</h3>
     
     <c:forEach var="vo" items="${list}">
     <div class="media post_item">
     <c:choose>
         <c:when test = "${vo.poster eq null}">
		         <c:choose>
		         <c:when test = "${type=='q'}">
		            <img src="../img/qa.png" alt="post" style="width:45px;height:45px">
		         </c:when>
		         <c:otherwise>
		         	<img src="../img/free.png" alt="post" style="width:45px;height:45px">
		         </c:otherwise>
		      	</c:choose>
         </c:when>
         <c:otherwise>
            <img src="${vo.poster}" alt="post">
         </c:otherwise>
      </c:choose>
         <div class="media-body">
             <a href="../board/detail.do?type=${type}&no=${vo.no}">
                 <h3>${vo.title}</h3>
             </a>
             <p><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></p>
         </div>
     </div>
     </c:forEach>
     
     <div class="br"></div>
 </aside>
 <aside class="single_sidebar_widget ads_widget">
     <a href="#">
         <img class="img-fluid" src="../img/blog/blog2.png" alt="">
     </a>
     <div class="br"></div>
 </aside>

<%@include file ="../news/newsSearch.jsp" %>

 <aside class="single-sidebar-widget tag_cloud_widget">
     <h4 class="widget_title">Tag Clouds</h4>
     <ul class="list">
         <li>
             <a href="#">Technology</a>
         </li>
         <li>
             <a href="#">Fashion</a>
         </li>
         <li>
             <a href="#">Architecture</a>
         </li>
         <li>
             <a href="#">Fashion</a>
         </li>
         <li>
             <a href="#">Food</a>
         </li>
         <li>
             <a href="#">Technology</a>
         </li>
         <li>
             <a href="#">Lifestyle</a>
         </li>
         <li>
             <a href="#">Art</a>
         </li>
         <li>
             <a href="#">Adventure</a>
         </li>
         <li>
             <a href="#">Food</a>
         </li>
         <li>
             <a href="#">Lifestyle</a>
         </li>
         <li>
             <a href="#">Adventure</a>
         </li>
     </ul>
 </aside>
</body>
</html>