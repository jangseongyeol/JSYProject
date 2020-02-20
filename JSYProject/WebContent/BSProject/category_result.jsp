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
<script type="text/javascript">
function list(page){
	$.ajax({
		type: "post",
		url: "${path}/product_servlet/categoryPage.do?curPage="+page+"&submenu=${submenu}",
		success: function(result){
			$("#categoryPage").html(result);
		}
	});
}

</script>
</head>
<body>
<div class="row">
<h2 class="text-center">${submenu}</h2>
<br>
 <c:forEach var="dto" items="${list}">
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
<div class="text-center">
     <ul class="pagination">
      <c:if test="${page.curBlock > 1 }">
        <li><a href="#" onclick="list('1')">[처음]</a></li>
      </c:if>
      <c:if test="${page.curBlock > 1 }">
        <li><a href="#" onclick="list('${page.prevPage}')">[이전]</a></li>
      </c:if>
      <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
        <c:choose>
          <c:when test="${num == page.curPage}">
            <li><span style="color: red">${num}</span></li>
          </c:when>
          <c:otherwise>
            <li><a href="#" onclick="list('${num}')">${num}</a></li>
          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:if test="${page.curBlock < page.totBlock}">
        <li><a href="#" onclick="list('${page.nextPage}')">[다음]</a></li>
      </c:if>
      <c:if test="${page.curBlock < page.totBlock}">
        <li><a href="#" onclick="list('${page.totPage}')">[끝]</a></li>
      </c:if>
  </ul>
</div>


 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>