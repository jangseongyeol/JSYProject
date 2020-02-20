<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품상세페이지</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../BSProject/storeHeader.jsp" %>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("utf-8");%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../include/css/bootstrap.css">
  <link rel="stylesheet" href="../BSProject/css/style.css">
  <script type="text/javascript">
  function menuList(submenu){
		 $.ajax({
				type: "post",
				url: "${path}/product_servlet/categoryPage.do?submenu="+submenu,
				success: function(result){
					$("#detailPage").hide();
					$("#categoryPage").show();
					$("#categoryPage").html(result);
				}
			});
		} 
	function list(page){
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/categoryPage.do?curPage="+page+"&submenu=${submenu}",
				success: function(result){
					$("#categoryPage").html(result);
				}
			});
		}
  /* 셀렉트박스 선택 옵션  */
  var modelsize0 = new Array("-[필수]사이즈를 선택해주세요.-");
  var modelsize1 = new Array("-[필수]사이즈를 선택해주세요.-","${dto.modelsize1}","${dto.modelsize2}","${dto.modelsize3}"
		  ,"${dto.modelsize4}","${dto.modelsize5}","${dto.modelsize6}");
  var modelsize2 = new Array("-[필수]사이즈를 선택해주세요.-","${dto.modelsize1}","${dto.modelsize2}","${dto.modelsize3}"
		  ,"${dto.modelsize4}","${dto.modelsize5}","${dto.modelsize6}");
  var modelsize3 = new Array("-[필수]사이즈를 선택해주세요.-","${dto.modelsize1}","${dto.modelsize2}","${dto.modelsize3}"
		  ,"${dto.modelsize4}","${dto.modelsize5}","${dto.modelsize6}");
  var modelsize4 = new Array("-[필수]사이즈를 선택해주세요.-","${dto.modelsize1}","${dto.modelsize2}","${dto.modelsize3}"
		  ,"${dto.modelsize4}","${dto.modelsize5}","${dto.modelsize6}");
  var modelsize5 = new Array("-[필수]사이즈를 선택해주세요.-","${dto.modelsize1}","${dto.modelsize2}","${dto.modelsize3}"
		  ,"${dto.modelsize4}","${dto.modelsize5}","${dto.modelsize6}");
  var modelsize6 = new Array("-[필수]사이즈를 선택해주세요.-","${dto.modelsize1}","${dto.modelsize2}","${dto.modelsize3}"
		  ,"${dto.modelsize4}","${dto.modelsize5}","${dto.modelsize6}");

  function submenuchange(item){
      var temp, i=0, j=0;
      var ccount, cselect;

      temp = document.choice_form.modelsize;

      for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
      eval('ccount = modelsize' + item + '.length');
      for (j=0 ; j<ccount ; j++) {
          eval('cselect = modelsize' + item + '[' + j + '];');
          temp.options[j]= new Option(cselect,cselect); 
      }
      temp.options[0].selected=true;
      return true;
  }
  
  function select_option(index) { 
		var modelsize  = "document.choice_form.modelsize";
		var modelSizeObj = eval(modelsize);
		var color = $("#product_color option:checked").text();
			document.choice_form.reset(); // select 문의 선택을 reset 한다
			modelSizeObj.options[index].selected = true; // 선택되건만 보여진다.
			size = modelSizeObj.options[index].value;

			add_row(size,color);
	}
  
	var count=0;

    function add_row(size,color) {
 
	   count++;
	   var my_tbody = document.getElementById('my-tbody');
	   // var row = my_tbody.insertRow(0); // 상단에 추가
	   var row = my_tbody.insertRow(my_tbody.rows.length ); // 하단에 추가
	   var cell1 = row.insertCell(0);
	   var cell2 = row.insertCell(1);
	   var cell3 = row.insertCell(2);
	   cell1.innerHTML = "<b>${dto.productname} "+color+"/"+size+"</b>";
	   cell2.innerHTML = "<input type=number class='form-controle inputNumber' id='counting"+count+"' name='counting"+count+"' value='1' min='1'><a class='btn btn-primary btn-xs btndelete' onclick='delete_row("+count+")'>삭제</a>";
	   var counting=$('input[name=counting'+count+']').val();
	   var price=parseInt($("#pricevalue").text());
	   cell3.innerHTML = "<b id='price"+count+"'>"+price+"원</b>";
	   var sumbasic =0;
	   for(var k=1; k<=count; k++){
		   sumbasic=parseInt($("#price"+k).text())+sumbasic;
	   	   document.getElementById("totalPrice").innerHTML="<b>TOTAL="+sumbasic+"원</b><br><hr>";
	   }
		   $('#counting'+count).change(function(){
			   for(var j=1; j<=10; j++){
				     var counting = parseInt($('#counting'+j).val() || 0);
				     var price = parseInt($("#pricevalue").text());
				     var sum = price * counting;
				     var rowsnum = j-1;
				     my_tbody.rows[rowsnum].cells[2].innerHTML = "<b id='price"+j+"'>"+sum+"원</b>";			
		    	var sumtot = 0;
			    for(var i=1; i<=j; i++){
			    sumtot = parseInt($('#price'+i).text())+sumtot;
			    document.getElementById("totalPrice").innerHTML="<b>TOTAL="+sumtot+"원</b><br><hr>"; 
		       }  
			 }  
		 });
	  }  
		   function delete_row(count) {
			   var my_tbody = document.getElementById('my-tbody');
			   count--;
			   // my_tbody.deleteRow(0); // 상단부터 삭제
			   if(count==0) {
				   document.getElementById("totalPrice").innerHTML="<b>TOTAL=0원</b><br><hr>";
			   }else {
				   var sumtot=0; 
				   for(var j=1; j<=count; j++){
			        sumtot = parseInt($('#price'+j).text())+sumtot;
					document.getElementById("totalPrice").innerHTML="<b>TOTAL="+sumtot+"원</b><br><hr>";
				   }				   
			   }
			   my_tbody.deleteRow(my_tbody.rows.length-1);
			}


 
  </script>
    <style type="text/css">

/* 카테고리 페이지  */

.container_category{
	margin-top: 80px;	
}

 .btn-secondary {
  background-color: silver !important;
}



@media (max-width: 800px) {
	
   /* 카테고리페이지 모바일 */
   
   .container_category{
	margin-top: 10px;	
} 
.container_category b{
    font-size: 2vw;
   } 
   
   /* 보드 모바일 페이지  */
   .container_board{
   margin-top: 10px;
   }
}

    
  .detailPage {
   margin-top: 80px; 
    }
  .detailPage .btn{
  width: 99%;
  margin: 2px 2px;
  }
 .detailPage .btndiv {
  padding: 0;
 }
  .detailPage .inputNumber {
   width: 33%;
  }
  .detailPage .btndelete{
  width: 40%;
  }
 .detailPage .btn-primary {
 color: white;
 background-color: #333;
 border-color: #333;
 }
 .product_table {
  border-bottom: 1px silver solid;
 }
 .categoryPage {
  margin-top: 80px;
 }
 @media (max-width: 800px) {
  .detailPage .col-lg-5 {
    padding-left: 2px;
    padding-right: 2px;
  }
  .categoryPage {
   margin-top: 10px;
  }
  
  .detailPage .product_table .tdbutton {
   padding-left: 4px;
   padding-right: 4px;
  }
  .detailPage {
   margin-top: 10px; 
    }
   .detailPage .imgdiv {
     z-index: 1;
   }
   .detailPage_price {
   z-index: 999;
   }
}
</style>
</head>
<body>


<div class="categoryPage" id="categoryPage"></div>


<div class="cotainer fuild detailPage" id="detailPage">
 <div class="row justify-content-center">
  <div class="col-lg-12 text-center">
   <div class="col-lg-4 col-lg-offset-2 mainImg">
      <img src="../upload_image/${dto.filename0}" class="img-rounded img-responsive col-xs-12 col-sm-12 col-md-12 col-lg-12">  
   </div>
   <div class="col-lg-4 detailPage_price">
     <hr>
     <b>${dto.productname}</b><br><hr>
     <b id="pricevalue">${dto.price}원</b><br><hr>
     <form method="post" name="choice_form" class="form-horizontal">
       <select name="product_color" id="product_color" class="form-control" 
       onChange="javascript:submenuchange(document.choice_form.product_color.options.selectedIndex)">
		<option selected value="">-[필수]색상를 선택해주세요.-</option>
	  <c:if test="${dto.product_color1 != ' '}">
		<option value="${dto.product_color1}">${dto.product_color1}</option>  
     </c:if>
      <c:if test="${dto.product_color2 != ' '}">
		<option value="${dto.product_color2}">${dto.product_color2}</option>  
     </c:if>
      <c:if test="${dto.product_color3 != ' '}">
		<option value="${dto.product_color3}">${dto.product_color3}</option>  
     </c:if>
      <c:if test="${dto.product_color4 != ' '}">
		<option value="${dto.product_color4}">${dto.product_color4}</option>  
     </c:if>
      <c:if test="${dto.product_color5 != ' '}">
		<option value="${dto.product_color5}">${dto.product_color5}</option>  
     </c:if>
      <c:if test="${dto.product_color6 != ' '}">
		<option value="${dto.product_color6}">${dto.product_color6}</option>  
     </c:if>      
	   </select>
	   <br>
	   <select name="modelsize" class="form-control" onchange="select_option(selectedIndex)">
		<option selected value="">-[필수]사이즈를 선택해주세요.-</option>      
	   </select>
	   </form>
	   <br>
	 최소주문수량 1개이상/ 최대주문수량 10000개이하
	 <table class="table text-center product_table col-xs-12 col-sm-12 col-md-12 col-lg-12" id="table_list">
	    
	    <tr>
	      <th class="text-center col-lg-6">상품명</th>
	      <th class="text-center col-lg-3">상품수</th>
	      <th class="text-center col-lg-3">가격</th>
	    </tr>
	 <tbody id='my-tbody'>
	  </tbody>
	 </table>
	    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right" id="totalPrice">
	      <b>TOTAL=0원</b><br><hr>
	    </div>
	 <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btndiv">
	     <div class="tdbutton col-xs-4 col-sm-4 col-md-4 col-lg-4">
	     <a class="btn btn-primary">바로구매</a></div>
	     <div class="tdbutton col-xs-4 col-sm-4 col-md-4 col-lg-4">
	     <a class="btn btn-secondary">장바구니</a></div>
	     <div class="tdbutton col-xs-4 col-sm-4 col-md-4 col-lg-4">
	     <a class="btn btn-secondary">관심상품</a></div>
	 </div>
   </div>
   <br>
   <div class="col-lg-6 col-lg-offset-3 text-center imgdiv">
   <br>
     <b>${dto.productcontent}</b><br><hr>
     <c:if test="${dto.filename1 != '-'}">
     <img src="../upload_image/${dto.filename1}" class="img-rounded img-responsive">
     </c:if>
     <c:if test="${dto.filename2 != '-'}">
     <img src="../upload_image/${dto.filename2}" class="img-rounded img-responsive">
     </c:if>
     <c:if test="${dto.filename3 != '-'}">
     <img src="../upload_image/${dto.filename3}" class="img-rounded img-responsive">
     </c:if>
     <c:if test="${dto.filename4 != '-'}">
     <img src="../upload_image/${dto.filename4}" class="img-rounded img-responsive">
     </c:if>
     <c:if test="${dto.filename5 != '-'}">
     <img src="../upload_image/${dto.filename5}" class="img-rounded img-responsive">
     </c:if>
     <c:if test="${dto.filename6 != '-'}">
     <img src="../upload_image/${dto.filename6}" class="img-rounded img-responsive">
     </c:if>
     <c:if test="${dto.filename7 != '-'}">
     <img src="../upload_image/${dto.filename7}" class="img-rounded img-responsive">
     </c:if>
     <c:if test="${dto.filename8 != '-'}">
     <img src="../upload_image/${dto.filename8}" class="img-rounded img-responsive">
     </c:if>

   </div>
   <div class="col-lg-6 col-lg-offset-3">
   <h3 class="text-center">결제안내</h3>
   <hr>
      <p class="text-left">*무통장 입금은 자동입금이 확인되며, 입금자명이나 금액이 다른경우,<br>
        공백이 있는 경우에도 확인되지 않으니 STORE로 꼭 연락주세요.<br><br>

        고액결제의 경우 안전을위해 카드사에서 확인전화를 드릴수 있습니다.&nbsp;<br>
        확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
         정상적인 주문이 아니라고 판단될 경우&nbsp;임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp;&nbsp;<br><br>

        무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;<br>
        주문시 입력한&nbsp;입금자명과 실제 입금자명이 반드시 일치해야 하며,<br>&nbsp;7일이내로 입금을 해야하며 입금되지
        않은 주문은 자동취소 됩니다<br></p>
        <br><br>
   </div>
   <div class="col-lg-6 col-lg-offset-3 text-left">
     <h3 class="text-center">배송안내</h3>
     <hr>
      <p class="text-left">배송 방법 : 택배<br>
        배송 지역 : 전국지역<br>
        배송 비용 : 조건부 무료 : 주문 금액 50,000원 미만일 때 배송비 2,500원을 추가합니다.<br>
        배송 기간 : 3일 ~ 7일<br>
        배송 안내 : <br>
      *STORE는 CJ 대한통운을 이용하고 있습니다.<br>
      *<font color="#996600"><b>5만원 이상 구매시 배송료는 무료로 적용됩니다.</b></font><br>
      *산간,도서지방,제주도는 별도의 추가배송료가 지불됩니다.<br>
      *배송은 입금 확인 후 2~5일 정도 소요됩니다.(공휴일 제외)<br>
      *입고가 지연되는 리오더 상품은 배송이 지연될 수 있습니다.(7~15일)<br>
      *주문하실 때는 품절이 아니었어도 재고에 따라 품절 될 수 있습니다.</p>          
            <br>
   </div>
   
   <div class="col-lg-6 col-lg-offset-3 text-left">
   <h3 class="text-center">교환/반품안내</h3>
   <hr>
      <p class="text-left"><b><font color="#0000cc">대한통운</font> 1588-1255</b><br>
      <font style="font-weight: bold;" color="#0000cc">교환 및 반품주소지</font><b> : </b>
      <font color="#996600">서울특별시 관악구 관악로 238 3층 STORE</font><br><br>

      *배송처리 된 이후의 문의사항은 대한통운으로 부탁드립니다.<br>
      *저희 STORE에서는 공정거래위원회의 규정에 따라 정책을 적용하고 있습니다.<br>
      &nbsp;따라서 교환 및 반품을 할 수 있습니다.( 단, 교환은 1회에 한해서 가능합니다.)<br>
      *교환 및 반품의 경우 7일 이내에 신청 후 보내주셔야 합니다.<br>
      *단숨변심에 의한 교환,반품은 왕복배송비를 고객님께서 부담하셔야 합니다.<br>
      *제품하자나, 오배송의 경우 택배비는 STORE에서 부담합니다.<br>
      *불량이거나 오배송의 경우, 동일제품, 동일사이즈, 동일색상으로만 교환할 수 있습니다.<br>
      *받아보신 상품에 문제가 있다 하더라도 처음 주문 상품이 아닌 다른 상품으로의 교환은&nbsp;
        변심으로 간주하며, 배송료는 고객님께서 부담하셔야 합니다.<br><br>
        
      <b><font color="#0000cc">교환 접수방법</font><font color="#0000ff"> :&nbsp;</font></b><br>
      *.STORE 홈페이지 상단 커뮤니티 Q&amp;A 게시판에 교환접수 게시글을 남겨주세요.<br>
      *.반품 및 교환시 받으신 상자에 상품과 종이에 정확하게 메모하시고,<br>
      <font color="#0000cc">택배비( 교환시 왕복 5,000원 / 반품 편도 2,500원)을 동봉</font>
      하셔서 대한통운 택배로 보내주세요.<br>
      *.대한통운이 아닌 타 택배 이용시 고객님께서 꼭 선불로 보내주세요.<br>
      *.반품으로 인해 최종주문 금액이 무료배송 금액 이하가 될 경우 저희가 무료 배송해드린 택배비까지&nbsp;
      총 5,000원을 동봉해주셔야 합니다.&nbsp;<br><br>
      <font color="#0000cc">교환 및 반품이 불가능한 경우</font><br>
      *반품기한이 지난 경우 (상품 수령 후 7일이 지난 상품의 경우)<br>
      *세일 상품의 경우<br>
      *제품의 상세페이지에 별도의 환불 불가 내용이 표기된 경우<br>
      <font color="#996600">또한, 고객님의 과실로 인한 상품의 훼손 및 변형이 판명 될 경우에도 반품을 받지 않습니다.</font><br>
      *상품을 세탁한 경우<br>
      *상품을 착용해 훼손하거나 변형되거나, 생활주름이 잡혀있는 경우<br>
      *화장품,향수,피죤 등 생활 고유의 향기가 베어있는 경우<br>
      *시즌상품으로 교환이 불가능한 경우<br>
      *고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.<br>
      &nbsp;(색상 교환, 사이즈 교환 등 포함)<br><br></p>
   </div>
  </div>
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

<div class="footer-copyright text-left py-3" id="footer_last_div">
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



</body>
</html>