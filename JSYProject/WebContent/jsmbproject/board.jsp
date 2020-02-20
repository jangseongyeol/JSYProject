<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="../jsmbproject/Jsmbjs/sidebar.js"></script>
<style type="text/css">
.ui-input-text {height: 43px;}
textarea.ui-input-text { height: inherit !important}
</style>
<script type="text/javascript">
$(function(){
	$("#btnSave").click(function(){
		insert();
	});
});

function insert() {
	var title=$("#title").val();
	var userid=$("#userid").val();
	var memo=$("#memo").val();
	var param="title="+title
	+"&userid="+userid
	+"&memo="+memo;
		$.ajax({
			type:"post",
			url: "${path}/board_servlet/insertboard.do",
			data:param,
			success: function(){
				location.replace("board_view.jsp");
				$("#title").val("");
				$("#userid").val("");
				$("#memo").val("");
			}
		});	
}
</script>
</head>
<body>
<div data-role="page" id="board_page">
   
      <div data-role="panel" id="panel1" data-display="overlay">
    <div data-role="navbar" style="width: 98%;">
     <ul>
      <li><a href="Viewed_Products.html#Viewed_Products_page" data-ajax="false" 
      data-role="button" style="border: 1px silver solid; ">관심상품</a></li>
      <li><a href="Shopping_Basket.html#Shopping_Basket_page" data-ajax="false" 
      data-role="button" style="border: 1px silver solid; ">장바구니</a></li>
     </ul>
    </div> 
        <p style="text-align: center;">고객님은 현재 <strong>로그아웃</strong> 중입니다<br>
         회원가입후 다양한 서비스를 이용해보세요.</p>
        
    
     <div data-role="navbar" style="width: 98%;">
     <ul>
      <li><a href="login.html#page2" data-ajax="false" data-role="button" data-theme="b" style="border: 1px silver solid; ">로그인</a></li>
      <li><a href="member.html#page3" data-ajax="false" data-role="button" style="border: 1px silver solid;">회원가입</a></li>
     </ul>
    </div>
        <a data-role="button" data-theme="b">출석체크 이벤트</a>
      <div data-role="tabs">
         <div data-role="navbar" style="width: 98%;">
           <ul>
             <li><a href="#tab1" data-role="button" style="border: 1px silver solid; border-radius: 10px; " >카테고리</a></li>
             <li><a href="#tab2" data-role="button" style="border: 1px silver solid;  border-radius: 10px;">커뮤니티</a></li>
           </ul>
         </div>
         <div id="tab1">
          <a id="menuBtn1" data-role="button" data-icon="carat-d" data-iconpos="right">BEST</a>
                <div data-role="controlgroup" data-role="navbar" id="navigation-list1">
                 <a data-role="button" href="Junior_Best.html#Junior_Best_page" data-ajax="false">JONIOR BEST</a>
                 <a data-role="button" href="Baby_Best.html#Baby_Best_page" data-ajax="false">BABY BEST</a>
                 <a data-role="button" href="Acc_Best.html#Acc_Best_page" data-ajax="false">ACC BEST</a>
               </div>
                 <a id="menuBtn2" data-role="button" data-icon="carat-d" data-iconpos="right">SALE</a>
                <div data-role="controlgroup" data-role="navbar" id="navigation-list2">
                 <a data-role="button" href="Sale_Spring.html#Sale_Spring_page" data-ajax="false">SPRING</a>
                 <a data-role="button" href="Sale_Summer.html#Sale_Summer_page" data-ajax="false">SUMMER</a>
                 <a data-role="button" href="Sale_Fall.html#Sale_Fall_page" data-ajax="false">FALL</a>
                 <a data-role="button" href="Sale_Winter.html#Sale_Winter_page" data-ajax="false">WINTER</a>
               </div>
                 <a id="menuBtn3" data-role="button" data-icon="carat-d" data-iconpos="right">BABY</a>
                <div data-role="controlgroup" data-role="navbar" id="navigation-list3">
                 <a data-role="button" href="Baby_Outer.html#Baby_Outer_page" data-ajax="false">OUTER</a>
                 <a data-role="button" href="Baby_Top.html#Baby_Top_page" data-ajax="false">TOP</a>
                 <a data-role="button" href="Baby_Bottom.html#Baby_Bottom_page" data-ajax="false">BOTTOM</a>
                 <a data-role="button" href="Baby_Set.html#Baby_Set_page" data-ajax="false">SET</a>
                 <a data-role="button" href="BabyDress.html#BabyDress_page" data-ajax="false">DRESS</a>
               </div>
                 <a id="menuBtn4" data-role="button" data-icon="carat-d" data-iconpos="right">JUNIOR</a>
                <div data-role="controlgroup" data-role="navbar" id="navigation-list4">
                 <a data-role="button" href="Junior_Outer.html#Junior_Outer_page"data-ajax="false">OUTER</a>
                 <a data-role="button" href="Junior_Top.html#Junior_Top_page" data-ajax="false">TOP</a>
                 <a data-role="button" href="Junior_Bottom.html#Junior_Bottom_page" data-ajax="false">BOTTOM</a>
                 <a data-role="button" href="Junior_Set.html#Junior_Set_page" data-ajax="false">SET</a>
                 <a data-role="button" href="Junior_Dress.html#Junior_Dress_page" data-ajax="false">DRESS</a>
               </div>
                 <a id="menuBtn5" data-role="button" data-icon="carat-d" data-iconpos="right">ACC</a>
                <div data-role="controlgroup" data-role="navbar" id="navigation-list5">
                 <a data-role="button" href="Acc_Bag.html#Acc_Bag_page" data-ajax="false">BAG</a>
                 <a data-role="button" href="Acc_Cap.html#Acc_Cap_page" data-ajax="false">CAP</a>
                 <a data-role="button" href="Acc_Socks.html#Acc_Socks_page" data-ajax="false">SOCKS</a>
                 <a data-role="button" href="Acc_Muffler.html#Acc_Socks_page" data-ajax="false">MUFFLER</a>
               </div>            
         </div>
         <div id="tab2">
           <div data-role="controlgroup" data-role="navbar">
             <a href="Notice.html#Notice_page" data-ajax="false" data-role="button">NOTICE</a>
             <a href="Event.html#Event_page" data-ajax="false" data-role="button">EVENT</a>
             <a href="Q&A.html#Q&A_page" data-ajax="false" data-role="button">Q &#38; A</a>
             <a href="Review.html#Review_page" data-ajax="false" data-role="button">REVIEW</a>
             <a href="Sns.html#Sns_page" data-ajax="false" data-role="button">SNS팔로우&#38;후기</a>
             <a href="Freeboard.html#Freeboard_page" data-ajax="false" data-role="button">FREE BOARD</a>
             <a href="F&A.html#F&A_page" data-ajax="false" data-role="button">자주묻는질문</a>
             <a href="board_view.jsp#board_view_page" data-ajax="false" data-role="button">가입인사게시판</a>
        
           </div>
         </div>
      </div>
    </div>
    
     <div data-role="panel" id="panel2" data-display="overlay" data-position="right">
     <span><input type="text" placeholder="검색키워드를 입력하세요."></span>
     <div data-role="tabs">
         <div data-role="navbar" style="width: 98%;">
           <ul>
             <li><a href="#tab1" style="border: 1px silver solid; border-radius: 10px;">인기 검색어</a></li>
             <li><a href="#tab2" style="border: 1px silver solid; border-radius: 10px;">최근 검색어</a></li>
           </ul>
         </div>
         <div id="tab1">
           <div data-role="controlgroup" data-role="navbar">
                  <a href="#" data-ajax="false" data-role="button">예쁜아기옷</a>
                  <a href="#" data-ajax="false" data-role="button">신생아바디슈트</a>
                  <a href="#" data-ajax="false" data-role="button">우주복</a>
                  <a href="#" data-ajax="false" data-role="button">아기외출복</a>
           </div>
          <button data-icon="plus" data-iconpos="right" data-theme="b">최근본상품</button> 
           </div>
         <div id="tab2">
                <div>
                <br><br> 
                   <p style="text-align: center;">최근 검색어가 없습니다.</p>     
                   <br><br>   
                </div>
                <div>
             <button data-icon="plus" data-iconpos="right" data-theme="b">최근본상품</button> 
                </div>
           </div>
  </div>
  </div>
   
     <div data-role="header" style="text-align: center; background-color: white; border: 0px;">
     <div data-role="navbar" style="border-bottom: 1px silver solid;">
      <ul>
       <li><a href="login.html#page2"  data-ajax="false" data-transition="fade" style="font-size: 0.6rem; background-color: white;">로그인</a></li>
       <li><a href="member.html#page3" data-ajax="false" data-transition="flip" style="font-size: 0.6rem; background-color: white;">회원가입</a></li>
       <li><a href="Order_Search.html#Order_Search_page" data-ajax="false" style="font-size: 0.6rem; background-color: white;">주문조회</a></li>
       <li><a href="MyPage.html#MyPage_page" data-ajax="false" style="font-size: 0.6rem; background-color: white;">마이쇼핑</a></li>
       <li><a href="Coupon.html#Coupon_page" data-ajax="false" style="font-size: 0.6rem; background-color: white;">쿠폰</a></li>
     </ul>
     <br>
    </div>
    <div>
    <a href="#panel1" data-role="button" data-inline="true"  data-inline="true" data-icon="bars" data-iconpos="notext" data-inline="true" style="float: left; margin-left: 10px;" >로그인 패널</a>
    <a href="#panel2" data-role="button" data-inline="true"  data-icon="search" data-iconpos="notext" data-inline="true" style="float: right; margin-right: 10px;">검색패널</a>     
     <h1><a href="index.html#page1" data-ajax="false" data-transition="flip" style="text-decoration: none; color: black; font-size: 1.6rem;">S T O R E</a></h1>
   </div>
     <img src="../jsmbproject/image/header.png" style="width: 100%;">
     <div data-role="navbar" style="width: 100%">
       <ul>
        <li><a href="Best.html#Best_page" data-ajax="false" 
       style="font-size: 0.6rem; border: 1px solid silver; background-color: white;">BEST</a></li>
       <li><a href="Sale.html#Sale_page" data-ajax="false" 
       style="font-size: 0.6rem; border: 1px solid silver; background-color: white;">SALE</a></li>
       <li><a href="Baby.html#Baby_page" data-ajax="false" 
       style="font-size: 0.6rem; border: 1px solid silver; background-color: white;">BABY</a></li>
       <li><a href="Junior.html#Junior_page" data-ajax="false" 
       style="font-size: 0.6rem; border: 1px solid silver; background-color: white;">JUNIOR</a></li>
       <li><a href="Acc.html#Acc_page" data-ajax="false" 
       style="font-size: 0.6rem; border: 1px solid silver; background-color: white;">ACC</a></li>
      </ul>
     </div>
   </div>

<div data-role="content" id="page1_content" style="background-color: white; margin: 0px; padding: 0px;">



<div style="margin: 2% 2%;">
   <select id="board_option">
     <option value="2">가입인사</option>
   </select>
   <b>제목</b>
   <input name="title" id="title" >
   <b>아이디</b>
   <input name="userid" id="userid">
   <b>내용</b>
   <textarea rows="10" id="memo" >
   </textarea>
   <a data-role="button" id="btnSave" data-mini="true" data-theme="b" >글쓰기</a>
</div>
  
</div>


<div data-role="footer" id="footer" style=" background-color: white; width: 100%; padding: 0px; margin: 0px;" >
     <div class="ui-bar" style="text-align: center;">  
     <a href="https://touch.facebook.com/login/" data-ajax="false"
     style="width: 4%; height: 4%; border: 1px solid silver; background-color: white;">
     <img src="../jsmbproject/image/facebook.png" style="width: 100%; height: 100%;">
     </a>
     <a href="https://www.instagram.com/accounts/login/?hl=ko" data-ajax="false"
     style="width: 4%; height: 4%;  border: 1px solid silver; background-color: white;">
     <img src="../jsmbproject/image/Instagram.png" style="width: 100%; height: 100%;">
     </a>
     <a href="https://nid.naver.com/nidlogin.login" data-ajax="false"
     style="width: 4%; height: 4%; border: 1px solid silver; background-color: white;">
     <img src="../jsmbproject/image/blog.png" style="width: 100%; height: 100%;">
     </a>
     <a href="https://story.kakao.com/s/login" data-ajax="false"
     style="width: 4%; height: 4%; border: 1px solid silver; background-color: white;">
     <img src="../jsmbproject/image/kakaostory.png"  style="width: 100%; height: 100%;">
     </a>
     <a href="https://www.kakaocorp.com/service/KakaoTalk?lang=ko" data-ajax="false"
     style="width: 4%; height: 4%; border: 1px solid silver; background-color: white;">
     <img src="../jsmbproject/image/kakao.png"  style="width: 100%; height: 100%;">
     </a>
     </div>
    <div class="ui-bar" style="text-align: center; border-top: silver solid 1px;">  
     <a href="Notice.html#Notice_page" data-ajax="false"
     style="width: 12%; height: 5%; border: 1px solid silver; background-color: white;
     margin-right: 14px;">
     <img src="../jsmbproject/image/footer_img1.png" style="width: 100%; height: 100%;">
     </a>
     <a href="F&A.html#F&A_page" data-ajax="false" 
     style="width: 12%; height: 5%; border: 1px solid silver; background-color: white;
     margin-right: 14px;">
     <img src="../jsmbproject/image/footer_img2.png" style="width: 100%; height: 100%;">
     </a>
     <a href="Sns.html#Sns_page" data-ajax="false"
     style="width: 12%; height: 5%; border: 1px solid silver; background-color: white;
     margin-right: 14px;">
     <img src="../jsmbproject/image/footer_img3.png" style="width: 100%; height: 100%;">
     </a>
     <a href="MyPage.html#MyPage_page" data-ajax="false"
     style="width: 12%; height: 5%; border: 1px solid silver; background-color: white;">
     <img src="../jsmbproject/image/footer_img4.png" style="width: 100%; height: 100%;">
     </a>
    <br>
      <a href="Viewed_Products.html#Viewed_Products_page" data-ajax="false"
      style="width: 12%; height: 5%; border: 1px solid silver; background-color: white;
     margin-right: 14px;">
     <img src="../jsmbproject/image/footer_img5.png" style="width: 100%; height: 100%;">
     </a>
     <a href="Shopping_Basket.html#Shopping_Basket_page" data-ajax="false"
     style="width: 12%; height: 5%; border: 1px solid silver; background-color: white;
     margin-right: 14px;">
     <img src="../jsmbproject/image/footer_img6.png" style="width: 100%; height: 100%;">
     </a>
     <a href="Order_Search.html#Order_Search_page" data-ajax="false"
     style="width: 12%; height: 5%; border: 1px solid silver; background-color: white;
     margin-right: 14px;">
     <img src="../jsmbproject/image/footer_img7.png" style="width: 100%; height: 100%;">
     </a>
     <a href="../JsProject/Home.html" data-ajax="false"
     style="width: 12%; height: 5%; border: 1px solid silver; background-color: white;">
     <img src="../jsmbproject/image/footer_img8.png" style="width: 100%; height: 100%;">
     </a>
​   </div>
    <br>
     <div style="width: 100%; display: inline-block; border-bottom: 1px solid silver; border-top: 1px solid silver;">
  
     <div data-role="navbar">
      <ul>
       <li><a href="company.html#company_page" style="font-size: 0.5rem; ">회사소개</a></li>
       <li><a href="agreement.html#agreement_page" data-ajax="false" style="font-size: 0.5rem; ">이용약관</a></li>
       <li><a href="privacy_policy.html#privacy_policy_page" data-ajax="false" style="font-size: 0.5rem; ">개인정보취급방침</a></li>
       <li><a href="guide.html#guide_page" data-ajax="false" style="font-size: 0.5rem; ">이용안내</a></li>
      </ul>
     </div>
     <div style="text-align: center;">
       <h6>
          상호 : STORE 고객센터 : ☎ 010-1234-1234<br>
          대표 : 홍길동  개인정보관리자 : 홍길동<br>
          주소 :서울특별시 강동구 천호대로 102(천호동)2층 STORE<br>
        사업자등록번호 : 123-12-12345 통신판매신고:제 2019-서울강동-0123호<br>
            호스팅제공:미래능력개발(주)
       </h6>
     </div>
    <p style="text-align: center; font-size: 0.8rem; background-color: silver;">COPYRIGHT ⓒSTORE ALL RIGHTS RESERVED.<br>
              DESIGNED by DFLOOR</p>
     </div>
   </div>

</div>
</body>
</html>