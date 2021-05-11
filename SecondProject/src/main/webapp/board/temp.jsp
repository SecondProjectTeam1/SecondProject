<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
function submit(){
	let id = $('#id').val();
	let title = $('#title').val();
	let content = $('#content').val();
	console.log(id,title,content)
	if(title.trim()=="") {
		$('#title').focus();
		return;
	};
	if(content.trim()=="") {
		$('#content').focus();
		return;
	};
	var form = document.frm;
    form.submit();
};
//사진 업로드
function uploadImageByImgur(file, callback) {
	form = new FormData();
	form.append('image', file);
	$.ajax({
			xhr : function() {
				var xhr = new window.XMLHttpRequest();
				xhr.upload.addEventListener("progress", function(evt) {
					if (evt.lengthComputable) {
						console.log("업로드진행률:"+ parseInt((evt.loaded / evt.total * 100),10) + "%");
					}
				}, false);
				return xhr;
			},
			url : 'https://api.imgur.com/3/image',             
			headers : {
				Authorization : 'Client-ID 8d95801a0ad3ea9'
			},
			type : 'POST',
			data : form,
			cache : false,
			contentType : false,
			processData : false
	}).always(callback);
}
$(document).ready(function() {
	$("input[name=img]").change(function() {
		var file = this.files[0];
		uploadImageByImgur(file, function(result) {
			console.log(result);
			console.log('업로드결과:' + result.status);
			if (result.status != 200) {
				result = $.parseJSON(result.responseText);
			}
			if (result.data.error) {
				console.log('지원하지않는 파일형식..');
			} else {
				console.log('업로드된 파일경로:' + result.data.link);
				$('input[name="poster"]').val(result.data.link);
			}
		});
	});
});

$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');
	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            var filename = $(this)[0].files[0].name;
	        } else {
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        }
	        $(this).siblings('.upload-name').val(filename);
	    });
}); 
function setThumbnail(event) {
	for (var image of event.target.files) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var container = document.querySelector("div#image_container");
			while(container.hasChildNodes()){
				container.removeChild(container.firstChild);
			}
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.style.width = '100%';
			container.appendChild(img);
		};
		console.log(image);
		reader.readAsDataURL(image); 
	} 
}
</script>
</head>  
<body>
<%@include file ="../board/header.jsp" %>

	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Upload Post</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">upload your post</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->



  <!--================Blog Area =================-->
	<section class="blog_area single-post-area py-80px section-margin--small">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
				<form action="update_ok.do" name=frm method="post">
					<div class="single-post row">
					<div class="col-lg-12">
					<span>THUMBNAIL</span>
					<div>
						<input name="poster" type="file" id="img" onchange="setThumbnail(event);"/><br>
						<div id="image_container">
							<img src="${vo.poster}" style="width:100%">
						</div>
					</div>
					</div>
					</div>
					
					<div class="col-lg-12 col-md-9 blog_details">
						
						<input type="hidden" name=id value="${sessionScope.id}">
							<div class="form-group">
							<span>TITLE</span>
								<input type="text" class="form-control" value="${vo.title}" name='title' id="title" placeholder="Insert Title" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Insert Title'">
							</div>
						<div class="form-group">
						<span>CONTENT</span>
							<textarea class="form-control mb-10" rows="20" name="content" id='content' placeholder="Insert Content" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Insert Content'"
										required="">${vo.content}</textarea>
						</div>
						
					</div>
					<div class="col-lg-12">
						<div class="row">
								<div class="col-6">
									<img class="img-fluid" src="img/blog/post-img1.jpg" alt="">
								</div>
								<div class="col-6">
									<img class="img-fluid" src="img/blog/post-img2.jpg" alt="">
								</div>
								<div class="col-lg-12 mt-4">
									<p>
										MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money
										on boot camp when you can get the MCSE study materials yourself at a fraction of
										the camp price. However, who has the willpower.
									</p>
								</div>
						</div>
					</div>
			</div>
			<div class="navigation-area">
				<div class="row">
						<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
							
						</div>
						<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
							<div class="detials">
								<a href="javascript:submit();" class="button button-postComment button--active" id="reBtn">MODIFY</a>
							</div>
							<div class="detail">
							&nbsp;&nbsp;&nbsp;
							</div>
							<div class="detials">
								<a href="#" onclick="history.back();" class="button button-postComment button--active" id="reBtn">CANCLE</a>
							</div>
						</div>
				</div>
			</div>
			</form>
	</div>
	<div class="col-lg-4">
			<div class="blog_right_sidebar">
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
                         <a href="insert.do" style="display:block;">
                          <h4 class="widget_title">Upload Post</h4>
                          <p>
                              upload your own post
                          </p>
                          </a>
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
                         <div class="media post_item">
                             <img src="img/blog/popular-post/post1.jpg" alt="post">
                             <div class="media-body">
                                 <a href="single-blog.html">
                                     <h3>Space The Final Frontier</h3>
                                 </a>
                                 <p>02 Hours ago</p>
                             </div>
                         </div>
                         <div class="media post_item">
                             <img src="img/blog/popular-post/post2.jpg" alt="post">
                             <div class="media-body">
                                 <a href="single-blog.html">
                                     <h3>The Amazing Hubble</h3>
                                 </a>
                                 <p>02 Hours ago</p>
                             </div>
                         </div>
                         <div class="media post_item">
                             <img src="img/blog/popular-post/post3.jpg" alt="post">
                             <div class="media-body">
                                 <a href="single-blog.html">
                                     <h3>Astronomy Or Astrology</h3>
                                 </a>
                                 <p>03 Hours ago</p>
                             </div>
                         </div>
                         <div class="media post_item">
                             <img src="img/blog/popular-post/post4.jpg" alt="post">
                             <div class="media-body">
                                 <a href="single-blog.html">
                                     <h3>Asteroids telescope</h3>
                                 </a>
                                 <p>01 Hours ago</p>
                             </div>
                         </div>
                         <div class="br"></div>
                     </aside>
                     <aside class="single_sidebar_widget ads_widget">
                         <a href="#">
                             <img class="img-fluid" src="img/blog/add.jpg" alt="">
                         </a>
                         <div class="br"></div>
                     </aside>

                     <aside class="single-sidebar-widget newsletter_widget">
                         <h4 class="widget_title">Newsletter</h4>
                         <p>
                             Here, I focus on a range of items and features that we use in life without giving them a second thought.
                         </p>
                         <div class="form-group d-flex flex-row">
                             <div class="input-group">
                                 <div class="input-group-prepend">
                                     <div class="input-group-text">
                                         <i class="fa fa-envelope" aria-hidden="true"></i>
                                     </div>
                                 </div>
                                 <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Enter email address" onfocus="this.placeholder = ''"
                                     onblur="this.placeholder = 'Enter email'">
                             </div>
                             <a href="#" class="bbtns">Subcribe</a>
                         </div>
                         <p class="text-bottom">You can unsubscribe at any time</p>
                         <div class="br"></div>
                     </aside>
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
				</div>
			</div>
		</div>
		</div>
</section>
	<!--================Blog Area =================-->
  
<%@include file ="../board/footer.jsp" %>
</body>
</html>