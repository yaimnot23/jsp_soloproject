<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .room-img {
        width: 150px;
        height: 100px;
        object-fit: cover; /* 사진 비율 유지하며 꽉 채우기 */
        border-radius: 5px;
    }
</style>
</head>
<body>
<div class="container mt-5">
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

        <a href="/brd/register" class="btn btn-primary">➕ 객실 등록하기</a>
    </div>
    
    <table class="table table-hover align-middle">
        <thead class="table-dark">
            <tr>
                <th>사진</th>
                <th>호수</th>
                <th>타입</th>
                <th>가격</th>
                <th>상태</th>
                <th>설명</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="room">
                <tr>
                    <td>
                        <c:if test="${not empty room.imageFile}">
                            <img src="${pageContext.request.contextPath}/upload/${room.imageFile}" class="room-img" alt="객실사진">
                        </c:if>
                        <c:if test="${empty room.imageFile}">
                            <span class="text-muted">이미지 없음</span>
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
                                    <a href="/brd/status?rno=${room.rno}&status=사용중" class="btn btn-sm btn-outline-danger py-0" style="font-size: 0.8rem;">
                                        입실시키기
                                    </a>
                                </c:when>
                                
                                <c:when test="${room.roomStatus == '사용중'}">
                                    <span class="badge bg-danger mb-1">사용중</span>
                                    <a href="/brd/status?rno=${room.rno}&status=청소중" class="btn btn-sm btn-outline-warning text-dark py-0" style="font-size: 0.8rem;">
                                        퇴실(청소)
                                    </a>
                                </c:when>
                                
                                <c:otherwise>
                                    <span class="badge bg-warning text-dark mb-1">청소중</span>
                                    <a href="/brd/status?rno=${room.rno}&status=빈방" class="btn btn-sm btn-outline-success py-0" style="font-size: 0.8rem;">
                                        청소완료
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                    <td class="text-truncate" style="max-width: 200px;">${room.content}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <c:if test="${empty list}">
        <div class="alert alert-warning text-center">
            등록된 객실이 없습니다. 첫 번째 객실을 등록해보세요!
        </div>
    </c:if>

</div>
</body>
</html>