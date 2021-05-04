<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
		 $('#idBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()=="")
		{
			$('#checkSpan').text("아이디를 입력하세요")
			$('#id').focus();
			
			return;
		}
		
		$.ajax({
			type:'post',
			url:'idcheck.do',
			dataType : "json",
			data:{"id":id},
			successs:function(result)
			{
				$('#checkSpan').text("성고옹");
			}
		
		});
		
	 });
		 
	
	 $('#postBtn').click(function(){
		 
	 });	 
		 
		 
});
</script>
</head>
<body>
<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Register</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Register</li>
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
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="id" name="id" placeholder="ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'">
								<input type="button" class="btn btn-sm btn-primary" value="중복확인" id="idBtn">
							</div>
							<div class=row style="height: 24px;">
                            <span id="checkSpan"></span>
                            </div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="pwd" name="pwd" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
              </div>
              <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'">
              </div>
              <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email" placeholder="이메일" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'">
							</div>
				<div class="col-md-12 form-group">
								<input type="checkbox" class="form-control" id="sex" name="sex" placeholder="성별" value="남자" onfocus="this.placeholder = ''" onblur="this.placeholder = '남자'">
								<input type="checkbox" class="form-control" id="sex" name="sex" placeholder="성별" value="여자" onfocus="this.placeholder = ''" onblur="this.placeholder = '여자'">
							</div>			
				<div class="col-md-12 form-group">
								<input type="date" class="form-control" id="birthday" name="birthday" placeholder="생년월일" onfocus="this.placeholder = ''" onblur="this.placeholder = '생년월일'">
							</div>
				<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="tel" name="tel" placeholder="전화번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '전화번호'">
							</div>		
				<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="post" name="post" placeholder="우편번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '주소'">
								<input type="button" value="우편번호 검색" class="btn btn-sm btn-primary" id="postBtn">
							</div>
				<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '주소'">
							</div>
				<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '주소'">
							</div>								
				<div class="col-md-12 form-group">
								<input type="textarea" class="form-control" id="content" name="content" placeholder="자기 소개" onfocus="this.placeholder = ''" onblur="this.placeholder = '자기 소개'">
							</div>										
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">Keep me logged in</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-register w-100">가입</button>
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