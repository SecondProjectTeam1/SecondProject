<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#checkSpan{
	margin:0px auto;
	text-align:center;
}
.post_window{
display: table;
overflow: auto;
height:50px;

}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

  

$(function(){
		$('.post_window').hide();
		 $('#idBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()=="")
		{
			$('#checkSpan').text("아이디를 입력하세요")
			$('#id').focus();
			
			return;
		}
		 let sex_test=$('#sex').val();
 		 console.log(sex_test);
		$.ajax({
			type:'get',
			url:'idcheck.do',
			data:{"id":id},
			success:function(result)
			{
						
				
				 let json=JSON.parse(result);
				 let idcount=json.idcount;
				 console.log(idcount);
				if(idcount==0)
				{
					$('#checkSpan').text("사용가능한 아이디 입니다.");
				}
				else
				{
					$('#checkSpan').text("이미 사용중인 아이디입니다.");
				}
 		}
		})
		
		
	 });
 	$('#postBtn').click(function(){
 		$('.post_window').show();
 	$('#post_confirm').click(function(){
 		$('.post_window').hide();
 		
 	
 	})	  
 	
 	})	 
 	
 	$('#sex').click(function(){
 		console.log(5555555);
 	});
	
	 $('#postfindBtn').click(function(){
		 
		 let dong=$('#dong').val();
		 
		 if(dong.trim()=="")
		{
			$('#dong').attr("placeholder","동을 입력하세요");
			$('#dong').focus();
		 }
		 
		 console.log(dong);
		 $.ajax({
			 type:'get',
			 url:'zipcode.do',
			 data:{"dong":dong},
			 success:function(result)
			 {
				 let json=JSON.parse(result);
				 let zipcodeData="";
				
				 
				 
			   for(let i=0; i<json.length;i++)
				{
				   if(json[i].bunji==" ")
					   {
					   json[i].bunji=" ";
					   }
				   zipcodeData+='<table class="table">'
					   			+'<tr>'
								+'<td>'+json[i].zipno+ '</td>'
								+'<td>'+json[i].sido+" "+json[i].gugun+" "+json[i].dong+" "+json[1].bunji+'</td>'
								+'</tr>'
								+'</table>'
				
					
								
				 }  
			   		
					 $('.post_window2').html(zipcodeData);
				 
				 $(".post_window2 tr").click(function(){
					 let total_addr=$(this)
					 total_addr=total_addr.text();
					 let post_data=total_addr.substring(0,7);
					 let rest_post=total_addr.substring(7);
					 /* console.log(rest_post); */
					 
					 $('#post').attr("value",function(code){
							
							return post_data;
						});
						$('#addr1').attr("value",function(code){
							
							return rest_post;
						});
					 
				 })
				 
			 }
		 })
	 });	 
		 
		 
});

</script>
</head>
<body>
<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category" style="height:150px;">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>아직 계정이 없으신가요?</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">지금바로</a></li>
              <li class="breadcrumb-item active" aria-current="page">가입하세요!</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				
				<div class="col-lg-12">
					<div class="login_form_inner register_form_inner">
						<h3>회원 가입</h3>
						<form class="row login_form" method="post" action="join_ok.do" id="register_form" >
							<div class="col-md-8 form-group">
								<input type="text" class="form-control" id="id" name="id" placeholder="ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'">
								
							</div>
							<input type="button" class="btn btn-sm btn-primary" value="중복확인" id="idBtn" style="float: left; height:50px; margin-left: 30px;">
							<div class=row style="height: 24px;">
                            
                            </div>
                            <span id="checkSpan"></span>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="pwd" name="pwd" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
              </div>
              <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'">
              </div>
              <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email" placeholder="이메일" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'">
							</div>
				  <div class="col-md-6 form-group">
								<input type="radio" class="form-control" id="sexm" name="sex" placeholder="성별" value="남자"  style="width:30%; margin:0px auto;">남자</div>
				  <div class="col-md-6 form-group">				
								<input type="radio" class="form-control" id="sexf" name="sex" placeholder="성별" value="여자" style="width:30%; margin:0px auto;">여자
								</div>
								
							
								
				<!-- <div class="widget" style="margin:0px auto;">
					<fieldset>
						<label for="radio-1">남자</label>
					    <input type="radio" name="radio-1" id="radio-1">
					    <label for="radio-2">여자</label>
					    <input type="radio" name="radio-1" id="radio-2">
					</fieldset>
				</div> -->
				
		<!-- 		
				<section class="product_description_area" style="margin:0px auto;">
				<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist" style="background-color: white;">
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" id="sex" role="tab"   name="sex" value="남자">남자</a>
					
				</li>
				
				<li class="nav-item">
					<a class="nav-link"  data-toggle="tab" id="sex"  role="tab"  value="여자" name="sex">여자</a>
				</li>
			</ul>
			</div>
			</section> -->
					
				
				<div class="col-md-12 form-group">
								<input type="date" class="form-control" id="birthday" name="birthday" placeholder="생년월일" onfocus="this.placeholder = ''" onblur="this.placeholder = '생년월일'">
							</div>
				<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="tel" name="tel" placeholder="전화번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '전화번호'">
							</div>		
				<div class="col-md-8 form-group">
								<input type="text" class="form-control" id="post" name="post" placeholder="우편번호(000-000)" readonly onfocus="this.placeholder = ''" onblur="this.placeholder = '우편번호'">
								
							</div>
							<input type="button" value="우편번호 검색" class="btn btn-sm btn-primary" id="postBtn" style="float: left; height:50px;">
				<div class="post_window"  >
								<table class="table">
									<tr>
										<td colspan="2">
										<input type="text" id="dong" name="dong" size="25" class="input-sm">
										<input type="btn" id="postfindBtn" size=5 class="btn btn-sm btn-primary" value="검색" style="display:inline; margin-left:25px;" >
										</td>
									</tr>
									<tr>
										<th class="text-center">우편번호</th>
										<th class="text-center">주소</th>
									</tr>
								</table>
							<div class="post_window2" >
								
							</div>
							<div class="btn btn-sm btn-primary" id="post_confirm">확인</div>
							</div>			
				<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" onfocus="this.placeholder = ''" readonly onblur="this.placeholder = '주소'">
							</div>
				<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '주소'">
							</div>								
				<div class="col-md-12 form-group">
								<input type="textarea" class="form-control" id="content" name="content" placeholder="자기 소개" onfocus="this.placeholder = ''" onblur="this.placeholder = '자기 소개'">
							</div>										
							
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-register w-100" style="height:40px;"><p style="color: white">가입</p></button>
							  <div style="height:70px;"></div>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
</body>
</html>