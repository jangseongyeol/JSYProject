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
  <link rel="stylesheet" href="../BSProject/css/managerStyle.css"> 
<style type="text/css">
  tbody tr:hover {
  cursor: pointer !important;
  }
  .product_list_div .col-sm-2 {
   float: left !important;
  }
.input-group-lg > .form-control,  .input-group-lg > .input-group-btn > .btn {
   height: 34px !important;
   padding: 0 10px!important;
  }
  .container_board {
   padding-top: 30px;
  }
  .member_table th {
   text-align: center;
  }
  .member_table {
   border-bottom: 1px soild silver;
  }
  @media (max-width: 800px) {
   .container_board {
   padding-top: 0;
  }
  
  }  
  </style>
</head>
<body>
<div class="container"> 
	 	<div class="row text-center">
		<h2>회원 관리 게시판</h2>
		<br><br>
<div class="form-group product_list_div">
  <form class="" name="product_list_form" method="post"  action="${path}/store_servlet/member_search.do">
  <div class="form-group col-xs-6 col-sm-6 col-lg-2 col-md-2">
    <select class="form-control" name="search_option">
    <option value="userid" selected>아이디</option>
  </select>
 </div>
   <div class="input-group input-group-lg col-xs-6 col-sm-6 col-lg-2 col-md-2">
               <input name="keyword" class="form-control" placeholder="Search" value="${keyword}">
                 <div class="input-group-btn">
                   <button class="btn btn-default" type="submit" id="btnSearch">
                   <i class="glyphicon glyphicon-search"></i>
                   </button>
                 </div>
          </div>
 </form>
</div> 
			<table class="table table-hover text-center member_table">
				<thead>
						<tr class="text-center">
							<th class="hidden-sm hidden-xs">고객번호</th>
							<th>아이디</th>
							<th>이름</th>
                            <th class="hidden-sm hidden-xs">생일</th>
                            <th>이메일</th>
                            <th class="hidden-sm hidden-xs">핸드폰</th>
                            <th class="hidden-sm hidden-xs">우편번호</th>
                            <th class="hidden-sm hidden-xs">집주소</th>
                            <th class="hidden-sm hidden-xs">가입일자</th>
						</tr>
				</thead>
				<tbody>
   <c:forEach var="dto" items="${list}">
    <tr>
      <td class="hidden-sm hidden-xs"><a href="${path}/store_servlet/member_view.do?usernum=${dto.usernum}">${dto.usernum}</a></td>
      <td><a href="${path}/store_servlet/member_view.do?usernum=${dto.usernum}">${dto.userid}</a></td>
      <td><a href="${path}/store_servlet/member_view.do?usernum=${dto.usernum}">${dto.username}</a></td>
      <td class="hidden-sm hidden-xs"><a href="${path}/store_servlet/member_view.do?usernum=${dto.usernum}">${dto.birthday}</a></td>
      <td><a href="${path}/store_servlet/member_view.do?usernum=${dto.usernum}">${dto.useremail}</a></td>
      <td class="hidden-sm hidden-xs"><a href="${path}/store_servlet/member_view.do?usernum=${dto.usernum}">${dto.phone}</a></td>
      <td class="hidden-sm hidden-xs"><a href="${path}/store_servlet/member_view.do?usernum=${dto.usernum}">${dto.postcode}</a></td>
      <td class="hidden-sm hidden-xs"><a href="${path}/store_servlet/member_view.do?usernum=${dto.usernum}">${dto.address} ${dto.address2}</a></td>
      <td class="hidden-sm hidden-xs"><fmt:formatDate value="${dto.join_date}" pattern="yyyy.MM.dd" /></td>
    </tr>
  </c:forEach>
 </tbody>
</table>
   
  <!-- 페이지 네비게이션 출력  -->

    <div class="text-center">
     <ul class="pagination">
      <c:if test="${page.curBlock > 1 }">
        <li><a href="#" onclick="memberList('1')">[처음]</a></li>
      </c:if>
      <c:if test="${page.curBlock > 1 }">
        <li><a href="#" onclick="memberList('${page.prevPage}')">[이전]</a></li>
      </c:if>
      <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
        <c:choose>
          <c:when test="${num == page.curPage}">
            <li><span style="color: red">${num}</span></li>
          </c:when>
          <c:otherwise>
            <li><a href="#" onclick="memberList('${num}')">${num}</a></li>
          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:if test="${page.curBlock < page.totBlock}">
        <li><a href="#" onclick="memberList('${page.nextPage}')">[다음]</a></li>
      </c:if>
      <c:if test="${page.curBlock < page.totBlock}">
        <li><a href="#" onclick="memberList('${page.totPage}')">[끝]</a></li>
      </c:if>
  </ul>
</div> 
 
		<!-- </div> -->
	</div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>