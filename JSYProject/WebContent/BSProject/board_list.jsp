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
    <link rel="stylesheet" href="../BSProject/css/style.css">
  <style type="text/css">
  tbody tr:hover {
  cursor: pointer !important;
  }
  .search_div .col-sm-2 {
   float: left !important;
  }
.input-group-lg > .form-control,  .input-group-lg > .input-group-btn > .btn {
   height: 34px !important;
   padding: 0 10px!important;
  }
  .container_board {
   padding-top: 30px;
  }
  @media (max-width: 800px) {
   .container_board {
   padding-top: 0;
  }
  
  }
  
  </style>
  
<script type="text/javascript">
$(function(){
	$("#btnSearch").click(function(){
		document.search_form.commit();
	});
	$("#btnWrite").click(function(){
		location.href="${path}/BSProject/board_write.jsp";
	});
});


//클릭한 페이지로 이동
/* function list(page){
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/list.do?curPage="+page+"&search_option=${search_option}"+"&keyword=${keyword}",
		success: function(result){
			$("#container_board").html(result);
		}
	}); */
/* 	 function search_list(){
		 var param="search_option="+$("#search_option").val()
		 +"&keyword="+$("#keyword").val();
		    $.ajax({
		 	type: "post",
		 	url: "${path}/board_servlet/search.do",
		 	data: param,
		 	success: function(result){
		 		location.replace="/BSProject/search.jsp";
		 	   }
		     });	
		 }     */
</script>
</head>
<body>



<div class="row text-center">
		<h2>자유 게시판</h2>
<div class="form-group search_div">
  <form class="" name="search_form" method="post"  action="${path}/board_servlet/search.do">
  <div class="form-group col-xs-6 col-sm-6 col-lg-2 col-md-2 ">
    <select class="form-control" name="search_option">
      <option value="userid">아이디</option>
      <option value="subject">제목</option>
      <option value="content">내용</option>
      <option value="all">아이디+제목+내용</option>
      <c:choose>
   <c:when test="${search_option == 'userid'}">
    <option value="userid" selected>아이디</option>
    <option value="subject">제목</option>
    <option value="contents">내용</option>
    <option value="all">아이디+제목+내용</option>
   </c:when>
   <c:when test="${search_option == 'subject'}">
    <option value="userid">아이디</option>
    <option value="subject" selected>제목</option>
    <option value="contents">내용</option>
    <option value="all">아이디+제목+내용</option>
   </c:when>
   <c:when test="${search_option == 'contents'}">
    <option value="userid" >아이디</option>
    <option value="subject">제목</option>
    <option value="contents" selected>내용</option>
    <option value="all">아이디+제목+내용</option>
   </c:when>
   <c:when test="${search_option == 'all'}">
    <option value="userid" >아이디</option>
    <option value="subject">제목</option>
    <option value="contents">내용</option>
    <option value="all" selected>아이디+제목+내용</option>
   </c:when>
  </c:choose>
    </select>
  </div>
  <div class="input-group input-group-lg col-xs-6 col-sm-6 col-lg-2 col-md-2 ">
               <input type="text" name="keyword" class="form-control" placeholder="Search">
                 <div class="input-group-btn">
                   <button class="btn btn-default" type="submit" id="btnSearch">
                   <i class="glyphicon glyphicon-search"></i>
                   </button>
                 </div>
               </div>
 </form>
</div> 
			<table class="table table-hover text-center">
				<thead>
						<tr>
							<th class="hidden-sm hidden-xs">번호</th>
                            <th>이름</th>
                            <th>제목</th>
                            <th>날짜</th>
                            <th>조회수</th>
						</tr>
				</thead>
				<tbody>
   <c:forEach var="dto" items="${list}">
    <c:choose>
      <c:when test="${dto.show == 'y'}">
    <tr>
      <td class="hidden-sm hidden-xs">${dto.num}</td>
      <td>${dto.userid}</td>
      <td>
        <!-- 답글 들여쓰기  -->
        <c:forEach var="i" begin="1" end="${dto.re_level}">
        &nbsp;&nbsp;
        </c:forEach>
      <a href="${path}/board_servlet/view.do?num=${dto.num}">
        ${dto.subject}</a>
        <!-- 댓글갯수 표시  -->
        <c:if test="${dto.comment_count > 0}">
          <span style="color:red">(${dto.comment_count})</span>
        </c:if>
      </td>
      <td>${dto.reg_date}</td>
      <td>${dto.readcount}</td>
    </tr>
  </c:when>
  <c:otherwise>
    <tr>
      <td>${dto.num}</td>
      <td colspan="6" align="center">삭제된 게시물입니다.</td>
    </tr>
  </c:otherwise>
  </c:choose>
  </c:forEach>
 </tbody>
</table>
             <div class="form-group text-center">
			      <button type="submit" id="btnWrite" class="btn btn-dark pull-right">
			         글쓰기
                  </button>
            </div>     
  <!-- 페이지 네비게이션 출력  -->

    <div class="text-center">
     <ul class="pagination">
      <c:if test="${page.curBlock > 1 }">
        <li><a href="#" onclick="boardList('1')">[처음]</a></li>
      </c:if>
      <c:if test="${page.curBlock > 1 }">
        <li><a href="#" onclick="boardList('${page.prevPage}')">[이전]</a></li>
      </c:if>
      <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
        <c:choose>
          <c:when test="${num == page.curPage}">
            <li><span style="color: red">${num}</span></li>
          </c:when>
          <c:otherwise>
            <li><a href="#" onclick="boardList('${num}')">${num}</a></li>
          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:if test="${page.curBlock < page.totBlock}">
        <li><a href="#" onclick="boardList('${page.nextPage}')">[다음]</a></li>
      </c:if>
      <c:if test="${page.curBlock < page.totBlock}">
        <li><a href="#" onclick="boardList('${page.totPage}')">[끝]</a></li>
      </c:if>
  </ul>
</div> 
 
		<!-- </div> -->
	</div>


</body>
</html>