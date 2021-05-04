<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table>
				<h1>주소찾기 확인창</h1>
				<c:forEach var="vo" items="${list }">
					<td>${vo.zipcode }</td>
					<td>${vo.address }</td>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>