<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../BSProject/managerHeader.jsp" %>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("utf-8");%>
<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../BSProject/css/managerStyle.css"> 
 <script type="text/javascript">
 
 function productList(page){
	  	location.href="${path}/store_servlet/member_search.do?curPage="+page+"&search_option=${search_option}"+"&keyword=${keyword}";
	  }
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

 <footer class="bs-docs-footer">

<br>   
<hr>
<div class="row text-left">
<div class="col-xs-3 text-center col-sm-3 col-md-2 col-lg-1">
 <a href="#" class="footer_atag">회사소개</a>
</div>
<div class="col-xs-3 text-center col-sm-3 col-md-2 col-lg-1">
<a href="agreement.html" class="footer_atag">이용약관</a>
</div>
<div class="col-xs-3 text-center col-sm-3 col-md-3 col-lg-2">
<a href="privacy_policy.html" class="footer_atag">개인정보취급방침</a>
</div>
<div class="col-xs-3 text-center col-sm-3 col-md-2 col-lg-1">
<a href="guide.html" class="footer_atag">이용안내</a>
</div>
<div class="col-md-2 col-lg-2 visible-lg visible-md" >
<a href="mailto:Hongkildong@naver.com" class="footer_atag">제휴문의</a>
</div>
</div>
<hr>
 <div class="row text-left">
<div class="col-xs-1 col-sm-1 col-md-4 col-lg-4"></div>
     <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">  
     <a href="https://touch.facebook.com/login/">
     <img src="../FooterImage/facebook.png" class="img-rounded img-responsive">
     </a>
     </div>
     <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
     <a href="https://www.instagram.com/accounts/login/?hl=ko">
     <img src="../FooterImage/Instagram.png" class="img-rounded img-responsive">
     </a>
     </div>
     <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
     <a href="https://nid.naver.com/nidlogin.login">
     <img src="../FooterImage/blog.png" class="img-rounded img-responsive">
     </a>
     </div>
     <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
     <a href="https://story.kakao.com/s/login">
     <img src="../FooterImage/kakaostory.png" class="img-rounded img-responsive">
     </a>
     </div>
     <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
     <a href="https://www.kakaocorp.com/service/KakaoTalk?lang=ko">
     <img src="../FooterImage/kakao.png" class="img-rounded img-responsive">
     </a>
     </div>
 <div class="col-xs-1 col-sm-1 col-md-3 col-lg-3 text-center"></div>
 </div>    
<hr>
<div class="row">
<div class="col-xs-6 col-md-3 col-lg-3" id="footer_middle_div1">
<p class="text-center"><b>CUSTOMER CENTER</b><br>
   ☎ 010-1234-1234</p>
<p class="text-center">Mon-Friday am 11:00 ~ pm 4:00<br>
Lunch Time pm 1:00 ~ pm 2:00<br>
Sat.Sun Holiday OFF</p>
</div>
<div class="col-md-3 col-lg-3 hidden-xs hidden-sm" id="footer_middle_div2">
<p class="text-center"><b>ACCOUNT INFO</b><br><br>
국민은행 020134-01-123412<br>
name 홍길동(STORE)<br><br>
<select onchange="if(this.value) window.open(this.value);">
<option>인터넷뱅킹바로가기</option>
<option value="https://www.kbstar.com/">국민은행</option>
<option value="https://www.shinhan.com/index.jsp">신한은행</option>
<option value="https://www.kebhana.com/">하나은행</option>
<option value="https://www.wooribank.com/">우리은행</option>
<option value="https://www.ibk.co.kr/">기업은행</option>
</select></p>
</div>
<div class="col-md-3 col-lg-3 hidden-xs hidden-sm" id="footer_middle_div3">
<p class="text-center"><b>FAVORITE MENU</b><br>
<a href="HomeLogin.html" >로그인</a> / 
<a href="MemberAgree.html">회원가입</a><br>
<a href="#">관심상품</a><br>
<a href="#">장바구니</a><br>
<a href="#">주문조회</a><br>
<a href="#">마이페이지</a></p>
</div>
<div class="col-xs-6 col-md-3 col-lg-3" id="footer_middle_div4">
<p class="text-center"><b>RETURN / EXCHANGE</b><br><br>
서울특별시 강동구 천호대로 102(천호동) <br>2층 STORE
자세한 교환●반품절차 안내는 <br>문의란 및 공지사항을 참고해주세요.</p>
</div>
</div>

<div class="footer-copyright text-center py-3" id="footer_last_div">
<br>
 <p> COMPANY : STORE OWNER : 홍길동 BUSINESS LICENSE : 123-12-12345 
 <button>사업자정보확인</button>
  MALL-ORDER LICENSE : 제 2019-서울강동-0123호<br>
  ADDRESS : 01234 서울특별시 강동구 천호대로 102(천호동)2층 STORE ☎ : 010-1234-1234 <br>
  SPO : 홍길동 (Hongkildong@naver.com) CONTACT US : Hongkildong@naver.com<br><br>
  COPYRIGHT ⓒSTORE ALL RIGHTS RESERVED. HOSTING by CAFE24 | DESIGNED by DFLOOR</p>
  <br>
  </div>
 </footer>  

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>