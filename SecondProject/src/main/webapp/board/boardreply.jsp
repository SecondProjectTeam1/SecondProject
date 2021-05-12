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
// 삭제
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
	$('#re-'+data_no).html(
		"<textarea id='edit_re"+data_no+"'>"+msg+"</textarea>"	
	);
	$('#modify'+data_no).html(
			"<a href='javascript:;' onclick='updateReOk(this);' class='btn-reply text-uppercase' data-no='"+data_no+"' data-bno='"+bno+"'>update</a> "
			+"<a href='javascript:;' onclick='back(this);' class='btn-reply text-uppercase' data-bno='"+bno+"'>cancle</a> "
	);
};
function updateReOk(re){
	let no=$(re).attr("data-no");
	let bno=$(re).attr("data-bno");
	let msg=$('#edit_re'+no).val();
	if(msg.trim()=="") {
		$('#edit_re'+no).focus();
		return;
	}
	$.ajax({
		type:'post',
		url:'reply_update.do',
		data:{"no":no,"bno":bno,"msg":msg},
		success:function(result) {
			$('#reply_data').html(result);
		}
	})
}
function adminDelete(re){
	let no=$(re).attr("data-no");
	let bno=$(re).attr("data-bno");
	$.ajax({
		type:'post',
		url:'reply_update.do',
		data:{"no":no,"bno":bno,"msg":"adminDel"},
		success:function(result) {
			$('#reply_data').html(result);
		}
	})
}
//답댓
function reReply(re){
	$('.rere').show();
	let root=$(re).attr("data-no");
	let bno=$(re).attr("data-bno");
	$('#reply'+root).html(
			"<a href='javascript:;' onclick='back(this);' class='btn-reply text-uppercase' data-bno='"+bno+"'>cancle</a> "
	);
}
function reReplyOk(re){
	let bno=$('#rere_bno').val();
	let root=$('#rere_no').val();
	let msg=$('#remessage').val();
	console.log(bno,root,msg)
	if(msg.trim()=="") {
		$('#remessage').focus();
		return;
	}
	$.ajax({
		type:'POST',
		url:'reReplyinsert.do',
		data:{"bno":bno,"msg":msg,"root":root},
		success:function(result) {
			$('#reply_data').html(result);
		}
	});
}
function back(re){
	$('.rere').hide();
	let bno=$(re).attr("data-bno");
	$.ajax({
		type:'GET',
		url:'reply_list.do',
		data:{"bno":bno},
		success:function(result){
			$('#reply_data').html(result);
		}
	});
}
</script>
</head>
<body>
	<div class="comments-area">
			<h4>${rList.size()} Comments</h4>
			
			<c:forEach var="rvo" items="${rList}">
			<c:choose>
				<c:when test="${rvo.msg eq 'adminDel'}">
					<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
					<p class="comment">관리자가 삭제한 댓글입니다.</p>
					<div style="height:60px"></div>
					</div>
					</div>
				</c:when>
				<c:otherwise>
			
			<div class="comment-list">
				<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
						<div class="desc" id="replydetail">
							<h5><a href="#">${rvo.id}</a></h5>
							<p class="date">${rvo.redate} </p>
							<p class="comment" id="re-${rvo.no}">${rvo.msg}</p>
						</div>
					</div>
					<c:choose>
						<c:when test="${sessionScope.admin eq 'y'}">
							<div>
								<a href="javascript:;" onclick="adminDelete(this);" class="btn-reply text-uppercase"
									 data-no="${rvo.no}" data-bno="${no}">delete</a>
							</div>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${sessionScope.id eq rvo.id}">
									<div id="modify${rvo.no}">
										<a href="javascript:;" onclick="updateRe(this);" class="btn-reply text-uppercase" data-no="${rvo.no}" data-bno="${no}">modify</a>
										<a href="javascript:;" onclick="deleteRe(this);" class="btn-reply text-uppercase" data-no="${rvo.no}" data-bno="${no}">delete</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="reply-btn" id="reply${rvo.no}">
										<a href="javascript:;" onclick="reReply(this);" class="btn-reply text-uppercase" data-no="${rvo.no}" data-bno="${no}">reply</a>
									</div>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<c:forEach var="avo" items="${aList}">
			<c:if test="${rvo.no==avo.root}">
			<div class="comment-list left-padding">
				<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
						<div class="thumb">
							<img src="img/blog/c1.jpg" alt="">
						</div>
						<div class="desc" id="replydetail">
							<h5>
								<a href="#">${avo.id}</a>
							</h5>
							<p class="date">${avo.redate} </p>
							<p class="comment" id="re-${avo.no}">${avo.msg}</p>
						</div>
					</div>
					<c:choose>
						<c:when test="${sessionScope.admin eq 'y'}">
							<div>
								<a href="javascript:;" onclick="deleteRe(this);" class="btn-reply text-uppercase" data-no="${avo.no}" data-bno="${no}">delete</a>
							</div>
						</c:when>
						<c:otherwise>
							<c:choose>
							<c:when test="${sessionScope.id eq avo.id}">
								<div id="modify${avo.no}">
									<a href="javascript:;" onclick="updateRe(this);" class="btn-reply text-uppercase" data-no="${avo.no}" data-bno="${no}">modify</a>
									<a href="javascript:;" onclick="deleteRe(this);" class="btn-reply text-uppercase" data-no="${avo.no}" data-bno="${no}">delete</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="reply-btn" id="reply${avo.no}">
									<a href="javascript:;" onclick="reReply(this);" class="btn-reply text-uppercase" data-no="${avo.no}" data-bno="${no}">reply</a>
								</div>
							</c:otherwise>
							</c:choose>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			</c:if>
			</c:forEach>
			
			<form class="rere" style="display:none">
				<div class="form-group">
					 <input type="hidden" name=rbno value="${no}" id="rere_bno">
					 <input type="hidden" name=rno value="${rvo.no}" id="rere_no">
					<textarea class="form-control mb-10" rows="5" name="message" id="remessage" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Reply'"
								required=""></textarea>
				</div>
				<a href="javascript:reReplyOk()" class="button button-postComment button--active" id="reBtn">Post Reply</a>
			</form>
			</c:otherwise>
			</c:choose>
			</c:forEach>
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