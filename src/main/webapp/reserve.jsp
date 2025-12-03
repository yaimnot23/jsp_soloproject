<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE HOTEL - Reserve</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container mt-5 mb-5" style="max-width: 600px;">
        <h2 class="mb-4 text-center" style="font-family: serif;">📅 객실 예약</h2>
        
        <div class="card p-5 shadow-sm border-0">
            <h4 class="text-center mb-4" style="color: #9e8a59;">
                Room <span class="fw-bold text-dark">${roomNum}</span>
            </h4>
            <p class="text-center text-muted mb-4">선택하신 객실의 예약을 진행합니다.</p>
            <hr class="mb-4">
            
            <form action="/rsv/register" method="post">
                <input type="hidden" name="rno" value="${rno}">
                <input type="hidden" name="roomNum" value="${roomNum}">
                
                <div class="mb-3">
                    <label class="form-label fw-bold">예약자 성함</label>
                    <input type="text" name="guestName" class="form-control" placeholder="홍길동" required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">전화번호</label>
                    <input type="text" name="guestPhone" class="form-control" placeholder="010-1234-5678" required>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">체크인 (Check-In)</label>
                        <input type="date" name="checkIn" class="form-control" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">체크아웃 (Check-Out)</label>
                        <input type="date" name="checkOut" class="form-control" required>
                    </div>
                </div>

                <div class="d-grid gap-2 mt-4">
                    <button type="submit" class="btn btn-primary btn-lg text-white">예약 확정하기</button>
                    <a href="/brd/list" class="btn btn-outline-secondary">취소</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>