<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom mb-5">
  <div class="container">
    <a class="navbar-brand" href="/">THE HOTEL</a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav align-items-center">
        <li class="nav-item">
          <a class="nav-link" href="/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/brd/list">Rooms</a>
        </li>
        
        <c:if test="${not empty ses.id}">
            <li class="nav-item">
              <a class="nav-link" href="/rsv/list">Reservations</a>
            </li>
        </c:if>

        <c:if test="${not empty ses.id}">
            <li class="nav-item">
                <a class="nav-link" href="/dash/main">Dashboard</a>
            </li>
            <li class="nav-item">
              <a class="nav-link btn btn-primary text-white px-3 mx-2" href="/brd/register" style="line-height: 24px;">Register Room</a>
            </li>
        </c:if>

        <li class="nav-item mx-2 text-white-50">|</li>

        <c:if test="${empty ses.id}">
            <li class="nav-item">
              <a class="nav-link" href="/mem/loginPage">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/mem/join">Join</a>
            </li>
        </c:if>
        
        <c:if test="${not empty ses.id}">
        	<li class="nav-item">
        		<span class="nav-link text-white" style="font-family: 'Playfair Display', serif; font-style: italic;">Welcome, ${ses.id}</span>
        	</li>
	        <li class="nav-item">
	          <a class="nav-link btn btn-sm btn-outline-light ms-3 px-3" href="/mem/logout" style="border-radius: 0;">LOGOUT</a>
	        </li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>