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
 .comment_list {
 padding: 0;
 }
 </style>
</head>
<body>
<div class="container col-xs-12 col-sm-12 col-md-12 col-lg-12 comment_list">
<table class="table">
 <c:forEach var="row" items="${list}">
  <tr>
  <td>
      ${row.userid} ( <fmt:formatDate value="${row.reg_date}" pattern="yyyy.MM.dd hh:mm:ss" />) <br>
      ${row.contents}
    </td>
  </tr>
 </c:forEach>
</table>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
