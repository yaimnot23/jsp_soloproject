<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE HOTEL - Reservation List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container mt-5 mb-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>예약 현황 리스트</h1>
            <a href="/brd/list" class="btn btn-outline-dark rounded-0">객실 목록으로</a>
        </div>
        
        <table class="table table-hover align-middle shadow-sm">
            <thead>
                <tr>
                    <th class="py-3 ps-4">NO</th>
                    <th class="py-3">ROOM</th>
                    <th class="py-3">GUEST</th>
                    <th class="py-3">PHONE</th>
                    <th class="py-3">CHECK-IN</th>
                    <th class="py-3">CHECK-OUT</th>
                    <th class="py-3">RESERVED AT</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="rsv">
                    <tr>
                        <td class="ps-4">${rsv.rsvNo}</td>
                        <td><span class="badge bg-secondary">${rsv.roomNum}</span></td>
                        <td><strong>${rsv.guestName}</strong></td>
                        <td>${rsv.guestPhone}</td>
                        <td class="text-primary fw-bold">${rsv.checkIn}</td>
                        <td class="text-danger fw-bold">${rsv.checkOut}</td>
                        <td class="text-muted small">${rsv.regDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <c:if test="${empty list}">
            <div class="alert alert-light text-center border mt-5 py-5">
                <p class="mb-0 text-muted">아직 등록된 예약이 없습니다.</p>
            </div>
        </c:if>
    </div>
</body>
</html>