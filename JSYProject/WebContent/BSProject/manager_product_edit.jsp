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
  function del() {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			document.product_edit_form.action="${path}/product_servlet/product_delete.do?productid=${dto.productid}";
			document.product_edit_form.submit();
		}
	}
  function update(){
		var chk = confirm("수정하시겠습니까?");
		if (chk) {
			document.product_edit_form.action="${path}/product_servlet/product_update.do?productid=${dto.productid}";
			document.product_edit_form.submit();
		}
	}
  
  var submenu0 = new Array("${dto.submenu}[현재메뉴]");
  var submenu1 = new Array("BEST BABY","BEST JUNIOR","BEST ACC");
  var submenu2 = new Array("SPRING","SUMMNER","FALL","WINTER");
  var submenu3 = new Array("BABY OUTER","BABY TOP","BABY BOTTOM","BABY SET","BABY DRESS");
  var submenu4 = new Array("JUNIOR OUTER","JUNIOR TOP","JUNIOR BOTTOM","JUNIOR SET","JUNIOR DRESS");
  var submenu5 = new Array("CAP", "BAG", "SOCKS", "MUFFLER");


  function submenuchange(item){
      var temp, i=0, j=0;
      var ccount, cselect;

      temp = document.product_edit_form.submenu;

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

.product_edit_div .text_cotent {
     padding: 0 !important;
   }
  .product_edit_div .btn-dark {
    background-color: #333 !important;
    color: white !important;
   }
   .product_edit_div .btn-primary {
    background-color: #333 !important;
    color: white !important;
    border-color: #333 !important;
   }
   .product_edit_div .color_form{
   margin-bottom: 0;
   }
   .product_edit_div .color_input {
   padding-right:0;
    display: inline-block;
   }
   .product_edit_div .modelsize_input {
     padding-right:0;
     display: inline-block;
   }
   .product_edit_div .color_padding {
   padding-right: 2%;
   }
    .product_edit_div .modelsize_padding {
   padding-right: 2%;
   }
   .product_edit_div input[type="checkbox"] {
   margin-left: 15px;
   }
   @media (max-width: 800px) {
 
   }
   
</style>
</head>
<body>




<div class="container product_edit_div">
            <div class="page-header text-center col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <h3>상품번호${dto.productid}번 수정/삭제</h3>
                </div>
            </div>
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <form method="post" name="product_edit_form" enctype="multipart/form-data" class="form-horizontal">
            <div class="form-group">
             <label for="category">카테고리1</label>
                <select name="mainmenu" class="form-control" onChange="javascript:submenuchange(document.product_edit_form.mainmenu.options.selectedIndex)">
			      <option selected value="${dto.mainmenu}">${dto.mainmenu}[현재메뉴]</option>
			      <option value="BEST">BEST</option>
			      <option value="SALE">SALE</option>
			      <option value="BABY">BABY</option>
			      <option value="JUNIOR">JUNIOR</option>
			      <option value="ACC">ACC</option>
		        </select>
		    </div>
		    <div class="form-group">
		    <label for="category">카테고리2</label>
		      <select name="submenu" class="form-control">
		      	<option selected value="${dto.submenu}">${dto.submenu}[현재메뉴]</option>
	    	  </select>
		    </div>
                    <div class="form-group">
                        <label for="username">상품명</label>
                        <input  class="form-control" id="productname" name="productname" value="${dto.productname}">
                    </div>
                    <div class="form-group">
                        <label for="price">가격</label>
                        <input class="form-control" id="price" name="price" value="${dto.price}">
                    </div>
                    <div class="form-group color_form">
                        <label for="color">색상</label>
                     </div>
                     <div class="row">
                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 color_input">
                      <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 color_padding">
                        <input class="form-control text-center" id="product_color1" name="product_color1" value="${dto.product_color1}">
                      </div>
                      <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 color_padding">  
                       <input class="form-control text-center" id="product_color2" name="product_color2" value="${dto.product_color2}">
                      </div>
                      <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 color_padding">
                       <input class="form-control text-center" id="product_color3" name="product_color3" value="${dto.product_color3}">
                      </div>
                      <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 color_padding">
                        <input class="form-control text-center" id="product_color4" name="product_color4" value="${dto.product_color4}">
                       </div>
                      <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 color_padding">
                        <input class="form-control text-center" id="product_color5" name="product_color5" value="${dto.product_color5}">
                      </div>
                      <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 color_padding"">
                        <input class="form-control text-center" id="product_color6" name="product_color6" value="${dto.product_color6}">
                       </div>
                    </div>
                    </div>
                    <div class="form-group color_form">
                        <label for="modelsize ">사이즈</label>
                    </div>
                   <div class="row">
                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 modelsize_input">
                     <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 modelsize_padding">
                        <input class="form-control text-center" id="modelsize1" name="modelsize1" value="${dto.modelsize1}">
                     </div>
                     <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 modelsize_padding">
                        <input class="form-control text-center" id="modelsize2" name="modelsize2" value="${dto.modelsize2}">
                     </div>
                     <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 modelsize_padding">
                        <input class="form-control text-center" id="modelsize3" name="modelsize3" value="${dto.modelsize3}">
                     </div>
                     <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 modelsize_padding">
                        <input class="form-control text-center" id="modelsize4" name="modelsize4" value="${dto.modelsize4}">
                     </div>
                     <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 modelsize_padding">
                        <input class="form-control text-center" id="modelsize5" name="modelsize5" value="${dto.modelsize5}">
                     </div>
                     <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 modelsize_padding">
                        <input class="form-control text-center" id="modelsize6" name="modelsize6" value="${dto.modelsize6}">
                     </div>
                    </div> 
                   </div>
                    <div class="form-group" id="photo_add">
                        <label for="filename0">메인사진</label><br>
                        <c:choose>
                       <c:when test="${dto.filename0 != '-'}">
                             <img src="../upload_image/${dto.filename0}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                             <input type="checkbox" name="fileDel0">사진파일 삭제<br>
                             <div class="form-group">
                             <input type=file name="filename0" value="${dto.filename0}">
                             </div>
                       </c:when>
                       <c:otherwise>
                           <div class="form-group">
                             <input  class="form-control "type=file name="filename0" >
                             </div>
                       </c:otherwise>
                       </c:choose>
                       <label for="filename1">보조사진1</label><br>
                       <c:choose>
                       <c:when test="${dto.filename1 != '-'}">
                             <img src="../upload_image/${dto.filename1}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                             <input type="checkbox" name="fileDel1">사진파일 삭제<br>
                             <div class="form-group">
                             <input type=file name="filename1" value="${dto.filename1}">
                             </div>
                       </c:when>
                       <c:otherwise>
                           <div class="form-group">
                             <input  class="form-control "type=file name="filename1" >
                             </div>
                       </c:otherwise>
                       </c:choose>        
                       <label for="filename2">보조사진2</label><br>       
                       <c:choose>
                       <c:when test="${dto.filename2 != '-'}">
                             <img src="../upload_image/${dto.filename2}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                             <input type="checkbox" name="fileDel2">사진파일 삭제<br>
                             <div class="form-group">
                             <input type=file name="filename2" value="${dto.filename2}">
                             </div>
                       </c:when>
                       <c:otherwise>
                           <div class="form-group">
                             <input  class="form-control "type=file name="filename2" >
                             </div>
                       </c:otherwise>
                       </c:choose>
                       <label for="filename3">보조사진3</label><br>
                       <c:choose>
                       <c:when test="${dto.filename3 != '-'}">
                             <img src="../upload_image/${dto.filename3}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                             <input type="checkbox" name="fileDel3">사진파일 삭제<br>
                             <div class="form-group">
                             <input type=file name="filename3" value="${dto.filename3}">
                             </div>
                       </c:when>
                       <c:otherwise>
                           <div class="form-group">
                             <input  class="form-control "type=file name="filename3" >
                             </div>
                       </c:otherwise>
                       </c:choose>
                       <label for="filename4">보조사진4</label><br>
                       <c:choose>
                       <c:when test="${dto.filename4 != '-'}">
                             <img src="../upload_image/${dto.filename4}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                             <input type="checkbox" name="fileDel4">사진파일 삭제<br>
                             <div class="form-group">
                             <input type=file name="filename4" value="${dto.filename4}">
                             </div>
                       </c:when>
                       <c:otherwise>
                           <div class="form-group">
                             <input  class="form-control "type=file name="filename4" >
                             </div>
                       </c:otherwise>
                       </c:choose>
                       <label for="filename5">보조사진5</label><br>
                       <c:choose>
                       <c:when test="${dto.filename5 != '-'}">
                             <img src="../upload_image/${dto.filename5}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                             <input type="checkbox" name="fileDel5">사진파일 삭제<br>
                             <div class="form-group">
                             <input type=file name="filename5" value="${dto.filename5}">
                             </div>
                       </c:when>
                       <c:otherwise>
                           <div class="form-group">
                             <input  class="form-control "type=file name="filename5" >
                             </div>
                       </c:otherwise>
                       </c:choose>
                       <label for="filename6">보조사진6</label><br>
                       <c:choose>
                       <c:when test="${dto.filename6 != '-'}">
                             <img src="../upload_image/${dto.filename6}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                             <input type="checkbox" name="fileDel6">사진파일 삭제<br>
                             <div class="form-group">
                             <input type=file name="filename6" value="${dto.filename6}">
                             </div>
                       </c:when>
                       <c:otherwise>
                           <div class="form-group">
                             <input  class="form-control "type=file name="filename6" >
                             </div>
                       </c:otherwise>
                       </c:choose>
                       <label for="filename7">보조사진7</label><br>
                       <c:choose>
                       <c:when test="${dto.filename7 != '-'}">
                             <img src="../upload_image/${dto.filename7}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                             <input type="checkbox" name="fileDel7">사진파일 삭제<br>
                             <div class="form-group">
                             <input type=file name="filename7" value="${dto.filename7}">
                             </div>
                       </c:when>
                       <c:otherwise>
                           <div class="form-group">
                             <input  class="form-control "type=file name="filename7" >
                             </div>
                       </c:otherwise>
                       </c:choose>
                       <label for="filename8">보조사진8</label><br>
                       <c:choose>
                       <c:when test="${dto.filename8 != '-'}">
                             <img src="../upload_image/${dto.filename8}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                             <input type="checkbox" name="fileDel8">사진파일 삭제<br>
                             <div class="form-group">
                             <input type=file name="filename8" value="${dto.filename8}">
                             </div>
                       </c:when>
                       <c:otherwise>
                           <div class="form-group">
                             <input  class="form-control "type=file name="filename8" >
                             </div>
                       </c:otherwise>
                       </c:choose>
                    </div>
              <div class="form-group">
				<label for="content_label">내용</label><br>			
					<textarea class="form-control text_cotent" name="productcontent" id="productcontent" rows="10" cols="10">${dto.productcontent}</textarea>
              </div>
              <div class="form-group text-center">
              <input type="hidden" name="productid" value="${dto.productid}">
                        <button type="submit" onclick="update()" class="btn btn-primary">
                            수정
                        </button>
                        <a type="submit" onclick="del()" class="btn btn-warning">
                           삭제
                        </a>
                        <a type="submit" id="btnList" href="../BSProject/manager_product_index.jsp" class="btn btn-dark pull-left">
                            목록<i class="fa fa-check spaceLeft"></i>
                        </a>
                    </div>
                   
   </form>
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