<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 상세 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>🏨 객실 상세 정보</h1>
    <hr>
    
    <div class="card mb-3">
        <div class="row g-0">
            <div class="col-md-6">
                <c:if test="${not empty rvo.imageFile}">
                    <img src="${pageContext.request.contextPath}/upload/${rvo.imageFile}" class="img-fluid rounded-start" alt="객실 사진" style="width: 100%; height: 400px; object-fit: cover;">
                </c:if>
                <c:if test="${empty rvo.imageFile}">
                    <div class="d-flex align-items-center justify-content-center bg-light" style="height: 400px;">
                        <span class="text-muted">이미지 없음</span>
                    </div>
                </c:if>
            </div>
            <div class="col-md-6">
                <div class="card-body">
                    <h2 class="card-title text-primary fw-bold">${rvo.roomNum}</h2>
                    <p class="card-text">
                        <span class="badge bg-secondary fs-6">${rvo.roomType}</span>
                        <c:choose>
                            <c:when test="${rvo.roomStatus == '빈방'}"><span class="badge bg-success fs-6">빈방</span></c:when>
                            <c:when test="${rvo.roomStatus == '사용중'}"><span class="badge bg-danger fs-6">사용중</span></c:when>
                            <c:otherwise><span class="badge bg-warning text-dark fs-6">청소중</span></c:otherwise>
                        </c:choose>
                    </p>
                    <h4 class="card-text mt-4">₩ ${rvo.price} / 1박</h4>
                    <p class="card-text mt-4">${rvo.content}</p>
                    <p class="card-text"><small class="text-muted">등록일: ${rvo.regDate}</small></p>
                    
                    <div class="mt-5">
                        <a href="/brd/modify?rno=${rvo.rno}" class="btn btn-warning">수정하기</a>
                        <a href="/brd/remove?rno=${rvo.rno}" class="btn btn-danger" onclick="return confirm('정말 이 객실을 삭제하시겠습니까?');">삭제하기</a>
                        <a href="/brd/list" class="btn btn-secondary">목록으로</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>