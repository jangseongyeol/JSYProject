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
<script src="../BSProject/js/managerLogin.js"></script>
<script src="../BSProject/js/managerJoin.js"></script>
</head>
<body>
<div class="jumbotron">
  <div class="container text-center">
    <h1><a href="../BSProject/manager_index.jsp">STORE(관리자모드)</a></h1>      
  </div>
</div>
<c:choose>
      <c:when test="${sessionScope.managerid!=null}">
        <form action="${path}/storemanager_servlet/logoutManager.do" class="form-group" name="managerLogout_form">
      <div class="text-right hidden-sm hidden-md hidden-lg logoutMobileDiv">
    <b class="hidden-sm hidden-md hidden-lg">${sessionScope.manager}님</b>&nbsp;&nbsp;
    <button id="managerLogout" type="submit" class="btn btn-primary hidden-sm hidden-md hidden-lg">로그아웃</button>
      </div>
        </form>
      </c:when>
      <c:otherwise>
       <div class="text-right hidden-sm hidden-md hidden-lg logoutMobileDiv">
        <a href="../BSProject/manager_login.jsp" class="btn btn-primary"><b>관리자로그인</b></a>
      </div>  
      </c:otherwise>
    </c:choose>

<nav class="navbar navbar-inverse">
  <div class="container-fluid menubar">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="../BSProject/manager_member_index.jsp">회원관리</a></li>
        <li><a href="../BSProject/manager_product_index.jsp">상품관리</a></li>
        <li><a href="../BSProject/manager_notice_index.jsp">공지사항</a></li>
        <li><a href="../BSProject/manager_reviewBoard_index.jsp">리뷰게시판</a></li>
        <li><a href="../BSProject/manager_board_index.jsp">자유게시판</a></li>
      </ul>
     <c:choose>
      <c:when test="${sessionScope.managerid!=null}">
        <form action="${path}/storemanager_servlet/logoutManager.do" class="form-group" name="managerLogout_form">
      <ul class="nav navbar-nav navbar-right hidden-xs">
        <li><a href="#"><b style="color:black"><span class="glyphicon glyphicon-user"></span>${sessionScope.manager}님</b></a></li>
        <li><button class="btn btn-primary btn-lg" id="managerLogout" type="submit">로그아웃</button></li>
      </ul>
        </form>
      </c:when>
      <c:otherwise>
       <ul class="nav navbar-nav navbar-right">
        <li class="hidden-sm hidden-xs"><a href="../BSProject/manager_login.jsp"><span class="glyphicon glyphicon-user"></span>관리자로그인</a></li>
        <li><a href="../BSProject/manager_join.jsp"><span class="glyphicon glyphicon-user"></span>관리자회원가입</a></li>
      </ul>  
      </c:otherwise>
    </c:choose>
    </div>
  </div>
</nav>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>