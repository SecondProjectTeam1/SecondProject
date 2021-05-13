<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row_home{
  margin: 0px auto;
  width:1200px;
  height:600px;
}
</style>
</head>
<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>관리자 페이지</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#"></a></li>
              <li class="breadcrumb-item active" aria-current="page">주문관리</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  
  <!--================Checkout Area =================-->
 <div style="height: 30px"></div>
  <div class="row row_home">
   <table class="table">
     <tr class="danger">
      <th class="text-center">번호</th>
      <th class="text-center"></th>
      <th class="text-center">ID</th>
      <th class="text-center">상품명</th>
      <th class="text-center">구매일</th>
      <th class="text-center">구매갯수</th>
      <th class="text-center">구매금액</th>
      <th class="text-center">상태</th>
     </tr>
     
     
     <c:forEach var="d" items="${dalist }">
      <tr>
       <td class="text-center">${d.cartno }</td>
       <td class="text-center"><img src="${d.dvo.poster }" width=30 height=30/></td>
       <td class="text-center">${d.id }</td>
       <td class="text-center">${d.dvo.title }</td>
       <td class="text-center"><fmt:formatDate value="${d.regdate }" pattern="yyyy-MM-dd"/></td>
       <td class="text-center">${d.qty }</td>
       <td class="text-center">${d.total_price }</td>
       <td class="text-center">
         <c:if test="${d.state2=='n' }">
           <a href="../cart/orderAdmin_ok.do?cartno=${d.cartno }" class="btn btn-sm btn-danger">승인요청</a>
         </c:if>
         <c:if test="${d.state2=='y' }">
            <span class="btn btn-sm btn-success">승인완료</span>
         </c:if>
       </td>
       </tr>
     </c:forEach>
     
     <c:forEach var="f" items="${falist }">
      <tr>
       <td class="text-center">${f.cartno }</td>
       <td class="text-center"><img src="${f.fvo.poster }" width=30 height=30/></td>
       <td class="text-center">${f.id }</td>
       <td class="text-center">${f.fvo.title }</td>
       <td class="text-center"><fmt:formatDate value="${f.regdate }" pattern="yyyy-MM-dd"/></td>
       <td class="text-center">${f.qty }</td>
       <td class="text-center">${f.total_price }</td>
       <td class="text-center">
         <c:if test="${f.state2=='n' }">
           <a href="../cart/orderAdmin_ok.do?cartno=${f.cartno }" class="btn btn-sm btn-danger">승인요청</a>
         </c:if>
         <c:if test="${f.state2=='y' }">
            <span class="btn btn-sm btn-success">승인완료</span>
         </c:if>
       </td>
       </tr>
     </c:forEach>
     
     <c:forEach var="u" items="${ualist }">
      <tr>
       <td class="text-center">${u.cartno }</td>
       <td class="text-center"><img src="${u.uvo.poster }" width=30 height=30/></td>
       <td class="text-center">${u.id }</td>
       <td class="text-center">${u.uvo.title }</td>
       <td class="text-center"><fmt:formatDate value="${u.regdate }" pattern="yyyy-MM-dd"/></td>
       <td class="text-center">${u.qty }</td>
       <td class="text-center">${u.total_price }</td>
       <td class="text-center">
         <c:if test="${u.state2=='n' }">
           <a href="../cart/orderAdmin_ok.do?cartno=${u.cartno }" class="btn btn-sm btn-danger">승인요청</a>
         </c:if>
         <c:if test="${u.state2=='y' }">
            <span class="btn btn-sm btn-success">승인완료</span>
         </c:if>
       </td>
       </tr>
     </c:forEach>
     
     <c:forEach var="v" items="${valist }">
      <tr>
       <td class="text-center">${v.cartno }</td>
       <td class="text-center"><img src="${v.cvo.poster }" width=30 height=30/></td>
       <td class="text-center">${v.id }</td>
       <td class="text-center">${v.cvo.title }</td>
       <td class="text-center"><fmt:formatDate value="${v.regdate }" pattern="yyyy-MM-dd"/></td>
       <td class="text-center">${v.qty }</td>
       <td class="text-center">${v.total_price }</td>
       <td class="text-center">
         <c:if test="${v.state2=='n' }">
           <a href="../cart/orderAdmin_ok.do?cartno=${v.cartno }" class="btn btn-sm btn-danger">승인요청</a>
         </c:if>
         <c:if test="${v.state2=='y' }">
            <span class="btn btn-sm btn-success">승인완료</span>
         </c:if>
       </td>
       </tr>
     </c:forEach>
   </table>
  </div>
  <!--================End Checkout Area =================-->
</body>
</html>