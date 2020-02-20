<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("utf-8");%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="../BSProject/css/style.css">
</head>
<body>
<div class="row">
<h2 class="text-center" style="color:pink">${submenu} 최신 상품</b></h2>
<br>
 <c:forEach var="dto" items="${list}" begin="0" end="24">
 <c:choose>
  <c:when test="${dto.submenu == submenu}">
    <div class="col-xs-4 col-sm-4 col-md-3 col-lg-3 text-center">  
    <a href="${path}/product_servlet/product_detail_view.do?productid=${dto.productid}">
    <input type="hidden" name="productid" value="${dto.productid}">
     <img src="../upload_image/${dto.filename0}" class="img-rounded img-responsive"> </a>
     <b>${dto.productname}</b><br>
     <b>${dto.price}</b><br>
     <b>${dto.product_color1} ${dto.product_color2} ${dto.product_color3} ${dto.product_color4} ${dto.product_color5} ${dto.product_color6}</b><br>
     <b>${dto.modelsize1} ${dto.modelsize2} ${dto.modelsize3} ${dto.modelsize4} ${dto.modelsize5} ${dto.modelsize6}</b><br>  
    </div>
    </c:when>
  </c:choose>
 </c:forEach>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>