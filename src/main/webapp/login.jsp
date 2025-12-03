<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container mt-5" style="max-width: 400px;">
        <h1>🔒 로그인</h1>
        <hr>
        
        <c:if test="${msg_login eq 0}">
        	<div class="alert alert-danger">아이디 또는 비밀번호가 틀렸습니다.</div>
        </c:if>

        <form action="/mem/login" method="post">
            <div class="mb-3">
                <label>아이디</label>
                <input type="text" name="id" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>비밀번호</label>
                <input type="password" name="pwd" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-dark w-100">로그인</button>
        </form>
        <div class="mt-3 text-center">
        	<a href="/mem/join">관리자 계정이 없으신가요?</a>
        </div>
    </div>
</body>
</html>