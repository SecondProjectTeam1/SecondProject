<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Blog</title>
	<link rel="icon" href="../img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../vendors/linericon/style.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../css/style.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="./style.css">
  
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.category').click(function(){
		let csno=$(this).attr("data-no");
		$.ajax({
	       type:'post',
	       url:'category_sub.do',
	       data:{"csno":Number(csno)},
	       success:function(result)
	       {
	    	   let json=JSON.parse(result);
	    	   let html="";
	    	   for(let i=0;i<json.length;i++)
	    	   {
	    		   html+='<td class="text-center"><span class="btnn btnn-'+[i+1]+'" onclick=recommend("'+json[i].subject+'")>'+json[i].subject+'</span></td>';
	    	   }
	    	   $('#subject').html(html);
	       }
		})
	})
})
function recommend(rdata)
{
	$.ajax({
		type:'POST',
		url:'recommend_data.do',
		data:{"fd":rdata},
		success:function(result)
		{
			let json=JSON.parse(result);
			let html="";
			for(let i=0;i<json.length;i++)
			{
				html+='<div class="col-md-6 col-lg-2">'
                	+'<div class="card text-center card-product">'
                	+'<div class="card-product__img">'
                	+'<img class="card-img" src="'+json[i].poster+'" style="width:320px;height: 200px">'
                	+'<ul class="card-product__imgOverlay">'
                	+'<li><button><i class="ti-search"></i></button></li>'
                	+'<li><button><i class="ti-shopping-cart"></i></button></li>'
                	+'<li><button><i class="ti-heart"></i></button></li>'
                	+'</ul>'
                	+'</div>'
                	+'<div class="card-body" style="width:175px;height: 100px">'
                	+'<p class="card-product__title" style="font-size: 14px"><a href="#">'+json[i].title+'</a></p>'
                	+'<p class="card-product__price" style="font-size: 12px">￦ '+json[i].price+'</p>'
                	+'</div>'
                	+'</div>'
                	+'</div>'
					
				
			}
			
			$('#blogg').html(html)
		}
	})
}
</script>
</head>
<body>
	  <!-- ================ start banner area ================= -->	
  <section class="blog-banner-area" id="blog">
    <div class="container h-100">
      <div class="blog-banner">
        <div class="text-center">
          <h1>자격증 종류별 책 추천</h1>
          <nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item active" aria-current="page">네이버 블로그 데이터 기반</li>
            </ol>
          </nav>
          <div style="height: 30px"></div>
          <div class="text-center">
        <c:set var="i" value="1"/>
        <c:forEach var="cate" items="${category }">
          <span class="btn btn-sm btn-primary category" data-no="${i}">${cate }</span>
          <c:set var="i" value="${i+1 }"/>
        </c:forEach>
       </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ end banner area ================= -->
	
<!-- partial -->
   <div style="height: 30px"></div>
    <div class="container h-100" >
    
      <div class="row">
       
      </div>
      <div class="row">
       <table class="table">
        <tr id="subject">
         
        </tr>
       </table>
      </div> 
      <div style="height: 60px"></div>
      <div class="row" id="blogg" >
      
      </div>
   </div>
   
<div style="height:300px"></div>
</body>
</html>
