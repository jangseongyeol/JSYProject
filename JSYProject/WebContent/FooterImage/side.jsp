<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="../include/css/bootstrap.min.css">
  <link rel="stylesheet" href="../include/css/bootstrap.css">
  <link rel="stylesheet" href="css/style.css">
   <script src="js/join.js"></script>
   <script type="text/javascript">
$(function(){
	$("#btnSave").click(function(){
		document.write_form.action="${path}/board_servlet/insert_board.do";
		document.write_form.submit();
	});
	$("#btnList").click(function(){
		document.write_form.action="${path}/board_servlet/list.do";
		document.write_form.submit();
	});
});

</script>
   <style type="text/css">
   .write_div .text_cotent {
     padding: 0 !important;
   }
   .write_div .btn-primary {
    background-color: #333 !important;
    color: white !important;
    border-color: #333 !important;
   }
   </style>
</head>
<body>
<div class="container write_div">
            <div class="page-header text-center col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <h3>글쓰기</h3>
                </div>
            </div>
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
                <form method="post" name="write_form" <%-- action="${path}/store_servlet/insertmember.do" --%> class="form-horizontal">
                    <div class="form-group">
                        <label for="username">제목</label>
                        <input type="text" class="form-control" id="subject" name="subject"placeholder="제목을 입력해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="userid">아이디</label>
                        <input type="userid" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="passwd">비밀번호</label>
                        <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="filename">사진파일</label><br>
                          <input type="file" class="form-control" id="filename1" name="filename1">
                    </div>
            
              <div class="form-group">
				<label for="content_label">내용</label><br>			
					<textarea class="form-control text_cotent" name="content" rows="10" cols="10">
			        </textarea>
              </div>
              <div class="form-group text-center">
                        <button type="submit" id="btnSave" class="btn btn-primary">
                            등록<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="submit" class="btn btn-warning">
                            취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                        <button type="submit" id="btnList" class="btn btn-dark pull-left">
                            목록<i class="fa fa-check spaceLeft"></i>
                        </button>
                    </div>
                   
   </form>
   </div>
   </div>
 
</body>
</html>