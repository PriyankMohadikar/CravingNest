<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home Page - CravingNest</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
        /* Navbar Styles */
        .navbar-brand {
            font-size: 28px;
            font-weight: bold;
        }
        .navbar-brand span {
            color: orange;
        }
        .profile-pic {
            width: 45px;
            height: 45px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #fff;
        }
        .nav-item {
            display: flex;
            align-items: center;
        }
        .user-name {
            margin-left: 10px;
            font-weight: bold;
            color: white;
        }
        
        /* Banner */
        .banner {
            background: url('banner.jpg') no-repeat center center/cover;
            height: 250px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: bold;
        }

        /* Card Styles */
        .food-card {
            height: 450px; /* Fixed height for all cards */
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background-color: #fff;
            border: 1px solid #ddd;
        }
        .food-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .food-card .image-container {
            height: 200px;
            overflow: hidden;
            position: relative;
        }
        .food-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .food-card img:hover {
            transform: scale(1.1); /* Zoom-in effect on hover */
        }
        .card-body {
            height: 250px; /* Fixed height for card body */
            overflow-y: auto; /* Scroll for content */
            padding: 15px;
            display: flex;
            flex-direction: column;
        }
        .card-body::-webkit-scrollbar {
            width: 6px;
        }
        .card-body::-webkit-scrollbar-thumb {
            background-color: #ccc;
            border-radius: 3px;
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .card-text {
            font-size: 0.9rem;
            color: #333;
            margin-bottom: 10px;
        }
        .category-text {
            font-size: 0.85rem;
            color: #666;
            margin-bottom: 10px;
        }
        .star-rating {
            color: #ffc107;
            font-size: 1rem;
            margin-bottom: 10px;
        }
        .view-details-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 25px;
            font-size: 0.9rem;
            text-align: center;
            text-decoration: none;
            margin-top: auto; /* Pushes button to bottom */
        }
        .view-details-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <jsp:include page="Navbar.jsp"></jsp:include>
   
    <!-- Food Deals Banner -->
    <div class="banner">
        <img src="assets/img/Foodbanner.jpeg" alt="CravingNest Banner" class="img-fluid" style="height: 70vh;width: 100%;">
    </div>

    <!-- Food Deals Section -->
    <div class="container mt-4">
        <h2 class="font-weight-bold fs-1 text-center mb-4">Current Food Deals & Offers</h2>

        <div class="row">
            <c:forEach var="location" items="${locations}">
                <div class="col-md-4 mb-4">
                    <div class="card food-card">
                        <div class="image-container">
                            <img src="${location.foodPicPath}" class="card-img-top" alt="Food Image">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${location.title}</h5>
                            <p class="card-text">${location.description}</p>
                            <p class="category-text">
                                <b>Category:</b> ${location.category} | <b>Food Type:</b> ${location.foodType}
                            </p>
                            <p class="star-rating">
                                <b>Rating:</b> 
                                <span>
                                    <c:set var="avgRating" value="${ratingsMap[location.locationId]}"/>
                                    <c:forEach begin="1" end="5" var="i">
                                        <c:choose>
                                            <c:when test="${i <= avgRating}">
                                                <i class="bi bi-star-fill"></i>
                                            </c:when>
                                            <c:when test="${i - 0.5 <= avgRating}">
                                                <i class="bi bi-star-half"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-star"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    (${avgRating})
                                </span>
                            </p>
                            <a href="locationdetails?locationId=${location.locationId}" class="view-details-btn">View Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>