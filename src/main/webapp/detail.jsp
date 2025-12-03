<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE HOTEL - Detail</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container mt-5 mb-5">
        <h1>🏨 객실 상세 정보</h1>
        <hr>
        
        <div class="card mb-3 shadow-sm">
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
                    <div class="card-body p-4">
                        <h2 class="card-title text-primary fw-bold mb-3" style="font-family: 'Playfair Display', serif;">${rvo.roomNum}</h2>
                        
                        <div class="mb-3">
                            <span class="badge bg-secondary fs-6 me-1">${rvo.roomType}</span>
                            <c:choose>
                                <c:when test="${rvo.roomStatus == '빈방'}"><span class="badge bg-success fs-6">빈방</span></c:when>
                                <c:when test="${rvo.roomStatus == '사용중'}"><span class="badge bg-danger fs-6">사용중</span></c:when>
                                <c:otherwise><span class="badge bg-warning text-dark fs-6">청소중</span></c:otherwise>
                            </c:choose>
                        </div>

                        <h4 class="card-text text-dark fw-bold mb-4">₩ ${rvo.price} / 1박</h4>
                        
                        <p class="card-text text-secondary mb-4" style="line-height: 1.6;">${rvo.content}</p>
                        
                        <p class="card-text border-top pt-3"><small class="text-muted">등록일: ${rvo.regDate}</small></p>
                        
                        <div class="mt-4 d-flex gap-2">
                            <c:if test="${not empty ses.id}">
                                <a href="/brd/modify?rno=${rvo.rno}" class="btn btn-warning text-white">수정하기</a>
                                <a href="/brd/remove?rno=${rvo.rno}" class="btn btn-danger" onclick="return confirm('정말 이 객실을 삭제하시겠습니까?');">삭제하기</a>
                            </c:if>
                            <a href="/brd/list" class="btn btn-outline-secondary">목록으로</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-12">
                <h3 class="mb-4" style="font-family: serif;">💬 Guest Reviews</h3>
                
                <c:if test="${not empty ses.id}">
                    <div class="card p-4 mb-4 bg-light border-0">
                        <h5 class="fw-bold mb-3">리뷰 작성하기</h5>
                        <form action="/cmt/register" method="post">
                            <input type="hidden" name="rno" value="${rvo.rno}">
                            <input type="hidden" name="writer" value="${ses.id}">
                            
                            <div class="row align-items-center mb-3">
                                <div class="col-auto">
                                    <label class="fw-bold">별점 평가:</label>
                                </div>
                                <div class="col-auto">
                                    <select name="rating" class="form-select">
                                        <option value="5">⭐⭐⭐⭐⭐ (5점)</option>
                                        <option value="4">⭐⭐⭐⭐ (4점)</option>
                                        <option value="3">⭐⭐⭐ (3점)</option>
                                        <option value="2">⭐⭐ (2점)</option>
                                        <option value="1">⭐ (1점)</option>
                                    </select>
                                </div>
                            </div>
                            
                            <textarea name="content" class="form-control mb-3" rows="3" placeholder="이 객실에서의 경험을 솔직하게 남겨주세요." required></textarea>
                            <div class="text-end">
                                <button type="submit" class="btn btn-dark">리뷰 등록</button>
                            </div>
                        </form>
                    </div>
                </c:if>

                <div class="review-list">
                    <c:forEach items="${cList}" var="cmt">
                        <div class="card mb-3 border-0 border-bottom">
                            <div class="card-body px-0">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <span class="fw-bold me-2">${cmt.writer}</span>
                                        <span class="text-warning">
                                            <c:forEach begin="1" end="${cmt.rating}">⭐</c:forEach>
                                        </span>
                                    </div>
                                    <small class="text-muted">${cmt.regDate}</small>
                                </div>
                                
                                <p class="card-text mt-2 text-secondary">${cmt.content}</p>
                                
                                <c:if test="${ses.id eq cmt.writer}">
                                    <div class="text-end">
                                        <a href="/cmt/remove?cno=${cmt.cno}&rno=${cmt.rno}" class="btn btn-sm btn-link text-danger text-decoration-none p-0" onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                    
                    <c:if test="${empty cList}">
                        <div class="text-center py-5 text-muted bg-light rounded">
                            <p class="mb-0">아직 등록된 후기가 없습니다. 첫 번째 후기의 주인공이 되어보세요!</p>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        
    </div> </body>
</html>