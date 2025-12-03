<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 객실 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>🏨 객실 등록</h1>
        <hr>
        <form action="/brd/insert" method="post" enctype="multipart/form-data">
            
            <div class="mb-3">
                <label class="form-label">객실 호수</label>
                <input type="text" name="roomNum" class="form-control" placeholder="예: 101호">
            </div>

            <div class="mb-3">
                <label class="form-label">객실 타입</label>
                <select name="roomType" class="form-select">
                    <option value="Standard">스탠다드 (Standard)</option>
                    <option value="Deluxe">디럭스 (Deluxe)</option>
                    <option value="Suite">스위트 (Suite)</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">1박 가격</label>
                <input type="number" name="price" class="form-control" placeholder="숫자만 입력">
            </div>

            <div class="mb-3">
                <label class="form-label">객실 설명</label>
                <textarea name="content" class="form-control" rows="5"></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">객실 사진</label>
                <input type="file" name="imageFile" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary">등록하기</button>
            <a href="/brd/list" class="btn btn-secondary">취소</a>
        </form>
    </div>
</body>
</html>