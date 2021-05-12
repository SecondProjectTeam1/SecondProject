<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
  <aside class="single-sidebar-widget newsletter_widget">
     <a href="../news/main.do" style="display:block;"><h4 class="widget_title">News</h4>
      <p>
          Here, check out the latest news.
      </p>
      </a>
      <div class="form-group d-flex flex-row">
          <div class="input-group">
              <div class="input-group-prepend">
                  <div class="input-group-text">
                      <i class="fa fa-envelope" aria-hidden="true"></i>
                  </div>
              </div>
              <input type="text" class="form-control" id="newsSearch" placeholder="Enter email address" onfocus="this.placeholder = ''"
                  onblur="this.placeholder = 'Enter word'">
          </div>
          <a href="#" class="bbtns" id="newsSearchBtn">Search</a>
      </div>
      <p class="text-bottom">You can Search for your interest.</p>
      <div class="br"></div>
  </aside>
</body>
</html>