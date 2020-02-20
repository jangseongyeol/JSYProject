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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="../include/css/bootstrap.css">
  <link rel="stylesheet" href="css/managerStyle.css">
  <script type="text/javascript">
  $(function(){
		$("#btnSearch").click(function(){
			document.product_list_form.commit();
		});
		$("#btnInsert").click(function(){
			location.href="${path}/BSProject/manager_product_insert.jsp";
		});
	});
  
  var submenu0 = new Array("-서브메뉴-");
  var submenu1 = new Array("BEST BABY","BEST JUNIOR","BEST ACC");
  var submenu2 = new Array("SPRING","SUMMNER","FALL","WINTER");
  var submenu3 = new Array("BABY OUTER","BABY TOP","BABY BOTTOM","BABY SET","BABY DRESS");
  var submenu4 = new Array("JUNIOR OUTER","JUNIOR TOP","JUNIOR BOTTOM","JUNIOR SET","JUNIOR DRESS");
  var submenu5 = new Array("CAP", "BAG", "SOCKS", "MUFFLER");


  function submenuchange(item){
      var temp, i=0, j=0;
      var ccount, cselect;

      temp = document.product_list_form.submenu;

      for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
      eval('ccount = submenu' + item + '.length');
      for (j=0 ; j<ccount ; j++) {
          eval('cselect = submenu' + item + '[' + j + '];');
          temp.options[j]= new Option(cselect,cselect); 
      }
      temp.options[0].selected=true;
      return true;
  }
  </script>
  <style type="text/css">
  tbody tr:hover {
  cursor: pointer !important;
  }
  .product_list_div .col-sm-2 {
   float: left !important;
  }
.input-group-lg > .form-control,  .input-group-lg > .input-group-btn > .btn {
   height: 34px !important;
   padding: 0 10px!important;
  }
  .container_board {
   padding-top: 30px;
  }
  .product_table th {
   text-align: center;
  }
  @media (max-width: 800px) {
   .container_board {
   padding-top: 0;
  }
  
  }  
  </style>
</head>
<body>
<div class="container"> 
	 	<div class="row text-center">
		<h2>상품 관리 게시판(관리자)</h2>
		<br><br>
<div class="form-group product_list_div">
  <form class="" name="product_list_form" method="post"  action="${path}/product_servlet/product_search.do">
		    <div class="form-group col-xs-4 col-sm-4 col-lg-2 col-md-2">
		      <select name="search_option" class="form-control">
		      	<option selected value="productname">상품명</option>
	    	  </select>
		    </div>
  <div class="input-group input-group-lg col-xs-4 col-sm-4 col-lg-2 col-md-2">
               <input type="text" name="keyword" class="form-control" placeholder="Search">
                 <div class="input-group-btn">
                   <button class="btn btn-default" type="submit" id="btnSearch">
                   <i class="glyphicon glyphicon-search"></i>
                   </button>
                 </div>
               </div>
 </form>
</div> 
			<table class="table table-hover text-center product_table">
				<thead>
						<tr class="text-center">
							<th class="hidden-sm hidden-xs">상품번호</th>
							<th class="hidden-sm hidden-xs">메인메뉴</th>
							<th>서브메뉴</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th class="hidden-sm hidden-xs">날짜</th>
                            <th>조회수</th>
						</tr>
				</thead>
				<tbody>
   <c:forEach var="dto" items="${list}">
    <tr>
      <td class="hidden-sm hidden-xs">${dto.productid}</td>
      <td class="hidden-sm hidden-xs">${dto.mainmenu}</td>
      <td>${dto.submenu}</td>
      <td>        
      <a href="${path}/product_servlet/product_view.do?productid=${dto.productid}">
        ${dto.productname}</a>
      </td>
      <td>${dto.price}</td>
      <td class="hidden-sm hidden-xs"><fmt:formatDate value="${dto.reg_date}" pattern="yyyy.MM.dd" /></td>
      <td>${dto.readcount}</td>
    </tr>
  </c:forEach>
 </tbody>
</table>
             <div class="form-group text-center">
			      <button type="submit" id="btnInsert" class="btn btn-dark pull-right">
			         상품업데이트
                  </button>
            </div>     
  <!-- 페이지 네비게이션 출력  -->

    <div class="text-center">
     <ul class="pagination">
      <c:if test="${page.curBlock > 1 }">
        <li><a href="#" onclick="productList('1')">[처음]</a></li>
      </c:if>
      <c:if test="${page.curBlock > 1 }">
        <li><a href="#" onclick="productList('${page.prevPage}')">[이전]</a></li>
      </c:if>
      <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
        <c:choose>
          <c:when test="${num == page.curPage}">
            <li><span style="color: red">${num}</span></li>
          </c:when>
          <c:otherwise>
            <li><a href="#" onclick="productList('${num}')">${num}</a></li>
          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:if test="${page.curBlock < page.totBlock}">
        <li><a href="#" onclick="productList('${page.nextPage}')">[다음]</a></li>
      </c:if>
      <c:if test="${page.curBlock < page.totBlock}">
        <li><a href="#" onclick="productList('${page.totPage}')">[끝]</a></li>
      </c:if>
  </ul>
</div> 
 
		<!-- </div> -->
	</div>
</div>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>