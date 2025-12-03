<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE HOTEL - Rooms</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container mt-5 mb-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>🏨 객실 목록</h1>
            
            <form action="/brd/list" method="get" class="d-flex gap-2">
                <select name="status" class="form-select" onchange="this.form.submit()">
                    <option value="all" ${param.status == 'all' ? 'selected' : ''}>전체 보기</option>
                    <option value="빈방" ${param.status == '빈방' ? 'selected' : ''}>🟢 빈방</option>
                    <option value="사용중" ${param.status == '사용중' ? 'selected' : ''}>🔴 사용중</option>
                    <option value="청소중" ${param.status == '청소중' ? 'selected' : ''}>🟡 청소중</option>
                </select>
                
                <input type="text" name="keyword" class="form-control" placeholder="방 번호 검색" value="${param.keyword}">
                <button type="submit" class="btn btn-secondary">검색</button>
            </form>

            <a href="/brd/register" class="btn btn-primary text-white">➕ 객실 등록하기</a>
        </div>
        
        <table class="table table-hover align-middle shadow-sm">
            <thead>
                <tr>
                    <th class="py-3 ps-4">IMAGE</th>
                    <th class="py-3">ROOM NO</th>
                    <th class="py-3">TYPE</th>
                    <th class="py-3">PRICE</th>
                    <th class="py-3">STATUS / ACTION</th>
                    <th class="py-3">DESCRIPTION</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${ph.list}" var="room">
                    <tr>
                        <td class="ps-4">
                            <c:if test="${not empty room.imageFile}">
                                <img src="${pageContext.request.contextPath}/upload/${room.imageFile}" class="room-img" alt="객실사진">
                            </c:if>
                            <c:if test="${empty room.imageFile}">
                                <span class="text-muted small">No Image</span>
                            </c:if>
                        </td>
                        <td>
                            <a href="/brd/detail?rno=${room.rno}" class="text-decoration-none text-dark">
                                <strong>${room.roomNum}</strong>
                            </a>
                        </td>
                        <td><span class="badge bg-secondary">${room.roomType}</span></td>
                        <td>${room.price}원</td>
                        <td>
                            <div class="d-flex flex-column align-items-start gap-2">
                                <c:choose>
                                    <c:when test="${room.roomStatus == '빈방'}">
                                        <span class="badge bg-success mb-1">빈방</span>
                                        <div class="d-flex gap-1">
                                            <a href="/brd/status?rno=${room.rno}&status=사용중" class="btn btn-sm btn-outline-danger py-0" style="font-size: 0.8rem;">🚪 입실</a>
                                            <a href="/rsv/join?rno=${room.rno}&roomNum=${room.roomNum}" class="btn btn-sm btn-primary py-0 text-white" style="font-size: 0.8rem;">📅 예약</a>
                                        </div>
                                    </c:when>
                                    
                                    <c:when test="${room.roomStatus == '사용중'}">
                                        <span class="badge bg-danger mb-1">사용중</span>
                                        <a href="/brd/status?rno=${room.rno}&status=청소중" class="btn btn-sm btn-outline-warning text-dark py-0" style="font-size: 0.8rem;">👋 퇴실(청소)</a>
                                    </c:when>
                                    
                                    <c:otherwise>
                                        <span class="badge bg-warning text-dark mb-1">청소중</span>
                                        <a href="/brd/status?rno=${room.rno}&status=빈방" class="btn btn-sm btn-outline-success py-0" style="font-size: 0.8rem;">✨ 청소완료</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                        <td class="text-truncate" style="max-width: 200px;">${room.content}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <c:if test="${empty ph.list}">
            <div class="alert alert-warning text-center">
                검색 결과가 없거나 등록된 객실이 없습니다.
            </div>
        </c:if>

        <div class="d-flex justify-content-center mt-4">
            <ul class="pagination">
                <c:if test="${ph.prev}">
                    <li class="page-item">
                        <a class="page-link" href="/brd/list?pageNo=${ph.startPage - 1}&status=${param.status}&keyword=${param.keyword}">&laquo; 이전</a>
                    </li>
                </c:if>
                <c:forEach begin="${ph.startPage}" end="${ph.endPage}" var="i">
                    <li class="page-item ${ph.pageNo == i ? 'active' : ''}">
                        <a class="page-link" href="/brd/list?pageNo=${i}&status=${param.status}&keyword=${param.keyword}">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${ph.next}">
                    <li class="page-item">
                        <a class="page-link" href="/brd/list?pageNo=${ph.endPage + 1}&status=${param.status}&keyword=${param.keyword}">다음 &raquo;</a>
                    </li>
                </c:if>
            </ul>
        </div>

    </div>
</body>
</html>