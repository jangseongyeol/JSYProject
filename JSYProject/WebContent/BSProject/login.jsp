<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<%@ include file="../include/header.jsp" %>
 <%request.setCharacterEncoding("utf-8");%>
 <%@ include file="../BSProject/storeHeader.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../BSProject/css/style.css">
 <script type="text/javascript">
 function menuList(submenu){
	 $.ajax({
			type: "post",
			url: "${path}/product_servlet/categoryPage.do?submenu="+submenu,
			success: function(result){
				$(".login-form").hide();
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
<style type="text/css">
.float-right {
 float: right !important;
}
.login-form {
 position: relative !important;
 margin-top: 50px;
}
.login-form .well {
 background-color: white !important;
}
.login-form .btn-default {
background-color: #333 !important;
color: white !important; 
}
.naver_login, .kakao_login, .facebook_login, .gogle_login{
 color: white;
}
.login-form .naver_login {
background-color: #2DB400 !important;
}
.login-form .kakao_login{
background-color: #f7e600 !important;
color: black !important;
}
.login-form .facebook_login{
background-color: #3b5998 !important;
}
.login-form .gogle_login{
background-color: #dd4b39 !important;
}
	
@media (max-width: 800px) {

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
 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">로그인 실패</h4>
        </div>
        <div class="modal-body">
          <p>로그인에 실패하였습니다.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<c:if test="${param.message=='error'} ">
             <script type="text/javascript">
             $("#myModal").modal();
             </script>
       </c:if>


<div class="container_category" id="categoryPage">

</div>

 <div class="container login-form">
      <div class="row">
        <div class="page-header col-md-6 col-md-offset-3 text-center" id="loginFail">
          <h2>로그인</h2>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <div class="login-box well">
        <form accept-charset="UTF-8" role="form" id="login_form" name="login_form" method="post" action="${path}/store_servlet/loginstore.do">    
            <div class="form-group">
                <label for="userid">아이디</label>
                <input name="userid" id="userid" placeholder="ID" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="passwd">비밀번호</label>
                <input name="passwd" id="passwd" value='' placeholder="Password" type="password" class="form-control" />
            </div>
            <div class="form-group text-center" id="login_message">
            <b></b>
            
            </div>
            <div class="form-group">
                <input type="submit" id="login-submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="로그인" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md naver_login" value="네이버로그인" />
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md kakao_login" value="카카오로그인" />
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md facebook_login" value="페이스북로그인" />
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md gogle_login" value="구글로그인" />
            </div>
            <span class="float-left"><a href="#" class="text-sm">아이디 찾기</a></span>
            <span class="float-right"><a href="#" class="text-sm">비밀번호 찾기</a></span>
            <hr />
            <div class="form-group">
                <a href="" class="btn btn-default btn-block m-t-md"> 회원가입</a>
            </div>
        </form>
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

</div>
</div>
</body>
</html>