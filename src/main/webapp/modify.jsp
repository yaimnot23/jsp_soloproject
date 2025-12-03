<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 정보 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>🛠️ 객실 정보 수정</h1>
        <hr>
        <form action="/brd/update" method="post" enctype="multipart/form-data">
            <input type="hidden" name="rno" value="${rvo.rno}">
            <input type="hidden" name="old_imageFile" value="${rvo.imageFile}">
            
            <div class="mb-3">
                <label class="form-label">객실 호수</label>
                <input type="text" name="roomNum" class="form-control" value="${rvo.roomNum}">
            </div>

            <div class="mb-3">
                <label class="form-label">객실 타입</label>
                <select name="roomType" class="form-select">
                    <option value="Standard" ${rvo.roomType == 'Standard' ? 'selected' : ''}>스탠다드 (Standard)</option>
                    <option value="Deluxe" ${rvo.roomType == 'Deluxe' ? 'selected' : ''}>디럭스 (Deluxe)</option>
                    <option value="Suite" ${rvo.roomType == 'Suite' ? 'selected' : ''}>스위트 (Suite)</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">현재 상태 (체크인/체크아웃 관리)</label>
                <select name="roomStatus" class="form-select bg-light">
                    <option value="빈방" ${rvo.roomStatus == '빈방' ? 'selected' : ''}>🟢 빈방 (Check-Out)</option>
                    <option value="사용중" ${rvo.roomStatus == '사용중' ? 'selected' : ''}>🔴 사용중 (Check-In)</option>
                    <option value="청소중" ${rvo.roomStatus == '청소중' ? 'selected' : ''}>🟡 청소중 (Cleaning)</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">1박 가격</label>
                <input type="number" name="price" class="form-control" value="${rvo.price}">
            </div>

            <div class="mb-3">
                <label class="form-label">객실 설명</label>
                <textarea name="content" class="form-control" rows="5">${rvo.content}</textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">객실 사진 수정</label>
                <div class="mb-2">
                    현재 파일: <span class="badge bg-info">${rvo.imageFile}</span>
                </div>
                <input type="file" name="imageFile" class="form-control">
                <div class="form-text">파일을 선택하지 않으면 기존 사진이 유지됩니다.</div>
            </div>

            <button type="submit" class="btn btn-success">수정 완료</button>
            <a href="/brd/detail?rno=${rvo.rno}" class="btn btn-secondary">취소</a>
        </form>
    </div>
</body>
</html>