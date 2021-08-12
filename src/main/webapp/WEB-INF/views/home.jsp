<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
	<title>메인화면</title>
</head>
<body>
<h2>[ 가계부 ]</h2>
<ul>
	<c:if test="${sessionScope.loginId == null}">
		<li><a href="join">회원가입</a></li>
		<li><a href="login">로그인</a></li>
	</c:if>	
	
	<c:if test="${sessionScope.loginId != null}">
		<li><a href="listMoneyBook">내 가계부</a></li>
		<li><a href="logout">로그아웃</a></li>
	</c:if>
</ul>
</body>
</html>
