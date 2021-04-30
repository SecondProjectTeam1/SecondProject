<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${list.size()==0 }">
	<div class="text-center" style="height:200px">
	일치하는 검색 결과가 없습니다
	</div>
</c:if>
<c:forEach var="vo" items="${list}">
  <article class="row blog_item">
      <div class="col-md-3">
          <div class="blog_info text-right">
              <div class="post_tag">
                  Category: &nbsp;&nbsp;<a class="active" href="#">${fd}</a>
              </div>
              <ul class="blog_meta list">
                  <li>
                      <a href="#">${vo.author}
                          <i class="lnr lnr-user"></i>
                      </a>
                  </li>
                  <li>
                      <a href="#">${vo.pubDate}
                          <i class="lnr lnr-calendar-full"></i>
                      </a>
                  </li>
              </ul>
          </div>
      </div>
      <div class="col-md-9">
          <div class="blog_post">
              <div class="blog_details">
                  <a href="${vo.link}">
                      <h2>${vo.title}</h2>
                  </a>
                  <p>${vo.description}</p>
                  <a class="button button-blog" href="${vo.link}">View More</a>
              </div>
          </div>
      </div>
  </article>
  </c:forEach>
  
  <input type="hidden" id="fd" value="${fd}">
  <input type="hidden" id="word" value="${word}">
  <nav class="blog-pagination justify-content-center d-flex">
	<ul class="pagination">
         <c:if test="${startPage>1} ">
         <li class="page-item">
              <a href="../news/news.do?fd=${fd}&word=${word}&page=${startPage-1}" class="page-link" aria-label="Previous">
                  <span aria-hidden="true">
                      <span class="lnr lnr-chevron-left"></span>
                  </span>
              </a>
          </li>
         </c:if>
         
         <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
           <c:if test="${i==curpage}">
            <c:set var="type" value="active"/>
           </c:if>
           <c:if test="${i!=curpage}">
            <c:set var="type" value=""/>
           </c:if>
           <li class="page-item ${type}" id="pageNum">
              <div class="page-link">${i}</div>
          </li>
         </c:forEach>
         
         <c:if test="${endPage<totalpage }">
         <li class="page-item">
              <a href="../news/news.do?fd=${fd}&word=${word}&page=${endPage+1}" class="page-link" aria-label="Next">
                  <span aria-hidden="true">
                      <span class="lnr lnr-chevron-right"></span>
                  </span>
              </a>
          </li>
         </c:if>
       </ul>
  </nav>
  
</body>
</html>