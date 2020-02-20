<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
 <%request.setCharacterEncoding("utf-8");%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="../include/css/bootstrap.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="js/script.js"></script>
 <script src="js/login.js"></script>
</head>
<body>
<div class="sidebar_nav"> 
<nav id="sidebar-right" class="sidebar-right">
        <div class="sidebar-header">
             <div class="row" id="sidebar_right_close_div">
          <button type="button" class="btn btn-default btn-lg" id="sidebar_right_close">
             <span class="glyphicon glyphicon-remove"></span></button>
              </div>
              <br><br><br><br>
              
        </div>
        <form>          
             <div class="input-group input-group-lg">
               <input type="text" class="form-control" id="search_form" placeholder="Search">
                 <div class="input-group-btn">
                   <button class="btn btn-default" type="submit">
                     <i class="glyphicon glyphicon-search"></i>
                   </button>
                 </div>
               </div>
             </form>
             <br>
        <div class="container">
          <p class="sidebar_Menu">
            <a href="#" target="_parent" onmouseover="this.innerHTML='메인화면'" onmouseout="this.innerHTML='MAIN'">
             MAIN
            </a>
          </p>
          <p class="sidebar_Menu">
            <a href="#" onclick="popup('popup_shortcuticon.html','popup_shortcuticon')" onmouseover="this.innerHTML='바로가기'" 
               onmouseout="this.innerHTML='SHORTCUT ICON'">SHORTCUT ICON
             </a></p>
           <p class="sidebar_Menu">
             <a href="#" onclick="popup('popup_bookmarked.html','popup_bookmarked')" onmouseover="this.innerHTML='즐겨찾기'" 
              onmouseout="this.innerHTML='BOOK MARKED'">BOOK MARKED
            </a></p>
            <p class="sidebar_Menu">
             <a href="#" onmouseover="this.innerHTML='공지사항'"onmouseout="this.innerHTML='NOTICE'">
               NOTICE
             </a></p>
            <p class="sidebar_Menu">
              <a href="#" onmouseover="this.innerHTML='이벤트'"onmouseout="this.innerHTML='EVENT'">
              EVENT
            </a></p>
            <p class="sidebar_Menu">
            <a href="#" onmouseover="this.innerHTML='포토리뷰'"onmouseout="this.innerHTML='PHOTO REVEIW'">
              PHOTO REVEIW
            </a></p>
           <p class="sidebar_Menu">
             <a href="#" onmouseover="this.innerHTML='상품문의'"onmouseout="this.innerHTML='Q & N'">
              Q &#38; N
            </a></p>
           <p class="sidebar_Menu">
            <a href="#" onmouseover="this.innerHTML='출석체크'"onmouseout="this.innerHTML='ATTENDANCEC check'">
             ATTENDANCEC CHECK
            </a></p><br>    
         </div>
        <div class="container" id="">
                       <a href="https://partner.talk.naver.com/" target="_blank">
                         <img alt="" src="../JsProject/sidebarimage/navertok.jpg">
                       </a><br>                  
                       <a href="https://www.instagram.com/" target="_blank">
                         <img alt="" src="../JsProject/sidebarimage/instagram.jpg">
                       </a><br>                                     
                       <a href="https://www.kakaocorp.com/service/KakaoTalk" target="_blank">
                           <img alt="" src="../JsProject/sidebarimage/kakao.jpg">
                       </a><br>                    
                        <a href="https://www.facebook.com/" target="_blank">
                         <img alt="" src="../JsProject/sidebarimage/facebook.jpg">
                        </a><br> 
                  </div><br>
                    
                  <div class="container">
                    <b>CALL CENTER</b> <br>
                    <b>010-1234-1234</b><br><br>

                    <b>MON-FRI AM 11:00 ~ PM 4:00<br>
                       LUNCH PM 1:00 ~ PM 2:00<br>
                       SAT.SUN.HOLIDAY OFF<br>
                       <br><br>
                       BANK INFO<br> 
                              국민은행 : 020134-01-123412<br>
                              예금주 : 홍길동 (STORE)
                    </b>
                 </div>
                 <br><br>
           
     </nav>
  </div>
<div class="wrapper">
            <!-- 사이드바 -->
            <nav id="sidebar">
              <div id="dismiss">
                    <i class="glyphicon glyphicon-remove"></i>
                </div>
                <div class="sidebar-header">
                    <h3>STORE</h3>
                </div>

                <ul class="list-unstyled components">
                    <li>
                        <a href="#menu1" data-toggle="collapse" aria-expanded="false">BEST</a>
                        <ul class="collapse list-unstyled" id="menu1">
                            <li><a href="#">JUNIOR BEST</a></li>
                            <li><a href="#">BABY BEST</a></li>
                            <li><a href="#">ACC BEST</a></li>
                        </ul>
                    </li>
                    <li>
                    <a href="#menu2" data-toggle="collapse" aria-expanded="false">SALE</a>
                        <ul class="collapse list-unstyled" id="menu2">
                            <li><a href="#">SPRING</a></li>
                            <li><a href="#">SUMMER</a></li>
                            <li><a href="#">FALL</a></li>
                            <li><a href="#">WINTER</a></li>
                        </ul>
                    <li>
                        <a href="#menu3" data-toggle="collapse" aria-expanded="false">BABY</a>
                        <ul class="collapse list-unstyled" id="menu3">
                            <li><a href="#">BABY OUTER</a></li>
                            <li><a href="#">BABY TOP</a></li>
                            <li><a href="#">BABY BOTTOM</a></li>
                            <li><a href="#">BABY SET</a></li>
                            <li><a href="#">BABY DRESS</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#menu4" data-toggle="collapse" aria-expanded="false">JUNIOR</a>
                        <ul class="collapse list-unstyled" id="menu4">
                            <li><a href="#">JUNIOR OUTER</a></li>
                            <li><a href="#">JUNIOR TOP</a></li>
                            <li><a href="#">JUNIOR BOTTOM</a></li>
                            <li><a href="#">JUNIOR SET</a></li>
                            <li><a href="#">JUNIOR DRESS</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#menu5" data-toggle="collapse" aria-expanded="false">ACC</a>
                        <ul class="collapse list-unstyled" id="menu5">
                            <li><a href="#">BAG</a></li>
                            <li><a href="#">CAP</a></li>
                            <li><a href="#">SOCKS</a></li>
                            <li><a href="#">MUFFLER</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">Q&#38;A</a>
                        <ul class="collapse list-unstyled" id="pageSubmenu">
                            <li><a href="#">NOTICE</a></li>
                            <li><a href="#">EVENT</a></li>
                            <li><a href="#">REVIEW</a></li>
                            <li><a href="#">F&#38;A</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"></a>
                    </li>
                    <li>
                        <a href="#"></a>
                    </li>
                 </ul>
                  
           </nav>
     

          
          
            <!-- Page Content Holder -->
           <div id="content">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                  <div class="row">
                  <div class="col-xs-3" >
                     <button type="button" class="navbar-toggle" data-toggle="collapse" id="sidebar_toggle">
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>                        
                   </button>
                  </div>
                   <div class="col-xs-6" id="mobile_brand_name">
                     <a href="#"><h2>STORE</h2></a>
                   </div>
                  <div class="col-xs-3" id="sidebar_right_div">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" id="#sidebar_right_toggle">
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>                        
                   </button>
                   </div>
                  </div>         
                </div>
            </nav>
             <!--  <div class="col-xs-11" id="web_login_div">
              <a href="#">로그인</a>&nbsp;&nbsp;&nbsp;
              <a href="#">회원가입</a>
              </div> -->
            <div class="row" id="web_header_div">
              <div class="col-xs-12" >
                 <h1 class="vw">STORE</h1>
             </div>
            </div>
             <br>
             
 <nav class="navbar-default col-lg-12 col-md-12 menu_bar">
  <div class="container col-lg-12 col-md-12">
    <!-- 메뉴에서 가장 왼쪽, 모바일에서 표시되는 제목 -->
   
    <!-- 메뉴의 리스트 -->
    <div class="collapse navbar-collapse navbar-left row" id="bs-example-navbar-collapse-1">
    <div class="col-lg-1 col-md-1 col-sm-1">
      <ul class="nav navbar-nav">
        <!-- DropDown 형식의 메뉴 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          aria-haspopup="true" aria-expanded="false">BEST</a>
          <ul class="dropdown-menu">
            <li><a href="#">JUNIOR BEST </a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">BABY BEST</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">ACC BEST</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="col-lg-1 col-md-1 col-sm-1">
      <ul class="nav navbar-nav">
        <!-- DropDown 형식의 메뉴 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          aria-haspopup="true" aria-expanded="false">SALE</a>
          <ul class="dropdown-menu ">
            <li><a href="#">SPRING</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">SUMMER</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">FALL</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">WINTER</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="col-lg-1 col-md-1 col-sm-1">
      <ul class="nav navbar-nav">
        <!-- DropDown 형식의 메뉴 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          aria-haspopup="true" aria-expanded="false">BABY</a>
          <ul class="dropdown-menu">
            <li><a href="#">BABY OUTER</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">BABY TOP</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">BABY BOTTOM</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">BABY SET</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">BABY DRESS</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="col-lg-1 col-md-1 col-sm-1">
      <ul class="nav navbar-nav">
        <!-- DropDown 형식의 메뉴 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          aria-haspopup="true" aria-expanded="false">JUNIOR</a>
          <ul class="dropdown-menu">
            <li><a href="#">JUNIOR OUTER</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">JUNIOR TOP</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">JUNIOR BOTTOM</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">JUNIOR SET</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">JUNIOR DRESS</a></li>
          </ul>
        </li>
      </ul>
   </div>
   <div class="col-lg-1 col-md-1 col-sm-1 ">
      <ul class="nav navbar-nav">
        <!-- DropDown 형식의 메뉴 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          aria-haspopup="true" aria-expanded="false">ACC</a>
          <ul class="dropdown-menu">
            <li><a href="#">BAG </a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">CAP</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">SOCKS</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">MUFFLER</a></li>
          </ul>
        </li>
      </ul>
     </div>
   <div class="col-lg-6 col-md-6 col-sm-6 text-right btn_login_bar">  
    <!-- 오른쪽 정렬의 메뉴 -->
    <a href="login.jsp" class="btn btn-default btnlogin">로그인</a>
      <a href="join.jsp" class="btn btn-default btnjoin">회원가입</a>
    <!--   <ul class="nav navbar-nav navbar-right">
        DropDown 형식의 메뉴
        <li class="dropdown">
          <a href="login.jsp" class="dropdown-toggle" data-toggle="dropdown" 
          role="button" aria-haspopup="true" aria-expanded="false">로그인</a>
           <ul class="dropdown-menu">
            <li><a href="#">정보</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">장바구니</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">관심상품</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">로그아웃</a></li>
          </ul> 
        </li>
      </ul> -->
    </div>
    <div class="col-lg-1 col-md-1 col-sm-1 btn_sideopen">
      <a href="#" class="btn btn-default" id="sidebar_right_open">메뉴바</a>
    </div>
    </div>
  </div>
</nav>
 
<div class="container">
<c:redirect url="/board_servlet/list.do"></c:redirect>

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