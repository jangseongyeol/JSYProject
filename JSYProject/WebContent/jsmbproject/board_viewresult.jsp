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
</head>
<body>
<div data-role="controlgroup" data-role="navbar" id="navigation-list1">
  <c:forEach var="row" items="${list}">
       <a data-role="button" href="${path}/board_servlet/viewboard.do?idx=${row.idx}" 
       data-ajax="false">
        <b style="font-size:0.8rem; float: left;">&#60;가입인사&#62;</b>
        <b style="font-size:0.8rem; float:left; margin-left: 25px;">${row.title}</b><br>
        <b style="font-size:0.8rem; float:left; color:#333;">${row.memo}</b><br>
        <b style="font-size:0.8rem; float: left;">${row.userid} </b>
        <b style="font-size:0.8rem; float:right; color: blue;">${row.post_date}</b>
       </a>
  </c:forEach>
</div>



</body>
</html>