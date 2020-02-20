<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
int a=Integer.parseInt(request.getParameter("num"));
//null을 숫자로 바꿀 수 없기 때문에 에러
//java.lang.NumberFormatException
%>
a : <%=a %>
</body>
</html>