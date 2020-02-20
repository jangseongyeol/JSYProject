<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.4.1.min.js"></script>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
Connection conn=null;
try {
	String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
	String dbId="java";//오라클 접속 아이디
	String dbPass="java1234";//비번
	Class.forName("oracle.jdbc.driver.OracleDriver");//driver 로딩
    conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	out.println("오라클에 접속되었습니다.");
}catch (Exception e) {
	out.println("오라클 접속 에러...");
	e.printStackTrace();
}
%>
</body>
</html>