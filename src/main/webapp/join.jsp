<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container mt-5" style="max-width: 500px;">
        <h1>📝 관리자 회원가입</h1>
        <hr>
        <form action="/mem/register" method="post">
            <div class="mb-3">
                <label>아이디</label>
                <input type="text" name="id" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>비밀번호</label>
                <input type="password" name="pwd" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>이메일</label>
                <input type="email" name="email" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary w-100">가입하기</button>
        </form>
    </div>
</body>
</html>