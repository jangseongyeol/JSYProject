<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 상세페이지</title>
<%@ include file="../include/header.jsp" %>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("utf-8");%>
<%@ include file="../BSProject/storeHeader.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="../BSProject/css/style.css">
   <script type="text/javascript">
   $(function(){
		comment_list();
		$("#btnSave").click(function(){
			comment_add();
		});
		$("#btnList").click(function(){
			document.reviewView_form.action="${path}/BSProject/reviewBoard_index.jsp";
			document.reviewView_form.submit();
		});
		$("#btnReply").click(function(){
			document.reviewView_form.action="${path}/reviewboard_servlet/reviewReply.do";
			document.reviewView_form.submit();
		});
		$("#btnEdit").click(function(){
			document.reviewView_form.action="${path}/reviewboard_servlet/reviewPass_check.do";
			document.reviewView_form.submit();
		});
	});

	function comment_add(){
	 var param="board_num=${dto.num}&userid="+$("#userid").val()
	 +"&contents="+$("#contents").val();
	 $.ajax({
		 type:"post",
		 url:"${path}/reviewboard_servlet/reviewComment_add.do",
		 data:param,
		 success: function(){
			 $("#userid").val("");
			 $("#conents").val("");
			 comment_list();
		 }
	 });
	}

	function comment_list(){
		$.ajax({
			type:"post",
			url:"${path}/reviewboard_servlet/reviewCommentList.do",
			data:"num=${dto.num}",
			success: function(result){
				$("#commentList").html(result);
			}
		});
	}
	
	function menuList(submenu){
		 $.ajax({
				type: "post",
				url: "${path}/product_servlet/categoryPage.do?submenu="+submenu,
				success: function(result){
					$("#view_div").hide();
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
   <style type="text/css">  
   
   a, a:hover, a:focus {
    color: #333;
    text-decoration: none;
    transition: all 0.3s;
    
}
   
   .view_div .text_cotent {
     padding: 0 !important;
   }
   .view_div .btn-primary, .write_div .btn-warning{
    background-color: #333 !important;
    color: white !important;
    border-color: #333 !important;
   }
   .reply_table .text-center{
   padding: 8px 8px;
   }

   </style>
</head>
<body>



<div class="container_category" id="categoryPage">

</div>


<div class="container view_div" id="view_div">
            <div class="page-header text-center col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                </div>
            </div>
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <form method="post" name="reviewView_form" class="form-horizontal">
                    <div class="form-group">
                        <label for="username">제목</label>
                        <input class="form-control"  value="${dto.subject}" >
                    </div>
                    <div class="form-group">
                        <label for="userid">아이디</label>
                        <input class="form-control"  value="${dto.userid}">
                    </div>
                    <div class="form-group">
                        <label for="passwd">비밀번호</label>
                        <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요">
                         <c:if test="${param.message=='error'}">
                          <span style="color:red">비밀번호가 일치하지 않습니다.</span>
                         </c:if>
                    </div>
                    <div class="form-group">
                        <label for="filename">사진파일</label><br>
                          <c:if test="${dto.filesize > 0}">
                             <img src="../upload_image/${dto.filename}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><br>                            
                          </c:if>
                    </div>
            
              <div class="form-group">
				<label for="content_label">내용</label><br>			
					<textarea class="form-control text_cotent" rows="10" cols="10">${dto.contents}</textarea>
              </div>
              <c:choose>
                <c:when test="${dto.userid==sessionScope.userid}">
                  <div class="form-group text-center">
              <input type="hidden" name="num" value="${dto.num}">
                        <button type="submit" id="btnEdit" class="btn btn-primary" >
                           수정/삭제
                        </button>
                        <button type="submit" id="btnReply" class="btn btn-warning">
                            답변
                        </button>
                        <button type="submit" id="btnList" class="btn btn-dark pull-left">
                            목록
                        </button>
                   </div>
                </c:when>
               <c:otherwise>
              <div class="form-group text-center">
              <input type="hidden" name="num" value="${dto.num}">
                        <button type="submit" id="btnReply" class="btn btn-warning">
                            답변
                        </button>
                        <button type="submit" id="btnList" class="btn btn-dark pull-left">
                            목록
                        </button>
                   </div>
                </c:otherwise>
              </c:choose>           
                              
   </form>
   <table class="table reply_table">
  <tr>
    <c:choose>
     <c:when test="${sessionScope.userid!=null}">
       <td><input class="form-control" id="userid" value="${sessionScope.userid}" placeholder="아이디"></td>                             
     </c:when>
       <c:otherwise>
       <td><input class="form-control" id="userid" placeholder="아이디"></td>
      </c:otherwise>
     </c:choose>
    <td rowspan="1" class="text-center">
      <button id="btnSave" class="btn btn-primary btn-block" type="button">댓글달기</button>
    </td>
  </tr>
  <tr>
    <td colspan="2"><textarea class="form-control" rows="2" id="contents" cols="40" placeholder="내용을 입력하세요"></textarea></td>
  </tr>
</table>
<div id="commentList" class="container col-xs-12 col-sm-12 col-md-12 col-lg-12"></div>           
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