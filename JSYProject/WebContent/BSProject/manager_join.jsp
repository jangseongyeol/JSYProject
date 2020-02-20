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
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <style type="text/css">
 .form-inline{
   margin-bottom: 15px !important;
 }
 #postname {
 margin-bottom: 0px !important;
 }
.form-group .col-lg-6 {
   margin: 0 !important;
   padding: 0 !important;
 }
 .form-horizontal .form-group {
  margin-left: 5px !important;
  margin-right: 5px !important;
 }
 .agree_form {
  display: flex; 
 }

.agree_form1, .agree_form2{
   padding: 0 !important;
   text-align: center;
  }
 .agree_form .radio {
  display: inline-block;
 }
.labelname {
 margin-bottom: 0px !important;
}
.phone_text {
 display: flex;
 display: inline-block;
 padding-left: 0 !important;
 padding-right: 0 !important;
}
#phone_text3 {
 width: 28%;
}
#birthday_text3 {
width: 28%;
}
.phone_text .form-group {
 display: inline-block;
}
.phone_text .form-control {
   padding-left: 0 !important;
   padding-right: 0px !important;
}
.btn-primary {
 background-color: #333 !important;
 border: silver !important;
}
.form-horizontal .control-label {
  padding-left: 0 !important;
  text-align: left;
}
.form-horizontal .control-radio {
 padding-left: 0 !important;
}
@media (max-width: 800px) {

.agree_form{
display: inline-block;
  width: 100%;
 }
 .agree_form1, .agree_form2{
   width: 100%;
  }
 .agree_form .radio {
  display: inline-block;
 }
.phone_text .form-group {
  margin-left: 0px !important;
  margin-right: 0px !important;
 }
.phone_text .form-control {
   padding-left: 0 !important;
   padding-right: 18px !important;
}
#phone_text3 {
 width: 32%;
}
#birthday_text3 {
 width: 32%;
}
.page-header {
     margin-top: 0 !important;
  }
.page-header h2 {
   margin-top: 0!important;
   font-size: 20px !important;
   font-weight: bold;
  }
}
 </style>
</head>
<body>


<div class="container">
            <div class="page-header col-md-8 col-md-offset-2 text-center">
          <h2>회원가입</h2>
           </div>
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <form method="post" id="managerJoin_form" name="managerJoin_form" class="form-horizontal"
                action="${path}/storemanager_servlet/insertManager.do">
                    <div class="form-group">
                        <label for="managername">성명</label>
                        <input type="text" class="form-control" id="managername" name="managername"placeholder="이름을 입력해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="managerid">아이디</label>
                        <input class="form-control" id="managerid" name="managerid" placeholder="아이디를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="passwd">비밀번호</label>
                        <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="passwdCheck">비밀번호 확인</label>
                        <input type="password" class="form-control" id="passwdCheck" name="passwdCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="manageremail">이메일 주소</label>
                        <input class="form-control" id="manageremail" name="manageremail" placeholder="이메일 주소를 입력해주세요">
                    </div>
                    <div class="labelname">
                        <label for="phonename">핸드폰</label><br>
                        <input type="hidden" class="form-control" name="postname">
                    </div>
                    <div class="phone_text col-xs-12 col-lg-12 col-md-12 col-sm-12">
                    <div class="form-group col-xs-4 col-lg-4 col-md-4 col-sm-4">
                        <select class="form-control" id="phone1" name="phone1">
                          <option value="010" selected>010</option>
                          <option value="011">011</option>
                          <option value="016">016</option>
                          <option value="019">019</option>
                          <option value="017">017</option>
                        </select>
                    </div>
                    <div class="form-group col-xs-4 col-lg-4 col-md-4 col-sm-4">
                        <input type="text" class="form-control" id="phone2" name="phone2" placeholder="1234" maxlength="4">
                    </div>
                     <div class="form-group col-xs-4 col-lg-4 col-md-4 col-sm-4" id="phone_text3">
                        <input type="text" class="form-control" id="phone3" name="phone3" placeholder="5678" maxlength="4">
                    </div>
                   </div>
                   <div class="labelname">
                        <label for="phonename">생년월일</label><br>
                        <input type="hidden" class="form-control">
                    </div>
                    <div class="phone_text col-xs-12 col-lg-12 col-md-12 col-sm-12">
                    <div class="form-group col-xs-4 col-lg-4 col-md-4 col-sm-4">
                        <input type="text" class="form-control" id="birthday1" name="birthday1" placeholder="2000" maxlength="4">
                    </div>
                     <div class="form-group col-xs-4 col-lg-4 col-md-4 col-sm-4">
                        <select class="form-control" id="birthday2" name="birthday2">
                          <option value="01" selected>01</option>
                          <option value="02">02</option>
                          <option value="03">03</option>
                          <option value="04">04</option>
                          <option value="05">05</option>
                          <option value="06">06</option>
                          <option value="07">07</option>
                          <option value="08">08</option>
                          <option value="09">09</option>
                          <option value="10">10</option>
                          <option value="11">11</option>
                          <option value="12">12</option>
                        </select>
                    </div>
                     <div class="form-group col-xs-4 col-lg-4 col-md-4 col-sm-4" id="birthday_text3">
                        <input type="text" class="form-control" id="birthday3" name="birthday3" placeholder="20" maxlength="2" >
                    </div>
                   </div>
                   <div class="labelname">
                        <label for="postname">우편번호</label><br>
                        <input type="hidden" class="form-control" name="postname">
                    </div>
                   <div class="form-inline">
                    <div class="form-group">                  
                      <input type="text" id="postcode" name="postcode" placeholder="우편번호"  class="form-control">          
                    </div>
                    <div class="form-group">
                       <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary"> 
                   </div>
                   </div>
                   <div class="form-group">
                     <label for="address">주소</label>
                      <input type="text" id="address" placeholder="주소" name="address"   class="form-control">
                   </div>     
                   <div class="form-group"> 
                    <label for="address2">상세주소</label>
                      <input type="text" id="address2" placeholder="상세주소" name="address2"   class="form-control">
                    </div>
                    
                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary" >
                            회원가입<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="submit" onclick="cancel()" class="btn btn-warning">
                            가입취소<i class="fa fa-times spaceLeft"></i>
                        </button>
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

</body>
</html>