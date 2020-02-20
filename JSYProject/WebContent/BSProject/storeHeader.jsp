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
   <link rel="stylesheet" href="../BSProject/css/style.css">
 <script src="../BSProject/js/script.js"></script>
 <script src="../BSProject/js/login.js"></script>
 <script src="../BSProject/js/join.js"></script>
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
        <form action="${path}/product_servlet/mainPage_search.do">
          <input name="search_option" type="hidden" value="productname">          
             <div class="input-group input-group-lg">    
               <input type="text" class="form-control" id="keyword" name="keyword" placeholder="Search">
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
            <a href="../BSProject/index.jsp" target="_parent" onmouseover="this.innerHTML='메인화면'" onmouseout="this.innerHTML='MAIN'">
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
             <a href="../BSProject/notice_index.jsp" onmouseover="this.innerHTML='공지사항'"onmouseout="this.innerHTML='NOTICE'">
               NOTICE
             </a></p>
            <p class="sidebar_Menu">
              <a href="#" onmouseover="this.innerHTML='이벤트'"onmouseout="this.innerHTML='EVENT'">
              EVENT
            </a></p>
            <p class="sidebar_Menu">
            <a href="../BSProject/reviewBoard_index.jsp" onmouseover="this.innerHTML='리뷰'"onmouseout="this.innerHTML='REVEIW'">
              REVEIW
            </a></p>
           <p class="sidebar_Menu">
             <a href="../BSProject/board_index.jsp" onmouseover="this.innerHTML='상품문의'"onmouseout="this.innerHTML='FREE BOARD'">
              FREE BOARD
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
                
    <c:choose>
      <c:when test="${sessionScope.userid!=null}">
       <div class="col-lg-6 col-md-6 col-sm-6 text-left btn_login_bar">
        <form action="${path}/store_servlet/logoutstore.do" class="form-group text-right" name="logout_form">
        <input type="hidden" name="userid" value="${sessionScope.userid}">
        <a href="${path}/store_servlet/memberMain_view.do?userid=${sessionScope.userid}" 
        class="btn btn-default btnlogin text-left">${sessionScope.username}님</a>
        <button id="logout"  type="submit" class="btn btn-primary btnjoin">로그아웃</button>
        </form>
       </div>
      </c:when>
      <c:otherwise>
      <div class="col-lg-6 col-md-6 col-sm-6 text-left btn_login_bar">
    <a href="../BSProject/login.jsp" class="btn btn-default btnlogin">로그인</a>
      <a href="../BSProject/join.jsp" class="btn btn-default btnjoin">회원가입</a>
      </div>  
      </c:otherwise>
    </c:choose>
    
                <ul class="list-unstyled components">
                    <li>
                        <a href="#menu1" data-toggle="collapse" aria-expanded="false">BEST</a>
                        <ul class="collapse list-unstyled" id="menu1">
                            <li><a href="#" onclick="menuList('BEST JUNIOR')">BEST JUNIOR</a></li>
                            <li><a href="#" onclick="menuList('BEST BABY')">BEST BABY</a></li>
                            <li><a href="#" onclick="menuList('BEST ACC')">BEST ACC</a></li>
                        </ul>
                    </li>
                    <li>
                    <a href="#menu2" data-toggle="collapse" aria-expanded="false">SALE</a>
                        <ul class="collapse list-unstyled" id="menu2">
                            <li><a href="#" onclick="menuList('SPRING')">SPRING</a></li>
                            <li><a href="#" onclick="menuList('SUMMER')">SUMMER</a></li>
                            <li><a href="#" onclick="menuList('FALL')">FALL</a></li>
                            <li><a href="#" onclick="menuList('WINTER')">WINTER</a></li>
                        </ul>
                    <li>
                        <a href="#menu3" data-toggle="collapse" aria-expanded="false">BABY</a>
                        <ul class="collapse list-unstyled" id="menu3">
                            <li><a href="#" onclick="menuList('BABY OUTER')">BABY OUTER</a></li>
                            <li><a href="#" onclick="menuList('BABY TOP')">BABY TOP</a></li>
                            <li><a href="#" onclick="menuList('BABY BOTTOM')">BABY BOTTOM</a></li>
                            <li><a href="#" onclick="menuList('BABY SET')">BABY SET</a></li>
                            <li><a href="#" onclick="menuList('BABY DRESS')">BABY DRESS</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#menu4" data-toggle="collapse" aria-expanded="false">JUNIOR</a>
                        <ul class="collapse list-unstyled" id="menu4">
                            <li><a href="#" onclick="menuList('JUNIOR OUTER')">JUNIOR OUTER</a></li>
                            <li><a href="#" onclick="menuList('JUNIOR TOP')">JUNIOR TOP</a></li>
                            <li><a href="#" onclick="menuList('JUNIOR BOTTOM')">JUNIOR BOTTOM</a></li>
                            <li><a href="#" onclick="menuList('JUNIOR SET')">JUNIOR SET</a></li>
                            <li><a href="#" onclick="menuList('JUNIOR DRESS')">JUNIOR DRESS</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#menu5" data-toggle="collapse" aria-expanded="false">ACC</a>
                        <ul class="collapse list-unstyled" id="menu5">
                            <li><a href="#" onclick="menuList('BAG')">BAG</a></li>
                            <li><a href="#" onclick="menuList('CAP')">CAP</a></li>
                            <li><a href="#" onclick="menuList('SOCKS')">SOCKS</a></li>
                            <li><a href="#" onclick="menuList('MUFFLER')">MUFFLER</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">Q&#38;A</a>
                        <ul class="collapse list-unstyled" id="pageSubmenu">
                            <li><a href="../BSProject/reviewBoard_index.jsp">REVIEW</a></li>
                            <li><a href="../BSProject/notice_index.jsp">NOTICE</a></li>
                            <li><a href="../BSProject/board_index.jsp">FREE BOARD</a></li>
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
                     <a href="../BSProject/index.jsp"><h2>STORE</h2></a>
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
                 <h1 class="vw"><a href="../BSProject/index.jsp">STORE</a></h1>
             </div>
            </div>
             <br>
             
 <nav class="navbar-default col-lg-12 col-md-12 menu_bar" id="menuList">
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
            <li><a href="#" onclick="menuList('BEST JUNIOR')">BEST JUNIOR</a></li>
            <li role="separator" class="divider"></li>     
             <li><a href="#" onclick="menuList('BEST BABY')">BEST BABY</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('BEST ACC')">BEST ACC</a></li>
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
            <li><a href="#" onclick="menuList('SPRING')">SPRING</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('SUMMER')">SUMMER</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('FALL')">FALL</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('WINTER')">WINTER</a></li>
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
            <li><a href="#" onclick="menuList('BABY OUTER')">BABY OUTER</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('BABY TOP')">BABY TOP</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('BABY BOTTOM')">BABY BOTTOM</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('BABY SET')">BABY SET</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('BABY DRESS')">BABY DRESS</a></li>
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
            <li><a href="#" onclick="menuList('JUNIOR OUTER')">JUNIOR OUTER</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('JUNIOR TOP')">JUNIOR TOP</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('JUNIOR BOTTOM')">JUNIOR BOTTOM</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('JUNIOR SET')">JUNIOR SET</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('JUNIOR DRESS')">JUNIOR DRESS</a></li>
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
            <li><a href="#" onclick="menuList('BAG')">BAG</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('CAP')">CAP</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('SOCKS')">SOCKS</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="menuList('MUFFLER')">MUFFLER</a></li>
          </ul>
        </li>
      </ul>
     </div>
         <div class="col-lg-1 col-md-1 col-sm-1">
      <ul class="nav navbar-nav">
        <!-- DropDown 형식의 메뉴 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          aria-haspopup="true" aria-expanded="false">BOARD</a>
          <ul class="dropdown-menu ">
            <li><a href="../BSProject/reviewBoard_index.jsp">REVIEW</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="../BSProject/notice_index.jsp">NOTICE</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="../BSProject/board_index.jsp">FREE BOARD</a></li>
          </ul>
        </li>
      </ul>
    </div>
   <div class="col-lg-5 col-md-5 col-sm-5 text-right btn_login_bar">  
    <!-- 오른쪽 정렬의 메뉴 -->
    <c:choose>
      <c:when test="${sessionScope.userid!=null}">
       <div class="col-lg-10 col-md-10 col-sm-10 text-right btn_login_bar">
       <input type="hidden" name="userid" value="${sessionScope.userid}">
        <a href="${path}/store_servlet/memberMain_view.do?userid=${sessionScope.userid}" 
        class="btn btn-default btnlogin text-left">${sessionScope.username}님</a>
       </div>
       <div class="col-lg-2 col-md-2 col-sm-2 text-right btn_login_bar">
        <form action="${path}/store_servlet/logoutstore.do" class="form-group" name="logout_form">
         <button id="logout"  type="submit" class="btn btn-primary btnjoin">로그아웃</button>
        </form>
        </div>
      </c:when>
      <c:otherwise>
    <a href="../BSProject/login.jsp" class="btn btn-default btnlogin">로그인</a>
      <a href="../BSProject/join.jsp" class="btn btn-default btnjoin">회원가입</a>   
      </c:otherwise>
    </c:choose>
    
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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>