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
    <link rel="stylesheet" href="../BSProject/css/style.css">
  <script type="text/javascript">
</script>
</head>
<body>

<div class="row text-center">
		<h2>공지사항 게시판</h2>

			<table class="table table-hover text-center">
				<thead>
						<tr class="text-center">
							<th class="hidden-sm hidden-xs text-center">번호</th>
                            <th class="text-center">이름</th>
                            <th class="text-center">제목</th>
                            <th class="text-center">날짜</th>
                            <th class="text-center">조회수</th>
						</tr>
				</thead>
				<tbody>
   <c:forEach var="dto" items="${list}">
    <tr>
      <td class="hidden-sm hidden-xs">${dto.num}</td>
      <td>${dto.managerid}</td>
      <td>
        <!-- 답글 들여쓰기  -->
        <c:forEach var="i" begin="1" end="${dto.re_level}">
        &nbsp;&nbsp;
        </c:forEach>
      <a href="${path}/noticemain_servlet/main_noticeView.do?num=${dto.num}">
        ${dto.subject}</a>
        <!-- 댓글갯수 표시  -->
        <c:if test="${dto.comment_count > 0}">
          <span style="color:red">(${dto.comment_count})</span>
        </c:if>
      </td>
      <td>${dto.reg_date}</td>
      <td>${dto.readcount}</td>
    </tr>
  </c:forEach>
 </tbody>
</table>
             
  <!-- 페이지 네비게이션 출력  -->

    <div class="text-center">
     <ul class="pagination">
      <c:if test="${page.curBlock > 1 }">
        <li><a href="#" onclick="noticeList('1')">[처음]</a></li>
      </c:if>
      <c:if test="${page.curBlock > 1 }">
        <li><a href="#" onclick="noticeList('${page.prevPage}')">[이전]</a></li>
      </c:if>
      <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
        <c:choose>
          <c:when test="${num == page.curPage}">
            <li><span style="color: red">${num}</span></li>
          </c:when>
          <c:otherwise>
            <li><a href="#" onclick="noticeList('${num}')">${num}</a></li>
          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:if test="${page.curBlock < page.totBlock}">
        <li><a href="#" onclick="noticeList('${page.nextPage}')">[다음]</a></li>
      </c:if>
      <c:if test="${page.curBlock < page.totBlock}">
        <li><a href="#" onclick="noticeList('${page.totPage}')">[끝]</a></li>
      </c:if>
  </ul>
</div> 
</div>
</body>
</html>