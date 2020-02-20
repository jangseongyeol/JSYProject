<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.managerid==null}">
  <script type="text/javascript">
    alert("로그인하신 후 사용하세요.");
    location.href="${path}/BSProject/manager_login.jsp";
  </script>
</c:if>