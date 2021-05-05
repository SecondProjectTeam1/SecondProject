<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let u=0;
let i=0;
$(function(){
	$('.updateBtn').click(function(){
		$('.updates').hide();
		$('.inserts').hide();
		let no=$(this).attr("data-no");
		if(u==0) {
			$('#m'+no).show();
			$(this).text("취소");
			u=1;
		}
		else {
			$('#m'+no).hide();
			$(this).text("수정");
			u=0;
		}
	})
	$('.insertBtn').click(function(){
		$('.updates').hide();
		$('.inserts').hide();
		let no=$(this).attr("data-no");
		if(i==0)
		{
			$(this).text("취소");
			$('#in'+no).show();
			i=1;
		}
		else
		{
			$(this).text("댓글");
			$('#in'+no).hide();
			i=0;
		}
	});
	
	
	
	// 댓글 댓글 올리기 
	$('.rrBtn').click(function(){
		let data_no=$(this).attr("data-no");
		let pno=$('#rr_insert_pno'+data_no).val();
		let bno=$('#rr_insert_bno'+data_no).val();
		let page=$('#rr_insert_page'+data_no).val();
		let msg=$('#rr_insert_msg'+data_no).val();
		if(msg.trim()=="") {
			$('#rr_insert_msg'+data_no).focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'reply_to_reply_insert.do',
			data:{"pno":pno,"bno":bno,"page":page,"msg":msg},
			success:function(result) {
				$('#reply_data').html(result);
			}
		})
	})

	
})
// 댓글 추가
function reply(){
	let bno=$('#insert_bno').val();
	let msg=$('#message').val();
	// val() => <input> , <select> , <textarea>
	if(msg.trim()=="") {
		$('#message').focus();
		return;
	}
	$.ajax({
		type:'POST',
		url:'reply_insert.do',
		data:{"bno":bno,"msg":msg},
		success:function(result) {
			$('#reply_data').html(result);
		}
	})
};
// 삭제하기
function deleteRe(re){
	let no=$(re).attr("data-no");
	let bno=$(re).attr("data-bno");
	console.log(no,bno);
	$.ajax({
		type:'get',
		url:'reply_delete.do',
		data:{"no":no,"bno":bno},
		success:function(result){
			$('#reply_data').html(result);
		}
	})
};
//댓글 수정 
function updateRe(re){
	let data_no=$(re).attr("data-no");
	let bno=$(re).attr("data-bno");
	let msg=$('#re-'+data_no).text();
	console.log(data_no,msg)
	$('#re-'+data_no).html(
		"<textarea id='edit_re"+data_no+"'>"+msg+"</textarea>"	
	);
	$('#modify'+data_no).html(
			"<a onclick='updateReOk(this);' class='btn-reply text-uppercase' data-no="+data_no+" data-bno="+bno+">update</a> "
			+"<a onclick='' class='btn-reply text-uppercase' data-no="+data_no+" data-bno="+bno+">cancle</a> "
	);
	/* if(msg.trim()=="") {
		$('#update_msg'+data_no).focus();
		return;
	}
	$.ajax({
		type:'post',
		url:'reply_update.do',
		data:{"no":no,"bno":bno,"msg":msg},
		success:function(result) {
			$('#reply_data').html(result);
		}
	}) */
}
</script>
</head>
<body>
	<div class="comments-area">
			<h4>${rList.size()} Comments</h4>
			
			<c:forEach var="rvo" items="${rList}">
			<c:if test="${rvo.root>0}">
            <c:set var="rtype" value="left-padding"/>
           </c:if>
           
			<div class="comment-list ${rtype}">
				<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
						<div class="thumb">
							<img src="img/blog/c1.jpg" alt="">
						</div>
						<div class="desc" id="replydetail">
							<h5>
								<a href="#">${rvo.id}</a>
							</h5>
							<p class="date">${rvo.redate} </p>
							<p class="comment" id="re-${rvo.no}">${rvo.msg}</p>
						</div>
					</div>
					<c:choose>
					<c:when test="${sessionScope.id eq rvo.id}">
						<div id="modify${rvo.no}">
							<a href="javascript:;" onclick="updateRe(this);" class="btn-reply text-uppercase" data-no="${rvo.no}">modify</a>
							<a href="javascript:;" onclick="deleteRe(this);" class="btn-reply text-uppercase" data-no="${rvo.no}" data-bno="${no}">delete</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="reply-btn">
							<a href="#" class="btn-reply text-uppercase">reply</a>
						</div>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			</c:forEach>
			
			<div class="comment-list left-padding">
					<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
									<div class="thumb">
											<img src="img/blog/c2.jpg" alt="">
									</div>
									<div class="desc">
											<h5>
													<a href="#">Elsie Cunningham</a>
											</h5>
											<p class="date">December 4, 2017 at 3:12 pm </p>
											<p class="comment">
													Never say goodbye till the end comes!
											</p>
									</div>
							</div>
							<div class="reply-btn">
									<a href="#" class="btn-reply text-uppercase">reply</a>
							</div>
					</div>
			</div>
			<div class="comment-list">
					<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
									<div class="thumb">
											<img src="img/blog/c4.jpg" alt="">
									</div>
									<div class="desc">
											<h5>
													<a href="#">Maria Luna</a>
											</h5>
											<p class="date">December 4, 2017 at 3:12 pm </p>
											<p class="comment">
													Never say goodbye till the end comes!
											</p>
									</div>
							</div>
							<div class="reply-btn">
									<a href="#" class="btn-reply text-uppercase">reply</a>
							</div>
					</div>
			</div>
	</div>
	<div class="comment-form">
			<h4>Leave a Reply</h4>
			<c:choose>
			<c:when test="${sessionScope.id eq null }">
				<strong>로그인시 댓글 이용 가능합니다.</strong>
			</c:when>
			<c:otherwise>
			<form>
				<div class="form-group form-inline">
					<div class="form-group col-lg-6 col-md-6 name">
						<input type="text" class="form-control" id="name" readonly value="${sessionScope.id}">
					</div>
				</div>
				<div class="form-group">
					 <input type="hidden" name=bno value="${no}" id="insert_bno">
					<textarea class="form-control mb-10" rows="5" name="message" id="message" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"
								required=""></textarea>
				</div>
				<a href="javascript:reply()" class="button button-postComment button--active" id="reBtn">Post Comment</a>
			</form>
			</c:otherwise>
			</c:choose>
	</div>
</body>
</html>