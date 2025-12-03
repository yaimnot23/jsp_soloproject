<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE HOTEL - Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container mt-5 mb-5">
        <h2 class="mb-4" style="font-family: serif;">📊 Management Dashboard</h2>
        
        <div class="row g-4 mb-5">
            <div class="col-md-3">
                <div class="card p-3 border-0 shadow-sm" style="border-left: 4px solid #333 !important;">
                    <div class="card-body">
                        <h6 class="text-muted text-uppercase mb-2">Total Rooms</h6>
                        <h2 class="fw-bold mb-0">${stats.total}</h2>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3">
                <div class="card p-3 border-0 shadow-sm" style="border-left: 4px solid #198754 !important;">
                    <div class="card-body">
                        <h6 class="text-success text-uppercase mb-2">Available</h6>
                        <h2 class="fw-bold mb-0">${stats.vacant}</h2>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3">
                <div class="card p-3 border-0 shadow-sm" style="border-left: 4px solid #dc3545 !important;">
                    <div class="card-body">
                        <h6 class="text-danger text-uppercase mb-2">Occupied</h6>
                        <h2 class="fw-bold mb-0">${stats.occupied}</h2>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3">
                <div class="card p-3 border-0 shadow-sm bg-primary text-white">
                    <div class="card-body">
                        <h6 class="text-white-50 text-uppercase mb-2">Total Reservations</h6>
                        <h2 class="fw-bold mb-0">${stats.rsv}</h2>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row g-4">
            <div class="col-md-8">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-header bg-white border-0 py-3">
                        <h5 class="mb-0 fw-bold">💬 Recent Guest Reviews</h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="list-group list-group-flush">
                            <c:forEach items="${recentReviews}" var="cmt">
                                <div class="list-group-item px-4 py-3">
                                    <div class="d-flex justify-content-between mb-1">
                                        <small class="fw-bold text-dark">${cmt.writer}</small>
                                        <small class="text-warning">
                                            <c:forEach begin="1" end="${cmt.rating}">⭐</c:forEach>
                                        </small>
                                    </div>
                                    <p class="mb-1 text-secondary text-truncate">${cmt.content}</p>
                                    <small class="text-muted" style="font-size: 0.75rem;">${cmt.regDate}</small>
                                </div>
                            </c:forEach>
                            <c:if test="${empty recentReviews}">
                                <div class="text-center py-4 text-muted">등록된 리뷰가 없습니다.</div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-header bg-white border-0 py-3">
                        <h5 class="mb-0 fw-bold">⚡ Quick Actions</h5>
                    </div>
                    <div class="card-body">
                        <div class="d-grid gap-3">
                            <a href="/brd/register" class="btn btn-outline-dark text-start p-3">
                                <i class="fa-solid fa-plus me-2"></i> 객실 등록하기
                            </a>
                            <a href="/rsv/list" class="btn btn-outline-dark text-start p-3">
                                <i class="fa-solid fa-list-check me-2"></i> 예약 현황 확인
                            </a>
                            <a href="/brd/list" class="btn btn-outline-dark text-start p-3">
                                <i class="fa-solid fa-bed me-2"></i> 객실 상태 관리
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>