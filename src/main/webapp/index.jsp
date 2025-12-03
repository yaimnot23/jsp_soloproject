<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE HOTEL - Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container-fluid p-0">
        <div class="hero-section text-center" 
             style="background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80'); 
                    background-color: #2c2c2c; 
                    background-size: cover; 
                    background-position: center; 
                    color: white; 
                    padding: 150px 0;">
            
            <h1 class="hero-title" style="font-family: serif; font-size: 3.5rem; text-shadow: 2px 2px 4px rgba(0,0,0,0.5);">
                Timeless Luxury, The Hotel
            </h1>
            
            <p class="lead mb-4" style="font-weight: 300; letter-spacing: 1px; color: #f0f0f0;">
                품격 있는 휴식을 위한 프리미엄 객실 관리 시스템
            </p>
            
            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center mt-5">
                <a href="/brd/list" class="btn btn-primary btn-lg px-5 gap-3 rounded-0" style="border: none;">
                    VIEW ROOMS
                </a>
                
                <c:if test="${not empty ses.id}">
                    <a href="/brd/register" class="btn btn-outline-light btn-lg px-5 rounded-0" style="border-width: 1px;">
                        REGISTER ROOM
                    </a>
                </c:if>
            </div>
        </div>
    </div>
    
    <div class="container mt-5 mb-5 text-center">
        <h3 class="mb-4" style="color: #9e8a59; font-family: serif;">Exceptional Service</h3>
        <p class="text-muted" style="max-width: 600px; margin: 0 auto;">
            체계적인 객실 관리와 실시간 상태 모니터링을 통해<br>
            고객에게 최상의 경험을 제공합니다.
        </p>
        <div class="mt-5 text-secondary">
            <small>&copy; 2025 THE HOTEL. All Rights Reserved.</small>
        </div>
    </div>
</body>
</html>