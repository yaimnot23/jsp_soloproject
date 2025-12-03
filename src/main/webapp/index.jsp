<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 관리 시스템</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* 배경 이미지나 스타일을 추가하고 싶으면 여기에 작성 */
    .hero-section {
        background-color: #f8f9fa;
        padding: 100px 0;
        text-align: center;
        border-radius: 10px;
        margin-top: 50px;
    }
</style>
</head>
<body>

<div class="container">
    <div class="hero-section">
        <h1 class="display-4 fw-bold">🏨 호텔 객실 관리 시스템</h1>
        <p class="lead text-muted mt-3">객실 상태를 확인하고 관리하는 관리자 전용 페이지입니다.</p>
        
        <hr class="my-5" style="width: 50%; margin: 0 auto;">
        
        <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
            <a href="/brd/list" class="btn btn-primary btn-lg px-5 gap-3">
                📋 객실 목록 보기
            </a>
            
            <a href="/brd/register" class="btn btn-outline-secondary btn-lg px-5">
                ➕ 객실 등록하기
            </a>
        </div>
    </div>
    
    <div class="mt-5 text-center text-secondary">
        <small>&copy; 2025 Hotel Management System Project</small>
    </div>
</div>

</body>
</html>