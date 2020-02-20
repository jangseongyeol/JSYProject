<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../BSProject/storeHeader.jsp" %>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("utf-8");%>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../BSProject/css/style.css">
   <script type="text/javascript">
   
  $(function(){
	  $("#btnList").click(function(){
			document.member_view_form.action="${path}/BSProject/index.jsp";
			document.member_view_form.submit();
		});
  });
  function memberDel() {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			document.member_view_form.action="${path}/store_servlet/memberDelete.do";
			document.member_view_form.submit();
		}
	}
function memberUpdate() {
		var chk = confirm("수정하시겠습니까?");
		if (chk) {
			document.member_view_form.action="${path}/store_servlet/memberUpdate.do";
			document.member_view_form.submit();
		}
	}	
  
  function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = ''; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수

	            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                fullAddr = data.roadAddress;

	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                fullAddr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	            if(data.userSelectedType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('address').value = fullAddr;

	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById('address2').focus();
	        }
	    }).open();
	}
  function menuList(submenu){
		 $.ajax({
				type: "post",
				url: "${path}/product_servlet/categoryPage.do?submenu="+submenu,
				success: function(result){
					$("#member_view_div").hide();
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
   .form-inline{
   margin-bottom: 15px !important;
 }
 .postinline {
   margin-right: 15px !important; 
 }
 .postcodediv {
 margin-bottom: 0px !important;
 }
 
  </style>
</head>
<body>
<div class="container_category" id="categoryPage">

</div>


<div class="container member_view_div" id="member_view_div">
            <div class="page-header text-center col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <h3>${dto.username}님의 정보</h3>
                </div>
            </div>
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <form method="post" name="member_view_form"  class="form-horizontal">
                    <div class="form-group">
                        <label for="userid">아이디</label>
                        <input  class="form-control" id="userid" name="userid" value="${dto.userid}">
                    </div>
                    <div class="form-group">
                        <label for="username">이름</label>
                        <input class="form-control" id="username" name="username" value="${dto.username}">
                    </div>
                    <div class="form-group">
                        <label for="birthday">생일</label>
                        <input class="form-control" id="birthday" name="birthday" value="${dto.birthday}">
                    </div>
                    <div class="form-group">
                        <label for="useremail">이메일</label>
                        <input class="form-control" id="useremail" name="useremail" value="${dto.useremail}">
                    </div>
                    <div class="form-group">
                        <label for="phone">핸드폰</label>
                        <input class="form-control" id="phone" name="phone" value="${dto.phone}">
                    </div>
                    <div class="labelname form-group postcodediv">
                        <label for="postname">우편번호</label>
                        <input type="hidden" class="form-control" name="postname">
                    </div>
                   <div class="form-inline">
                    <div class="form-group postinline">                  
                      <input type="text" id="postcode" name="postcode"  value="${dto.postcode}"  class="form-control">          
                    </div>
                    <div class="form-group">
                       <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary"> 
                   </div>
                   </div>
                   <div class="form-group">
                     <label for="address">주소</label>
                      <input type="text" id="address" name="address" value="${dto.address}"  class="form-control">
                   </div>     
                   <div class="form-group"> 
                    <label for="address2">상세주소</label>
                      <input type="text" id="address2" name="address2" value="${dto.address2}"  class="form-control">
                    </div>
              <div class="form-group text-center">
              <input type="hidden" name="usernum" value="${dto.usernum}">
                        <button type="submit" onclick="memberUpdate()" class="btn btn-primary">
                            수정
                        </button>
                        <button type="submit" onclick="memberDel()"  class="btn btn-warning">회원탈퇴
                        </button>
                        <a type="submit" id="btnList" class="btn btn-dark pull-left">
                            목록
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
</body>
</html>