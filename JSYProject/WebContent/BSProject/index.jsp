<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인홈페이지</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../BSProject/storeHeader.jsp" %>
 <%request.setCharacterEncoding("utf-8");%>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <script type="text/javascript">
 window.onload  = function(){
	  BestBabyList();
	}
 function  BestBabyList(){
	 $.ajax({
			type: "post",
			url: "${path}/product_servlet/categoryMainPage.do?submenu=BEST BABY",
			success: function(result){
				$("#categoryPage_Best").html(result);
			}
		});
	} 
 
 function menuList(submenu){
	 $.ajax({
			type: "post",
			url: "${path}/product_servlet/categoryPage.do?submenu="+submenu,
			success: function(result){
				$("#mainImgdiv").hide();
				$("#categoryPage_Best").hide();
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
 </script>
</head>
<body>






<div class="container_category" id="categoryPage">

</div>




<div id="mainImgdiv">
 <div id="main_img_div">
          <div class="col-xs-4">
            <img  src="../JsProject/BasicImage/main.gif" class="img-rounded img-responsive">
          </div>
          <div class="col-xs-4" >                 
            <img  src="../JsProject/BasicImage/basicmain1.jpg" class="img-rounded img-responsive">
          </div>
          <div class="col-xs-4" > 
            <img id="main_img3" src="../JsProject/BasicImage/basicmain2.jpg" class="img-rounded img-responsive">
          </div>
           </div>
        <div id="carousel-example-generic" class="carousel slide">
         <div class="col-xs-8">
        <!--
            id="carousel-example-generic" 없으면 다음 페이지로 안넘어간다.
            class="carousel":이미지 양쪽의 화살표 보이게 하는것
                (화살표 없어도 그 부근 클릭하면 넘어간다.이 줄 없으면 아래 동그란 인티케이터도 안나타난다.) 
                 slide 없으면 슬라이드 효과 없이 그냥 이미지가 나타난다. 
                -->
        
            <!-- Indicators(이미지 하단의 동그란것->class="carousel-indicators") -->
            <ol class="carousel-indicators">
              <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
              <li data-target="#carousel-example-generic" data-slide-to="1"></li>
              <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>
            <!-- 
                위의 data-slide-to가 0 2 2이면 두번째 동그라미 클릭해도 3번째 이미지가 나온다. 
                0 2 5이면 세번째 동그라미 클릭해도 아무 반응이 없다. 
                Indicators는 이미지 갯수와 같게 만들어야 한다. 
            -->
             <!-- Carousel items -->
             <div class="carousel-inner">
             <!-- class="carousel-inner" : 없으면 이미지 3장이 모두 세로로 배치된다. 
             --> 
                <div class="item active">
                   <img src="../JsProject/BasicImage/slide.jpg" alt="First slide" class="img-rounded img-responsive">
                   <!-- 캡션 넣고 싶을 때 아래 4줄 추가하면 된다. 캡션은 자동 중앙 정렬된다. -->
                  <!--  <div class="carousel-caption">
                        <h3>슬라이드 효과 </h3>
                        <p>캡션 내부에는 HTML 태그 사용 가능합니다.</p>
                     </div>  -->
                </div>
                <div class="item">
                   <img src="../JsProject/BasicImage/slide2.jpg" alt="Second slide" class="img-rounded img-responsive">               
                </div>
                <div class="item">
                   <img src="../JsProject/BasicImage/slide3.jpg" alt="Third slide" class="img-rounded img-responsive">                 
                </div>
                <div class="item">
                   <img src="../JsProject/BasicImage/slide4.jpg" alt="ford slide" class="img-rounded img-responsive">                 
                </div>
             </div>
            <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                <span class="icon-prev"></span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="icon-next"></span>
              </a>
          </div>
         
  </div>
          <div class="col-xs-4" > 
            <img id="main_img3" src="../JsProject/BasicImage/basicmain3.jpg" class="img-rounded img-responsive">
          </div>
</div>          
   
   <div class="container_category" id="categoryPage_Best">

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